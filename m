Content-Type: multipart/mixed; boundary="===============8165351828789271523=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ntb/ntb_transport.c:2019: undefined reference to `__dma_request_channel'
Date: Sun, 14 Jun 2020 16:44:16 +0800
Message-ID: <202006141606.kNXorSXD%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8165351828789271523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andrey Ryabinin <aryabinin@virtuozzo.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   96144c58abe7ff767e754b5b80995f7b8846d49b
commit: 277a10850f9f4cb3429faf59293e2c89b1a320be ubsan: split "bounds" chec=
ker from other options
date:   10 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 weeks ago
config: mips-randconfig-c022-20200613 (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

mipsel-linux-ld: include/linux/dmaengine.h:1559: undefined reference to `__=
dma_request_channel'
mipsel-linux-ld: include/linux/dmaengine.h:1559: undefined reference to `__=
dma_request_channel'
mipsel-linux-ld: drivers/spi/spi-pxa2xx-dma.o: in function `pxa2xx_spi_dma_=
setup':
drivers/spi/spi-pxa2xx-dma.c:209: undefined reference to `dma_release_chann=
el'
mipsel-linux-ld: drivers/spi/spi-pxa2xx-dma.o: in function `pxa2xx_spi_dma_=
release':
drivers/spi/spi-pxa2xx-dma.c:223: undefined reference to `dma_release_chann=
el'
mipsel-linux-ld: drivers/spi/spi-pxa2xx-dma.c:228: undefined reference to `=
dma_release_channel'
mipsel-linux-ld: drivers/spi/spi-rockchip.o: in function `rockchip_spi_remo=
ve':
drivers/spi/spi-rockchip.c:759: undefined reference to `dma_release_channel'
mipsel-linux-ld: drivers/spi/spi-rockchip.c:761: undefined reference to `dm=
a_release_channel'
mipsel-linux-ld: drivers/spi/spi-rockchip.o: in function `rockchip_spi_prob=
e':
drivers/spi/spi-rockchip.c:691: undefined reference to `dma_request_chan'
mipsel-linux-ld: drivers/spi/spi-rockchip.c:702: undefined reference to `dm=
a_request_chan'
mipsel-linux-ld: drivers/spi/spi-rockchip.c:731: undefined reference to `dm=
a_release_channel'
mipsel-linux-ld: drivers/spi/spi-rockchip.c:728: undefined reference to `dm=
a_release_channel'
mipsel-linux-ld: drivers/spi/spi-topcliff-pch.o: in function `pch_spi_relea=
se_dma':
drivers/spi/spi-topcliff-pch.c:902: undefined reference to `dma_release_cha=
nnel'
mipsel-linux-ld: drivers/spi/spi-topcliff-pch.c:906: undefined reference to=
 `dma_release_channel'
mipsel-linux-ld: drivers/spi/spi-topcliff-pch.o: in function `pch_spi_reque=
st_dma':
drivers/spi/spi-topcliff-pch.c:869: undefined reference to `__dma_request_c=
hannel'
mipsel-linux-ld: drivers/spi/spi-topcliff-pch.c:884: undefined reference to=
 `__dma_request_channel'
mipsel-linux-ld: drivers/spi/spi-topcliff-pch.c:888: undefined reference to=
 `dma_release_channel'
mipsel-linux-ld: drivers/mmc/host/dw_mmc.o: in function `dw_mci_edmac_exit':
drivers/mmc/host/dw_mmc.c:853: undefined reference to `dma_release_channel'
mipsel-linux-ld: drivers/mmc/host/dw_mmc.o: in function `dw_mci_edmac_init':
drivers/mmc/host/dw_mmc.c:836: undefined reference to `dma_request_chan'
mipsel-linux-ld: drivers/mmc/host/usdhi6rol0.o: in function `usdhi6_dma_rel=
ease':
drivers/mmc/host/usdhi6rol0.c:521: undefined reference to `dma_release_chan=
nel'
mipsel-linux-ld: drivers/mmc/host/usdhi6rol0.c:526: undefined reference to =
`dma_release_channel'
mipsel-linux-ld: drivers/mmc/host/usdhi6rol0.o: in function `usdhi6_dma_req=
uest':
drivers/mmc/host/usdhi6rol0.c:679: undefined reference to `dma_request_chan'
mipsel-linux-ld: drivers/mmc/host/usdhi6rol0.c:696: undefined reference to =
`dma_request_chan'
mipsel-linux-ld: drivers/mmc/host/usdhi6rol0.c:716: undefined reference to =
`dma_release_channel'
mipsel-linux-ld: drivers/mmc/host/usdhi6rol0.c:719: undefined reference to =
`dma_release_channel'
mipsel-linux-ld: drivers/crypto/img-hash.o: in function `img_hash_remove':
drivers/crypto/img-hash.c:1063: undefined reference to `dma_release_channel'
mipsel-linux-ld: drivers/crypto/img-hash.o: in function `img_hash_dma_init':
drivers/crypto/img-hash.c:335: undefined reference to `dma_request_chan'
mipsel-linux-ld: drivers/crypto/img-hash.o: in function `img_hash_probe':
drivers/crypto/img-hash.c:1037: undefined reference to `dma_release_channel'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.o: in function `mtk_h=
sdma_remove':
drivers/staging/mt7621-dma/mtk-hsdma.c:741: undefined reference to `dma_asy=
nc_device_unregister'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.o: in function `vchan=
_tx_prep':
drivers/dma/virt-dma.h:61: undefined reference to `dma_async_tx_descriptor_=
init'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.o: in function `mtk_h=
sdma_terminate_all':
drivers/staging/mt7621-dma/mtk-hsdma.c:296: undefined reference to `vchan_d=
ma_desc_free_list'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.o: in function `vchan=
_free_chan_resources':
drivers/dma/virt-dma.h:199: undefined reference to `vchan_dma_desc_free_lis=
t'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.o: in function `mtk_h=
sdma_probe':
drivers/staging/mt7621-dma/mtk-hsdma.c:703: undefined reference to `vchan_i=
nit'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.c:712: undefined refe=
rence to `dma_async_device_register'
mipsel-linux-ld: drivers/staging/mt7621-dma/mtk-hsdma.c:730: undefined refe=
rence to `dma_async_device_unregister'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.o: in function `gd=
ma_dma_remove':
drivers/staging/ralink-gdma/ralink-gdma.c:899: undefined reference to `dma_=
async_device_unregister'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.o: in function `gd=
ma_dma_tx_status':
drivers/staging/ralink-gdma/ralink-gdma.c:683: undefined reference to `vcha=
n_find_desc'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.o: in function `gd=
ma_dma_terminate_all':
drivers/staging/ralink-gdma/ralink-gdma.c:234: undefined reference to `vcha=
n_dma_desc_free_list'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.o: in function `vc=
han_free_chan_resources':
drivers/dma/virt-dma.h:199: undefined reference to `vchan_dma_desc_free_lis=
t'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.o: in function `vc=
han_tx_prep':
drivers/dma/virt-dma.h:61: undefined reference to `dma_async_tx_descriptor_=
init'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/dma/virt-dma.h:61: undefined reference to `dma_asy=
nc_tx_descriptor_init'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/dma/virt-dma.h:61: undefined reference to `dma_asy=
nc_tx_descriptor_init'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:63: undefined reference to `vchan_t=
x_submit'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/dma/virt-dma.h:64: undefined reference to `vchan_t=
x_desc_free'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.o: in function `gd=
ma_dma_probe':
drivers/staging/ralink-gdma/ralink-gdma.c:865: undefined reference to `vcha=
n_init'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.c:871: undefined r=
eference to `dma_async_device_register'
mipsel-linux-ld: drivers/staging/ralink-gdma/ralink-gdma.c:889: undefined r=
eference to `dma_async_device_unregister'
mipsel-linux-ld: drivers/ntb/ntb_transport.o: in function `ntb_async_tx_sub=
mit':
drivers/ntb/ntb_transport.c:1822: undefined reference to `dmaengine_get_unm=
ap_data'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:1847: undefined reference to `=
dmaengine_unmap_put'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:1853: undefined reference to `=
dmaengine_unmap_put'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:1855: undefined reference to `=
dmaengine_unmap_put'
mipsel-linux-ld: drivers/ntb/ntb_transport.o: in function `ntb_transport_fr=
ee_queue':
drivers/ntb/ntb_transport.c:2131: undefined reference to `dma_sync_wait'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:2138: undefined reference to `=
dma_release_channel'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:2151: undefined reference to `=
dma_sync_wait'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:2153: undefined reference to `=
dma_release_channel'
mipsel-linux-ld: drivers/ntb/ntb_transport.o: in function `ntb_async_rx_sub=
mit':
drivers/ntb/ntb_transport.c:1541: undefined reference to `dmaengine_get_unm=
ap_data'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:1574: undefined reference to `=
dmaengine_unmap_put'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:1583: undefined reference to `=
dmaengine_unmap_put'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:1585: undefined reference to `=
dmaengine_unmap_put'
mipsel-linux-ld: drivers/ntb/ntb_transport.o: in function `ntb_transport_cr=
eate_queue':
>> drivers/ntb/ntb_transport.c:2019: undefined reference to `__dma_request_=
channel'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:2025: undefined reference to `=
__dma_request_channel'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:2093: undefined reference to `=
dma_release_channel'
mipsel-linux-ld: drivers/ntb/ntb_transport.c:2095: undefined reference to `=
dma_release_channel'

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D277a10850f9f4cb3429faf59293e2c89b1a320be
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 277a10850f9f4cb3429faf59293e2c89b1a320be
vim +2019 drivers/ntb/ntb_transport.c

1199aa61264a74 Allen Hubbe     2015-05-18  1961  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  1962  /**
fce8a7bb5b4bfb Jon Mason       2012-11-16  1963   * ntb_transport_create_qu=
eue - Create a new NTB transport layer queue
fce8a7bb5b4bfb Jon Mason       2012-11-16  1964   * @rx_handler: receive ca=
llback function
fce8a7bb5b4bfb Jon Mason       2012-11-16  1965   * @tx_handler: transmit c=
allback function
fce8a7bb5b4bfb Jon Mason       2012-11-16  1966   * @event_handler: event c=
allback function
fce8a7bb5b4bfb Jon Mason       2012-11-16  1967   *
fce8a7bb5b4bfb Jon Mason       2012-11-16  1968   * Create a new NTB transp=
ort layer queue and provide the queue with a callback
fce8a7bb5b4bfb Jon Mason       2012-11-16  1969   * routine for both transm=
it and receive.  The receive callback routine will be
fce8a7bb5b4bfb Jon Mason       2012-11-16  1970   * used to pass up data wh=
en the transport has received it on the queue.   The
fce8a7bb5b4bfb Jon Mason       2012-11-16  1971   * transmit callback routi=
ne will be called when the transport has completed the
fce8a7bb5b4bfb Jon Mason       2012-11-16  1972   * transmission of the dat=
a on the queue and the data is ready to be freed.
fce8a7bb5b4bfb Jon Mason       2012-11-16  1973   *
fce8a7bb5b4bfb Jon Mason       2012-11-16  1974   * RETURNS: pointer to new=
ly created ntb_queue, NULL on error.
fce8a7bb5b4bfb Jon Mason       2012-11-16  1975   */
fce8a7bb5b4bfb Jon Mason       2012-11-16  1976  struct ntb_transport_qp *
e26a5843f7f501 Allen Hubbe     2015-04-09  1977  ntb_transport_create_queue=
(void *data, struct device *client_dev,
fce8a7bb5b4bfb Jon Mason       2012-11-16  1978  			   const struct ntb_que=
ue_handlers *handlers)
fce8a7bb5b4bfb Jon Mason       2012-11-16  1979  {
e26a5843f7f501 Allen Hubbe     2015-04-09  1980  	struct ntb_dev *ndev;
e26a5843f7f501 Allen Hubbe     2015-04-09  1981  	struct pci_dev *pdev;
e26a5843f7f501 Allen Hubbe     2015-04-09  1982  	struct ntb_transport_ctx =
*nt;
fce8a7bb5b4bfb Jon Mason       2012-11-16  1983  	struct ntb_queue_entry *e=
ntry;
fce8a7bb5b4bfb Jon Mason       2012-11-16  1984  	struct ntb_transport_qp *=
qp;
e26a5843f7f501 Allen Hubbe     2015-04-09  1985  	u64 qp_bit;
fce8a7bb5b4bfb Jon Mason       2012-11-16  1986  	unsigned int free_queue;
1199aa61264a74 Allen Hubbe     2015-05-18  1987  	dma_cap_mask_t dma_mask;
1199aa61264a74 Allen Hubbe     2015-05-18  1988  	int node;
e26a5843f7f501 Allen Hubbe     2015-04-09  1989  	int i;
fce8a7bb5b4bfb Jon Mason       2012-11-16  1990  =

e26a5843f7f501 Allen Hubbe     2015-04-09  1991  	ndev =3D dev_ntb(client_d=
ev->parent);
e26a5843f7f501 Allen Hubbe     2015-04-09  1992  	pdev =3D ndev->pdev;
e26a5843f7f501 Allen Hubbe     2015-04-09  1993  	nt =3D ndev->ctx;
fce8a7bb5b4bfb Jon Mason       2012-11-16  1994  =

1199aa61264a74 Allen Hubbe     2015-05-18  1995  	node =3D dev_to_node(&nde=
v->dev);
1199aa61264a74 Allen Hubbe     2015-05-18  1996  =

8fcd0950c021d7 Thomas VanSelus 2017-02-13  1997  	free_queue =3D ffs(nt->qp=
_bitmap_free);
fce8a7bb5b4bfb Jon Mason       2012-11-16  1998  	if (!free_queue)
fce8a7bb5b4bfb Jon Mason       2012-11-16  1999  		goto err;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2000  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  2001  	/* decrement free_queue t=
o make it zero based */
fce8a7bb5b4bfb Jon Mason       2012-11-16  2002  	free_queue--;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2003  =

e26a5843f7f501 Allen Hubbe     2015-04-09  2004  	qp =3D &nt->qp_vec[free_q=
ueue];
e26a5843f7f501 Allen Hubbe     2015-04-09  2005  	qp_bit =3D BIT_ULL(qp->qp=
_num);
e26a5843f7f501 Allen Hubbe     2015-04-09  2006  =

e26a5843f7f501 Allen Hubbe     2015-04-09  2007  	nt->qp_bitmap_free &=3D ~=
qp_bit;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2008  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  2009  	qp->cb_data =3D data;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2010  	qp->rx_handler =3D handle=
rs->rx_handler;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2011  	qp->tx_handler =3D handle=
rs->tx_handler;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2012  	qp->event_handler =3D han=
dlers->event_handler;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2013  =

1199aa61264a74 Allen Hubbe     2015-05-18  2014  	dma_cap_zero(dma_mask);
1199aa61264a74 Allen Hubbe     2015-05-18  2015  	dma_cap_set(DMA_MEMCPY, d=
ma_mask);
1199aa61264a74 Allen Hubbe     2015-05-18  2016  =

a41ef053f70061 Dave Jiang      2015-05-19  2017  	if (use_dma) {
569410ca756cd3 Dave Jiang      2015-07-13  2018  		qp->tx_dma_chan =3D
569410ca756cd3 Dave Jiang      2015-07-13 @2019  			dma_request_channel(dma=
_mask, ntb_dma_filter_fn,
569410ca756cd3 Dave Jiang      2015-07-13  2020  					    (void *)(unsigned=
 long)node);
569410ca756cd3 Dave Jiang      2015-07-13  2021  		if (!qp->tx_dma_chan)
569410ca756cd3 Dave Jiang      2015-07-13  2022  			dev_info(&pdev->dev, "U=
nable to allocate TX DMA channel\n");
569410ca756cd3 Dave Jiang      2015-07-13  2023  =

569410ca756cd3 Dave Jiang      2015-07-13  2024  		qp->rx_dma_chan =3D
569410ca756cd3 Dave Jiang      2015-07-13  2025  			dma_request_channel(dma=
_mask, ntb_dma_filter_fn,
1199aa61264a74 Allen Hubbe     2015-05-18  2026  					    (void *)(unsigned=
 long)node);
569410ca756cd3 Dave Jiang      2015-07-13  2027  		if (!qp->rx_dma_chan)
569410ca756cd3 Dave Jiang      2015-07-13  2028  			dev_info(&pdev->dev, "U=
nable to allocate RX DMA channel\n");
a41ef053f70061 Dave Jiang      2015-05-19  2029  	} else {
569410ca756cd3 Dave Jiang      2015-07-13  2030  		qp->tx_dma_chan =3D NULL;
569410ca756cd3 Dave Jiang      2015-07-13  2031  		qp->rx_dma_chan =3D NULL;
a41ef053f70061 Dave Jiang      2015-05-19  2032  	}
569410ca756cd3 Dave Jiang      2015-07-13  2033  =

51cb8dbf13246a Logan Gunthorpe 2019-02-19  2034  	qp->tx_mw_dma_addr =3D 0;
c59666bb32b91d Logan Gunthorpe 2019-01-18  2035  	if (qp->tx_dma_chan) {
c59666bb32b91d Logan Gunthorpe 2019-01-18  2036  		qp->tx_mw_dma_addr =3D
c59666bb32b91d Logan Gunthorpe 2019-01-18  2037  			dma_map_resource(qp->tx=
_dma_chan->device->dev,
c59666bb32b91d Logan Gunthorpe 2019-01-18  2038  					 qp->tx_mw_phys, qp->=
tx_mw_size,
c59666bb32b91d Logan Gunthorpe 2019-01-18  2039  					 DMA_FROM_DEVICE, 0);
c59666bb32b91d Logan Gunthorpe 2019-01-18  2040  		if (dma_mapping_error(qp=
->tx_dma_chan->device->dev,
c59666bb32b91d Logan Gunthorpe 2019-01-18  2041  				      qp->tx_mw_dma_ad=
dr)) {
c59666bb32b91d Logan Gunthorpe 2019-01-18  2042  			qp->tx_mw_dma_addr =3D =
0;
c59666bb32b91d Logan Gunthorpe 2019-01-18  2043  			goto err1;
c59666bb32b91d Logan Gunthorpe 2019-01-18  2044  		}
c59666bb32b91d Logan Gunthorpe 2019-01-18  2045  	}
c59666bb32b91d Logan Gunthorpe 2019-01-18  2046  =

569410ca756cd3 Dave Jiang      2015-07-13  2047  	dev_dbg(&pdev->dev, "Usin=
g %s memcpy for TX\n",
569410ca756cd3 Dave Jiang      2015-07-13  2048  		qp->tx_dma_chan ? "DMA" =
: "CPU");
569410ca756cd3 Dave Jiang      2015-07-13  2049  =

569410ca756cd3 Dave Jiang      2015-07-13  2050  	dev_dbg(&pdev->dev, "Usin=
g %s memcpy for RX\n",
569410ca756cd3 Dave Jiang      2015-07-13  2051  		qp->rx_dma_chan ? "DMA" =
: "CPU");
282a2feeb9bfb1 Jon Mason       2013-02-12  2052  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  2053  	for (i =3D 0; i < NTB_QP_=
DEF_NUM_ENTRIES; i++) {
c9160b69258ef4 Jia-Ju Bai      2018-04-10  2054  		entry =3D kzalloc_node(s=
izeof(*entry), GFP_KERNEL, node);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2055  		if (!entry)
fce8a7bb5b4bfb Jon Mason       2012-11-16  2056  			goto err1;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2057  =

282a2feeb9bfb1 Jon Mason       2013-02-12  2058  		entry->qp =3D qp;
da2e5ae56164b8 Allen Hubbe     2015-07-13  2059  		ntb_list_add(&qp->ntb_rx=
_q_lock, &entry->entry,
fce8a7bb5b4bfb Jon Mason       2012-11-16  2060  			     &qp->rx_free_q);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2061  	}
a754a8fcaf383b Dave Jiang      2016-04-08  2062  	qp->rx_alloc_entry =3D NT=
B_QP_DEF_NUM_ENTRIES;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2063  =

a754a8fcaf383b Dave Jiang      2016-04-08  2064  	for (i =3D 0; i < qp->tx_=
max_entry; i++) {
c9160b69258ef4 Jia-Ju Bai      2018-04-10  2065  		entry =3D kzalloc_node(s=
izeof(*entry), GFP_KERNEL, node);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2066  		if (!entry)
fce8a7bb5b4bfb Jon Mason       2012-11-16  2067  			goto err2;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2068  =

282a2feeb9bfb1 Jon Mason       2013-02-12  2069  		entry->qp =3D qp;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2070  		ntb_list_add(&qp->ntb_tx=
_free_q_lock, &entry->entry,
fce8a7bb5b4bfb Jon Mason       2012-11-16  2071  			     &qp->tx_free_q);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2072  	}
fce8a7bb5b4bfb Jon Mason       2012-11-16  2073  =

e26a5843f7f501 Allen Hubbe     2015-04-09  2074  	ntb_db_clear(qp->ndev, qp=
_bit);
e26a5843f7f501 Allen Hubbe     2015-04-09  2075  	ntb_db_clear_mask(qp->nde=
v, qp_bit);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2076  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  2077  	dev_info(&pdev->dev, "NTB=
 Transport QP %d created\n", qp->qp_num);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2078  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  2079  	return qp;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2080  =

fce8a7bb5b4bfb Jon Mason       2012-11-16  2081  err2:
f766755c3057c3 Jon Mason       2013-01-19  2082  	while ((entry =3D ntb_lis=
t_rm(&qp->ntb_tx_free_q_lock, &qp->tx_free_q)))
fce8a7bb5b4bfb Jon Mason       2012-11-16  2083  		kfree(entry);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2084  err1:
a754a8fcaf383b Dave Jiang      2016-04-08  2085  	qp->rx_alloc_entry =3D 0;
da2e5ae56164b8 Allen Hubbe     2015-07-13  2086  	while ((entry =3D ntb_lis=
t_rm(&qp->ntb_rx_q_lock, &qp->rx_free_q)))
fce8a7bb5b4bfb Jon Mason       2012-11-16  2087  		kfree(entry);
c59666bb32b91d Logan Gunthorpe 2019-01-18  2088  	if (qp->tx_mw_dma_addr)
c59666bb32b91d Logan Gunthorpe 2019-01-18  2089  		dma_unmap_resource(qp->t=
x_dma_chan->device->dev,
c59666bb32b91d Logan Gunthorpe 2019-01-18  2090  				   qp->tx_mw_dma_addr,=
 qp->tx_mw_size,
c59666bb32b91d Logan Gunthorpe 2019-01-18  2091  				   DMA_FROM_DEVICE, 0);
569410ca756cd3 Dave Jiang      2015-07-13  2092  	if (qp->tx_dma_chan)
569410ca756cd3 Dave Jiang      2015-07-13  2093  		dma_release_channel(qp->=
tx_dma_chan);
569410ca756cd3 Dave Jiang      2015-07-13  2094  	if (qp->rx_dma_chan)
569410ca756cd3 Dave Jiang      2015-07-13  2095  		dma_release_channel(qp->=
rx_dma_chan);
e26a5843f7f501 Allen Hubbe     2015-04-09  2096  	nt->qp_bitmap_free |=3D q=
p_bit;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2097  err:
fce8a7bb5b4bfb Jon Mason       2012-11-16  2098  	return NULL;
fce8a7bb5b4bfb Jon Mason       2012-11-16  2099  }
fce8a7bb5b4bfb Jon Mason       2012-11-16  2100  EXPORT_SYMBOL_GPL(ntb_tran=
sport_create_queue);
fce8a7bb5b4bfb Jon Mason       2012-11-16  2101  =


:::::: The code at line 2019 was first introduced by commit
:::::: 569410ca756cd3ebb15609cb6828a8393fb6384d NTB: Use unique DMA channel=
s for TX and RX

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8165351828789271523==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
70tXnR0JABeULY8eAZ6biL4B/z9u1VCmBdgBAA==
--===============8165351828789271523==--

