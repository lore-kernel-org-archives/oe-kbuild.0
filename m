Content-Type: multipart/mixed; boundary="===============4951143261517213942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 224/1029] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2828:47-48: WARNING this kind of initialization is deprecated
Date: Sat, 26 Mar 2022 23:39:48 +0800
Message-ID: <202203262342.xK2jrrkY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4951143261517213942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 353f790929055728585095cb890b378ee0471607 [224/1029] net: axienet: A=
dd clock support
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: ia64-randconfig-c004-20220324 (https://download.01.org/0day-ci/arch=
ive/20220326/202203262342.xK2jrrkY-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2828:47-48: WARNING th=
is kind of initialization is deprecated

vim +2828 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2811  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2812  /**
2be586205ca2b81 Srikanth Thokala             2015-05-05  2813   * axienet_p=
robe - Axi Ethernet probe function.
95219aa538e11d5 Srikanth Thokala             2015-05-05  2814   * @pdev:	Po=
inter to platform device structure.
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2815   *
b0d081c524b46c2 Michal Simek                 2015-05-05  2816   * Return: 0=
, on success
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2817   *	    Non-z=
ero error value on failure.
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2818   *
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2819   * This is t=
he probe routine for Axi Ethernet driver. This is called before
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2820   * any other=
 driver routines are invoked. It allocates and sets up the Ethernet
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2821   * device. P=
arses through device tree and populates fields of
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2822   * axienet_l=
ocal. It registers the Ethernet device.
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2823   */
2be586205ca2b81 Srikanth Thokala             2015-05-05  2824  static int a=
xienet_probe(struct platform_device *pdev)
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2825  {
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22  2826  	int (*axien=
et_clk_init)(struct platform_device *pdev,
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22  2827  				struct c=
lk **axi_aclk, struct clk **axis_clk,
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22 @2828  				struct c=
lk **ref_clk, struct clk **tmpclk) =3D
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22  2829  					axienet=
_clk_init;
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2830  	int ret =3D=
 0;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2831  	struct devi=
ce_node *np;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2832  	struct axie=
net_local *lp;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2833  	struct net_=
device *ndev;
83216e3988cd196 Michael Walle                2021-04-12  2834  	u8 mac_addr=
[ETH_ALEN];
daef06520f0d07f Radhey Shyam Pandey          2020-01-24  2835  	struct reso=
urce *ethres, dmares;
5fff0151b3244dc Andre Przywara               2020-03-24  2836  	int addr_wi=
dth =3D 32;
8495659bf93c8e2 Srikanth Thokala             2015-05-05  2837  	u32 value;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2838  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2839  	ndev =3D al=
loc_etherdev(sizeof(*lp));
41de8d4cff21a2e Joe Perches                  2012-01-29  2840  	if (!ndev)
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2841  		return -EN=
OMEM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2842  =

95219aa538e11d5 Srikanth Thokala             2015-05-05  2843  	platform_se=
t_drvdata(pdev, ndev);
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2844  =

95219aa538e11d5 Srikanth Thokala             2015-05-05  2845  	SET_NETDEV_=
DEV(ndev, &pdev->dev);
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2846  	ndev->flags=
 &=3D ~IFF_MULTICAST;  /* clear multicast */
28e24c62ab3062e Eric Dumazet                 2013-12-02  2847  	ndev->featu=
res =3D NETIF_F_SG;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2848  	ndev->netde=
v_ops =3D &axienet_netdev_ops;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2849  	ndev->ethto=
ol_ops =3D &axienet_ethtool_ops;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2850  =

d894be57ca92c8a Jarod Wilson                 2016-10-20  2851  	/* MTU rang=
e: 64 - 9000 */
d894be57ca92c8a Jarod Wilson                 2016-10-20  2852  	ndev->min_m=
tu =3D 64;
d894be57ca92c8a Jarod Wilson                 2016-10-20  2853  	ndev->max_m=
tu =3D XAE_JUMBO_MTU;
d894be57ca92c8a Jarod Wilson                 2016-10-20  2854  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2855  	lp =3D netd=
ev_priv(ndev);
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2856  	lp->ndev =
=3D ndev;
95219aa538e11d5 Srikanth Thokala             2015-05-05  2857  	lp->dev =3D=
 &pdev->dev;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2858  	lp->options=
 =3D XAE_OPTION_DEFAULTS;
8b09ca823ffb4ee Robert Hancock               2019-06-06  2859  	lp->rx_bd_n=
um =3D RX_BD_NUM_DEFAULT;
8b09ca823ffb4ee Robert Hancock               2019-06-06  2860  	lp->tx_bd_n=
um =3D TX_BD_NUM_DEFAULT;
57baf8cc70ea4cf Robert Hancock               2021-02-12  2861  =

b11bfb9a19f9d79 Robert Hancock               2021-03-25  2862  	lp->axi_clk=
 =3D devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2863  	if (!lp->ax=
i_clk) {
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2864  		/* For bac=
kward compatibility, if named AXI clock is not present,
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2865  		 * treat t=
he first clock specified as the AXI clock.
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2866  		 */
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2867  		lp->axi_cl=
k =3D devm_clk_get_optional(&pdev->dev, NULL);
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2868  	}
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2869  	if (IS_ERR(=
lp->axi_clk)) {
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2870  		ret =3D PT=
R_ERR(lp->axi_clk);
57baf8cc70ea4cf Robert Hancock               2021-02-12  2871  		goto free_=
netdev;
57baf8cc70ea4cf Robert Hancock               2021-02-12  2872  	}
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2873  	ret =3D clk=
_prepare_enable(lp->axi_clk);
57baf8cc70ea4cf Robert Hancock               2021-02-12  2874  	if (ret) {
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2875  		dev_err(&p=
dev->dev, "Unable to enable AXI clock: %d\n", ret);
57baf8cc70ea4cf Robert Hancock               2021-02-12  2876  		goto free_=
netdev;
57baf8cc70ea4cf Robert Hancock               2021-02-12  2877  	}
57baf8cc70ea4cf Robert Hancock               2021-02-12  2878  =

b11bfb9a19f9d79 Robert Hancock               2021-03-25  2879  	lp->misc_cl=
ks[0].id =3D "axis_clk";
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2880  	lp->misc_cl=
ks[1].id =3D "ref_clk";
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2881  	lp->misc_cl=
ks[2].id =3D "mgt_clk";
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2882  =

b11bfb9a19f9d79 Robert Hancock               2021-03-25  2883  	ret =3D dev=
m_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2884  	if (ret)
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2885  		goto clean=
up_clk;
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2886  =

b11bfb9a19f9d79 Robert Hancock               2021-03-25  2887  	ret =3D clk=
_bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2888  	if (ret)
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2889  		goto clean=
up_clk;
b11bfb9a19f9d79 Robert Hancock               2021-03-25  2890  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2891  	/* Map devi=
ce registers */
47651c51c02fc49 Yang Yingliang               2021-06-10  2892  	lp->regs =
=3D devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
fcc028c106e5750 Krzysztof Kozlowski          2015-07-09  2893  	if (IS_ERR(=
lp->regs)) {
fcc028c106e5750 Krzysztof Kozlowski          2015-07-09  2894  		ret =3D PT=
R_ERR(lp->regs);
59cd4f19267a0aa Robert Hancock               2021-03-11  2895  		goto clean=
up_clk;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2896  	}
7fa0043d5c74c6e Robert Hancock               2019-06-11  2897  	lp->regs_st=
art =3D ethres->start;
46aa27df8853214 Srikanth Thokala             2015-05-05  2898  =

8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2899  	/* Setup ch=
ecksum offload, but default to off if not specified */
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2900  	lp->feature=
s =3D 0;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2901  =

a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2902  	if (pdev->d=
ev.of_node) {
a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2903  		const stru=
ct of_device_id *match;
a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2904  =

a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2905  		match =3D =
of_match_node(axienet_of_match, pdev->dev.of_node);
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22  2906  		if (match =
&& match->data) {
a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2907  			lp->axien=
et_config =3D match->data;
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22  2908  			axienet_c=
lk_init =3D lp->axienet_config->clk_init;
353f79092905572 Appana Durga Kedareswara Rao 2021-01-22  2909  		}
a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2910  	}
a2fc9e93fefa1f1 Appana Durga Kedareswara Rao 2020-01-24  2911  =

8495659bf93c8e2 Srikanth Thokala             2015-05-05  2912  	ret =3D of_=
property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e2 Srikanth Thokala             2015-05-05  2913  	if (!ret) {
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2914  		dev_info(&=
pdev->dev, "TX_CSUM %d\n", value);
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2915  =

8495659bf93c8e2 Srikanth Thokala             2015-05-05  2916  		switch (va=
lue) {
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2917  		case 1:
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2918  			lp->csum_=
offload_on_tx_path =3D
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2919  				XAE_FEAT=
URE_PARTIAL_TX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2920  			lp->featu=
res |=3D XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2921  			/* Can ch=
ecksum TCP/UDP over IPv4. */
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2922  			ndev->fea=
tures |=3D NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2923  			break;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2924  		case 2:
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2925  			lp->csum_=
offload_on_tx_path =3D
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2926  				XAE_FEAT=
URE_FULL_TX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2927  			lp->featu=
res |=3D XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2928  			/* Can ch=
ecksum TCP/UDP over IPv4. */
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2929  			ndev->fea=
tures |=3D NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2930  			break;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2931  		default:
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2932  			lp->csum_=
offload_on_tx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2933  		}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2934  	}
8495659bf93c8e2 Srikanth Thokala             2015-05-05  2935  	ret =3D of_=
property_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e2 Srikanth Thokala             2015-05-05  2936  	if (!ret) {
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2937  		dev_info(&=
pdev->dev, "RX_CSUM %d\n", value);
c9e6ca8b3f17070 Appana Durga Kedareswara Rao 2021-01-22  2938  =

8495659bf93c8e2 Srikanth Thokala             2015-05-05  2939  		switch (va=
lue) {
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2940  		case 1:
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2941  			lp->csum_=
offload_on_rx_path =3D
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2942  				XAE_FEAT=
URE_PARTIAL_RX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2943  			lp->featu=
res |=3D XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2944  			break;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2945  		case 2:
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2946  			lp->csum_=
offload_on_rx_path =3D
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2947  				XAE_FEAT=
URE_FULL_RX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2948  			lp->featu=
res |=3D XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2949  			break;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2950  		default:
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2951  			lp->csum_=
offload_on_rx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2952  		}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2953  	}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2954  	/* For supp=
orting jumbo frames, the Axi Ethernet hardware must have
f080a8c35d8932d Srikanth Thokala             2015-05-05  2955  	 * a larger=
 Rx/Tx Memory. Typically, the size must be large so that
f080a8c35d8932d Srikanth Thokala             2015-05-05  2956  	 * we can e=
nable jumbo option and start supporting jumbo frames.
f080a8c35d8932d Srikanth Thokala             2015-05-05  2957  	 * Here we =
check for memory allocated for Rx/Tx in the hardware from
f080a8c35d8932d Srikanth Thokala             2015-05-05  2958  	 * the devi=
ce-tree and accordingly set flags.
f080a8c35d8932d Srikanth Thokala             2015-05-05  2959  	 */
8495659bf93c8e2 Srikanth Thokala             2015-05-05  2960  	of_property=
_read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
ee06b1728b95643 Alvaro G. M                  2017-07-17  2961  =

6c8f06bb2e5147b Robert Hancock               2021-02-12  2962  	lp->switch_=
x_sgmii =3D of_property_read_bool(pdev->dev.of_node,
6c8f06bb2e5147b Robert Hancock               2021-02-12  2963  						   "xl=
nx,switch-x-sgmii");
6c8f06bb2e5147b Robert Hancock               2021-02-12  2964  =

ee06b1728b95643 Alvaro G. M                  2017-07-17  2965  	/* Start wi=
th the proprietary, and broken phy_type */
ee06b1728b95643 Alvaro G. M                  2017-07-17  2966  	ret =3D of_=
property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
ee06b1728b95643 Alvaro G. M                  2017-07-17  2967  	if (!ret) {
ee06b1728b95643 Alvaro G. M                  2017-07-17  2968  		switch (va=
lue) {
ee06b1728b95643 Alvaro G. M                  2017-07-17  2969  		case XAE_P=
HY_TYPE_MII:
ee06b1728b95643 Alvaro G. M                  2017-07-17  2970  			lp->phy_m=
ode =3D PHY_INTERFACE_MODE_MII;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2971  			break;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2972  		case XAE_P=
HY_TYPE_GMII:
ee06b1728b95643 Alvaro G. M                  2017-07-17  2973  			lp->phy_m=
ode =3D PHY_INTERFACE_MODE_GMII;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2974  			break;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2975  		case XAE_P=
HY_TYPE_RGMII_2_0:
ee06b1728b95643 Alvaro G. M                  2017-07-17  2976  			lp->phy_m=
ode =3D PHY_INTERFACE_MODE_RGMII_ID;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2977  			break;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2978  		case XAE_P=
HY_TYPE_SGMII:
ee06b1728b95643 Alvaro G. M                  2017-07-17  2979  			lp->phy_m=
ode =3D PHY_INTERFACE_MODE_SGMII;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2980  			break;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2981  		case XAE_P=
HY_TYPE_1000BASE_X:
ee06b1728b95643 Alvaro G. M                  2017-07-17  2982  			lp->phy_m=
ode =3D PHY_INTERFACE_MODE_1000BASEX;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2983  			break;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2984  		default:
9dce88e232cf191 Appana Durga Kedareswara Rao 2020-01-24  2985  			/* Don't =
error out as phy-type is an optional property */
9dce88e232cf191 Appana Durga Kedareswara Rao 2020-01-24  2986  			break;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2987  		}
ee06b1728b95643 Alvaro G. M                  2017-07-17  2988  	} else {
0c65b2b90d13c1d Andrew Lunn                  2019-11-04  2989  		ret =3D of=
_get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
0c65b2b90d13c1d Andrew Lunn                  2019-11-04  2990  		if (ret)
59cd4f19267a0aa Robert Hancock               2021-03-11  2991  			goto clea=
nup_clk;
ee06b1728b95643 Alvaro G. M                  2017-07-17  2992  	}
6c8f06bb2e5147b Robert Hancock               2021-02-12  2993  	if (lp->swi=
tch_x_sgmii && lp->phy_mode !=3D PHY_INTERFACE_MODE_SGMII &&
6c8f06bb2e5147b Robert Hancock               2021-02-12  2994  	    lp->phy=
_mode !=3D PHY_INTERFACE_MODE_1000BASEX) {
6c8f06bb2e5147b Robert Hancock               2021-02-12  2995  		dev_err(&p=
dev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
6c8f06bb2e5147b Robert Hancock               2021-02-12  2996  		ret =3D -E=
INVAL;
59cd4f19267a0aa Robert Hancock               2021-03-11  2997  		goto clean=
up_clk;
6c8f06bb2e5147b Robert Hancock               2021-02-12  2998  	}
8a3b7a252dca9fb Daniel Borkmann              2012-01-19  2999  =

f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  3000  	lp->eth_has=
nobuf =3D of_property_read_bool(pdev->dev.of_node,
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  3001  						 "xlnx=
,eth-hasnobuf");
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  3002  	lp->eth_has=
ptp =3D of_property_read_bool(pdev->dev.of_node,
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  3003  					       =
"xlnx,eth-hasptp");
f6420dd2cc68a93 Appana Durga Kedareswara Rao 2020-01-24  3004  =

9dce88e232cf191 Appana Durga Kedareswara Rao 2020-01-24  3005  	if (lp->axi=
enet_config->mactype =3D=3D XAXIENET_1G && !lp->eth_hasnobuf)
9dce88e232cf191 Appana Durga Kedareswara Rao 2020-01-24  3006  		lp->eth_ir=
q =3D platform_get_irq(pdev, 0);
bf05571deda79b6 Appana Durga Kedareswara Rao 2020-01-24  3007  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4951143261517213942==--

