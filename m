Content-Type: multipart/mixed; boundary="===============4307169871235851130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 59/159] drivers/net/ethernet/marvell/mvneta.c:2145 mvneta_xdp_submit_frame() warn: variable dereferenced before check 'tx_desc' (see line 2136)
Date: Tue, 01 Feb 2022 19:43:42 +0800
Message-ID: <202202011945.tqWQ7nWl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4307169871235851130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "GNU/Weeb Mailing List" <gwml@gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   5ee32ea24ce7075736e03b4b0b5954a8a323cd73
commit: c41ced023a9892572bd0ec8c3af0bd99faefd31f [59/159] net: mvneta: add =
frags support to XDP_TX
:::::: branch date: 3 hours ago
:::::: commit date: 11 days ago
config: nios2-randconfig-m031-20220130 (https://download.01.org/0day-ci/arc=
hive/20220201/202202011945.tqWQ7nWl-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/marvell/mvneta.c:2145 mvneta_xdp_submit_frame() warn: =
variable dereferenced before check 'tx_desc' (see line 2136)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.
drivers/net/ethernet/marvell/mvneta.c:2409 mvneta_swbm_build_skb() error: u=
ninitialized symbol 'num_frags'.
include/linux/skbuff.h:2971 __netdev_alloc_skb_ip_align() warn: should this=
 be a bitwise op?

vim +/tx_desc +2145 drivers/net/ethernet/marvell/mvneta.c

ca0e014609f05f Lorenzo Bianconi 2020-07-17  2079  =

b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2080  static int
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2081  mvneta_xdp_submit_frame(s=
truct mvneta_port *pp, struct mvneta_tx_queue *txq,
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2082  			struct xdp_frame *xdpf=
, int *nxmit_byte, bool dma_map)
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2083  {
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2084  	struct skb_shared_info *=
sinfo =3D xdp_get_shared_info_from_frame(xdpf);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2085  	struct device *dev =3D p=
p->dev->dev.parent;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2086  	struct mvneta_tx_desc *t=
x_desc =3D NULL;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2087  	int i, num_frames =3D 1;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2088  	struct page *page;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2089  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2090  	if (unlikely(xdp_frame_h=
as_frags(xdpf)))
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2091  		num_frames +=3D sinfo->=
nr_frags;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2092  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2093  	if (txq->count + num_fra=
mes >=3D txq->size)
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2094  		return MVNETA_XDP_DROPP=
ED;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2095  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2096  	for (i =3D 0; i < num_fr=
ames; i++) {
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2097  		struct mvneta_tx_buf *b=
uf =3D &txq->buf[txq->txq_put_index];
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2098  		skb_frag_t *frag =3D NU=
LL;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2099  		int len =3D xdpf->len;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2100  		dma_addr_t dma_addr;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2101  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2102  		if (unlikely(i)) { /* p=
aged area */
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2103  			frag =3D &sinfo->frags=
[i - 1];
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2104  			len =3D skb_frag_size(=
frag);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2105  		}
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2106  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2107  		tx_desc =3D mvneta_txq_=
next_desc_get(txq);
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2108  		if (dma_map) {
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2109  			/* ndo_xdp_xmit */
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2110  			void *data;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2111  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2112  			data =3D unlikely(frag=
) ? skb_frag_address(frag)
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2113  					      : xdpf->data;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2114  			dma_addr =3D dma_map_s=
ingle(dev, data, len,
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2115  						  DMA_TO_DEVICE);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2116  			if (dma_mapping_error(=
dev, dma_addr)) {
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2117  				mvneta_txq_desc_put(t=
xq);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2118  				goto unmap;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2119  			}
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2120  =

b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2121  			buf->type =3D MVNETA_T=
YPE_XDP_NDO;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2122  		} else {
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2123  			page =3D unlikely(frag=
) ? skb_frag_page(frag)
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2124  					      : virt_to_page=
(xdpf->data);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2125  			dma_addr =3D page_pool=
_get_dma_addr(page);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2126  			if (unlikely(frag))
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2127  				dma_addr +=3D skb_fra=
g_off(frag);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2128  			else
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2129  				dma_addr +=3D sizeof(=
*xdpf) + xdpf->headroom;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2130  			dma_sync_single_for_de=
vice(dev, dma_addr, len,
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2131  						   DMA_BIDIRECTIONA=
L);
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2132  			buf->type =3D MVNETA_T=
YPE_XDP_TX;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2133  		}
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2134  		buf->xdpf =3D unlikely(=
i) ? NULL : xdpf;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2135  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21 @2136  		tx_desc->command =3D un=
likely(i) ? 0 : MVNETA_TXD_F_DESC;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2137  		tx_desc->buf_phys_addr =
=3D dma_addr;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2138  		tx_desc->data_size =3D =
len;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2139  		*nxmit_byte +=3D len;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2140  =

b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2141  		mvneta_txq_inc_put(txq);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2142  	}
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2143  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2144  	/*last descriptor */
c41ced023a9892 Lorenzo Bianconi 2022-01-21 @2145  	if (likely(tx_desc))
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2146  		tx_desc->command |=3D M=
VNETA_TXD_L_DESC | MVNETA_TXD_Z_PAD;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2147  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2148  	txq->pending +=3D num_fr=
ames;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2149  	txq->count +=3D num_fram=
es;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2150  =

b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2151  	return MVNETA_XDP_TX;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2152  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2153  unmap:
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2154  	for (i--; i >=3D 0; i--)=
 {
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2155  		mvneta_txq_desc_put(txq=
);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2156  		tx_desc =3D txq->descs =
+ txq->next_desc_to_proc;
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2157  		dma_unmap_single(dev, t=
x_desc->buf_phys_addr,
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2158  				 tx_desc->data_size,
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2159  				 DMA_TO_DEVICE);
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2160  	}
c41ced023a9892 Lorenzo Bianconi 2022-01-21  2161  =

c41ced023a9892 Lorenzo Bianconi 2022-01-21  2162  	return MVNETA_XDP_DROPPE=
D;
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2163  }
b0a43db9087a21 Lorenzo Bianconi 2019-10-19  2164  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4307169871235851130==--

