Content-Type: multipart/mixed; boundary="===============7330918063149683955=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/actions/owl-emac.c:210 owl_emac_ring_prepare_rx() error: potentially dereferencing uninitialized 'desc'.
Date: Sun, 07 Aug 2022 01:45:55 +0800
Message-ID: <202208070132.61ALGbPW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7330918063149683955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cai Huoqing <caihuoqing@baidu.com>

Hi Cai,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: fbcf8a340150abd20bf44fc706362b0827157fe8 net: ethernet: actions: Ad=
d helper dependency on COMPILE_TEST
date:   12 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-m031-20220801 (https://download.01.org/0day-ci/=
archive/20220807/202208070132.61ALGbPW-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/actions/owl-emac.c:210 owl_emac_ring_prepare_rx() erro=
r: potentially dereferencing uninitialized 'desc'.
drivers/net/ethernet/actions/owl-emac.c:233 owl_emac_ring_prepare_tx() erro=
r: potentially dereferencing uninitialized 'desc'.

vim +/desc +210 drivers/net/ethernet/actions/owl-emac.c

de6e0b19823985 Cristian Ciocaltea 2021-03-22  178  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  179  static int owl_emac_ring=
_prepare_rx(struct owl_emac_priv *priv)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  180  {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  181  	struct owl_emac_ring *r=
ing =3D &priv->rx_ring;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  182  	struct device *dev =3D =
owl_emac_get_dev(priv);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  183  	struct net_device *netd=
ev =3D priv->netdev;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  184  	struct owl_emac_ring_de=
sc *desc;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  185  	struct sk_buff *skb;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  186  	dma_addr_t dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  187  	int i;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  188  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  189  	for (i =3D 0; i < ring-=
>size; i++) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  190  		skb =3D owl_emac_alloc=
_skb(netdev);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  191  		if (!skb)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  192  			return -ENOMEM;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  193  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  194  		dma_addr =3D owl_emac_=
dma_map_rx(priv, skb);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  195  		if (dma_mapping_error(=
dev, dma_addr)) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  196  			dev_kfree_skb(skb);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  197  			return -ENOMEM;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  198  		}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  199  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  200  		desc =3D &ring->descs[=
i];
de6e0b19823985 Cristian Ciocaltea 2021-03-22  201  		desc->status =3D OWL_E=
MAC_BIT_RDES0_OWN;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  202  		desc->control =3D skb_=
tailroom(skb) & OWL_EMAC_MSK_RDES1_RBS1;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  203  		desc->buf_addr =3D dma=
_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  204  		desc->reserved =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  205  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  206  		ring->skbs[i] =3D skb;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  207  		ring->skbs_dma[i] =3D =
dma_addr;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  208  	}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  209  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22 @210  	desc->control |=3D OWL_=
EMAC_BIT_RDES1_RER;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  211  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  212  	ring->head =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  213  	ring->tail =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  214  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  215  	return 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  216  }
de6e0b19823985 Cristian Ciocaltea 2021-03-22  217  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  218  static void owl_emac_rin=
g_prepare_tx(struct owl_emac_priv *priv)
de6e0b19823985 Cristian Ciocaltea 2021-03-22  219  {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  220  	struct owl_emac_ring *r=
ing =3D &priv->tx_ring;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  221  	struct owl_emac_ring_de=
sc *desc;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  222  	int i;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  223  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  224  	for (i =3D 0; i < ring-=
>size; i++) {
de6e0b19823985 Cristian Ciocaltea 2021-03-22  225  		desc =3D &ring->descs[=
i];
de6e0b19823985 Cristian Ciocaltea 2021-03-22  226  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  227  		desc->status =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  228  		desc->control =3D OWL_=
EMAC_BIT_TDES1_IC;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  229  		desc->buf_addr =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  230  		desc->reserved =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  231  	}
de6e0b19823985 Cristian Ciocaltea 2021-03-22  232  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22 @233  	desc->control |=3D OWL_=
EMAC_BIT_TDES1_TER;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  234  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  235  	memset(ring->skbs_dma, =
0, sizeof(dma_addr_t) * ring->size);
de6e0b19823985 Cristian Ciocaltea 2021-03-22  236  =

de6e0b19823985 Cristian Ciocaltea 2021-03-22  237  	ring->head =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  238  	ring->tail =3D 0;
de6e0b19823985 Cristian Ciocaltea 2021-03-22  239  }
de6e0b19823985 Cristian Ciocaltea 2021-03-22  240  =


:::::: The code at line 210 was first introduced by commit
:::::: de6e0b198239857943db395377dc1d2ddd6c05df net: ethernet: actions: Add=
 Actions Semi Owl Ethernet MAC driver

:::::: TO: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7330918063149683955==--

