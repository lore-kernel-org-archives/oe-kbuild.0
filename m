Content-Type: multipart/mixed; boundary="===============6375278711332155074=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH V4 2/2] net: ethernet: ravb: Enable optional refclk
Date: Tue, 13 Apr 2021 21:43:21 +0300
Message-ID: <20210413184321.GL6021@kadam>
In-Reply-To: <20210412132619.7896-2-aford173@gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6375278711332155074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Adam,

url:    https://github.com/0day-ci/linux/commits/Adam-Ford/dt-bindings-net-=
renesas-etheravb-Add-additional-clocks/20210412-212824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git 6628d=
dfec7580882f11fdc5c194a8ea781fdadfa
config: m68k-randconfig-m031-20210412 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/renesas/ravb_main.c:2254 ravb_probe() error: potential=
ly dereferencing uninitialized 'priv'.

vim +/priv +2254 drivers/net/ethernet/renesas/ravb_main.c

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2043  static int ravb_probe(struct platform_device *pdev)
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2044  {
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2045  	struct device_node *np =3D pdev->dev.of_node;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2046  	struct ravb_private *priv;
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2047  	enum ravb_chip_id chip_id;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2048  	struct net_device *ndev;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2049  	int error, irq, q;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2050  	struct resource *res;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2051  	int i;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2052  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2053  	if (!np) {
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2054  		dev_err(&pdev->dev,
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2055  			"this driver is required to be instantiated from devic=
e tree\n");
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2056  		return -EINVAL;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2057  	}
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2058  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2059  	/* Get base address */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2060  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2061  	if (!res) {
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2062  		dev_err(&pdev->dev, "invalid resource\n");
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2063  		return -EINVAL;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2064  	}
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2065  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2066  	ndev =3D alloc_etherdev_mqs(sizeof(struct ravb_private),
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2067  				  NUM_TX_QUEUE, NUM_RX_QUEUE);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2068  	if (!ndev)
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2069  		return -ENOMEM;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2070  =

4d86d381862714 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2017-10-04  2071  	ndev->features =3D NETIF_F_RXCSUM;
4d86d381862714 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2017-10-04  2072  	ndev->hw_features =3D NETIF_F_RXCSUM;
4d86d381862714 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2017-10-04  2073  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2074  	pm_runtime_enable(&pdev->dev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2075  	pm_runtime_get_sync(&pdev->dev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2076  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2077  	/* The Ether-specific entries in the device structure. */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2078  	ndev->base_addr =3D res->start;
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2079  =

e866863066a4e6 drivers/net/ethernet/renesas/ravb_main.c Wolfram Sang       =
2016-03-01  2080  	chip_id =3D (enum ravb_chip_id)of_device_get_match_data(=
&pdev->dev);
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2081  =

22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2082  	if (chip_id =3D=3D RCAR_GEN3)
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2083  		irq =3D platform_get_irq_byname(pdev, "ch22");
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2084  	else
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2085  		irq =3D platform_get_irq(pdev, 0);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2086  	if (irq < 0) {
f375339e497582 drivers/net/ethernet/renesas/ravb_main.c Sergei Shtylyov    =
2015-08-28  2087  		error =3D irq;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2088  		goto out_release;
                                                                           =
                             ^^^^^^^^^^^^^^^^^

"priv" not initialized on this error path.


c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2089  	}
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2090  	ndev->irq =3D irq;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2091  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2092  	SET_NETDEV_DEV(ndev, &pdev->dev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2093  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2094  	priv =3D netdev_priv(ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2095  	priv->ndev =3D ndev;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2096  	priv->pdev =3D pdev;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2097  	priv->num_tx_ring[RAVB_BE] =3D BE_TX_RING_SIZE;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2098  	priv->num_rx_ring[RAVB_BE] =3D BE_RX_RING_SIZE;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2099  	priv->num_tx_ring[RAVB_NC] =3D NC_TX_RING_SIZE;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2100  	priv->num_rx_ring[RAVB_NC] =3D NC_RX_RING_SIZE;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2101  	priv->addr =3D devm_ioremap_resource(&pdev->dev, res);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2102  	if (IS_ERR(priv->addr)) {
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2103  		error =3D PTR_ERR(priv->addr);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2104  		goto out_release;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2105  	}
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2106  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2107  	spin_lock_init(&priv->lock);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2108  	INIT_WORK(&priv->work, ravb_tx_timeout_work);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2109  =

0c65b2b90d13c1 drivers/net/ethernet/renesas/ravb_main.c Andrew Lunn        =
2019-11-04  2110  	error =3D of_get_phy_mode(np, &priv->phy_interface);
0c65b2b90d13c1 drivers/net/ethernet/renesas/ravb_main.c Andrew Lunn        =
2019-11-04  2111  	if (error && error !=3D -ENODEV)
0c65b2b90d13c1 drivers/net/ethernet/renesas/ravb_main.c Andrew Lunn        =
2019-11-04  2112  		goto out_release;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2113  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2114  	priv->no_avb_link =3D of_property_read_bool(np, "renesas=
,no-ether-link");
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2115  	priv->avb_link_active_low =3D
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2116  		of_property_read_bool(np, "renesas,ether-link-active-lo=
w");
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2117  =

22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2118  	if (chip_id =3D=3D RCAR_GEN3) {
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2119  		irq =3D platform_get_irq_byname(pdev, "ch24");
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2120  		if (irq < 0) {
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2121  			error =3D irq;
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2122  			goto out_release;
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2123  		}
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2124  		priv->emac_irq =3D irq;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2125  		for (i =3D 0; i < NUM_RX_QUEUE; i++) {
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2126  			irq =3D platform_get_irq_byname(pdev, ravb_rx_irqs[i]);
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2127  			if (irq < 0) {
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2128  				error =3D irq;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2129  				goto out_release;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2130  			}
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2131  			priv->rx_irqs[i] =3D irq;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2132  		}
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2133  		for (i =3D 0; i < NUM_TX_QUEUE; i++) {
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2134  			irq =3D platform_get_irq_byname(pdev, ravb_tx_irqs[i]);
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2135  			if (irq < 0) {
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2136  				error =3D irq;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2137  				goto out_release;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2138  			}
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2139  			priv->tx_irqs[i] =3D irq;
f51bdc236b6c58 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2016-04-03  2140  		}
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2141  	}
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2142  =

22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2143  	priv->chip_id =3D chip_id;
22d4df8ff3a3cc drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2144  =

3e3d647715d401 drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2017-08-01  2145  	priv->clk =3D devm_clk_get(&pdev->dev, NULL);
ab104615e01c2c drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2017-10-12  2146  	if (IS_ERR(priv->clk)) {
ab104615e01c2c drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2017-10-12  2147  		error =3D PTR_ERR(priv->clk);
ab104615e01c2c drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2017-10-12  2148  		goto out_release;
ab104615e01c2c drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2017-10-12  2149  	}
3e3d647715d401 drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2017-08-01  2150  =

8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2151  	priv->refclk =3D devm_clk_get_optional(&pdev->dev, "refc=
lk");
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2152  	if (IS_ERR(priv->refclk)) {
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2153  		error =3D PTR_ERR(priv->refclk);
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2154  		goto out_release;
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2155  	}
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2156  	clk_prepare_enable(priv->refclk);
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12  2157  =

75efa06f457bbe drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2018-02-16  2158  	ndev->max_mtu =3D 2048 - (ETH_HLEN + VLAN_HLEN + ET=
H_FCS_LEN);
75efa06f457bbe drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2018-02-16  2159  	ndev->min_mtu =3D ETH_MIN_MTU;
75efa06f457bbe drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2018-02-16  2160  =

f543305da9b5a5 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2018-09-19  2161  	priv->num_tx_desc =3D chip_id =3D=3D RCAR_GEN2 ?
f543305da9b5a5 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2018-09-19  2162  		NUM_TX_DESC_GEN2 : NUM_TX_DESC_GEN3;
f543305da9b5a5 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2018-09-19  2163  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2164  	/* Set function */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2165  	ndev->netdev_ops =3D &ravb_netdev_ops;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2166  	ndev->ethtool_ops =3D &ravb_ethtool_ops;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2167  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2168  	/* Set AVB config mode */
0184165b2f42c4 drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2016-08-03  2169  	ravb_set_config_mode(ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2170  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2171  	/* Set GTI value */
b3d39a8805c510 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2015-11-20  2172  	error =3D ravb_set_gti(ndev);
b3d39a8805c510 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2015-11-20  2173  	if (error)
b3d39a8805c510 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2015-11-20  2174  		goto out_release;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2175  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2176  	/* Request GTI loading */
568b3ce7a8efdc drivers/net/ethernet/renesas/ravb_main.c Sergei Shtylyov    =
2016-02-10  2177  	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2178  =

ce19a9eb53be2f drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-10-01  2179  	if (priv->chip_id !=3D RCAR_GEN2) {
a6f51f2efa742d drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-10-01  2180  		ravb_parse_delay_mode(np, ndev);
61fccb2d6274f7 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2017-01-27  2181  		ravb_set_delay_mode(ndev);
ce19a9eb53be2f drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-10-01  2182  	}
61fccb2d6274f7 drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2017-01-27  2183  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2184  	/* Allocate descriptor base address table */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2185  	priv->desc_bat_size =3D sizeof(struct ravb_desc) * DBAT_=
ENTRY_NUM;
e2dbb33ad9545d drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2186  	priv->desc_bat =3D dma_alloc_coherent(ndev->dev.parent, =
priv->desc_bat_size,
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2187  					    &priv->desc_bat_dma, GFP_KERNEL);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2188  	if (!priv->desc_bat) {
c451113291c193 drivers/net/ethernet/renesas/ravb_main.c Simon Horman       =
2015-11-02  2189  		dev_err(&pdev->dev,
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2190  			"Cannot allocate desc base address table (size %d byte=
s)\n",
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2191  			priv->desc_bat_size);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2192  		error =3D -ENOMEM;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2193  		goto out_release;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2194  	}
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2195  	for (q =3D RAVB_BE; q < DBAT_ENTRY_NUM; q++)
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2196  		priv->desc_bat[q].die_dt =3D DT_EOS;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2197  	ravb_write(ndev, priv->desc_bat_dma, DBAT);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2198  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2199  	/* Initialise HW timestamp list */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2200  	INIT_LIST_HEAD(&priv->ts_skb_list);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2201  =

f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2202  	/* Initialise PTP Clock driver */
f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2203  	if (chip_id !=3D RCAR_GEN2)
f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2204  		ravb_ptp_init(ndev, pdev);
f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2205  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2206  	/* Debug message level */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2207  	priv->msg_enable =3D RAVB_DEF_MSG_ENABLE;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2208  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2209  	/* Read and set MAC address */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2210  	ravb_read_mac_address(ndev, of_get_mac_address(np));
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2211  	if (!is_valid_ether_addr(ndev->dev_addr)) {
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2212  		dev_warn(&pdev->dev,
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2213  			 "no valid MAC address supplied, using a random one\n"=
);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2214  		eth_hw_addr_random(ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2215  	}
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2216  =

77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2217  	/* MDIO bus init */
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2218  	error =3D ravb_mdio_init(priv);
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2219  	if (error) {
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2220  		dev_err(&pdev->dev, "failed to initialize MDIO\n");
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2221  		goto out_dma_free;
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2222  	}
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2223  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2224  	netif_napi_add(ndev, &priv->napi[RAVB_BE], ravb_poll, 64=
);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2225  	netif_napi_add(ndev, &priv->napi[RAVB_NC], ravb_poll, 64=
);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2226  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2227  	/* Network device register */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2228  	error =3D register_netdev(ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2229  	if (error)
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2230  		goto out_napi_del;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2231  =

3e3d647715d401 drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2017-08-01  2232  	device_set_wakeup_capable(&pdev->dev, 1);
3e3d647715d401 drivers/net/ethernet/renesas/ravb_main.c Niklas S=C3=B6derlu=
nd   2017-08-01  2233  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2234  	/* Print device information */
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2235  	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2236  		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2237  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2238  	platform_set_drvdata(pdev, ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2239  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2240  	return 0;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2241  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2242  out_napi_del:
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2243  	netif_napi_del(&priv->napi[RAVB_NC]);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2244  	netif_napi_del(&priv->napi[RAVB_BE]);
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2245  	ravb_mdio_release(priv);
77972b55fb9d35 drivers/net/ethernet/renesas/ravb_main.c Geert Uytterhoeven =
2020-09-22  2246  out_dma_free:
e2dbb33ad9545d drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-09-30  2247  	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size,=
 priv->desc_bat,
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2248  			  priv->desc_bat_dma);
f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2249  =

f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2250  	/* Stop PTP Clock driver */
f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2251  	if (chip_id !=3D RCAR_GEN2)
f5d7837f96e53a drivers/net/ethernet/renesas/ravb_main.c Kazuya Mizuguchi   =
2015-12-02  2252  		ravb_ptp_stop(ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2253  out_release:
8f9e50a484ae35 drivers/net/ethernet/renesas/ravb_main.c Adam Ford          =
2021-04-12 @2254  	clk_disable_unprepare(priv->refclk);
                                                                           =
                                           ^^^^^^^^^^^^

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2255  	free_netdev(ndev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2256  =

c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2257  	pm_runtime_put(&pdev->dev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2258  	pm_runtime_disable(&pdev->dev);
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2259  	return error;
c156633f135326 drivers/net/ethernet/renesas/ravb.c      Sergei Shtylyov    =
2015-06-11  2260  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6375278711332155074==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICMLWdGAAAy5jb25maWcAnDxLc+M20vf8CtXMJTkk0cP2yPWVDyAISliRBAWAkuwLS7E1E1f8
mJLkbPLvtxt8ASSopL7DbqzuRqPRaPQL4Hz+4fOIfJzfX/fn58f9y8vfo2+Ht8Nxfz48jb4+vxz+
bxSKUSr0iIVc/wLE8fPbx1+/vt7M/xhd/zKZ/jL++fh4M1odjm+HlxF9f/v6/O0Dhj+/v/3w+Qcq
0ogvCkqLDZOKi7TQbKfvPuHwn1+Q08/fHh9HPy4o/Wl0+8vsl/EnawxXBSDu/q5Bi5bP3e14Nh43
tDFJFw2qAcchsgiisGUBoJpsOrtqOcQWYmyJsCSqICopFkKLlouF4GnMU9aiuFwXWyFXAIH1fx4t
jDZfRqfD+eN7q5FAihVLC1CISjJrdMp1wdJNQSTIxBOu72bTZlaRZDxmoEKlrRUJSuJa9E+N+oKc
w5IUibUFDFlE8libaTzgpVA6JQm7+/Tj2/vb4aeGQN2rDc+snagA+F+q4xaeCcV3RbLOWc780HbI
51GF3hJNl4XBjp5Po7f3M2qrWbUUShUJS4S8L4jWhC5bzrliMQ9sZiQHO7XZmF2AXRmdPn47/X06
H17bXViwlElOzaappdhapmZh6JJn7gaHIiE89cGKJWeSSLq8d7ERUZoJ3qLBgNIwhm2zhbdnDVmQ
LyJlL+Xz6PD2NHr/2llOYwlsQeh9oXnCJPw/XVk7IBlLMl2kwtiq0QnN8l/1/vTH6Pz8ehjtgfPp
vD+fRvvHx/ePt/Pz27dWUcitgAEFoVTkqebpwpY7U9wr57+YotlmYM6ViIlGO65ElDQfqf62wfT3
BeBsEeBnwXYZk9pjQ6oktod3QEStlOFRbYEH1QPlIfPBtSSUNeJVmnBX0orNV+Ufrvoa5JKREGyk
Z8/q8ffD08fL4Tj6etifP46HkwFXk3mwjZoXUuSZY3RwtOjCd/AMaaHoklkONCJcFl4MjcDXglFv
eaiXztZoe4B3pdVcGQ/VJbwMEzIsaQRG/sCkPXWFCdmGU3aJM5gfmLa+RBJk0fDc5rRa/lHgealQ
RBNLS0tGV5ngqS4k+HEhLT9p9AMeTAsz0nG3oNyQwTGmRNtK72KKzbRFShYTyw8F8Qo1Yby/tHiY
3yQBPkrkkjIrMsiwWDzY3g8AAQCmzv6GRfzg3RjA7B56pMKrZYO68jN5UNqSNxBCF+Xfzl7TQmTg
/PgDKyIhC/AF8J+EpNQbVjrUCv5w1OrEtSXZsCLn4eTGEiOL2h+l63GOFURUDvFJ+vzRgukEnIWZ
h8RONCx3tEJ4xkZl4OhGV+P1nXOdSTCylYdDaakNXUAUqCB3J2uwUQ4Zm4cJy0RsKUjxRUpiO9My
AhlAw4ttWKqj0KeQJXihdizhwh7HRZHDYvxOkoQbrlitMOVhDqwDIiU3rqGCrZD2PnEUVsMKv+Ib
tFEYni3NN8yxB2s/2wRFmuTKVs2K2jkfSMfCkDmayuhkfNXz+lWSnR2OX9+Pr/u3x8OI/Xl4g4BK
wPFTDKmHoxMJ/uWIWpRNUu5RYYJ8aU9W8kk05K1WVqFi4uReKs4D7x6pWAwhSAD7IxesTkJ9xoFE
6NxjrsBrgvmLxJ3Wxi+JDCGG+60sjyJIoDMC88E2QeYMDtjOkkTE4zq3qVToJvCNTd3MLUVg8hLg
VqYhJ1ZeWOdzyy3ji6XuI8BYeCDBccPyHV+NpwdS+y0GiRaaCjgLmYCAmhDLgh4gqysgNFr+6uFu
0hY32UKTANYdw+bG6m7WLCKxkhf4USRQ5UjIwSxTZTtGHW8BzpenkUBl0Z6FZi/7M1paU+6U0OP7
4+F0ej+O9N/fD20eh0qE0k0p7kxBRRxGXPrjNYwZT8e+Uw6I2dhaD/y+GjseGSA3477MjXTq++Hx
+evz40h8x/q1PEmWrBFsM0vyITeEkcZndhBeICFMyM5slADzlHeTiW07ppgMQ9hr8PwZpI/WnsOk
dTqc7B9/f347GC06wpGEL3zxFzIPyR0VEOojQ1/ueNxN4tf+MoOq23ey8nS2sxmsr/qKDj5OkAN/
//5+PLc2YEQspIBKWhH73HVMyXaAUZvzulb3dPjz+dFVDWTQUgeM+FM7NGLjMbZE+rKElOgIxlon
MKIitX8yyHVfrZ0wywEgk+nAnDYJoy5Jd+31gsoV/b4/7h/BYfvWWXINVXZ9s/Ly7I92+hP7I9jW
+fCIiv356fAdRkGcGL03J6E2V0nUEo6onbcaJ9GBKaaLyDJjLHqL2TTguhBRVFgqNbkVtlISEVZ9
DOW6pQVBZaH3A+e/YB2mWwIBC5sRGZEQmOtWSNsg0aKue+0ZYbZyvMoY5ZFd8gEqj5nC4F2wODKx
/iK2uxhkm24gp4Yc01qLwI4MX6gcpkzDWQ9BqHYkr2JuqTWMCJ2Vp6Iu7O2jF2PtYYVxX0rUiplF
abGBKBQ2DSsqNj//tj8dnkZ/lMft+/H96/NL2Q9oWxVABhsPJhx7ze0im25s/QfjayoBiHuYjtru
0SRjKsGka9LZoe6WVY44FsTJtSpkniLCH3NawxzCIwclad3lJAPZdE3JfQV3hcRdx0jQE79G1CVZ
l2uD3z1cmhwTn22RcAi7KXq4hJmQU/AEMwv/CgM0Kl/kUOnELiSxFwoHiqdGnWCHXK57eMlIWOEv
4bxjt5JrNjTYRrqj29aAsWH21+Hx47z/7eVgetwjkxyfLS8XQIqTaDzeVp4eR66Lq4gUlRxO4Ktz
NDGiV/gotgPIPwGx87vJsAecme6wJmah7U5YpOA2/LtV0jwg0SUCBZGPhUWXzPERIu/LaYCvPXZg
UtQ7HaotzJPM6yiG9qLMeA6v78e/IfF52387vHoDEkrvFI9GNakIGRZ+bqKsshg8aaaNgUDipe6u
rCIRG8wBng7jgy3pwQsbz+xRkiklJMOTU9YNdQLFwVlB4Aly6xyvlCVm3XRPQEJQXWoSwLur8e1N
k1ww2JwMAh+miCtrKI0Z5JqELpkjp7cF85AJYcWnhyC3CtGHWQQ21Jrug3GkwsnGaxiaot+aeFjX
VNj6XHUK9VpRTOIykInb8s4zc6HhtY3h7W91ZCdnDK82Fq7zRCDzwMAkocaguvYJ6eH83/fjHxCf
+jYG+7+yJyp/F1DsLexzkKd859XQLsxMS5ANuFdwXr4TCFC8SoJcCvbWLrxR/kxnRVk8Rfe2QutB
2bK8CgCNJ9lQ8wSIoeLV3iYVHCsr39BJEZPUMbhA8nDhy5o3QFlAmTZZOzVFAy0WG5l55bFokg5N
c2xouefNmBICJUTuX0ccW6kd/HB6l5A2x77Atpte2zsbkyzwGfVSdIThjDGU/9rXyUQx66a5sbn1
x+HjABb3a9Wxd+5cKuqCBmtblBq81D6JGmykaMcqDBz28cKoTHLhWhlCTSdz7eMmB9r5NV5Fl2RU
0bo/mWbruHVIDTSI+kAaqP54MGgPU2JW1uMAbiHsU4eqf9oQDv+140xDLqVHZ2u/LtUqqBA9ZdGl
WHlr0Aq/jtYeHUCci/vTROsG05+HrPzFfTv4kmEtIx/TjF8SvXXK/YFxPuiaqg31FTCN8sso6vqD
MrAaBXhZ1xS1li4SKa86amwW8UiY291+ZK9kvPv0/evz1/fi6/50/lRV8i/70wk7TZ13EjiCxh2r
BgBWOVCgvnbBmvI0ZLuuXhEVbQe0hsh8Nm2ZVQBzX+LkExUcD8PgDiGRVBufp7bRN33Zo9jct/e4
lbdmFyf038TZjJns6zDBZwZOc96kBgbsg1W592zqClAhaTK05oogDe41c5ddYVD7vvkSpknX01co
fDVzYcmEdrIgABSZiDllXYaIwUbDADdEJ1yiX/QMVJBKxEMHHQlSot0lG0Hw6ZCXHR9UokGvgqGR
IMaQV0A0phF9heCFXU84mATq4j6cR17V6TxNWVys2P2ghZYa1kNqAsZmUgwxnQkqFAaIQe4VTXXy
B8k0Rapi2GyMowff5XhO6gvXYarwFkLgI6NWTwFkEgSLlo3di6lh9Z8bJ19s0am/ULQozIW6L7es
8mir1KogZTpuJ5w1Aiq6LCDeBgbWaVz4uLoIrAIT4RpVzNNVb9ILlpkqp1W8VL5sdS2184IBfxcq
8edZBgkm6avet4FzSVY9RjCVQ8e++hRlXdFJjeQOq9n7wr34DdZxp4IanQ+nc90trAq5HqqDsKsu
S0MkkSQcOAyUpH4b8hepWyj2YshB/G8PohUf6Njhym99XooS7oZL+D1otQYJrEJmHRcDzFXg3C44
PiGiYF8LDjWKz6QAm1Juua4SgP23LhcE50T6VYMES+q84Kr2c38cRc+HF7wpfn39eKvyldGPMOIn
6xLC4oPHJidxJZgzRRR6nT1gsvR6NnPXYUAFn9I+eGpW4sKV7quihFU8HEkqDOhpUB/pLkOaAYHV
LNrK9LozXwnsC10i5o3clvH/KwU31WYZft1YhXHKbv5vywg14ILA/tBr2Z2MBSvcFlFEeCw2dgbF
9FIDSe3z6vMeGvlG4fH5z/LZQc2TUiI7zxkSyknPwDL68+P++DT67fj89K29zjO3As+PFWPrMrbi
lpeXG0sWZ7aUDhgWppfOE9eNTrLIKUFqWJHgNYnvVlOTNCSxcNsemSwnirhM8NqwfGrbW1z0fHz9
7/54GL28758OR6thuTVXELboDcjsRwgcnadFWpJmNmtN7Sh8ZdLqo3274yOA/Y3jgWjYDrAuIRpz
7a6oHmUu4PBhWd3ntdpG5q7Bj+tArW0BHwpVNd+47ZwuAduAgBcIsKtYsYH8JQGT9qzYEBF1n9Ka
NJMisM5Y81Ijy6tnhFaSAMmB2+GVbOE0nMvfxiV0YSrmCY597cIz3qfNEt4jTBK7wVDPZN96tBwL
skns3nNC6uY/mFrkWg0iI5bSsp3baRXYF3f9I9pc8/suqCU+ltdsIfHRTRH7+lCBnhQkswKiAews
hSRip92O25IrDoWOSIs482eVazDmggV86r8VW3LcQ+8y7aU0UVuAf6X4bqi1kdRuLuOvAs4bJ3EH
mOiVH6G4jFpM2xtHXB7sKpRffO17chJqy+CEk6eICPvUuttzb7FwZmG83VsDIF6qaMmYA1yJ4D8O
ILxPScKdqet3LQ7MsVIRuV18EdXlhgPDkFQ+kWo9MZF48dJPXPD5SvvSpI23Nry8X3o+PfYTGcVS
JSTUDVzN4s14aiXCJLyeXu+KMBPaC+ymGzaqk2/UW5Unyb3RiDWMU3U7m6qr8cTfmIcSVCkrzYDj
GguVQzACU+k4KWP+VHA40XFsT2IQ2LqSmf9VUKhu5+MpiS0nxVU8vR2PZ13IdNxCavVpwFxfO0+w
alSwnHz54n1IVBGYyW/Hu5brMqE3s2urcxKqyc3c6mOhhcLKC0azWfs8uOYrieX/dvjKD45VGDHL
WLNNRlK7zUanaF53r9WlMYPQkIxO3RdMJRx2ZXpla7cFX3sPboUvP9rwaKLCJ2R3M/9ybaUDJfx2
Rnc3Huhud9UH81AX89tlxtSuh2NsMh5f2WlpZ6Fm8frw1/404m+n8/Hj1TwgPf0OqcDT6Hzcv52Q
bvSCT9Oe4EA9f8c/bd+vIdn23/D9P/j6TqkbNR2Mk44TvOsimNhlzlFgdOmvMvGrAH8IdFxHY6R4
Z87D5hsbRRWviPqGg0h8lGHnWL4B5RdMjLHRZHZ7NfoR8rDDFv73U58lPpvEStfezosjreKgl90k
3NKpaQs4zx+M47LMaQ11H3+w01oeBd0Wl2bEF/gTQk3PzqIGkGI+vwRs4C8IEE5W3kLrKOQf6nYv
TDsEIOgvtIQ/bPGhkio2Zt3mEzT7zf2GuZ+4VN2izjVuK1ycCH+3Au9Vy8TT1zUqewolutM30Pre
clQIWSrnqaeBlXL5vEv5/FB3VAgLS0PIzkhMKD6moUtfYCgPkVa9Dmk9OiEP3tcSDo0dVfHxYozv
Z61DnKezEtSe3iQsdougu+8AgyR9YDqDK7+K8YoKVptq7ns5YVNJ5zIVfmJj3p9tIqKQgq7ws8HL
bAMJxRYVVmAKrq6sFitNrm7HcwjuzH1uQxNc1MDTngXOn0EwxI9ffBH2XmmWVIGtLxOF8q/cB/fa
hcQ7FhJQp/8JscNhw/NkQN/UPJTxqTtMIK8Y2+ssIdWrPbwrwGcmy7IB6e1Ts95dQTUre/jnzYiI
JKH9BD/SsNTJ2EpsIr3ogmwGkB7j1x+O7iKvC4tUXESJfUeBkGxdJKFd0yHQKLyEt/UGJymIO6Di
hRCLePiGt6JqyqbLWlnmZMv4wEx8Drmt7+MgmwZKvo7DrTAJkRtmO+Nk4y4zQedLigBylBS/X+hi
PJROANlk2dQjXLYjkDgW5cNtj1ggE0mFlSgl8U5ty+Bns2+gxXI75N4tInS4ibeRWxJ1CocSmPCU
Dw6Keven9RI4lYMtQItGuF82w7mfzv9zM+5DypeVEIU6b40Av5teAYEvle9OplgyZEgp0Yi9zAT+
lCIV9itoG+vy5uj4wcRSsmAJdusGHWac0R6yDZKCDriUDHJM/BLpn84ZZkV4d3R5bRIkUMTpTip8
+uALv5JsemlVzQYvq3y3ShaNIgmEVufOSmFQHZjNHsnY2qt7/GxbRjGRvbBREyTqH4KGEpSLFP9t
CFuuFBtXfleGOBg/mCI2jLUxPiuv0Al61DKBc2F11LRy3C3Cwy0t1kK5Y0pU73PxEgx2J/Ep/6sL
5tl6Pr7ZdcFggpP5rgdOWMiJZs7z3xJTdrT0EoTyBcKtnYJ0RQNNR9mC9Jkq7b8OqbHJzOdNK2ye
7pwLnwY89/Y8Sm0ku/mAIav7VGSQqVze2w23PsuAH4Vc4r/FYbFsgKZb6r3/JcAtBusz+bRPli1/
GMzrW6qypeB9I3jfuXJBgNXjVNvM/tciYhYWWvLFAnvRNiLiO3wPvHQ8sIqctKZsanE+ArK6jHxq
7mfaBDYxjHxhhSmRFotdbCZqM++Qpx1IlTh3oLv5/MvtTeBKXue5Li2ksddXk6txD3oz2+06DGjy
ZVcBbcr51Xw+6aoE4V9KYl+LmSZl1dfZBcoh8yXutFWy2p0ghAS3Wo1nAk6zOFeVqG2U2ekhekyQ
it2W3LuTxwo/EpuMJxPaZVZlTkNbWGEn40VX8jIxGBpXZwSumluwnvQEqeN6l2V7Qsy/50GG5sRr
Vv0fMpl0N5fo+Xi268639s1Vh0WGdenKVWIVV7t8at84wArDlcsHSqbJeJe18mEFDGbEqepZRzaf
zafTQY0gXtP5ZDIwuRl/Ne+KbMA3Xy6ynd/cDjDdQPqmFHN1XHVBF+AvphL/v7u1+NBJzW9vr71f
FmCyXl2JWbkyAp0rMRF1qpp6nPNlswFCuLjiHZip3x0bRihRGfN+a1vOz3VAUudpfgmHs8+73y13
CfL/MfYlS3IjOZuvotPYzKGnuZNxqAODZERQyS3pjAimLrRsKbtL1pJSJqnm7377Ady5+AJnqsxU
UuADfV/gcDiAEnemlWI908rEc6ecVpCEpyo485kJwIjKUKFWG1Wp2zElndZwtM2GQjY74kQQIwLH
PZhUEC6CRfWItHf1X19+ff7+5eU/ygX90klTfR3NrkPq1lQWnNddr8oCcoNxOK2PpCyqssK23Bfn
RcfeZczctpZ9E+baCP+T1aUE/8redfIAgJ/TkeEuRNuWIp4XeM1Fy5uIW59KIFh3nXRC5RRsBm3v
77oW31XIfK32Gb+NVkn8flrR+LFKluxYdVHOKYiuV/gWG33Og5butGjD4RpfUeG/IkPIuLz+/PW3
n58/vby7suOiTuZcLy+f0Hfc6w+OLJZf6afn7/j4+Kd0LTdnda8splz31KadMG1USpY36lYHBKPU
5bfvf/2yKuTLppNfu/GfKI/J91+cdjrhe7FKM2kXGOPPkB/qlNI3CZY6BQFvRJZl3F9/vvz4gv6x
PqNDjn8+a3fn82ftFTqzuFnTfd8+KQZmglrckPhVT624aaZqUgMZlj3atw/F07FNe3pgSYXdKylT
PZQtFDw6Ve15a/EN8HOKmisjX6LTp5mVIWuPPbWtrQznk/dAJn3uSV2igk+qTcuGXcuqKuqWWvBX
JhQJe8Wme4VYmRd3NP3tCXCo84zMteQ61L0s7+ggp+3Jr+v0zHVie9/zJ8Rtf6SKjNBRMbzfMHw1
SdflXubwg0A+XIrmck3pXmchCMz7HY+zxHiMqjN1bOzS3HJlv3KdWJlGR3NucXcrlseSgqG9ZhcG
ElZBr3zzHCpJtUlfl4GhjuTE0rPyC6NQhVIfNcrJkXwSLBRufNJqnF4+X7Lq/K5rUDyd4ismATON
9PwloFRPIAwXIefy/OMTN0kr/96+w8VcseJQXmDxn/h/9epDkOEo2DFPZ+7Tu844330RzEDCDd/4
oM84t7w7C6DDLOm9lzO0qJlMO0atNXNlUF6myoLS2ZzrTL9qvXhOa/5oWe6JhTY1LAwTIteVoQpk
IYzqhPXymdpwrd5MlsPVIM37m7QMZvMN7wCHLyZcRcom+8PCsNEud4m2qYUGCcDn6zn9aBkf9B7g
KDY8KRv97GgTycRHVQ7Tlnvxmz1NCEuAlx+fn7+YUq0w7ZqKtK+eMvXh+QwlXmj60mlev/2NAz9F
ulz6ImSrOQ1uMmQZRwBnVcdiOITroxSgWV1sHafAUqej79JugWQGKvWyplRmG7jXLmhNXZXkO5ul
7JeJZaU6OVby1PQ8CfaHR+PEuFEZlrK9VQDVNdcMXRiqfX1vHIkMNnApxU7faW53VqI5GWaQa4/h
WF0SHbJib2fMyhP6v/uqkStUCz4a5EeTE47EzdiZ3cPJ1tKzzI1KFvOmIWq+wjsfCnNco1dXnN71
Z7ahrI9Fn6fkyJi3h/dDetafW5CM/EWAXlAJw6nDvbJsjioIpmN6zdGJ3B+uG3qOYysV5yW61ZjP
I4Pla7f4s+qoY0sN9DRUht/KFfYr442KVo8+MwYR7q8wk0UjuRqIF+hVRzbyBu1M9AyvpLh1e3ku
M1jPSWee8/BBO3JyXHHgN+YT3rCYoxap1slQ34rjlR5FArLXrb3TBsUzDCN8Z0Evq2MBOxyIFbJQ
QaHTMnw3Ezd1J9Q/zoa+MtRLM9hAbfibjJ7S/TXTWXaw0lyralaabIaI3DczKxvq9cPltjwCMBoT
3yooWk2JzgsM+ejiFJDsPlhngzGjX8uuLhfX4BoVbyc1Z8KCjkarwuEXibCh19x1c1BobsVZ85SS
p0POx6RzgyAw9eEbJ3If7nlLCVGiKPgmuz2dtLQeMjYda0nJKBS7nM4ZFLDp+D2Qjm7XWuLj47Ci
dHGORuUlM+P74mFUfqq5EIVX27KtC+pCf2M7poHvEonO/U4hYvoTAL+So0tTk2Nrw4vxqWkZlSg2
JZ3mQwGH25a0p9uYMhj0zZlKeCy7C2w20l12cRPumbariuL2oDXgdl+EXvOIrIcM/nTS7OaEkmlC
wEw12bQ3kRJ5yvqQkl0XFhAWOIt09yMhXLCmoRIojaK8l9HmemsHVa5F+AaVxCdII3WLs5Z68P0P
nRfoH8uYRRdgsAnD6TUZ2LerJ9tzGMKF5PzZMjv6K+x26CJ2feEmtIpQFlPbKj+KwibhKkX0LauS
hRdEZcVBKvfzS+pCAcWLjVm1Kl2B8HJkf37+ThYGRImjODlzNxEFepr8qiWq3flsVJGhUkIEqiEL
fCeyl3LqsvQQBq6ZpgD+QwBlg1sOlV1fWAIJAJ4X0sc7BaqrMeuqXLYg321C+fv5hSGefdU+ZLWy
e/LWrs7tsRxMIlR86TvMbNUu4GMs4oTL8y3H8JIrypRt3PGQC+/+gU+5hMjx7n9/ff3568t/3718
/cfLJ7ys+PvM9Tc4VX+Eyv0fbWBw+VkrKd9r1N5Jh4OrcQEF/VPfCuEhvkRbtLTSPhvHUkt9u377
qpMf2ibVJ8Oxz2pG+oPiUwUv23SJig+J9FbSj5zFgEGn7vyF67zIauNphXkF307FNK/iDItorQ9o
sXnRj2cQxxpZMr2U5wucQ3PZYQVfkuuzngsqGaqOXiw53na+bJqFtPcfgjhx1GrAed170NuoHiLa
QFaAceRp46W+RcGoZwfnMZVrloP03FrsJouDOYQtV1II3Ss1B5iDW3cphelqGGqdxt2MGmFMta/G
VIwSlU88TZNVNCt11k9I5L4sM733mJ95gUtt3xy9TDWsMZUxdllZD7rrZRmmzqACABntFGhrGyfG
amHZtYlA6vXuWiXYU/N4BYHTGO38Yay1RBydjh3pLwcZrg3IXaWZ7EKfTta08XFJOpSW0zly3Gtb
g4hjvlrFsep1QnfQx3SfpZI3VhApvsGREIC/w04BK/XzfFtsqEt5Y6Roi3mrl12i/fWn2Jjmj6Wl
Xv1Q3tok8skSvci6+6i9fz1qXWyO83kH4O/qjLHIMXyOi89yd7ZvfNOOM/wNFtxCrWsxMoidWKml
UTFfmWkZugAC2lRjFCtKB5LfJVxRK8KZevfLugQRHDkusv8O9TlfVxrxdYA0ZyZrCZCqHiyE7r0r
39XPP3FAZa/ffv14/YKxkQy/FfydvNjqvyq0/uAHo5p5Olzig1JRzlijDaEf08pw/plyXBAkEBGu
THFpsrKi+XiuiegcHLn7kgmE1LKxqNUABnnBS3x6C5Xw9Eo7kppZ0B7zLXy6MIvWVPBMj0aXLlZa
CpF4fiSRl+aw5ENeY/DBs8gg1moU3cEnd2oET0wrulAeEv2CwH4ZuYUYQ085iliBEGq9T1UxGi01
y24SBQQZ+PukzhiUZVTCe11wQ2LVJUngTv1AiTxr7cqjmhQSlTvkhZhrR2sxCdGKGP51ojdZzmOT
jQTIZSM92eFhamgdLDYfSEXTqbyqLcWpHVFGcU+Bz+itRWwzHivOkh/KU16gd+JQEkMdWSfXcR40
svpGAEldmfme3mOcOLFH25gC6cobjVFPvUFUGbqspBwpcoxosccreRWNiCmxIRmks8hoIJa5Scki
x1Pbgl30WoP0drHPI+P2CWmd6nZooenGQDI8K93Vb7jO/XEn8wHHTaDlrlqvzqRIb5NVAFQ3s1F2
PMAHEop8nuvw9UQvIQddlzKa2L51YJ2pUnah0nXQrK/RxiMlRCJ91B8wqajx8kGFK9uoGQd8QwV/
8fcoSiE/QCuJeaQVBYG6m847nSNeFm8bv6S8MJ/gY9NzI9iVv/vx+uv14+uXWWLQ5AP4I6zp5JVk
di8oArOqjV0VkTc6xgCzHJj5ZqX7UOHOf5QEaig0g1UN2FBpRWlqZa09/FB0a8JyBoTej6swtPre
4uQvn9ETgxJFB5JAjRtp+6pGneuY6QVvU+8OHXIYEhrS5mzNTsIks6rEV3wPXP8uG8euEDe7IJFZ
Z7dmNAc4fv0h5yXQoYNivH78N1EIKLkbJgkkqoSeUOlTPhRW7BHW+8f10PONhzwQz1B4aNTG5rj9
1ys01Ms7OOXAuejTZ3S1BIclXs6f/9dWQjjCSxNfw8p8SLzO961FBYb5fmAxtDZaZv1yVkeuSS0e
s2ZgWiOObh8oducSP+ofT9cm0wx7MCX4F52FAogTjlGkpSgoa8NgCAikVo6FC/lYu0nikEN5YcnT
JHSm7trR1rAL2/zGb5enzjrPZ06yy4RRWyxn9ZVldEOHfIu2MAz1SdqW1/zTMQa5S1muFgztNJuS
EhkXjv4hcUKzZdusqNqBSnJ7WcQsurw1jXtFJcBCZ79vGH0SW+GD4xBDQWh2ifzm+8Uzte3qPERL
LFBEpc2PYu4bA2TvPLd2FI9ppjeowZY9nRvxBmOnMg2jitqw7u30G+bpiZMJvcWTMj/e7+Rj0YMA
Mh3PAenVes1sVZpqACorKaIXElME6TGRCOzHJnM6v8ihgYQAlpc9FEAnxYE4oBYvgCLHpQw5pVIn
nhcRKwEAUeRQqSJ0iPamVZ3Xh8gNbR+P8d784cm7liIdQt8CxJG1rIc3szvsfLzXfI8ZCxyy6fmB
iAtqHe2JSGVkR8FoVo5lsZuQ/QCIl+yublkCnxJjmOW16FuTngQhRR9DsjehgVzy7lxi8EIqpxpW
MbJWVZeiq6XO9Ebcg9T28/nnu++fv3389YOwpF33odWXgp4rRrvLbHRNyyKBKJEY92frgnBCX0DF
jbbklrn6JI3jwyHcaa+NLbDlNaey1+orW3wgFrY1DXKb3+DdjpXY3N1k4r35s6Xi75eFftFh8kW/
17jRG1WPKK+LJpu3n8ru5NzY4jcKk+7vfitj8DvZ+Sk5sPoP6V6VAd6va/DGFr0x/lYHBd7OuA32
x0oQ/GZJst/qnqBw98qS7qJHcm70H5q3xzO7xJ7jv1FCZIqsKwVHD7+TU0wGVDaYrGMAUfIBj84U
xnRzIZaEe8kn0e9UxP+NycKr8hstG3vEMVFgoy9foNk2JmMnWR3vaMBspWeh463SHkYPAH4xTqrX
JQ6unDV3PKFFJaggUhySiDgyGVpUBTgF3mGvIIInIjar+Wpd9miqQdavLpaFgoN154bx7kgZyqls
eUz2nZKv+lIin/Xivcr3V6SVEc5tv8nJqnxvW5VTJI6hGzwystOkokdk1DuTzyVXOonB25+YcpmU
uTlHAf30+Xl4+bdd9ivKZsDrIeJgZiEKl5AEvUv7kjz21oMXO/srN7+28t9m2ZsO9ZC4PrkWIuLt
D1sso0s6vVsZojgiBgXS1QttGTm8lSvUaT/XxI1iW53it1oMzjFvsxz2JXBgCd39TQRq6us1XQOR
WkagXtOqzS5Nek57SruWK6YFCx0OkXHlEn3CgQOx3N5KBpShNJGh7m5xTGm1isdrWZXHHt2YbK9A
4VCjeEGaCdwrOEbQmKqyLoc/Qnd9I9eetIPS8knZP87uxtaGFdpYi26PW9qyJyYHiRfWt4oPg5U0
3VyNavhe41Q9BAMnombTd9Z7njmu7Nfn799fPr3jBSS8ZPEvY9gjbc7DOMNqMaJ+Z3qooXBT86lx
oZmJLece0jgWff+E9gtjZxRhsRa1J48c45lZneIIJmFcqnfJbKihZ7rYYNhSy+9KgAdOK/CVCkod
X1WyYivFSacB/3JIiz95TBDGiwLu58sgNVk0yrCleKnuufFB2VKXmhyq2nOZ3fRRubj4M6jzC1Bl
sB6TiMWjUfm6yyAJWl0qGLjVxA4+WjtZsTEVz8fxdnHtGb0s3bgzrNC4zzpo89RIDCTjNMw9WKva
49W6VIgLf+PbsrWONdbgJSC6F1KrRow1WO64Dzad8wlXWo2X36BrjOJCPol0VhYkqlNjTl7EHVvB
1wVe//Ce5WiLZvtOOLtmR60Uq5Wmmhh9My/WnTqfTtlFPubsrJmrrT2nvvzn+/O3T9RamuZdGCak
ZwEBN+Yidr7DXKZe+0nrutnAnO7tTBX+usK3NiSHVc3MTD8lYWz9bOjKzEtc8zsYBwf9rkqyv9Ta
TexRp/y32pM8uwu4Lz/gYwFjX8hjJ/ToW8aFwU32GPL04ISUKmde1ZI4jEJtEOriz9pP/MaRIoc6
mVVewg14tUkKUk+hz8fMD5ODuYYOHYN0E+pFzoZ7bmI0GgeSaKfrAT+4jl4OQfb0deGxHs3F4l4F
jm+kcK8iJzCH1L1OfHdnhN+5jn0X165GtqluDr3VPOaNIQnikhvRx9ilZ333YBcPxIR2zb0v8/2E
1KiKeVmylvVay42wIgeOb6bFY0iRNSdqyKt4+/zj11/PX3RRUZlt5zPsNOmgPmSZM8we9JDGc4Zk
wku6d6Ud7i4+FzYOx+7f/ufzbJ9uWCzBJ8JKesqZF8jBcjYEhIKt3eQP3HtN8avS/0Zn51LeLohi
ycVlX57/n+rj7L48lOKO0skRtLIw+v3timNtZVsEFVAmtwahG9Fcj45HM7uUElFNLrLmRGogZQ60
pfhKpiqvECrgWrPz3yyrn2hjbYVoUxKZI04cuqxxoo/grX6FQ2mMVRY3JobUPHTWAy6+LMeIYXIM
MYnIzy/zozkLKk43mz5Ags8FuuBfn6/T+gOZ32LIorHgPwfFa4PMgZaZAKMVlK1cwqpG/Hgjv2rI
vEPo2VJCrYdNZyWxwdp2rXB1+w1OXrU3+XYemstsswhuKb1Ayf6hijY/B9ucmRX4WJn7uZQMN0Wa
JKbknXnaKzwMMFfLH1rLw65dVz2ZtRJ0axzhDl1U8/D2m+gwn3jTPMP42bAUS25ChZAw4YJ27Qyy
lpKQGFbqWjIeI5NTyT5Fu1B0Vo7SqENenc7FwsjoySEIpZm4INndc2QV2ELHNUQ1Q5ERUh5QGFw6
SXknXOhVcW6n4uabyGz6RpWCHcmwTXOLMDmIoohFIYhGFsdHHEqjFdCjg+jwJX8k+0bny4fpCmMI
ehTH6k7RQcJ3Q7rhObLT8CDCuTFKrEZlZkRZihTMIwXDhWWWj/EkIQfpm0sMRzMYfj7Rf/0YKjvj
8gVkmRwceulbeOY8d1oKTzuedK8p05PELKeugNpKw8fHbmmqwY9CaoZtDFngRp5iLSlV1w3CmFbl
r/1eDDy4qeCOQuqgJCWondKUlj3EBNB5kXcw6cIMqj4eTQiGbuCGo9nAHJDV4zLghUTuCMTq3YoE
hZDLbtsgT0Ja3sgcB9VcS4Yi8kJ2XS3qox8QpRZHVtVcZxna5/R6LsQOH9CKv5WzrfJTyagQL0tG
/QCLM9k6uNP5dPqna1HNxRD74U4G14y5juORzWPqJAyOw+EQSnfyPOqS9MoBf063MtdJ88tZcTch
nCc+/4KDFqXyX8OP5lBf+hgrsQT0AxyZQTlrbEjtOh41j1WO0P4xNS9VDmmWKYDsl0gG3DgmgYMX
OHQ5BmgjWsEg8wS/xbPfGMARebZCBPuBZDlHSFTtMrhE0Fpub0yRM+NF4gKN5XRKmyWE5H5lbXEL
VoZh7MhcMBJ2d6Od4wmODP6Xlv2UdX1LpbDgHaN07AtXziIqli8G2/WIkSM0gSYdvaCP5Pg9oUFr
SL47lDgS73Smvw79OKSEroXjzDLqwzpz/TjxUUze7aHTwIbiOqCItMt3rkI3YWSAxY3Dc2Sz8BUA
kTYlyR5B5ddeaWMil/ISuT7RV+WxTgsiX6B3xUg1Ton3XNYgdivXkMQ79X2fBeQchZND73qkmnoL
1NsU6bkwi0xcp68Q3/SIoScAYjGbATUisA6qb5xl8EA0tQCIbuOCWEhMGAQ8ly524HmWpDxLRQMv
oksFAJE5CnXwHw14RJMhPXIiciJzzKUNDBWeiL5JkHksBiYSiw+nA5u3bJmJlNUllohcxjjgE1sm
B+hxzSHyJKRwHOhmhaIeyH21zjrfsdzirjzV2BdnXBZ2ch+yKAzMvEGc9PyEHB19DCuWbwKwZo7k
ulHVEaVY3GBqKwWqTycWU1dKEkzN6TpOKGpCZpxYMk4sLjI2hr2Fr6rpngQ6ZRQlwZbiHELP3xc+
OU+wJzQJDmLV6LIk9iOywAgF3l5VmyET+vmSiYsOHc8GmO7EEEIgpsQwAOLEIZY9BA4OMYCXh1xE
BRqW+rsbTZtlU5fQOwDHDhM7EvsQYFRLnpLwIE2kjnu5oxq21lwqEvK3F0XUpxzanRhHjOh2IgoN
+/2UnU4dI6CGddd+KjtGor0fetQyCcD8Cs0UDvqOhYGzNyRLVkUJSGHUzPRCJ4oIAPdXcoYLYFNL
b+dCicVPXPvW5VjuKdW9y2LxKTF5zpubDrCEpFQvNoI3lh9kCgLyfYfEkkQJ0U51B81EtkFXR3EU
DLTCaWUaC9jj93J+DAP23nWSlJjCsNUETuCRuydgoR+Rxm0LyzXL55DgBOBRwJh3hUvJUB+qyKU+
6O41LVzLtnWLosGoA5vtEXbqwI4DIwRKBodPslcAeGPvBw7/P3s5XoaMOqjVBQhHxNwr4GQUULs+
AJ5rASLU15Plr1kWxPXeMrCwUGKzwI4+F5rMxLNLGFksoBUenzb0XXmGgcWkHnUrRx3RUi/IQq6X
5An5rnZjYnHiWXQ/AMW76g5o3oRcfZvUcw7k4tugA6C9pbeBjZFWXwwZ+R53hS91FpLSwlB3rrMv
knOWPQmRM5DtBEjwxtqLLLtaNGAIXVLGug2uZ4kTtbDcEz+OfeoSTuZI3JxKH6GDawm8J/N4v8FD
31AoLHvyATBUsMUMxEYvoEj25C1BMNUuJxtSkBC/V6TpIaWp4LFva9dBX+26QpfLmalylTGTMARg
pfnwN3j4BTqG6aIEr4WpqIv+XDQYzGe+QZ74o5+pZn84OnMrORpZaPe+5MG+MGSz6ghn4ciLU3qt
hunc3jCMbDfdSzIwHsV/Qn0du6SqEzeKE+M7iUhrO0kbSRL4WkQqR2RAn338f7ut/2aZsu6618NF
fRXxnXaqg1b50nUAOtbbUpyp6N6XIiZ1bdIf/JW2jsLFQlFC1sJyhz4LQM3Arkh7M0keFd0kr0GJ
TSSTkvmvQoXBSxT6oewf7m2bm0jeLhZWalVm15X2uqCiN/KI9hkeJOIcQ/LXyxd0V/TjqxLxioNp
1pXvYN77gTMSPKuxzz7fFl6Myoqnc/zx+vzp4+tXIpO56OhNJXZds06zmxUCEMZC1MDlccXZTgMi
A+uVtp8rYS0pr8fw8p/nn1DRn79+/PWVO8iyVmgoJ9ZmVPcOJVWyFUb/hP5O2REPqFojEO4mnfdp
HHo0y1z/t2sorE+fv/7869u/7NWf38QSLWz7dCumbEVDlJUX4PGv5y/QTTsjil9jD7i7bWNmcwXC
064VqXIDh6LuprRKddPHuQbWvJds1heURO/zt7v23n24wNRHxeOV32MZo36J7SKZHc4ULfrGSm7a
e/rUXhWvTysootvwKBFT0eDmSR2gVva2KxruDw3Tc4j0+Bsyo7Puz78+/vnp9V/vuh8vvz5/fXn9
69e78ys02bdX9cp3Tafrizkb3L3sCRrBcZdWbk/D1lbbmiFutuVW3CYH3p55e8FzxP0a0QV8PfaJ
/OaF2gSE1bdBrovm5LkofxH9LOzEzI9mUzHziznulwl8KMse7TqltNZm4ADr9tqhriDRXI5yNZ+9
yQRXR8zjuJdoyuqDF1HVQEdxfY1KBgvI0vpANYx4yhQQyOLC2EROA9TMcamsZv/2VP/fCaLwYkw2
CXdBS7XFZoDYjIHjJPujkQeMIHIG0akfSnKQ9004RC6d7rZEXZtxN4rUEvuJymExDNv5HN+I+GgB
1w8ZnQZ/qbVfyIHFnmVErTx45+P/BpMQKne5QEz1cNAT1QEovlYdnxJSJ9ftiAHttG+2Rh7wxeEb
deSRBnZZ+KZFl0s4fj6PxyPZyALem+ZFXqZD8UCta0ucEAKbX1cS43J2BqWuHQux/5Aq9PlNLjGr
B3wN6RLIuu0SWQ+56x6oQvH9mGqfjvs+22ug5WUgVcgsxBGVD4ogG/BJkw+arMrlW9s4WR4OWzoZ
4NjxEzWrsj53IN9oOdUdFsqxjRaMdhI5xkew4aeea/noWldUk7IjHOEZK49KlESmBOdGJhHgz2an
D1VLiXSQLCfE2S4tuoFuaXMSzjHnVZcdbUsiM53rNJuymjrvKmyaGzKB6dbiW+Crf/717SM6jF1C
MBsia33KNSkOKaul9leZKuJNnzvF/pazMz9WXYAsVNotBHdcLB4vavmmg5fEDlWiLUyCng0PlICO
82FdokbZynOpMr3k0H7hwVFvEzk9P4SxW99v9PqNSY6d54yWMGvIoD943Gi6NbeE0G6teSetbiKU
7zjZ4hJ0xRNKP7iiqmnpRqZ1u6Jny8zyZAS7FkVQn7alxa9nqVerKsVib9zZ7uy/5mcRNeJW0Ff7
YzVzl2j4hPrh6B98o1nmAyb3UWjJ5Ay7F3pxXuzQ5B7OXJRA1GE9E9WAJzKgXFVzQJhQq8wjlKrH
aamRPTicM2O6XsoogPW1U9yMz0AYjporygtITB3vcbk9kAplo2+/MK3ykUXeqDfhAxxzK1rnjXCS
wBZI+uzd0FCfOpwcka/UxMwSdu9a22y+jg1qaPS8oFuckG0MB+quY4WTwDdySw5OTGSWHDzblF1s
682UDolGHCI/0ivIfdwYOS5nQLJ+xQcejZAOJMGXi10UjtWUwSlC0puNbQWZabqlpg7P7yjk1OrE
mF+rD1Z90PRD6Pj0GsbhLBzCxNad6Oo60RtxPudYPmFFJnY1rRysDOJotAd24jz2e2YO16F6GbsS
7W6aOcvDUwIzw7ZeCnN+bTFIj2PoOEZAwPTouzPZltr8SF+o8ob688cfry9fXj7++vH67fPHn+84
zvW5P/75rKhXpOMLsFj2BIEtEXkWtd/vZ6O1jIje1mc2ecJ8lIjUAYNP+D6soAPLbIbGyFh1/iGw
Da754ZAyjCHlqr7qfdylVZ3SoiU+GnGdkFoTxXsS2VOBoMSjOp0WVwkU1RQZZscJ9OX8UgWoGelz
Q8IVxxFSwnqDzO4YCKrihEGiemSRgb4jZqwsWqynGYOtyqcuoBeFhCnGLkh6zeXLq9nJgzGv8JN7
5Xqxv79CVLUfkm+8eZ6rLwyZKDxQKLTN2loVvWc/IhTRlE8WQDGkXoVKNWgxr14damYEGqh3J3dc
YWxhd8NZtw4HVrlivrbWc0HVpwhSrCeFiF1Sn2+7jeRCR415vBbbaBM23IPE4tyDbzXtpRZeWkir
D5kFdc9qltvHOiLiHlWdCLJCQBxg2qFQ6EZ0ohJggtdUuC5SidvVg762YYikKcW9pqAm56IyNmeY
YlMg7wa75+FNNWTYE64kPQjhBpzKscinW1sN+IqBYMCw79e0wjdC7KpEsNl48Lqc35bvcoGwe8Z1
T1afryAe25OIPgyqXHi4f4stD33LjJKYGviLciMlsYgzvaXEXHOw+z11RJdQ68NBhWce7EQCVl9G
Kot8clQQ13OtCXuk6aTG4lIJn9Im9EPV7b6G0u5wNibVUctGF6c/O3ILZQ8jChrKITE2pGQVnJZD
6iO0+fViN6Uw2LQi39Kt61a0W0WUo2KyKhzxLGnji216cVWZ3hgWm7hi+Z50dSaxiI2ZalGEojii
amYeZ1UsTCK6RMuJ942KL0fg3aJze+PgYM0Ig4e8mQAefa0JHEJa/aRxxZTQo/Ec9rIhA3zorbHf
pOSpX2NSnjjomByBRcJmDZC6xal4nJDLEkKJGp9ABjsX+pcSuSSmLgxcevx1SRLaeh4w0kWazPIY
HzzLboDaCYtZpsa0PzOFTxuyZQAJExsSkQsfIvJ7IhU5kDOxO5Ypoz5Bz4JBSKZmerCQsFMyOvRX
p+uHwrVgN9gk1GgXGvjGHsJ5DmSrdPeaIvPLwb6rL3Smq8HLbrac68qO000EqzYYZPP8ob1mF5b1
BV4bDRiwlfxiVtmYAIjDdFn7IUjIBy0yS33zyOZhXt2ljkU0QJC9IfawsE7iiBxcwh0DiVRnOE05
lh4XQvyxbS2xuHXOW1+cjtcTPVcFS3d/KyHtdCBD/JAz3eo6I+vylLhOlJKfPiWJF1hEBw7G1EXa
xoOvT1xYI+gU8NTv+W/sYEIRQq8ypkJFx2w7yqJeeWMN5Gyuv7+Gm5oTHQvsJVR0Kxp2cMnVhtKz
SKjVk450BNoCKphHKHRjTgH66V1FQnJ2zsduohJ86anSY3mUvFT3mb4LY0R7xVltVfa0vg9Y8yJr
czjcUXVH9FZmhWI7XvZ4C0UbhaAgPoaXnBaPAC4HOEGW1LQs8aQKx+MH6dq+F0YZKmVQOZrrrR00
nnvZHNsmx5y2ZgH67GxJKk591n/D8n1XPkLa5a61ABIb8vA/g+9vGfEJVIaK2bGgl7TvjLxZ2jy1
BrXPQiL9PqN8r0A/LmGAtW+EV/SSfmcHnzHaBgOt9NEmiq4KK/pSsWhfSNPQpw2rS3T6oxWE2cbE
kDZntfYfZHdLhT74kdK0Q3lSZipSu7KRlDFoy8PJvdJPM+ME2zceEJv3NjsgzokO8Vr10p+X6BL7
pG0BgsLMKG3VwqnnYZ62iMgDW63kG48DcmwFQdAC3CCRm0rROjpe/LnohmHG+cfz9z/xMmILMizb
fE1ld72Z+t6ZIZejAcEPtC4pp/woKVs3KlOU1kjPuym9jtypEqw7dPqzxyRWVCc1ojViDzWbLkXV
qcMLkdMRozSQDzcUvqpN8wkaKIfFqK/vqa2aWFZoZrW256KeuPHNUgStaDYMv2MX9M5IoSy7FGvQ
cLwNePn28fXTy493rz/e/fny5Tv86+Ofn79LZjP4FTDiOHScSE0N6aysXDlc50Jvxm4a8hSOneMO
OD+4kzyE2wok3lT09azPVJ9QSGS1Cx7q45SXrKPDGyHH7axGX+A0aGBrry6vVyzp8ccq+X265LU2
UjlS3XKmNiJqTNH9e3dV2bu0Kaqlq/LPP79/ef7vu+7528sXrXc445Qeh+kJxI5xdKI4VbOYOTAz
2Jxh0MqeQSUGdmXTB8cZ0Hi/C6dm8MNQDRm6MR/bAvZn1Cx48YG2c1CZh5vruPdrPTUVta9szDmG
YK/pXLH53siLlXVX2WaaYCmqMk+nh9wPB1eODb5xnIpyhJX7AYoMK5V3TGWthsL2hK/ETk9O7HhB
XnpR6js5lWJZlWjuWVYH3yPTWhnKQ5K4GZlG07QVLGqdEx8+ZGQnv8/LqRqgNHXhhI4cH2fjme8i
Buao710ljrI5z9MGmsk5xDnpw1jqlyLNsfTV8ACJXnw3iO5UJSU+KN0ldxPZwkfqxHnDqvKDcAlv
pgTg0fHDR8ezwecgjH2qFA3u61XiBMmlkrXSEkd749a5fAqoYQ5IpiiKvXS3hSTmg+NGdIp12gzl
ONVVenLC+F6EtIpo+6CtyroYpyrL8Z/NFQYtbQYhfdKXDH1fXqZ2QBOkw365W5bjH5gIgxcm8RT6
8vvajQ/+n4IwUmbT7Ta6zsnxg8axNJxFqbFbjj59yktYPfo6it2Da0t4ZUo8S8h0ibsFyX7qjzBb
cvK8Zo5HFuVulJMDcmMp/EtKDkqJJfLfO6NDjk6Fq7Y0ocZkuaS18+esfCPvJEmdCX4GoVecHPeN
+iRpallLVqb2BOm80cxF+dBOgX+/ndwzmSOeaqbqEYZj77LRsYyDmY05fnyL8zup2yK4A39wq8Ka
aDnAiIHpyYbYFh/Pxk3bX1m4kwNtjCuxw9FvSrMx8IL0wSaJqKxhFKYPhqQjeIa8nYYKpsGdXfy3
Zs3QAXPueAmcvLL9hp1ZA78eipRcZzlHd3Zdy+AZ+mv1NAsi8XR/HM/7q9WtZCCRtyOuAAfvQO4t
sEZ2BQzIseucMMy82JMvzzVJS/782Je5fOstyTcLoghrm/HV8cfnT/9So0Dgx1neoMNJ28zNLjAm
8I4fZW9fWyuW7RlIDXdkrMIVfIkrYTUcIlebvCp2HTPtU5CxJtTjaDJIXZxTFHzRrUjejXhjcy6m
YxI6cIg73fWhhTJ+NzR+QKoXRdv1aV5MHUsiz1gvV0jf/uHAAX/KJPKMMQPkg+NR1zIL6vmBnhpK
i0sHaukNl7LBR+RZ5EOjuCDhWefG0LJLeUyFCVJMmmYTbNq5SUNjtagamuyhcaihsNGeusCcZviS
uolCGIQWm9/l6y53Pea4tMkFMsH+jxHhRvjHGPlk/GudLU5G7XC4onlnAfCzyAvNM2Wa3+LQdfUK
ShAesm1TDWdifcm7JAwiNW0Fmt7HnqstAdthT1VACLKeqbHQmKuEnHgxNOmtvKk5zkTqnTpvqz7r
zpQlMl4ZIcNlTPwwVvy5LBAePzyP7mWZxyd98skcgar5X6C6hK3Df6QePC0sfdGlnWwUtACwOYay
maZEj/1QWwHnN27n06i3z1Dm5LMGvvjhIvekNfeI2q3phLr9gg2M2gFAqi4aEclkeryW/YPGhYFD
+7TJ23rZJU4/nr++vPvHX//858uP+am1dLA/HeEMnKO72C0doHFt5JNMktt4UTNxpRNRQUwU/pzK
quphz9jaawaytnuCz1MDgHP+uTjCAVVB2BOj00KATAsBOi1o3KI8N1PR5GXaKHU+tsNlo2+VBQT+
EgA5XoEDshlgeTeZtFq0sndAIObFCc4nMHxkTSrmmGYPVXm+qIXHACizuo0p7KhpwarCQD2T/f7n
849P//P8g3iuhi0/RxhVuviI09tW3eutYJSABFB36z2l0OhuAFWvasWZm4vHOzIxHZ7039N51DoD
iWvz2Ap4d8kTADZVLb9ymAkguGZFVWk5cYt/Ww7oC/I8DkFoOf4By06EAEBnC0a1gwsUz9u6UKjH
vk1zdimKQeshBudl36Hci2K712mn9QRSFl30egug480VNc/sD9/8kqGDqZL6CCAqK/hAM/E0sRPT
mn3Ds7aqYM5jJGTufYpaTNUEVaNyBbvBMLT1lHDHgly4le5xhSQXlR/LS1u1mQ2py2Y6ZQ9Tx8Ov
PGwes9SUq6LopvSEQeKwVtMSq4vPe+Q7HcW54t0zyADFrOk2/GusieIEzSGxtkv9iBozC8Mq21kZ
FvGN4FlPEFN+K7WRrHO81cAbpxDYpuFG5DjreWW7eQ2rzt0FhAg4a6xKPqpgv3/a1z5RD7HyHcSb
3bSkWNcdP4RJ94BAWZO/3M5K/F8EIV1KEiQlAeHa6fnjv798/tefv979r3dVli+23Nt12pw46v+y
KuVTF+/Ylft6wKrg5MDpxRtIH4Wco2Yglp1PcjA+Th9ufug83lSqkBJHPRsuGJJuiREd8tYLav2b
2/nsBb6XUvplxKX41sp3ac386HA6O/SxZa4TbBQPJ2ulhRysVq3FC1BPfhC+bmpqEytBahaOhyH3
QlrZszF1d+q11YYLtxNVkVNl0D0PbsjyzpyGkkQPL6aAMb1bSoWebfZ2S75YwP/XhLgNtJNaoQNd
uAqOXeTjLoVFiT8llRkF7p7Mc33IbyCG44Etoxs0b0zGkt6Yjnnkqi9dpUz7bMwaWljduOYXH/t1
LnJZafXGOrF8fyvzoqWFVX6CnXeq7PXbz9cvIJPOJ1Qhm5qrTn6ta66AYq3sQ0Iho6xwrRv2R+LQ
eN/e2R9eKC3ufVqD/HECAXxhIlfNN0opLQXtuSVTMMwTtm9Ye22UExRvmAucqoxWAKLUjGW+hcwb
+qI5D4p9KOB9eie69npR4jlBMrOjtqVT2PeXj5+fv/AyEPGc8Is0wGsdcnRxOOuv1EziWNfJd8Kc
dIXTW6UVHn2wP5T0CEY4u+C1jiWT7FLCryc1m6y9iqgnSjp1mqVVZU2Im53o32RPHQhc9PUw4tDy
57bpaaekyFDUcBI86TUuQNQl3W1w8MND8aT3W30se21MnE+yNQunVG1ftrLRL1Jv5S2t8lJNEbLg
t2R6hR+ebDW5p9XQdnrSxZ1f0OnJnJ96mwNShEv056UmVQ4a4X167I3+GO5lcyFP3aJSDYNT8aA6
HEekyuwhODle0OYGAmvaG+XvhoPtucQZorbuQsUfnaR1XOnqkEByf62PVdGluTeRkViR53wIHOLT
OxwXKzZZAuyKoX8usxpGhq1za+jcvm3UHqjTpxNIJ1rd+kIMemN6lVnfohs/WxZ479AXT/pcqK/V
UPKxaC1+M1AHBETgWMsNMhV22KJRiwmTgVJYcY5iSKunZlRr1qGLrEybZTNR0tJo5V8YYAhRZ1aZ
RTH35ECVNvySLmMG8LQFMZ4BiShGgfxBj3Yzan1YitYfennnu1NLUbmCE91DG58NRUoHFp9RGIKw
t1gCf3Gea9NVZCQPPqxUbTdfRPACP2UlpX3iCdZpP7xvnzDVreYy1Wimoby1GqXtWDFLPjL5AguJ
vb7Dpb+yQQRvt5Tuirvy1DFf7ZR7WdbtUOj5jWVT29aYD0XfqnVcKEb9PjzlsCUrkR2xobjH8Oly
ParcMz2DquDDEv5L27CrjsknWUpiWO3+VFFms8r0MjFXqWXt/1P2LMuN47r+imtWM4u5R29LS1mW
bU0kWxFlx90bV07anXZNYvdNnKrp8/WXICmJoEDn3E13DIAP8QGCIB4D8rDcbObF3rTd0ys1C/Uh
QRQ9RQuOMJtVVmC1rT78QEFYm2q3bDLAAT/Z2yJDzKeD2WKKHV8vb7/Y9fT0NyVu9aW3a5YuctD0
bKv8Zi2ry/sVhNbr2+XlhVL7rPMHwZiGeYdf8tJJwQ4dwx8OmAEnOLWIIkidT0A3a4BDrnNQmz2A
nex6OZiGwhk7UkmLYvyK53p6hjgJXfuOFyapCeZMBomQEspv7oZXNkJDyg1/9F2zrIp80v95QOsO
b3IwGsdxA9cNRtXlpQs5wByLmljQiGATpDqjx3rGzMBdFud97sEJ+TLdox39Vi+gpnOfAIpAqdhH
XH7pZsblgsP9dkbJDTpJk96P+gfOeqFPe1oIAmt8Hdl/CPNCanA6bDgaqDp0cE75DhwKV9CqIiVS
RaQCx5hlQclhKyQ+UU+vrENHt/4eGZFxXAS6i4/Bj/ktGxWWPjm2spz1u17AnDg05ld6G+Kqeqcd
6+Kfe7EzGuHWDxPfAI6URHKlmR62Arpm3miZrfN2PyvocKmCoM1S8Aiz9bQtszBx96OlToQj6xDg
13xrD4b/GJVtWpkzCdcEqrmIzFMn0AXz3UXpu8l4TSoUnXhGbkoZQWpWtnC7Mjjo5PvlbfLvl9P5
79/dPyb8BJs0y9lE3WI+zqBbJo7qye+DaPOHwYNnIPSNl4mM1WRd/xBRzuSPMr+iAYT4HCbXqYvD
7Eubj0ZVxmsi9qsxhLWdj7Jl5bsi9bJ8H315fP8hNO/t5e3px42jqGnjULxo9APevp2en8eELT/q
lkjdpYNlsJfxlynshh+Rqw11U0Jkq5yLsrM8ba0VkY+jFGFWb0dz2+HSjIvFRUtpRhAdyc86ZJdP
Bc+YGMXTz+vjv1+O75OrHMphja6P1++nlys4ZFzO30/Pk99hxK+Pb8/Hq7lA+5EFHy0wjDCWU/+l
aZVjxQFC88thQclziIhzpHm+szRQC13c2oKVsaloXNt+0YWhGexfXQIcNiK56uHhGoLrglU/NVkQ
nbssdM9LDjBEPQCtsnbD9zUJ7F4ifnu7Pjm/6QQc2XJBGpdSQHup7km4/wgArndc1h0tE46ZnDrD
JSQZQ5li3S7G2QrGJHWzIUMedXiY119EOXC/2ha5cMGylJ83u4Py6ervPNDpESfpiNPZLPyaMx+P
mcTkm6968JIevo8d7JqtMCp7yo2uzRkYCFBlJeaQ8U2zJTWpOuE0MMdnwFiiSmtEkRE3RmFWX6o4
jOhHrI7GHvRFEUB0+ER3P9EQZihQhLIFYkI0dPA9jWYUw9QgGcW17BEszPwp6W6uKApWuh6KsIAQ
nkdVq3D0W2VHtOckZLgPhRdpWD1ihQoEBG4iWhY4n8xejEgiW70xgagCt40dcg4Fxhpwvd8h9mBW
HcW9791RLdxwr+8oxm79OibBVrAdjvHbXOJYYoUpmgWXVCwG8v0C4kyBDoY1EISxO+4bFNTtWjt4
XvGrNblfmh3H3N4uQEIHT+gJ4lh3Q+lHI6yoJtmcM6d4dByA98lN7grLIiGaEfBgDBdckNxJAnNr
lwBBQDQl4FMantCMKkrciFoqTWLz/xgmM+CTfGvcgc8EMTEignF65Gb0XGr3V1k9TYyFI6ye13MV
zbOfI5CqPz0J58z3fGsHpsTKhXWYZN74YyRG5TskVnwkHT9E/+qXxyu/Kb1+1jnXi8lJ4ZjQFlJJ
IwlvcUI4FOPwsEirovxiaSSyJDFGJFS2X41g6sWhZXFPg8/r50fv5zTBrW0/Z17gUPuuizZPwCOK
TbR37rRNidOwCuJWD7uqw/2QGlvAhMntk51VkXfzw2b3QUwzjqYOs092LazWW6zbtL3R4SF9qAjF
wI0qReZEquQNe5uO5OuX9X1Vd/vncv6TXxyN3TOqVmWCur16ZPKj2zRdkprb5yUrD4u2Gqd7M+dV
RGahxAkR4GInrhs32gGjvVuD7GdU5TKJ1I1yuyZwsY6yH8Y+bdbNfnUJtG600Zl5jBbVruUynUNs
OQiWQuyr0VVJdEDkB/PjW1+p8nWNW1q0/C/HpfrQVjV1EBl5HzrEX1+DaUBUU9adLnuMAHXbGGFG
vh+ueks9A0nfo31GdHOfHXbE+cbWO0ZUITJNkWuz9abuLV6kguaNq2ynyOGtl/9hLRDH5NR3CHlR
RmoZH7kyGRNxjRXPxZ00AJpGdjy/X95un7edrbxm3gUJXLpATiOYaVeuYXYdSjpJVunY6yVlX9bZ
od2rdIniVUpY+D4UbYb7wEmWyDsGYH30YVkO91CmNR40NGULeWgqtoSujGcx3RdQSneO5HXAUsY3
H4Cy1HX3FsdZQEOUfaKJ+QPRikptx4FD74GP5vNKW+EQoKmaZwcMFN6iBYfpnoUKuqkP6Rxnd7rz
D/S3V9nCaI8LRLM83bZgKJjqob07+F59hfYUWx9qS/UVhH/RP7Diq3+DAu1Aphe69HpWL9Sw6QVk
mD66SI+rtvtxmcpSCJKXmY3I1zcxZeR0C0bkOYe0nln6IilcR86GnpivqEZlhofvLv1aZTZtEuzx
chJM5WBMvEpeKQWIw9w2Te3dYcXwMuCg7N6oTdgr868hOy6QK1iTh2pZ0VqBgYbeJHORMgyF5lLQ
AcAWYrWhyVoBTX6YpYwOMSdj9dimskueBzYH9vkuxEaxbn1TMhksLcSuLI2yPWvMXk6QIFgX4Xrm
aBmnKhUKT4JJHpq0mGuMd7ZdTC4/ITq8ntUVal8UJTJ3YQ8CTq03WY/BCTmEn5i7XDkq2oYFyEZ2
FxjdBeViiP8CZpWnOAG9Dhda7pxOLWx8ec/ot3vlTD+MHYQNA/OywcBmHgDjVw9dyPpJYih7mQom
LSuKA7ZUa93oTnfn51hP+8xauJBIgwwQgBkKtV+rgEqbtsf99tvQG9Xxw6zkxx1tZKiTUK+FGl5a
mPRtb/XXEv6D7zgpwRbNPUbMIQAZhaibre6StlvgZyr4zddOwUeZcmAW6Mp4FuiB6mWDKsflgoNM
LKjJBDLylvkbckRtR8BZWpYb3VZLwYt1vW1H0Kqi6gWHRuXUexiJUIpIiAt8AnI+/sIGXl9qu3lN
7fydSNCouj0QCyjYeTJlSKWcm8dWSpA76P3y/TpZ/fp5fPtzN3n+OL5fkX1Yl1riE9KuS8sm/zLD
RhGsTTkvoi0HKI9Mbb02myrvHYHIhHR5WaYQ9qP3FhokC/HCfVht2rrc6tmgJVys6L6pDWSN3W/c
Ka1ekZv/kJV3RB9WD6wu1uUGx8UcoLZLqkYB56DGJwYEK5oFjaibuaU5IdtQ7TG+NbfibjkMUsrF
uA0SjSA+Y8VhRA3dIB+qlRazTk9F3TzwS38la+xOUxU2zwB3UrjR+qrwo8ixdWBV8PuTY9SkvuGA
D0Epm9QZmCBo0gIkfoUsrrgKKQ5yQl3ABYmnmt+bpCJxFr88ANTMQG/ptugLrl0wOt6/wgQNfsAy
kubxfHw7PU0kY6wfn4/imX7CTG8UWRoY7bJNUWpXEwMTtpviaLw0SX8Wk6fqZ10zq1fOxbRQpCik
eQJkn2z55t8uKVftzUKSD18oMn93sGFP91CryNGvTaNCPsmhU4yrZH7CJYHs4WA7pwQB1RlYTaNC
8kX9+Hq5Hn++XZ5I9V0Ohsjme3k/B0RhWenP1/dn4nJf84WrbU34KY59pOYQ0DUZy1mgxHJeKvtz
CwYAN7CMiwmaCmNAswpFJ5EYeUTSA4A+tJ8G8OJ6KIThsXwDuXycvz2c3o6a6kEi+MD+zn69X4+v
k815kv04/fxj8g5WWd/50h5MdWUU0teXyzMHswuhOJEayyxd7/S0CApa3vG/UrZFqZxUJnHIsFys
F0gckriqx5HfTnVH9lNofOhuqugocN6JcOOvBIKtN7oTkcLUXnpQEcq1q4lA3ezluDNaech5zEsf
yLAlPZYtmm4mZ2+Xx29Pl1fj6/oau8zfI1eifmlk0mRY1yYKoLTd0L9O0VnrEodJJYt0DplU90T/
1vv6X4u34/H96ZEzyfvLW3FPz9D9tsiykZZry2Gs3DwgiHbnq9PU01wy+w591qw0/vqfak93RsxN
tY8rvc4RubS02dfBP//Y5gWwfCjvqyUZo1ti1zXqO1GjqDI/i4OmPF2Psh+zj9MLmKr1G5foAERZ
FfsJRqltIJJFQy7Y/752Zer/7fTYHv+2cAUlRWC5gl8C0tqQNfgGatJsscRQkW36oUlrrIphWY2M
wwBWVRI0yOxUz0Sf7z8eX/giNTeRLq7AHY6f/0OzEspmKKCHzCVQZpSiQOD4RXHscyww91Vhwajc
KjpInRe4XX5WAK2taSgjbLTzUY9ZVXuUSK6QrDI+u+PQGPqQrSEmCkraoMTORp8HcrT1DaYUTugQ
5lc40FJRHOwLywRO418CFKfTaZKg92UNQVnp6+UcqrppYqmN1nlrBJSlhoZ2LfVaUvvpFJ82HdGP
vRoF7e+gEcSfNjKlFD8aPh2NZ7WZmUq2njywhGHQKG4PKHY90eDUO7KGzhxLuZwyYtHwqWUGgxlp
/dIJ2kv9PquJ33MurRdIvSbOfasbJGA7lbvKSgke5XWJo/b3ZP6IjB5voKcfwLciLfRYVhEMdX96
OZ3HZ59iABS2d9b7rwTQoRs1JC/YLZr8nhiVfN9m4j1dHpP/XJ8uZyXxjt3OJDEkIT/8lWZaPhSF
WLA0CWJtGSs4TkuugFrOvr6rA8r3yUSDA4GROn5A4ETwCl6369ANxz3rU28dqoJloz42LWTTS0dw
VoWhHuZdgUH9b1rTDyi+Tvi/dNAbfvBsGuRDnbYVvGbOm9SSgV4S5DN67SnZlEt5C/pBY9a6h5LL
f21JoiFtd14VtFoYXjJsOHGHXtakc+WiXqaH+aIUpfUXPX7ZhjWKEpvBQyY85Kzz9pAthrEGeLHQ
RCH5znpY55UhH7EKp/pIY3iOmzfGN3esRb3hNHWmd04qehZV5sFYI06holWTn1roK74ArbBU0f4a
ww7ZjCI13msRXIn6FBYcNEepcgF/tygWggqDlRODrkTWsPLPBSPL4I/pWmUi9FlH4mnyPCdiD3bN
u8J3JS29zHfSR0ReW5+eji/Ht8vr8YqvrPOCuZHnoBCvHZAysUnn+9IPQkwuQJZE6B0WZfQWwKk3
ApBUKkv4sCGr1CXfhjjCQ7GaqjRwRr9x0nEFQ+3OqoyzQBknkYaadWgYVNM89fTcj/PUN4LpVmkz
t0Tbkjjadk/gSItoza1d9sdHSp+7PZvTVd7ts78gNQeZBz7zPV/7jqpKudAUjgBGPncFlCOi2TCk
UzrBK8fEQeihGpIwdDs/dww1AdrjX7XP+KSiRcpBkUeelCxLwWN5KM3au9h3PQyYpTitjrGh5CY7
P75cnifXy+Tb6fl0fXwBry4uGJhb7sCKZcX5e86FJn21T53EbUIEcb0A/07Qppl6UYR/J67x26BP
Yrx1uXhM+XRwROREBimH8AMFcoxDKHF+yadOB0RnbOfp1OjuNIoPuMNTfb/A78RgTRxCLVGOiOOp
QZp4FtIkSFArSbLHRZMgovxjOWcU1kVcsNPKgyptDOGnXhrOPYXRFV+HApTOgKCe6tMEmMmyNsrl
611ebmp45WxFNEhS6Puy3jDcF7D5KRuQRBEYhINq74UYuiq4rKitwNV+qudyKdapxyUDVKRYgzrD
qL2o9tM5BknvJhOWubFZobJTNIBt5gVT1wDEaIsLUEKtZonRrAZBpAYHEJ1BcJDrWmxPJZJyrQGM
F7hmTbRzEMeIzAE6cVZzQZfOJw64gMxTB5jEqAjCd0EyHJmK2LK6dCp+pQA7Dbxaai/yEjz263SL
M1Cv66zCJOJ2sINF1tty6BhpYXrYb8aFxJWisMB3FjgH674ZYHG0/NJscJ/6GzCDvAdoLynXcmOI
tPfGnNdIDyATyxqiU8voAfopAfKvHIMGOXX3GLsV3YLNK+OY0zHow8BQODdA23VQ9DxDAVsxUA7k
vUIx4yWUfMfukAFzPNesyfVcPx5X5Toxc8mE4F2xmDn6qa7AkcsiLzLAvCY9nq6ETRPsCCChsU9G
x1DIKB53lcnoELabWltmQUiH4JfucXz/4nXE4RHAxcCTpjWRsEnUTQelleC+q6kTJ26JDrpwsXi7
nK+T/PwNvwBwyb/JuSRjies4Lqwe3X6+nL6fDG1+Oo/9iGKjqyoLvBB1e6hA1vDj+Hp64r2XZtC6
1NOW/MpYr0ZRliQi/7oZYWZVHsWO+dsUvQUMyRlZxmJ0aqX35o6sKzZ1LAmEWDb3HVsCTehj0UAA
MrasdZGY1Uz/ufsaJyiU02hkpMX46VtnMc6ncJJdXl8vZxQGsxPm5cUR81YDPdwHh4BQZP36fbFi
qgqmBlY+3bK6K9f3CV9PWa3KrbZ0AOZxFej62hrN0jg0rwZOzanKDiQ3Dd8/j3KpI8lbW9qhE1Fc
gyN8HMsXIOQtkyMCDwmtYRBExm8kXoZh4jXCYnYENVoME5+S6wDjoItAGHlBY4rXYRRH5u8xTRLh
IeewaRgav2P8OzKEcA6xjKKU8BHp1LF809S4rPi60yznQrGj57eqNy1E+NEgLAj061EnTc6xzTwX
/lz6vglioZHGvYo83xKyiQtvoUtdCgARe6ZUF0wtGV8Al5BSnTrxU3zWS5AhHPDjigOd2FPRjvRz
jCPCcEo/1Ej01Lc4dSp0RLrgyNOsG90+486NnSffrjnj+fbx+tpFE9a19yOcyuZx/N+P4/np14T9
Ol9/HN9P/4HgPfM5+1ddlp3FSPZyefpbWko9Xi9v/5qf3q9vp39/gCEy3vNJ6Pkkj7pZhXSg/fH4
fvyz5GTHb5Pycvk5+Z134Y/J976L71oXcbOLwIhVhXHmDKk+/X9bHALe3xw0xCaff71d3p8uP4+8
afOcFro/JzZ4IQBdMkBAh4vGBWw+kel83zAvoWvjqCBEp/7SjUa/TSlAwBCrW+xT5vH7nE43wHB5
DW4oq7QjVtwwfDpMblVvfSd0LCpQdXDJCtJ9YSiJOxT4l99AQ7goE90u/S4sl7Efx1MsBY7j48v1
hyaeddC366R5vB4n1eV8ul6MpbzIg8AiLUkcdRjA25Tj6oo1BfGQhEI1rSH13sq+fryevp2uv4il
W3m+fnmYr1pdDFzBVcXZI4CHPDFRqNCqmBct8ldftczzqOvBqt3qAgErpo6e8gF+e2iSRt8gGSVn
Q1eIWPZ6fHz/eDu+Hrmw/sHHZLQ9kVZbgaIxaBqO92Rg0ZwXxiYrhk2mKd4Ltc2oJ6v9hsVTHCOu
g1n2RY9GG/eu2kdI57Q7FFkVcGaC6tbhtn2nk2BRkmP4no3EnkUPUDoCf72OMoYAi8btoWRVNGd7
kr/fmGV918NsiWBWrxR0eCSTwbREmgKCl//FF7Tx5JDOt6D7Iplv6aP9wH9z9oLc0tJ6zhLfoiUT
SJsRScqmvudS22e2cqeI4/Pf+r0v4yKQG7sYoLvp8t8opmcGkT9D/DsK0Sgsay+tHVJrIVH8ux1H
fwG8Z5Hn8iHRIy13NxhW8tPMjW0YT8MIiOuhnam/2ZQ34kdLkrohDeH/Yqnr6a8WTd04oYdUpk2o
S9Tljs92kOkWtemeM3O8zxSMfjRab1JL5JhN3fJlorVW8+6J2LBoHljhur7lHs5RgcVkqb3zffL5
i2++7a5gesyfHoTP/AGMOEObMT/AoW0FiAxf1U1zyyc1jFB4XQGKKSUwYKb62ycHBKGPhmXLQjf2
aFljl63LwBZiVyJ9eth2eSX0VZRsL1BTXYNRRq6+C7/yGfW6h2LFyzDfkSabj8/n41U+ixEc6S5O
pvpFFn7rd887JzH02upxtUqXa5PNkzQ21syRnBN+8mQKNeTtpsoh3Rh+Oa2qzA+9gPRJlFxfNE8L
cF3vb6EJ+a5bX6sqC+MArS8DZTkBTSq01DtkU/lITMNwY9dgnCEtf0mrdJXy/1hoRvTq7Gap5SEX
zsfL9fTz5fiPadwMSqotfZaiMkqGeno5nW3LT1eYrbOyWJMzrVFJE4xDs2lH2Ty0A51oUnSmi5w6
+XPyfn08f+PX4/NRcyviX7ZqRKBU2pYD3JmbZlu3SLWHlg5oB8oa1WFdoEB7o7UWwqiWm01No0Xo
SUrHSH+lkkvOXLwXEbIez88fL/zvn5f3E1yvtckZPgnO2OBQb2w5EnC8funtDcF8c8yUPm8U3YZ/
Xq5cBjsRtjGhp/PpOXNlWDekEgpuqIuCmFazSBypS8rqAEkSAHB9FwOM00LQ0AHy2ro0b1yWzyaH
hE+ofvsoqzpxHfrCiYtI5cnb8f8qe7LltnFlf8WVp3urMnMsWbblhzxAJCUi4mYusuwXlmMrsWri
pbycOTlff7uxkFgaytyHmVjdTawNoBvo5Q1FXOIcWFTHZ8f5yt7oqympnMRZCmeT4TceVyDU0nqb
yFZkLeYqoLjyqMIxI+1Qqmwysa1HBCSwySqktbcC7GRiKqN5c+q+/ApI8ExTaFrZQuTJuXeO6N4T
UPKaXWJs+ed0Zt7CptX0+Mz48KZiIHqfeQC7eA3Ux4O+2nL5YVRenvZPP6gtgTUnF640Ywof1neK
6Z7/s39E5Rp3gPs97kl3O3K7QVH8lMxsmfGY1cKtBaMajZO4mFiKR4UpiE2XumV8fj4jtYqmXpo3
+M32wmJh+G0FpkJy6wETBbtAJLVNdnqSHW8HfXUY7YMDoRwk355/Yjj139osTZsL64Jh2kycm6ff
lCVPxN3jC9612puCfQAcMzjvkpzyIcEL+4u5uwXzXCZtL6X1+e/0J7fssahse3F8NiHvsgTKnPo2
B/XRTsaOEGpPb+HoNDUh8Xtq7Gd4LzaZn55ZpyoxUgPbXRn+n/BDns02yAkZhSBhB02AQMGxXPMQ
oVz9iN4IbFJn3HiIFDDl42cBjWzbBlRGY7JhKqqdDUz5YtPaLeb5duJBpuf2dyoOzMoZJsVeNq1+
NWqi1h0EZYlEMovEw+6pHfeDVMIpjTc0zwkCZZMTJthSAhFihA15nMtg+1ZfRZqN+akD3DIbYLs6
CYgy7m6rzkEocxp79JRptwPMpvOoymJ3PIVdTaAnbtAFASPTnklMbr/bDcA+Cw+0MJwJYoUvS6C+
licRc7oOsLTGpWhDr5wlBoDeSjuLQBWHUF3f8fry6O5h/+LnwQSMGHMrxFq/5KQYwmKM+mBFh/mK
r4Y943aoRjXFsEoiJK84FbFmoIImGG5F2vb/hk0clJ51Ue4IbpvZHLXI2vDT1DaDbdTZCF18Om90
MePhUF+OAbkYjxMqEjtG2ABCTMdmOSsJeNHmZLJOZTaJFURlvuCFuZgwQs0KPcarKMVEdobnRNOq
1o+6oDuTRgsqFq37BZn/TeQ0N3xn7dlCHGvTczLipcRum8mxGRdEQIWL9ezUL0xu3+RCUAThWPsm
XpkcufWmTbz2K0WT0GCBcsNeXblFraeTYxeGKQP5pV+B2siDdeh4qD5Q5qzoWb1w0Wjp6MIq3rQM
VmXpIqR/atk0ftuUvy6ZmEEQNFFuCOEKxvPKdmpUcNzn8mpyGh7PpozQhYj4FgOdBj9rucp343ZN
r7sQvF9lXeIiMRLeCFNxfhSLiFA0ZvMcNMaiMZspRfv0+qj5+PYmPPrGTVJFe+0BPVZnAPucVxyU
xtRyG0OEPvtFjryWDqOEdCLeH3U0AE7FM0GHNWPjx1plDIrJlCFy6tZto09ge+GhKhSTbleCiKoF
caKXSNCzgmXl6iCdGI1Hk0AHZIDGpPan0fWq6BqibjRlb2r8wons0K/LQvYa6YLDipSFiAVIaUw2
xYk7fkUzPTRmiBZBBs2swaLIGlvNTM+LAYw9efTbCH08UJMK9du3ZV2jx9UvChlbzGliGlg+Zjp1
C8eyTWm3Uzj1YdCIS6q1Od/CPjrMcHDkVbAnzJtFd0rFipJTa8Fx38dT0usQoDhs5EVJsrvctftN
vQW10RtOirQG4SDAGioC8/mp8BbNOsxC2nsNksecnGsKQY2fcLCEkqGNXZvTLwkm4Vyk1XOG2qAD
ibufzgtQZRpTdLBQ1HAhMjw7eV6dqOa7UFGPDQb9o/UGB6GdpTQq4LaRW4PVnDJKshJNL+s4IXUR
oBEiis8xKkDX5ex4EsJeihFwqhQYkZq0qJp+meRt2W/oq1aLPG3EqAYaOZbauEOuGzo/Ptu6Y28R
1kzEWQpPj3RISIoT4lQYvBJi8Wt77DZjdNzHpRQ3/OBCHqgPbFADTXtdJZFbnxJ+46rfgExNpeA1
qMTOIuhsHlNodURY5Wvn324ZYpyBguCC5rTaYFzfA2fEIIOodRRAnQRQ/rE2KhlpxO1+ovkxKrGT
E2gTDIZ7iI74mca7w9HydHZ8foB7pBoLePjhLGWhok4uZn017dyRkk7bdLHimkCpF/Y+CRJfxavE
GRwpjq+TJF8wmNw8d9ph471FPVy/iIOidIdgRCd0amEhcpnRlK1rTUsINErGQFJRIDBwHpHKjIgL
o7wr7l+f9/fGjWcR1yU3ZAcF6EE9BD1bRT4ctXILS7K6U4AOVvrp2x5TAX5++Fv98e+ne/nXp3DV
Q/RAU/nUfdCfxcxQCUXKOeene28ogUJV5sa1xgguo7I1gpepeALJsmusZS8/0MJ1giH26OsxmxDK
JoZN0qAXo659nFU4rkTlxGfyYFli1V6v0YWsiZkZJU9vkbovLhxrfnQbjrKhaNSBzsnVjMFW6SEY
NhuvI05B0vraq04PhQ5qF5gMzMMAA72qArlF2AaddYm5UgTKY06W7obmDM2BrLqWjCeNN6+O3l9v
78SjjXvX1Zi3v/ADDZ1aDBIsJRrD+EejMF0jHfwcaeIuz+mDE7FN2dVRoqO6kZZEA5GZhlRh5R7W
GpqShvSrNvXpoDgKCgcfUULVWlYVA9wLtTkalPrjqkt17wFEaJF8Ves7Asou0yHpmXkLo6LLVrgR
6QDyxu2kgxT344fq0F80rjHJQIFnQP+7pqrzIlQGbLWzsNnmQJazKN2W05CJK5Itah6bscNV+5d1
ktwkGuunBahwxyfCI5lF18mKm3cv5dKCP1rE8dK4eBvixbBl59P1BS8bxUYVi/rCjndgDXReaY7R
2IZbP/oiEaFJ+qKMExuTM6GIqcA+PiLtLIXLwKhAlsS4AE1jRXAWkEWCMVqMLgCwjGzfzIRa1XmX
tRzmYDsazxpGRFRsw7xDR+HV+cWUTOcgsc1kZqe+RHgwvTsiMXD572ya/IB23AmMDL/xStmrSuMz
nmOoIPMTAMnDEYPrUTfoaHQEfxdJ1Np7k4aiKGDvZSZmnueHkMUh5GUAKdpbNiAqnASapN+hftnb
5oCXCgo5G7AokZKa3LIxtvxchH6XaZFH6xc7AJh0X9r/3B1J+dR4Qt8wNCpoE+BVDJ/RmJepCCob
DqwUGYs62WK0alNA05B+IYOf2ykbMM9EjwhOhnVbYsj6qL6uWmuTAfAmqXl7TYD87MUjatFxWEoF
xjIpWNvV5L3AspE5K8wiYj+NxTBjAiNzpZuVsgOZLy67sqVThbCuLZfNrKelcYHszYBNKMVIwMgb
tGCj8grYtCUMTMaunerkVnJ792CmZFo2ERw01u4pACKkpj2nCoH3biUof7QQqalCsbg1vlx8xcWQ
cVtxUM2Td+xvu4/756PvwMMeC4uoJdadEQLWdhIZAcNXhDZzgBVGCMzLgrdl7aBAxs7iOjHYcp3U
hVmVo6q0ebW0BkoAxlVEDpOk2bK2JVd7ki/jPqoTGdV02B3wH8kpxpARwzSUwxuZ80VmTbFaWdaY
gESURr1DitXpsNUAVKlJQukeImCOQAT4CninDugWSXtV1muzvZQgb3o9wA8dTf7Lp/3b83x+evHH
5JOJjkA0ELM9M43ULMz5iRV9xcadU4YnFsncjgjh4KirIofkNNCu+WmoxXPTQcrBTIKYabiZZIgY
h2QWLPj0QMFU8AaH5CJQ8MXJWQhzGur/hWkYZWNmoXrm507XeFMiJ/XzYL8m01PK/M2lceZCJAui
q5q4VWlEiH80/iT0IWU7ZuK9SdOI0Ixp/Dndg4tAx04C8MCYT5zVsC75vK/dtgoolZkBkZhNrC5z
VrhfiTRjCYgK1E3fSAAiWFeX5Md1yVrOKBuVgeS65llmXxNo3Iol2cG6V6C5rakvQWfMWEFpJQNF
0fHWHrphHDgrfAzISWtM/OjU1rVLOipNV3BkbVJRsMRMGbVjd/fxigafXh6ydWJGNMdfoFRedglK
tEoSGU+LpG5AQIAZQcIazhvqSFh4pbY1vsPFDlSJnBpuhiJMQL5MQYgF9RlFUvrsapKok6IoHH/C
sqCteRS49VG05OGa4hVXyuo4KaAxKGJGZXXdYwqqiLV2nkSPjLwfglZHgiKHKZLh1g15hUKDCNSm
Xz796+3b/ulfH2+718fn+90fD7ufL8Ztr87UMvbcTMmXNfmXTz9vn+4xdMFn/N/9899Pn3/dPt7C
r9v7l/3T57fb7zto6f7+8/7pffcDWeLzt5fvnySXrHevT7ufRw+3r/c7YT49cosKuv/4/PrraP+0
RzfV/X9vVUCFQUjnaIKCxkxFWSS2xgUotDLAMR364brNOMR4cRKkHaLtk03S6HCPhmA07soYxDtk
zlJfBUSvv17en4/unl93R8+vR3Jixq5LYujeykouZIGnPjxhMQn0SZt1xKvUZCMH4X+SWsnkDKBP
WhcrCkYSDhKe1/BgS1io8euq8qkB6JeAT+k+KWymbEWUq+D+B67+aNOjMa5IxCQyIRIr2yFPtm3N
JLFX02o5mc7zLvMQRZfRwCnRMPEPdc7ocenaFPZR4ks3gZSNHfKcSM3u49vP/d0ff+1+Hd0JPv/x
evvy8Mtj77phXstj4/JaF26mSBlgcUq0ElSYuKFuzzR35+SodPUmmZ6eTiy7R/la9/H+gM5Gd7fv
u/uj5En0B/27/t6/Pxyxt7fnu71Axbfvt14Hoyj3erMiYFEKRyObHldldo1ezsQiXvEGGMBfrskl
35ADkTLY9zZehxYiEA2eBm9+cxf+QEfLhQ9r/SUSmak+h0b432b1lXXtIaHlkno1VcgK2+WWvSXW
CJzzIsmKPxwMEyi2HX2noVvbNMR4pbdvD8NweYxDJ/PVe6OV4Va3m+rMRub81Y5xu7d3f27q6GRK
TA+CiQ5vt7gzh9u2yNg6mfrTI+H+VEI97eQ4NqOwa34mz4UgJ+fxzCs8jwk6DhwsLMz8Ttd5bMUQ
0WshZRN/gcC6Oj2jwKcT4lhM2YkPzAlYC8LEovSPuatKliu5Zf/yYHk3DcvZZ16A9S1x1hfdgvvz
wepoRkxeebWUQj+N8OL66dllmIKTMwKBcruXNNfAUvcnBvrMKzJOGoJfl+LfcFnrlN0Qwo3eOIl9
0XSEGIB1JSPVuxPsj2Wb+KPRXpXk8Cr4OFBy8p8fX9AN0ZJph0FYZnj555aU3ZReS+azKTH22Q11
AzAi04j46KZp/awnNYj4z49Hxcfjt92rDlFGNZoVDe+jihLu4nqxcjLvmhi1E7rNkTgWShxrEEXk
PapB4dX7lbdtglayNShVpNym8na69WnUbxs2EGqROdzCgZQaOxMJa2bjS6sDhRDwXZ4ZsEkhhM1y
gXYG1s2y3rMYcWhiN3uVudBUTX7uv73egir0+vzxvn8ipAUMDkRtZAJObU8impA8X7TRPMXYI9UB
BgciufaHkqjaJAkxyQJJSn0+XRzooz7iQIzlN8mXySGSQ40MHpVjDw5IhkgUOOPSK381JhvUma94
UZCKC+KVhWUdvP0fKJtT2h7JrEy4fSq14sASHkkT/7AbsW2cNATPjAQwFP+kFk6IUiNWKhwHK5ke
z35T0WXkr0AFD2vfA0FKaEYKp5Y5y7JAIw0iamv63Se/G0HRvit0Je6zpPgC4g5JhCkAbZ91A83z
VZtE3hbrEypDEWqfQbSbA95kTrZMtlHi68aIjCIQ30iM8C1oEl9GF9OfZ+WKR/1qm4W4cKQIvpFa
jZx2oaK00WsZNUI4BCnlcGHmB2nUBbjDoRJns+Do6YzkEtZc53mCV6HiHhUtu/1XZww0910oyW9H
359fj972P56kR/ndw+7ur/3TD1N7ks9/uMtHa3wh1re/5I3cPylbRXcIHVgZLzDMvngRNd+UmTBg
GAELDlL9JqlNu0zt3QUCfxFV1/2yFmb95to1SWBFBLCYM6treWYyclnHlg9FzfOkL7p8gek0H90S
qkgks2aVX7gDRvdjZfZrMnkEfA9ikQWanNkUvpYHpbddb391MnV+jmbCFjMLTAbNWFzTzw4WCc3f
goDVV04KUImAKQuVS8aNjhzBJDLy0sFR6mvZkXHnIpXq8TcwVFzmZucHFAjtwl3HDpOCULTNc+E3
eIqDDJZZBgE3UvpwNAVQEcaSf5lQo2QDDpoA0RKA0y0BDYEsaHuDYHMCJKTfzumkUgotjOUr6uhX
BJydzdxq0O2KgrVply+INjQVCJzhKhbRV680xasKOPa4X91wYyUZiAUgpiRme0OCcSz9pWo+Aw1b
LKamZS3fwLFe18zQV1L0iy8tg3oEYR66AVBg8m6A9Oh7oVPl6qLrKBVfNNdFJIiWQ7AxggoJoPFo
UJsmto8hooqy0AhMhVXZ2AFVlWVmo+rEo455jRZCBAZ1GSeoiAXuG8tQTPd8ARImHGb1mmCEZpXJ
gTeKvDTauMrKhf3L3ND0OGdoz0PMaFvmPDK5OMpu+pZZnIou/yDEU3aQecUx/OrYMp5bv+HHMjZm
okFj+IzbQUTQUZF6uC4XX9nKEsPwWbNYDf0jD13vLLXf8/SJLqAvr/un979k6J/H3dsP/004kqbv
PYhGGZyv2fDkcx6kuOx40n6ZDUMkDJKIEgYKkFIWJRwjfVLXBcuto0JyDfwHZ/uidH0fVJeD3Rgu
c/Y/d3+87x+V3PEmSO8k/NXv9LKGVvRXrC6+TI6nM3v8QaJt0CmGtIGqQcuXIn6Tm91IE4y7gebV
sMhJTlLLA9YV5g3JeZOzNjIOLBcjmteXRXZtbmBYBuwSIOYvu0J+wDKOESenFkvLHlYlDxi1miVd
JWwtklBGlRRMtXT3T8dVzIK4nNrfaUaMd98+fvzAZ1j+9Pb++oEBjm2LaoayOIibNZVnV7Wv8fre
iL3iylWxBiw+6wmCHA16ydPPKQnfr2mzi0XD6Jfof9RXu+FoyZgQTUY7QU9mVy/dQ7mG8SWutGTb
YgIaYb/rFId4sZlSDnX4LbBEUxbcNpKW30q7UNoAQ3Fvxqi3IIUU1gAd7gUGV0cpHIASlRRxDz+j
tV/1hvI2UgMkUv0KQwFjExf6ab9mMEPEBY7Eokkj7qZFCVS85TeYLitWopNrVTCOtdfplNssKp+C
kP6ofH55+3yEaRo+XuTiSG+ffpjGsgwj3MAqLaWZNgVGo/DOuKSSSIzmVHbtl+PhqCmjdVcNif+M
MS6XrY8cerEoyxYzNeYmoaiDMugJEqtWHpvDg5X1KXrttqyhI1ddXcJGBttZXNJXVnjMqa6RS+3w
OEuDJ9ib7j9wQyIWjGRAR2SRQHWxasJGy2ttMkKUbfMnzhPo7ZVcUlLbxWfccVP4n7eX/RM+7UIX
Hj/ed//ZwR+797s///zzf8eGytJqEN66NtnaDzGKEaEOHKnwUgl9WV81jkmvQ6D8BeSVuRI+aHrh
cgAchrb+IcODqyvZFEJOa6Kl9bXpRfH/GTa3A7BEQRcjbdTEOQp7Yt8V+PIEEy91Q/doWcv9zxTm
N4knn+g5lnz5lzwA7m/fb49w57/Du483d1KVpb29UQ/m9/Yc06tEIoX/Awcxg1q4uIEXfcxaFPZF
vGB9QFgrKdBit6qohpEqWu5EopePUlFHrTRrWkc9POp6kZGOgDtfDE1AXJ0sje8oSQwLqFmUuF8m
l80BH0m78W63YbeSMlEtpCGiWlElKBGlOMY0VzOM0dS4gIGlHl248lsb5U4Jr6u8QQ2FJwHRRdHJ
X6SBo6LYLDFgNt4p5jHejC30y+fj2fwvavaGjd+4chvPAqGWfPl0B9Le88/dl/f3X83x58nF9Ph4
MFhMWJ1d4zVZ0a5NtnMqNJWVdvf2jisd9/Po+d+719sfO1NEXHdF4ApJrwTUKEQY769Seqa8XoRJ
4UAxdm/JeIYCjSU2A0zKSZ4QZdBYBZLWoUFiLXtS119SagFZJSo3is/s8AI1SLR4C4krAndrfNSl
XVjcoACHBtzaJ0EcbbDouIw6KN52Q5I76YLLUW/I9eXoof8HnrJYlhvWAQA=
--===============6375278711332155074==--

