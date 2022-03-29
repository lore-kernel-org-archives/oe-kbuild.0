Content-Type: multipart/mixed; boundary="===============6109469213688300378=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 225/1039] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3050 axienet_probe() warn: missing error code 'ret'
Date: Tue, 29 Mar 2022 17:37:22 +0800
Message-ID: <202203291706.pCeTZakA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6109469213688300378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Saurabh Sengar <saurabh.singh@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   ea33365bd1a8cf667a122498e8f551df05609f92
commit: ee94241b2118ddd38a456b2b805fc584b57de58f [225/1039] net: axienet: a=
dded multichannel DMA support
:::::: branch date: 4 days ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-m001-20220328 (https://download.01.org/0day-ci/ar=
chive/20220329/202203291706.pCeTZakA-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3050 axienet_probe() warn=
: missing error code 'ret'

Old smatch warnings:
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:204 axienet_dma_bd_init()=
 error: uninitialized symbol 'ret'.
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3110 axienet_probe() warn=
: inconsistent indenting

vim +/ret +3050 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2770  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2771  /**
2be586205ca2b8 Srikanth Thokala             2015-05-05  2772   * axienet_pr=
obe - Axi Ethernet probe function.
95219aa538e11d Srikanth Thokala             2015-05-05  2773   * @pdev:	Poi=
nter to platform device structure.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2774   *
b0d081c524b46c Michal Simek                 2015-05-05  2775   * Return: 0,=
 on success
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2776   *	    Non-ze=
ro error value on failure.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2777   *
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2778   * This is th=
e probe routine for Axi Ethernet driver. This is called before
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2779   * any other =
driver routines are invoked. It allocates and sets up the Ethernet
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2780   * device. Pa=
rses through device tree and populates fields of
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2781   * axienet_lo=
cal. It registers the Ethernet device.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2782   */
2be586205ca2b8 Srikanth Thokala             2015-05-05  2783  static int ax=
ienet_probe(struct platform_device *pdev)
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2784  {
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2785  	int (*axiene=
t_clk_init)(struct platform_device *pdev,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2786  				struct cl=
k **axi_aclk, struct clk **axis_clk,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2787  				struct cl=
k **ref_clk, struct clk **tmpclk) =3D
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2788  					axienet_=
clk_init;
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2789  	int ret =3D =
0;
ee94241b2118dd Saurabh Sengar               2021-01-22  2790  #ifdef CONFIG=
_XILINX_AXI_EMAC_HWTSTAMP
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2791  	struct devic=
e_node *np;
ee94241b2118dd Saurabh Sengar               2021-01-22  2792  #endif
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2793  	struct axien=
et_local *lp;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2794  	struct net_d=
evice *ndev;
83216e3988cd19 Michael Walle                2021-04-12  2795  	u8 mac_addr[=
ETH_ALEN];
ee94241b2118dd Saurabh Sengar               2021-01-22  2796  	struct resou=
rce *ethres;
8495659bf93c8e Srikanth Thokala             2015-05-05  2797  	u32 value;
ee94241b2118dd Saurabh Sengar               2021-01-22  2798  	u16 num_queu=
es =3D XAE_MAX_QUEUES;
ee94241b2118dd Saurabh Sengar               2021-01-22  2799  	bool slave =
=3D false;
ee94241b2118dd Saurabh Sengar               2021-01-22  2800  =

ee94241b2118dd Saurabh Sengar               2021-01-22  2801  	ret =3D of_p=
roperty_read_u16(pdev->dev.of_node, "xlnx,num-queues",
ee94241b2118dd Saurabh Sengar               2021-01-22  2802  				   &num_q=
ueues);
ee94241b2118dd Saurabh Sengar               2021-01-22  2803  	if (ret) {
ee94241b2118dd Saurabh Sengar               2021-01-22  2804  #ifndef CONFI=
G_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  2805  		num_queues =
=3D 1;
ee94241b2118dd Saurabh Sengar               2021-01-22  2806  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  2807  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2808  =

ee94241b2118dd Saurabh Sengar               2021-01-22  2809  	ndev =3D all=
oc_etherdev_mq(sizeof(*lp), num_queues);
41de8d4cff21a2 Joe Perches                  2012-01-29  2810  	if (!ndev)
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2811  		return -ENO=
MEM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2812  =

95219aa538e11d Srikanth Thokala             2015-05-05  2813  	platform_set=
_drvdata(pdev, ndev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2814  =

95219aa538e11d Srikanth Thokala             2015-05-05  2815  	SET_NETDEV_D=
EV(ndev, &pdev->dev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2816  	ndev->flags =
&=3D ~IFF_MULTICAST;  /* clear multicast */
28e24c62ab3062 Eric Dumazet                 2013-12-02  2817  	ndev->featur=
es =3D NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2818  	ndev->netdev=
_ops =3D &axienet_netdev_ops;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2819  	ndev->ethtoo=
l_ops =3D &axienet_ethtool_ops;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2820  =

d894be57ca92c8 Jarod Wilson                 2016-10-20  2821  	/* MTU range=
: 64 - 9000 */
d894be57ca92c8 Jarod Wilson                 2016-10-20  2822  	ndev->min_mt=
u =3D 64;
d894be57ca92c8 Jarod Wilson                 2016-10-20  2823  	ndev->max_mt=
u =3D XAE_JUMBO_MTU;
d894be57ca92c8 Jarod Wilson                 2016-10-20  2824  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2825  	lp =3D netde=
v_priv(ndev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2826  	lp->ndev =3D=
 ndev;
95219aa538e11d Srikanth Thokala             2015-05-05  2827  	lp->dev =3D =
&pdev->dev;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2828  	lp->options =
=3D XAE_OPTION_DEFAULTS;
ee94241b2118dd Saurabh Sengar               2021-01-22  2829  	lp->num_tx_q=
ueues =3D num_queues;
ee94241b2118dd Saurabh Sengar               2021-01-22  2830  	lp->num_rx_q=
ueues =3D num_queues;
8b09ca823ffb4e Robert Hancock               2019-06-06  2831  	lp->rx_bd_nu=
m =3D RX_BD_NUM_DEFAULT;
8b09ca823ffb4e Robert Hancock               2019-06-06  2832  	lp->tx_bd_nu=
m =3D TX_BD_NUM_DEFAULT;
57baf8cc70ea4c Robert Hancock               2021-02-12  2833  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2834  	lp->axi_clk =
=3D devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2835  	if (!lp->axi=
_clk) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2836  		/* For back=
ward compatibility, if named AXI clock is not present,
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2837  		 * treat th=
e first clock specified as the AXI clock.
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2838  		 */
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2839  		lp->axi_clk=
 =3D devm_clk_get_optional(&pdev->dev, NULL);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2840  	}
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2841  	if (IS_ERR(l=
p->axi_clk)) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2842  		ret =3D PTR=
_ERR(lp->axi_clk);
57baf8cc70ea4c Robert Hancock               2021-02-12  2843  		goto free_n=
etdev;
57baf8cc70ea4c Robert Hancock               2021-02-12  2844  	}
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2845  	ret =3D clk_=
prepare_enable(lp->axi_clk);
57baf8cc70ea4c Robert Hancock               2021-02-12  2846  	if (ret) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2847  		dev_err(&pd=
ev->dev, "Unable to enable AXI clock: %d\n", ret);
57baf8cc70ea4c Robert Hancock               2021-02-12  2848  		goto free_n=
etdev;
57baf8cc70ea4c Robert Hancock               2021-02-12  2849  	}
57baf8cc70ea4c Robert Hancock               2021-02-12  2850  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2851  	lp->misc_clk=
s[0].id =3D "axis_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2852  	lp->misc_clk=
s[1].id =3D "ref_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2853  	lp->misc_clk=
s[2].id =3D "mgt_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2854  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2855  	ret =3D devm=
_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2856  	if (ret)
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2857  		goto cleanu=
p_clk;
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2858  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2859  	ret =3D clk_=
bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2860  	if (ret)
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2861  		goto cleanu=
p_clk;
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2862  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2863  	/* Map devic=
e registers */
47651c51c02fc4 Yang Yingliang               2021-06-10  2864  	lp->regs =3D=
 devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
fcc028c106e575 Krzysztof Kozlowski          2015-07-09  2865  	if (IS_ERR(l=
p->regs)) {
fcc028c106e575 Krzysztof Kozlowski          2015-07-09  2866  		ret =3D PTR=
_ERR(lp->regs);
59cd4f19267a0a Robert Hancock               2021-03-11  2867  		goto cleanu=
p_clk;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2868  	}
7fa0043d5c74c6 Robert Hancock               2019-06-11  2869  	lp->regs_sta=
rt =3D ethres->start;
46aa27df885321 Srikanth Thokala             2015-05-05  2870  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2871  	/* Setup che=
cksum offload, but default to off if not specified */
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2872  	lp->features=
 =3D 0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2873  =

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2874  	if (pdev->de=
v.of_node) {
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2875  		const struc=
t of_device_id *match;
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2876  =

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2877  		match =3D o=
f_match_node(axienet_of_match, pdev->dev.of_node);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2878  		if (match &=
& match->data) {
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2879  			lp->axiene=
t_config =3D match->data;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2880  			axienet_cl=
k_init =3D lp->axienet_config->clk_init;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2881  		}
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2882  	}
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2883  =

8495659bf93c8e Srikanth Thokala             2015-05-05  2884  	ret =3D of_p=
roperty_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e Srikanth Thokala             2015-05-05  2885  	if (!ret) {
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2886  		dev_info(&p=
dev->dev, "TX_CSUM %d\n", value);
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2887  =

8495659bf93c8e Srikanth Thokala             2015-05-05  2888  		switch (val=
ue) {
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2889  		case 1:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2890  			lp->csum_o=
ffload_on_tx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2891  				XAE_FEATU=
RE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2892  			lp->featur=
es |=3D XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2893  			/* Can che=
cksum TCP/UDP over IPv4. */
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2894  			ndev->feat=
ures |=3D NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2895  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2896  		case 2:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2897  			lp->csum_o=
ffload_on_tx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2898  				XAE_FEATU=
RE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2899  			lp->featur=
es |=3D XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2900  			/* Can che=
cksum TCP/UDP over IPv4. */
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2901  			ndev->feat=
ures |=3D NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2902  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2903  		default:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2904  			lp->csum_o=
ffload_on_tx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2905  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2906  	}
8495659bf93c8e Srikanth Thokala             2015-05-05  2907  	ret =3D of_p=
roperty_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e Srikanth Thokala             2015-05-05  2908  	if (!ret) {
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2909  		dev_info(&p=
dev->dev, "RX_CSUM %d\n", value);
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2910  =

8495659bf93c8e Srikanth Thokala             2015-05-05  2911  		switch (val=
ue) {
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2912  		case 1:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2913  			lp->csum_o=
ffload_on_rx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2914  				XAE_FEATU=
RE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2915  			lp->featur=
es |=3D XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2916  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2917  		case 2:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2918  			lp->csum_o=
ffload_on_rx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2919  				XAE_FEATU=
RE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2920  			lp->featur=
es |=3D XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2921  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2922  		default:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2923  			lp->csum_o=
ffload_on_rx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2924  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2925  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2926  	/* For suppo=
rting jumbo frames, the Axi Ethernet hardware must have
f080a8c35d8932 Srikanth Thokala             2015-05-05  2927  	 * a larger =
Rx/Tx Memory. Typically, the size must be large so that
f080a8c35d8932 Srikanth Thokala             2015-05-05  2928  	 * we can en=
able jumbo option and start supporting jumbo frames.
f080a8c35d8932 Srikanth Thokala             2015-05-05  2929  	 * Here we c=
heck for memory allocated for Rx/Tx in the hardware from
f080a8c35d8932 Srikanth Thokala             2015-05-05  2930  	 * the devic=
e-tree and accordingly set flags.
f080a8c35d8932 Srikanth Thokala             2015-05-05  2931  	 */
8495659bf93c8e Srikanth Thokala             2015-05-05  2932  	of_property_=
read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
ee06b1728b9564 Alvaro G. M                  2017-07-17  2933  =

6c8f06bb2e5147 Robert Hancock               2021-02-12  2934  	lp->switch_x=
_sgmii =3D of_property_read_bool(pdev->dev.of_node,
6c8f06bb2e5147 Robert Hancock               2021-02-12  2935  						   "xln=
x,switch-x-sgmii");
6c8f06bb2e5147 Robert Hancock               2021-02-12  2936  =

ee06b1728b9564 Alvaro G. M                  2017-07-17  2937  	/* Start wit=
h the proprietary, and broken phy_type */
ee06b1728b9564 Alvaro G. M                  2017-07-17  2938  	ret =3D of_p=
roperty_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
ee06b1728b9564 Alvaro G. M                  2017-07-17  2939  	if (!ret) {
ee06b1728b9564 Alvaro G. M                  2017-07-17  2940  		switch (val=
ue) {
ee06b1728b9564 Alvaro G. M                  2017-07-17  2941  		case XAE_PH=
Y_TYPE_MII:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2942  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_MII;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2943  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2944  		case XAE_PH=
Y_TYPE_GMII:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2945  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_GMII;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2946  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2947  		case XAE_PH=
Y_TYPE_RGMII_2_0:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2948  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_RGMII_ID;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2949  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2950  		case XAE_PH=
Y_TYPE_SGMII:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2951  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_SGMII;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2952  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2953  		case XAE_PH=
Y_TYPE_1000BASE_X:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2954  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_1000BASEX;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2955  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2956  		default:
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  2957  			/* Don't e=
rror out as phy-type is an optional property */
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  2958  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2959  		}
ee06b1728b9564 Alvaro G. M                  2017-07-17  2960  	} else {
0c65b2b90d13c1 Andrew Lunn                  2019-11-04  2961  		ret =3D of_=
get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
0c65b2b90d13c1 Andrew Lunn                  2019-11-04  2962  		if (ret)
59cd4f19267a0a Robert Hancock               2021-03-11  2963  			goto clean=
up_clk;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2964  	}
6c8f06bb2e5147 Robert Hancock               2021-02-12  2965  	if (lp->swit=
ch_x_sgmii && lp->phy_mode !=3D PHY_INTERFACE_MODE_SGMII &&
6c8f06bb2e5147 Robert Hancock               2021-02-12  2966  	    lp->phy_=
mode !=3D PHY_INTERFACE_MODE_1000BASEX) {
6c8f06bb2e5147 Robert Hancock               2021-02-12  2967  		dev_err(&pd=
ev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
6c8f06bb2e5147 Robert Hancock               2021-02-12  2968  		ret =3D -EI=
NVAL;
59cd4f19267a0a Robert Hancock               2021-03-11  2969  		goto cleanu=
p_clk;
6c8f06bb2e5147 Robert Hancock               2021-02-12  2970  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2971  =

f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  2972  	lp->eth_hasn=
obuf =3D of_property_read_bool(pdev->dev.of_node,
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  2973  						 "xlnx,=
eth-hasnobuf");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2974  	lp->eth_hasp=
tp =3D of_property_read_bool(pdev->dev.of_node,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2975  					       "=
xlnx,eth-hasptp");
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  2976  =

9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  2977  	if (lp->axie=
net_config->mactype =3D=3D XAXIENET_1G && !lp->eth_hasnobuf)
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  2978  		lp->eth_irq=
 =3D platform_get_irq(pdev, 0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2979  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2980  #ifdef CONFIG=
_XILINX_AXI_EMAC_HWTSTAMP
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2981  	struct resou=
rce txtsres, rxtsres;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2982  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2983  	/* Find AXI =
Stream FIFO */
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2984  	np =3D of_pa=
rse_phandle(pdev->dev.of_node, "axififo-connected", 0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2985  	if (IS_ERR(n=
p)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2986  		dev_err(&pd=
ev->dev, "could not find TX Timestamp FIFO\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2987  		ret =3D PTR=
_ERR(np);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2988  		goto free_n=
etdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2989  	}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2990  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2991  	ret =3D of_a=
ddress_to_resource(np, 0, &txtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2992  	if (ret) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2993  		dev_err(&pd=
ev->dev, "unable to get Tx Timestamp resource\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2994  		goto free_n=
etdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2995  	}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2996  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2997  	lp->tx_ts_re=
gs =3D devm_ioremap_resource(&pdev->dev, &txtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2998  	if (IS_ERR(l=
p->tx_ts_regs)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  2999  		dev_err(&pd=
ev->dev, "could not map Tx Timestamp regs\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3000  		ret =3D PTR=
_ERR(lp->tx_ts_regs);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3001  		goto free_n=
etdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3002  	}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3003  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3004  	if (lp->axie=
net_config->mactype =3D=3D XAXIENET_10G_25G) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3005  		np =3D of_p=
arse_phandle(pdev->dev.of_node, "xlnx,rxtsfifo",
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3006  				      0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3007  		if (IS_ERR(=
np)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3008  			dev_err(&p=
dev->dev,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3009  				"couldn't=
 find rx-timestamp FIFO\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3010  			ret =3D PT=
R_ERR(np);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3011  			goto free_=
netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3012  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3013  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3014  		ret =3D of_=
address_to_resource(np, 0, &rxtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3015  		if (ret) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3016  			dev_err(&p=
dev->dev,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3017  				"unable t=
o get rx-timestamp resource\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3018  			goto free_=
netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3019  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3020  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3021  		lp->rx_ts_r=
egs =3D devm_ioremap_resource(&pdev->dev, &rxtsres);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3022  		if (IS_ERR(=
lp->rx_ts_regs)) {
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3023  			dev_err(&p=
dev->dev, "couldn't map rx-timestamp regs\n");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3024  			ret =3D PT=
R_ERR(lp->rx_ts_regs);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3025  			goto free_=
netdev;
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3026  		}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3027  		lp->tx_ptph=
eader =3D devm_kzalloc(&pdev->dev,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3028  						XXVENET=
_TS_HEADER_LEN,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3029  						GFP_KER=
NEL);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3030  	}
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3031  =

bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3032  	of_node_put(=
np);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3033  #endif
ee94241b2118dd Saurabh Sengar               2021-01-22  3034  	if (!slave) {
ee94241b2118dd Saurabh Sengar               2021-01-22  3035  #ifdef CONFIG=
_AXIENET_HAS_MCDMA
ee94241b2118dd Saurabh Sengar               2021-01-22  3036  		ret =3D axi=
enet_mcdma_probe(pdev, lp, ndev);
ee94241b2118dd Saurabh Sengar               2021-01-22  3037  #else
ee94241b2118dd Saurabh Sengar               2021-01-22  3038  		ret =3D axi=
enet_dma_probe(pdev, ndev);
ee94241b2118dd Saurabh Sengar               2021-01-22  3039  #endif
46aa27df885321 Srikanth Thokala             2015-05-05  3040  		if (ret) {
ee94241b2118dd Saurabh Sengar               2021-01-22  3041  			pr_err("Ge=
tting DMA resource failed\n");
ee94241b2118dd Saurabh Sengar               2021-01-22  3042  			goto free_=
netdev;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3043  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3044  =

ee94241b2118dd Saurabh Sengar               2021-01-22  3045  		if (dma_set=
_mask_and_coherent(lp->dev, DMA_BIT_MASK(lp->dma_mask)) !=3D 0) {
ee94241b2118dd Saurabh Sengar               2021-01-22  3046  			dev_warn(&=
pdev->dev, "default to %d-bit dma mask\n", XAE_DMA_MASK_MIN);
ee94241b2118dd Saurabh Sengar               2021-01-22  3047  			if (dma_se=
t_mask_and_coherent(lp->dev,
ee94241b2118dd Saurabh Sengar               2021-01-22  3048  						      D=
MA_BIT_MASK(XAE_DMA_MASK_MIN)) !=3D 0) {
ee94241b2118dd Saurabh Sengar               2021-01-22  3049  				dev_err(&=
pdev->dev, "dma_set_mask_and_coherent failed, aborting\n");
ee94241b2118dd Saurabh Sengar               2021-01-22 @3050  				goto free=
_netdev;
f735c40ed93cca Andre Przywara               2020-03-24  3051  			}
5fff0151b3244d Andre Przywara               2020-03-24  3052  		}
5fff0151b3244d Andre Przywara               2020-03-24  3053  =

353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3054  		ret =3D axi=
enet_dma_clk_init(pdev);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3055  		if (ret) {
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3056  			if (ret !=
=3D -EPROBE_DEFER)
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3057  				dev_err(&=
pdev->dev, "DMA clock init failed %d\n", ret);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3058  			goto free_=
netdev;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3059  		}
ee94241b2118dd Saurabh Sengar               2021-01-22  3060  	}
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3061  =

353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3062  	ret =3D axie=
net_clk_init(pdev, &lp->aclk, &lp->eth_sclk,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3063  			       &lp=
->eth_refclk, &lp->eth_dclk);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3064  	if (ret) {
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3065  		if (ret !=
=3D -EPROBE_DEFER)
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3066  			dev_err(&p=
dev->dev, "Ethernet clock init failed %d\n", ret);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3067  		goto err_di=
sable_clk;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3068  	}
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  3069  =

ee94241b2118dd Saurabh Sengar               2021-01-22  3070  	lp->eth_irq =
=3D platform_get_irq(pdev, 0);
ee94241b2118dd Saurabh Sengar               2021-01-22  3071  	/* Check for=
 Ethernet core IRQ (optional) */
ee94241b2118dd Saurabh Sengar               2021-01-22  3072  	if (lp->eth_=
irq <=3D 0)
ee94241b2118dd Saurabh Sengar               2021-01-22  3073  		dev_info(&p=
dev->dev, "Ethernet core IRQ not defined\n");
ee94241b2118dd Saurabh Sengar               2021-01-22  3074  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  3075  	/* Retrieve =
the MAC address */
83216e3988cd19 Michael Walle                2021-04-12  3076  	ret =3D of_g=
et_mac_address(pdev->dev.of_node, mac_addr);
83216e3988cd19 Michael Walle                2021-04-12  3077  	if (!ret) {
da90e38003e2f0 Tobias Klauser               2016-12-07  3078  		axienet_set=
_mac_address(ndev, mac_addr);
83216e3988cd19 Michael Walle                2021-04-12  3079  	} else {
83216e3988cd19 Michael Walle                2021-04-12  3080  		dev_warn(&p=
dev->dev, "could not find MAC address property: %d\n",
83216e3988cd19 Michael Walle                2021-04-12  3081  			 ret);
83216e3988cd19 Michael Walle                2021-04-12  3082  		axienet_set=
_mac_address(ndev, NULL);
83216e3988cd19 Michael Walle                2021-04-12  3083  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3084  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  3085  	lp->coalesce=
_count_rx =3D XAXIDMA_DFT_RX_THRESHOLD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3086  	lp->coalesce=
_count_tx =3D XAXIDMA_DFT_TX_THRESHOLD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3087  =

95219aa538e11d Srikanth Thokala             2015-05-05  3088  	lp->phy_node=
 =3D of_parse_phandle(pdev->dev.of_node, "phy-handle", 0);
46aa27df885321 Srikanth Thokala             2015-05-05  3089  	if (lp->phy_=
node) {
09a0354cadec26 Robert Hancock               2019-06-06  3090  		ret =3D axi=
enet_mdio_setup(lp);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3091  		if (ret)
09a0354cadec26 Robert Hancock               2019-06-06  3092  			dev_warn(&=
pdev->dev,
09a0354cadec26 Robert Hancock               2019-06-06  3093  				 "error r=
egistering MDIO bus: %d\n", ret);
46aa27df885321 Srikanth Thokala             2015-05-05  3094  	}
1a02556086fc0e Robert Hancock               2020-10-28  3095  	if (lp->phy_=
mode =3D=3D PHY_INTERFACE_MODE_SGMII ||
1a02556086fc0e Robert Hancock               2020-10-28  3096  	    lp->phy_=
mode =3D=3D PHY_INTERFACE_MODE_1000BASEX) {
1a02556086fc0e Robert Hancock               2020-10-28  3097  		if (!lp->ph=
y_node) {
1a02556086fc0e Robert Hancock               2020-10-28  3098  			dev_err(&p=
dev->dev, "phy-handle required for 1000BaseX/SGMII\n");
1a02556086fc0e Robert Hancock               2020-10-28  3099  			ret =3D -E=
INVAL;
59cd4f19267a0a Robert Hancock               2021-03-11  3100  			goto clean=
up_mdio;
1a02556086fc0e Robert Hancock               2020-10-28  3101  		}
1a02556086fc0e Robert Hancock               2020-10-28  3102  		lp->pcs_phy=
 =3D of_mdio_find_device(lp->phy_node);
1a02556086fc0e Robert Hancock               2020-10-28  3103  		if (!lp->pc=
s_phy) {
1a02556086fc0e Robert Hancock               2020-10-28  3104  			ret =3D -E=
PROBE_DEFER;
59cd4f19267a0a Robert Hancock               2021-03-11  3105  			goto clean=
up_mdio;
1a02556086fc0e Robert Hancock               2020-10-28  3106  		}
1a02556086fc0e Robert Hancock               2020-10-28  3107  		lp->phylink=
_config.pcs_poll =3D true;
1a02556086fc0e Robert Hancock               2020-10-28  3108  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  3109  =

f5203a3d9b25fa Robert Hancock               2019-06-06  3110  		lp->phylink=
_config.dev =3D &ndev->dev;
f5203a3d9b25fa Robert Hancock               2019-06-06  3111  		lp->phylink=
_config.type =3D PHYLINK_NETDEV;
f5203a3d9b25fa Robert Hancock               2019-06-06  3112  =

f5203a3d9b25fa Robert Hancock               2019-06-06  3113  	lp->phylink =
=3D phylink_create(&lp->phylink_config, pdev->dev.fwnode,
f5203a3d9b25fa Robert Hancock               2019-06-06  3114  				     lp->=
phy_mode,
f5203a3d9b25fa Robert Hancock               2019-06-06  3115  				     &axi=
enet_phylink_ops);
f5203a3d9b25fa Robert Hancock               2019-06-06  3116  	if (IS_ERR(l=
p->phylink)) {
f5203a3d9b25fa Robert Hancock               2019-06-06  3117  		ret =3D PTR=
_ERR(lp->phylink);
f5203a3d9b25fa Robert Hancock               2019-06-06  3118  		dev_err(&pd=
ev->dev, "phylink_create error (%i)\n", ret);
59cd4f19267a0a Robert Hancock               2021-03-11  3119  		goto cleanu=
p_mdio;
f5203a3d9b25fa Robert Hancock               2019-06-06  3120  	}
f5203a3d9b25fa Robert Hancock               2019-06-06  3121  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6109469213688300378==--

