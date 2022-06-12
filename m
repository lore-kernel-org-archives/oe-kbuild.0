Content-Type: multipart/mixed; boundary="===============3193094117458024741=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mediatek/mtk_eth_soc.c:926:17: warning: Parameter 'txd' can be declared with const [constParameter]
Date: Sun, 12 Jun 2022 23:21:54 +0800
Message-ID: <202206122359.x7grkHlh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3193094117458024741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/ethernet/mediatek/mtk_eth_soc.c:926:17: warning: Parameter 'txd' can be =
declared with const [constParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: 7173eca8eeb7d58f885f7506f808f17851f934ce net: ethernet: mtk_eth_soc=
: convert ring dma pointer to void
date:   3 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 7173eca8eeb7d58f885f7506f808f17851f934ce
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/flow_offload.c:255:26: warning: Parameter 'cb' can be declared =
with const [constParameter]
           flow_setup_cb_t *cb, void *cb_ident)
                            ^
>> net/core/flow_offload.c:255:36: warning: Parameter 'cb_ident' can be dec=
lared with const [constParameter]
           flow_setup_cb_t *cb, void *cb_ident)
                                      ^
   net/core/flow_offload.c:287:45: warning: Parameter 'cb' can be declared =
with const [constParameter]
   bool flow_block_cb_is_busy(flow_setup_cb_t *cb, void *cb_ident,
                                               ^
   net/core/flow_offload.c:287:55: warning: Parameter 'cb_ident' can be dec=
lared with const [constParameter]
   bool flow_block_cb_is_busy(flow_setup_cb_t *cb, void *cb_ident,
                                                         ^
>> net/core/flow_offload.c:427:46: warning: Parameter 'release' can be decl=
ared with const [constParameter]
   static void __flow_block_indr_cleanup(void (*release)(void *cb_priv),
                                                ^
>> net/core/flow_offload.c:428:17: warning: Parameter 'cb_priv' can be decl=
ared with const [constParameter]
             void *cb_priv,
                   ^
>> net/core/flow_offload.c:518:57: warning: Parameter 'data' can be declare=
d with const [constParameter]
   static struct flow_indir_dev_info *find_indir_dev(void *data)
                                                           ^
>> net/core/flow_offload.c:403:17: warning: Uninitialized variable: indr_de=
v->cb [uninitvar]
     if (indr_dev->cb =3D=3D cb &&
                   ^
>> net/core/flow_offload.c:523:12: warning: Uninitialized variable: cur->da=
ta [uninitvar]
     if (cur->data =3D=3D data)
              ^
--
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:926:17: warning: Parameter '=
txd' can be declared with const [constParameter]
             void *txd, u32 txd_size)
                   ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:939:55: warning: Parameter '=
dma' can be declared with const [constParameter]
   static int txd_to_idx(struct mtk_tx_ring *ring, void *dma, u32 txd_size)
                                                         ^
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:1030:12: warning: Signed int=
eger overflow for expression '0x7<<29'. [integerOverflow]
      data |=3D TX_DMA_CHKSUM;
              ^
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:2054:13: warning: Signed int=
eger overflow for expression '0x7<<29'. [integerOverflow]
     if (val & MTK_LRO_RING_RELINQUISH_DONE) {
               ^

vim +/txd +926 drivers/net/ethernet/mediatek/mtk_eth_soc.c

656e705243fd0c John Crispin     2016-03-08   924  =

c4fd06c2bb82c8 Lorenzo Bianconi 2022-05-20   925  static struct mtk_tx_buf =
*mtk_desc_to_tx_buf(struct mtk_tx_ring *ring,
7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20  @926  					     void *txd, u32 =
txd_size)
656e705243fd0c John Crispin     2016-03-08   927  {
7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20   928  	int idx =3D (txd - ring-=
>dma) / txd_size;
656e705243fd0c John Crispin     2016-03-08   929  =

656e705243fd0c John Crispin     2016-03-08   930  	return &ring->buf[idx];
656e705243fd0c John Crispin     2016-03-08   931  }
656e705243fd0c John Crispin     2016-03-08   932  =

296c9120752bab Stefan Roese     2019-08-16   933  static struct mtk_tx_dma =
*qdma_to_pdma(struct mtk_tx_ring *ring,
296c9120752bab Stefan Roese     2019-08-16   934  				       struct mtk_tx_=
dma *dma)
296c9120752bab Stefan Roese     2019-08-16   935  {
7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20   936  	return ring->dma_pdma - =
(struct mtk_tx_dma *)ring->dma + dma;
296c9120752bab Stefan Roese     2019-08-16   937  }
296c9120752bab Stefan Roese     2019-08-16   938  =

7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20  @939  static int txd_to_idx(str=
uct mtk_tx_ring *ring, void *dma, u32 txd_size)
296c9120752bab Stefan Roese     2019-08-16   940  {
7173eca8eeb7d5 Lorenzo Bianconi 2022-05-20   941  	return (dma - ring->dma)=
 / txd_size;
296c9120752bab Stefan Roese     2019-08-16   942  }
296c9120752bab Stefan Roese     2019-08-16   943  =

c30c4a82739090 Felix Fietkau    2021-04-22   944  static void mtk_tx_unmap(=
struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
c30c4a82739090 Felix Fietkau    2021-04-22   945  			 bool napi)
656e705243fd0c John Crispin     2016-03-08   946  {
296c9120752bab Stefan Roese     2019-08-16   947  	if (MTK_HAS_CAPS(eth->so=
c->caps, MTK_QDMA)) {
656e705243fd0c John Crispin     2016-03-08   948  		if (tx_buf->flags & MTK=
_TX_FLAGS_SINGLE0) {
d776a57e4a284b Felix Fietkau    2022-04-05   949  			dma_unmap_single(eth->=
dma_dev,
656e705243fd0c John Crispin     2016-03-08   950  					 dma_unmap_addr(tx_b=
uf, dma_addr0),
656e705243fd0c John Crispin     2016-03-08   951  					 dma_unmap_len(tx_bu=
f, dma_len0),
656e705243fd0c John Crispin     2016-03-08   952  					 DMA_TO_DEVICE);
656e705243fd0c John Crispin     2016-03-08   953  		} else if (tx_buf->flag=
s & MTK_TX_FLAGS_PAGE0) {
d776a57e4a284b Felix Fietkau    2022-04-05   954  			dma_unmap_page(eth->dm=
a_dev,
656e705243fd0c John Crispin     2016-03-08   955  				       dma_unmap_addr=
(tx_buf, dma_addr0),
656e705243fd0c John Crispin     2016-03-08   956  				       dma_unmap_len(=
tx_buf, dma_len0),
656e705243fd0c John Crispin     2016-03-08   957  				       DMA_TO_DEVICE);
656e705243fd0c John Crispin     2016-03-08   958  		}
296c9120752bab Stefan Roese     2019-08-16   959  	} else {
296c9120752bab Stefan Roese     2019-08-16   960  		if (dma_unmap_len(tx_bu=
f, dma_len0)) {
d776a57e4a284b Felix Fietkau    2022-04-05   961  			dma_unmap_page(eth->dm=
a_dev,
296c9120752bab Stefan Roese     2019-08-16   962  				       dma_unmap_addr=
(tx_buf, dma_addr0),
296c9120752bab Stefan Roese     2019-08-16   963  				       dma_unmap_len(=
tx_buf, dma_len0),
296c9120752bab Stefan Roese     2019-08-16   964  				       DMA_TO_DEVICE);
296c9120752bab Stefan Roese     2019-08-16   965  		}
296c9120752bab Stefan Roese     2019-08-16   966  =

296c9120752bab Stefan Roese     2019-08-16   967  		if (dma_unmap_len(tx_bu=
f, dma_len1)) {
d776a57e4a284b Felix Fietkau    2022-04-05   968  			dma_unmap_page(eth->dm=
a_dev,
296c9120752bab Stefan Roese     2019-08-16   969  				       dma_unmap_addr=
(tx_buf, dma_addr1),
296c9120752bab Stefan Roese     2019-08-16   970  				       dma_unmap_len(=
tx_buf, dma_len1),
296c9120752bab Stefan Roese     2019-08-16   971  				       DMA_TO_DEVICE);
296c9120752bab Stefan Roese     2019-08-16   972  		}
296c9120752bab Stefan Roese     2019-08-16   973  	}
296c9120752bab Stefan Roese     2019-08-16   974  =

656e705243fd0c John Crispin     2016-03-08   975  	tx_buf->flags =3D 0;
656e705243fd0c John Crispin     2016-03-08   976  	if (tx_buf->skb &&
c30c4a82739090 Felix Fietkau    2021-04-22   977  	    (tx_buf->skb !=3D (s=
truct sk_buff *)MTK_DMA_DUMMY_DESC)) {
c30c4a82739090 Felix Fietkau    2021-04-22   978  		if (napi)
c30c4a82739090 Felix Fietkau    2021-04-22   979  			napi_consume_skb(tx_bu=
f->skb, napi);
c30c4a82739090 Felix Fietkau    2021-04-22   980  		else
656e705243fd0c John Crispin     2016-03-08   981  			dev_kfree_skb_any(tx_b=
uf->skb);
c30c4a82739090 Felix Fietkau    2021-04-22   982  	}
656e705243fd0c John Crispin     2016-03-08   983  	tx_buf->skb =3D NULL;
656e705243fd0c John Crispin     2016-03-08   984  }
656e705243fd0c John Crispin     2016-03-08   985  =

296c9120752bab Stefan Roese     2019-08-16   986  static void setup_tx_buf(=
struct mtk_eth *eth, struct mtk_tx_buf *tx_buf,
296c9120752bab Stefan Roese     2019-08-16   987  			 struct mtk_tx_dma *tx=
d, dma_addr_t mapped_addr,
296c9120752bab Stefan Roese     2019-08-16   988  			 size_t size, int idx)
296c9120752bab Stefan Roese     2019-08-16   989  {
296c9120752bab Stefan Roese     2019-08-16   990  	if (MTK_HAS_CAPS(eth->so=
c->caps, MTK_QDMA)) {
296c9120752bab Stefan Roese     2019-08-16   991  		dma_unmap_addr_set(tx_b=
uf, dma_addr0, mapped_addr);
296c9120752bab Stefan Roese     2019-08-16   992  		dma_unmap_len_set(tx_bu=
f, dma_len0, size);
296c9120752bab Stefan Roese     2019-08-16   993  	} else {
296c9120752bab Stefan Roese     2019-08-16   994  		if (idx & 1) {
296c9120752bab Stefan Roese     2019-08-16   995  			txd->txd3 =3D mapped_a=
ddr;
296c9120752bab Stefan Roese     2019-08-16   996  			txd->txd2 |=3D TX_DMA_=
PLEN1(size);
296c9120752bab Stefan Roese     2019-08-16   997  			dma_unmap_addr_set(tx_=
buf, dma_addr1, mapped_addr);
296c9120752bab Stefan Roese     2019-08-16   998  			dma_unmap_len_set(tx_b=
uf, dma_len1, size);
296c9120752bab Stefan Roese     2019-08-16   999  		} else {
296c9120752bab Stefan Roese     2019-08-16  1000  			tx_buf->skb =3D (struc=
t sk_buff *)MTK_DMA_DUMMY_DESC;
296c9120752bab Stefan Roese     2019-08-16  1001  			txd->txd1 =3D mapped_a=
ddr;
296c9120752bab Stefan Roese     2019-08-16  1002  			txd->txd2 =3D TX_DMA_P=
LEN0(size);
296c9120752bab Stefan Roese     2019-08-16  1003  			dma_unmap_addr_set(tx_=
buf, dma_addr0, mapped_addr);
296c9120752bab Stefan Roese     2019-08-16  1004  			dma_unmap_len_set(tx_b=
uf, dma_len0, size);
296c9120752bab Stefan Roese     2019-08-16  1005  		}
296c9120752bab Stefan Roese     2019-08-16  1006  	}
296c9120752bab Stefan Roese     2019-08-16  1007  }
296c9120752bab Stefan Roese     2019-08-16  1008  =

160d3a9b192985 Lorenzo Bianconi 2022-05-20  1009  static void mtk_tx_set_dm=
a_desc_v1(struct net_device *dev, void *txd,
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1010  				   struct mtk_tx_dma_=
desc_info *info)
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1011  {
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1012  	struct mtk_mac *mac =3D =
netdev_priv(dev);
160d3a9b192985 Lorenzo Bianconi 2022-05-20  1013  	struct mtk_eth *eth =3D =
mac->hw;
160d3a9b192985 Lorenzo Bianconi 2022-05-20  1014  	struct mtk_tx_dma *desc =
=3D txd;
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1015  	u32 data;
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1016  =

731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1017  	WRITE_ONCE(desc->txd1, i=
nfo->addr);
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1018  =

731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1019  	data =3D TX_DMA_SWC | TX=
_DMA_PLEN0(info->size);
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1020  	if (info->last)
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1021  		data |=3D TX_DMA_LS0;
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1022  	WRITE_ONCE(desc->txd3, d=
ata);
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1023  =

731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1024  	data =3D (mac->id + 1) <=
< TX_DMA_FPORT_SHIFT; /* forward port */
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1025  	if (info->first) {
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1026  		if (info->gso)
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1027  			data |=3D TX_DMA_TSO;
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1028  		/* tx checksum offload =
*/
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1029  		if (info->csum)
731f3fd6bc879f Lorenzo Bianconi 2022-05-20 @1030  			data |=3D TX_DMA_CHKSU=
M;
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1031  		/* vlan header offload =
*/
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1032  		if (info->vlan)
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1033  			data |=3D TX_DMA_INS_V=
LAN | info->vlan_tci;
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1034  	}
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1035  	WRITE_ONCE(desc->txd4, d=
ata);
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1036  }
731f3fd6bc879f Lorenzo Bianconi 2022-05-20  1037  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3193094117458024741==--

