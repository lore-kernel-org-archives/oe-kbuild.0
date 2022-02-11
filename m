Content-Type: multipart/mixed; boundary="===============9104918718313539117=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ambarus:spi-nor/next 1/15] drivers/spi/atmel-quadspi.c:1202 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
Date: Fri, 11 Feb 2022 08:11:16 +0800
Message-ID: <202202110830.1OGwXRWt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9104918718313539117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://github.com/ambarus/linux-0day spi-nor/next
head:   038b3fa2d89f1a00fdb8767704cdb799a0fe746b
commit: ff51c966a3c5144ae964797349747e680ee47c3a [1/15] spi: atmel-quadspi:=
 Add support for sama7g5 QSPI
:::::: branch date: 22 hours ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-m031-20220210 (https://download.01.org/0day-ci/=
archive/20220211/202202110830.1OGwXRWt-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/spi/atmel-quadspi.c:1202 atmel_qspi_dma_init() warn: passing zero t=
o 'PTR_ERR'

vim +/PTR_ERR +1202 drivers/spi/atmel-quadspi.c

161aaab8a067a9 drivers/mtd/spi-nor/atmel-quadspi.c Cyrille Pitchen 2016-06-=
13  1193  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1194  static int atmel_qspi_dma_init(struct spi_controller *ctrl)
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1195  {
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1196  	struct atmel_qspi *aq =3D spi_controller_get_devdata(ctrl);
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1197  	int ret;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1198  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1199  	aq->rx_chan =3D dma_request_chan(&aq->pdev->dev, "rx");
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1200  	if (IS_ERR(aq->rx_chan)) {
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1201  		aq->rx_chan =3D NULL;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19 @1202  		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1203  				     "RX DMA channel is not available\n");
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1204  	}
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1205  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1206  	aq->tx_chan =3D dma_request_chan(&aq->pdev->dev, "tx");
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1207  	if (IS_ERR(aq->tx_chan)) {
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1208  		ret =3D dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->tx_chan),
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1209  				    "TX DMA channel is not available\n");
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1210  		goto release_rx_chan;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1211  	}
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1212  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1213  	ctrl->dma_rx =3D aq->rx_chan;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1214  	ctrl->dma_tx =3D aq->tx_chan;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1215  	init_completion(&aq->dma_completion);
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1216  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1217  	dev_info(&aq->pdev->dev, "Using %s (tx) and %s (rx) for DMA tran=
sfers\n",
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1218  		 dma_chan_name(aq->tx_chan), dma_chan_name(aq->rx_chan));
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1219  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1220  	return 0;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1221  =

ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1222  release_rx_chan:
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1223  	dma_release_channel(aq->rx_chan);
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1224  	aq->rx_chan =3D NULL;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1225  	aq->tx_chan =3D NULL;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1226  	return ret;
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1227  }
ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020-10-=
19  1228  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9104918718313539117==--

