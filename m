Content-Type: multipart/mixed; boundary="===============1923731310273596732=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 224/1129] drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2826:2: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 08 May 2022 21:02:22 +0800
Message-ID: <202205082038.f6mlQlNC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1923731310273596732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
CC: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>
CC: Swati Agarwal <swati.agarwal@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: 353f790929055728585095cb890b378ee0471607 [224/1129] net: axienet: A=
dd clock support
:::::: branch date: 4 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20508/202205082038.f6mlQlNC-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a38564=
5b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/353f79092905572858509=
5cb890b378ee0471607
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 353f790929055728585095cb890b378ee0471607
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   sound/soc/codecs/pcm186x.c:268:19: warning: Value stored to 'format' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           snd_pcm_format_t format =3D params_format(params);
                            ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/pcm186x.c:268:19: note: Value stored to 'format' during=
 its initialization is never read
           snd_pcm_format_t format =3D params_format(params);
                            ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/net/ethernet/broadcom/bcmsysport.c:903:21: warning: Value stored=
 to 'ndev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct net_device *ndev =3D priv->netdev;
                              ^~~~   ~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bcmsysport.c:903:21: note: Value stored to=
 'ndev' during its initialization is never read
           struct net_device *ndev =3D priv->netdev;
                              ^~~~   ~~~~~~~~~~~~
   Suppressed 17 warnings (13 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   drivers/net/ethernet/fujitsu/fmvj18x_cs.c:580:5: warning: Value stored t=
o 'j' is never read [clang-analyzer-deadcode.DeadStores]
       j =3D pcmcia_release_window(link, link->resource[2]);
       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/fujitsu/fmvj18x_cs.c:580:5: note: Value stored to '=
j' is never read
       j =3D pcmcia_release_window(link, link->resource[2]);
       ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1521:2: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D axienet_mdio_enable(lp);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1521:2: note: Value st=
ored to 'ret' is never read
           ret =3D axienet_mdio_enable(lp);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1556:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D axienet_device_reset(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1556:3: note: Value st=
ored to 'ret' is never read
                   ret =3D axienet_device_reset(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1558:3: warning: Value=
 stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D axienet_mii_init(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:1558:3: note: Value st=
ored to 'ret' is never read
                   ret =3D axienet_mii_init(ndev);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2826:2: warning: Assig=
ned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           int (*axienet_clk_init)(struct platform_device *pdev,
           ^
   drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2826:2: note: Assigned=
 value is garbage or undefined
           int (*axienet_clk_init)(struct platform_device *pdev,
           ^
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/iio/light/si1145.c:151:8: warning: Excessive padding in 'struct =
si1145_part_info' (14 padding bytes, where 6 is optimal). =

   Optimal fields order: =

   iio_info, =

   channels, =

   num_channels, =

   num_leds, =

   part, =

   uncompressed_meas_rate, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct si1145_part_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/iio/light/si1145.c:151:8: note: Excessive padding in 'struct si1=
145_part_info' (14 padding bytes, where 6 is optimal). Optimal fields order=
: iio_info, channels, num_channels, num_leds, part, uncompressed_meas_rate,=
 consider reordering the fields or adding explicit padding members
   struct si1145_part_info {
   ~~~~~~~^~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   include/linux/skbuff.h:2048:2: warning: 2nd function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           __skb_insert(newsk, next->prev, next, list);
           ^
   net/tipc/socket.c:2404:2: note: Calling 'tipc_sk_filter_rcv'
           tipc_sk_filter_rcv(sk, skb, &xmitq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/socket.c:2345:2: note: Calling '__skb_queue_head_init'
           __skb_queue_head_init(&inputq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/socket.c:2345:2: note: Returning from '__skb_queue_head_init'
           __skb_queue_head_init(&inputq);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/tipc/socket.c:2346:2: note: Calling '__skb_queue_tail'
           __skb_queue_tail(&inputq, skb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +2826 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2811  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2812  /**
2be586205ca2b8 Srikanth Thokala             2015-05-05  2813   * axienet_pr=
obe - Axi Ethernet probe function.
95219aa538e11d Srikanth Thokala             2015-05-05  2814   * @pdev:	Poi=
nter to platform device structure.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2815   *
b0d081c524b46c Michal Simek                 2015-05-05  2816   * Return: 0,=
 on success
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2817   *	    Non-ze=
ro error value on failure.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2818   *
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2819   * This is th=
e probe routine for Axi Ethernet driver. This is called before
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2820   * any other =
driver routines are invoked. It allocates and sets up the Ethernet
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2821   * device. Pa=
rses through device tree and populates fields of
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2822   * axienet_lo=
cal. It registers the Ethernet device.
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2823   */
2be586205ca2b8 Srikanth Thokala             2015-05-05  2824  static int ax=
ienet_probe(struct platform_device *pdev)
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2825  {
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22 @2826  	int (*axiene=
t_clk_init)(struct platform_device *pdev,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2827  				struct cl=
k **axi_aclk, struct clk **axis_clk,
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2828  				struct cl=
k **ref_clk, struct clk **tmpclk) =3D
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2829  					axienet_=
clk_init;
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2830  	int ret =3D =
0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2831  	struct devic=
e_node *np;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2832  	struct axien=
et_local *lp;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2833  	struct net_d=
evice *ndev;
83216e3988cd19 Michael Walle                2021-04-12  2834  	u8 mac_addr[=
ETH_ALEN];
daef06520f0d07 Radhey Shyam Pandey          2020-01-24  2835  	struct resou=
rce *ethres, dmares;
5fff0151b3244d Andre Przywara               2020-03-24  2836  	int addr_wid=
th =3D 32;
8495659bf93c8e Srikanth Thokala             2015-05-05  2837  	u32 value;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2838  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2839  	ndev =3D all=
oc_etherdev(sizeof(*lp));
41de8d4cff21a2 Joe Perches                  2012-01-29  2840  	if (!ndev)
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2841  		return -ENO=
MEM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2842  =

95219aa538e11d Srikanth Thokala             2015-05-05  2843  	platform_set=
_drvdata(pdev, ndev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2844  =

95219aa538e11d Srikanth Thokala             2015-05-05  2845  	SET_NETDEV_D=
EV(ndev, &pdev->dev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2846  	ndev->flags =
&=3D ~IFF_MULTICAST;  /* clear multicast */
28e24c62ab3062 Eric Dumazet                 2013-12-02  2847  	ndev->featur=
es =3D NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2848  	ndev->netdev=
_ops =3D &axienet_netdev_ops;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2849  	ndev->ethtoo=
l_ops =3D &axienet_ethtool_ops;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2850  =

d894be57ca92c8 Jarod Wilson                 2016-10-20  2851  	/* MTU range=
: 64 - 9000 */
d894be57ca92c8 Jarod Wilson                 2016-10-20  2852  	ndev->min_mt=
u =3D 64;
d894be57ca92c8 Jarod Wilson                 2016-10-20  2853  	ndev->max_mt=
u =3D XAE_JUMBO_MTU;
d894be57ca92c8 Jarod Wilson                 2016-10-20  2854  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2855  	lp =3D netde=
v_priv(ndev);
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2856  	lp->ndev =3D=
 ndev;
95219aa538e11d Srikanth Thokala             2015-05-05  2857  	lp->dev =3D =
&pdev->dev;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2858  	lp->options =
=3D XAE_OPTION_DEFAULTS;
8b09ca823ffb4e Robert Hancock               2019-06-06  2859  	lp->rx_bd_nu=
m =3D RX_BD_NUM_DEFAULT;
8b09ca823ffb4e Robert Hancock               2019-06-06  2860  	lp->tx_bd_nu=
m =3D TX_BD_NUM_DEFAULT;
57baf8cc70ea4c Robert Hancock               2021-02-12  2861  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2862  	lp->axi_clk =
=3D devm_clk_get_optional(&pdev->dev, "s_axi_lite_clk");
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2863  	if (!lp->axi=
_clk) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2864  		/* For back=
ward compatibility, if named AXI clock is not present,
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2865  		 * treat th=
e first clock specified as the AXI clock.
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2866  		 */
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2867  		lp->axi_clk=
 =3D devm_clk_get_optional(&pdev->dev, NULL);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2868  	}
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2869  	if (IS_ERR(l=
p->axi_clk)) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2870  		ret =3D PTR=
_ERR(lp->axi_clk);
57baf8cc70ea4c Robert Hancock               2021-02-12  2871  		goto free_n=
etdev;
57baf8cc70ea4c Robert Hancock               2021-02-12  2872  	}
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2873  	ret =3D clk_=
prepare_enable(lp->axi_clk);
57baf8cc70ea4c Robert Hancock               2021-02-12  2874  	if (ret) {
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2875  		dev_err(&pd=
ev->dev, "Unable to enable AXI clock: %d\n", ret);
57baf8cc70ea4c Robert Hancock               2021-02-12  2876  		goto free_n=
etdev;
57baf8cc70ea4c Robert Hancock               2021-02-12  2877  	}
57baf8cc70ea4c Robert Hancock               2021-02-12  2878  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2879  	lp->misc_clk=
s[0].id =3D "axis_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2880  	lp->misc_clk=
s[1].id =3D "ref_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2881  	lp->misc_clk=
s[2].id =3D "mgt_clk";
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2882  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2883  	ret =3D devm=
_clk_bulk_get_optional(&pdev->dev, XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2884  	if (ret)
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2885  		goto cleanu=
p_clk;
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2886  =

b11bfb9a19f9d7 Robert Hancock               2021-03-25  2887  	ret =3D clk_=
bulk_prepare_enable(XAE_NUM_MISC_CLOCKS, lp->misc_clks);
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2888  	if (ret)
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2889  		goto cleanu=
p_clk;
b11bfb9a19f9d7 Robert Hancock               2021-03-25  2890  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2891  	/* Map devic=
e registers */
47651c51c02fc4 Yang Yingliang               2021-06-10  2892  	lp->regs =3D=
 devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
fcc028c106e575 Krzysztof Kozlowski          2015-07-09  2893  	if (IS_ERR(l=
p->regs)) {
fcc028c106e575 Krzysztof Kozlowski          2015-07-09  2894  		ret =3D PTR=
_ERR(lp->regs);
59cd4f19267a0a Robert Hancock               2021-03-11  2895  		goto cleanu=
p_clk;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2896  	}
7fa0043d5c74c6 Robert Hancock               2019-06-11  2897  	lp->regs_sta=
rt =3D ethres->start;
46aa27df885321 Srikanth Thokala             2015-05-05  2898  =

8a3b7a252dca9f Daniel Borkmann              2012-01-19  2899  	/* Setup che=
cksum offload, but default to off if not specified */
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2900  	lp->features=
 =3D 0;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2901  =

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2902  	if (pdev->de=
v.of_node) {
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2903  		const struc=
t of_device_id *match;
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2904  =

a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2905  		match =3D o=
f_match_node(axienet_of_match, pdev->dev.of_node);
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2906  		if (match &=
& match->data) {
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2907  			lp->axiene=
t_config =3D match->data;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2908  			axienet_cl=
k_init =3D lp->axienet_config->clk_init;
353f7909290557 Appana Durga Kedareswara Rao 2021-01-22  2909  		}
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2910  	}
a2fc9e93fefa1f Appana Durga Kedareswara Rao 2020-01-24  2911  =

8495659bf93c8e Srikanth Thokala             2015-05-05  2912  	ret =3D of_p=
roperty_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
8495659bf93c8e Srikanth Thokala             2015-05-05  2913  	if (!ret) {
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2914  		dev_info(&p=
dev->dev, "TX_CSUM %d\n", value);
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2915  =

8495659bf93c8e Srikanth Thokala             2015-05-05  2916  		switch (val=
ue) {
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2917  		case 1:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2918  			lp->csum_o=
ffload_on_tx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2919  				XAE_FEATU=
RE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2920  			lp->featur=
es |=3D XAE_FEATURE_PARTIAL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2921  			/* Can che=
cksum TCP/UDP over IPv4. */
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2922  			ndev->feat=
ures |=3D NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2923  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2924  		case 2:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2925  			lp->csum_o=
ffload_on_tx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2926  				XAE_FEATU=
RE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2927  			lp->featur=
es |=3D XAE_FEATURE_FULL_TX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2928  			/* Can che=
cksum TCP/UDP over IPv4. */
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2929  			ndev->feat=
ures |=3D NETIF_F_IP_CSUM | NETIF_F_SG;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2930  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2931  		default:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2932  			lp->csum_o=
ffload_on_tx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2933  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2934  	}
8495659bf93c8e Srikanth Thokala             2015-05-05  2935  	ret =3D of_p=
roperty_read_u32(pdev->dev.of_node, "xlnx,rxcsum", &value);
8495659bf93c8e Srikanth Thokala             2015-05-05  2936  	if (!ret) {
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2937  		dev_info(&p=
dev->dev, "RX_CSUM %d\n", value);
c9e6ca8b3f1707 Appana Durga Kedareswara Rao 2021-01-22  2938  =

8495659bf93c8e Srikanth Thokala             2015-05-05  2939  		switch (val=
ue) {
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2940  		case 1:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2941  			lp->csum_o=
ffload_on_rx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2942  				XAE_FEATU=
RE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2943  			lp->featur=
es |=3D XAE_FEATURE_PARTIAL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2944  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2945  		case 2:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2946  			lp->csum_o=
ffload_on_rx_path =3D
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2947  				XAE_FEATU=
RE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2948  			lp->featur=
es |=3D XAE_FEATURE_FULL_RX_CSUM;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2949  			break;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2950  		default:
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2951  			lp->csum_o=
ffload_on_rx_path =3D XAE_NO_CSUM_OFFLOAD;
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2952  		}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2953  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2954  	/* For suppo=
rting jumbo frames, the Axi Ethernet hardware must have
f080a8c35d8932 Srikanth Thokala             2015-05-05  2955  	 * a larger =
Rx/Tx Memory. Typically, the size must be large so that
f080a8c35d8932 Srikanth Thokala             2015-05-05  2956  	 * we can en=
able jumbo option and start supporting jumbo frames.
f080a8c35d8932 Srikanth Thokala             2015-05-05  2957  	 * Here we c=
heck for memory allocated for Rx/Tx in the hardware from
f080a8c35d8932 Srikanth Thokala             2015-05-05  2958  	 * the devic=
e-tree and accordingly set flags.
f080a8c35d8932 Srikanth Thokala             2015-05-05  2959  	 */
8495659bf93c8e Srikanth Thokala             2015-05-05  2960  	of_property_=
read_u32(pdev->dev.of_node, "xlnx,rxmem", &lp->rxmem);
ee06b1728b9564 Alvaro G. M                  2017-07-17  2961  =

6c8f06bb2e5147 Robert Hancock               2021-02-12  2962  	lp->switch_x=
_sgmii =3D of_property_read_bool(pdev->dev.of_node,
6c8f06bb2e5147 Robert Hancock               2021-02-12  2963  						   "xln=
x,switch-x-sgmii");
6c8f06bb2e5147 Robert Hancock               2021-02-12  2964  =

ee06b1728b9564 Alvaro G. M                  2017-07-17  2965  	/* Start wit=
h the proprietary, and broken phy_type */
ee06b1728b9564 Alvaro G. M                  2017-07-17  2966  	ret =3D of_p=
roperty_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
ee06b1728b9564 Alvaro G. M                  2017-07-17  2967  	if (!ret) {
ee06b1728b9564 Alvaro G. M                  2017-07-17  2968  		switch (val=
ue) {
ee06b1728b9564 Alvaro G. M                  2017-07-17  2969  		case XAE_PH=
Y_TYPE_MII:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2970  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_MII;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2971  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2972  		case XAE_PH=
Y_TYPE_GMII:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2973  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_GMII;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2974  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2975  		case XAE_PH=
Y_TYPE_RGMII_2_0:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2976  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_RGMII_ID;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2977  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2978  		case XAE_PH=
Y_TYPE_SGMII:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2979  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_SGMII;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2980  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2981  		case XAE_PH=
Y_TYPE_1000BASE_X:
ee06b1728b9564 Alvaro G. M                  2017-07-17  2982  			lp->phy_mo=
de =3D PHY_INTERFACE_MODE_1000BASEX;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2983  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2984  		default:
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  2985  			/* Don't e=
rror out as phy-type is an optional property */
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  2986  			break;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2987  		}
ee06b1728b9564 Alvaro G. M                  2017-07-17  2988  	} else {
0c65b2b90d13c1 Andrew Lunn                  2019-11-04  2989  		ret =3D of_=
get_phy_mode(pdev->dev.of_node, &lp->phy_mode);
0c65b2b90d13c1 Andrew Lunn                  2019-11-04  2990  		if (ret)
59cd4f19267a0a Robert Hancock               2021-03-11  2991  			goto clean=
up_clk;
ee06b1728b9564 Alvaro G. M                  2017-07-17  2992  	}
6c8f06bb2e5147 Robert Hancock               2021-02-12  2993  	if (lp->swit=
ch_x_sgmii && lp->phy_mode !=3D PHY_INTERFACE_MODE_SGMII &&
6c8f06bb2e5147 Robert Hancock               2021-02-12  2994  	    lp->phy_=
mode !=3D PHY_INTERFACE_MODE_1000BASEX) {
6c8f06bb2e5147 Robert Hancock               2021-02-12  2995  		dev_err(&pd=
ev->dev, "xlnx,switch-x-sgmii only supported with SGMII or 1000BaseX\n");
6c8f06bb2e5147 Robert Hancock               2021-02-12  2996  		ret =3D -EI=
NVAL;
59cd4f19267a0a Robert Hancock               2021-03-11  2997  		goto cleanu=
p_clk;
6c8f06bb2e5147 Robert Hancock               2021-02-12  2998  	}
8a3b7a252dca9f Daniel Borkmann              2012-01-19  2999  =

f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  3000  	lp->eth_hasn=
obuf =3D of_property_read_bool(pdev->dev.of_node,
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  3001  						 "xlnx,=
eth-hasnobuf");
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3002  	lp->eth_hasp=
tp =3D of_property_read_bool(pdev->dev.of_node,
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3003  					       "=
xlnx,eth-hasptp");
f6420dd2cc68a9 Appana Durga Kedareswara Rao 2020-01-24  3004  =

9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  3005  	if (lp->axie=
net_config->mactype =3D=3D XAXIENET_1G && !lp->eth_hasnobuf)
9dce88e232cf19 Appana Durga Kedareswara Rao 2020-01-24  3006  		lp->eth_irq=
 =3D platform_get_irq(pdev, 0);
bf05571deda79b Appana Durga Kedareswara Rao 2020-01-24  3007  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1923731310273596732==--

