Content-Type: multipart/mixed; boundary="===============2489277319104011439=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xlnx:xlnx_rebase_v5.4 943/1700] drivers/spi/spi-xilinx.c:844 xilinx_spi_probe() error: uninitialized symbol 'cs_num'.
Date: Wed, 03 Mar 2021 03:37:46 +0800
Message-ID: <202103030338.HilyyQ53-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2489277319104011439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>
CC: Naga Sureshkumar Relli <nagasure@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   49bdb4e70d2001f3a5bf0bf5e990cca4a85210f4
commit: 9f025ab296df6624dbb42e196f5c2bc5ece23260 [943/1700] spi: spi-xilinx=
: Updated axi-qspi controller driver
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m021-20210302 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/spi/spi-xilinx.c:844 xilinx_spi_probe() error: uninitialized symbol=
 'cs_num'.

vim +/cs_num +844 drivers/spi/spi-xilinx.c

ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 607  =

ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 608  /* This driver supports single master mode only. Hence Tx FIFO Empty
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 609   * is the only interrupt we care about.
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 610   * Receive FIFO Overrun, Transmit FIFO Underrun, Mode Fault, and Slav=
e Mode
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 611   * Fault are not to happen.
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 612   */
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 613  static irqreturn_t xilinx_spi_irq(int irq, void *dev_id)
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 614  {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 615  	struct spi_master *master =3D dev_id;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 616  	struct xilinx_spi *xspi =3D spi_master_get_devdata(dev_id);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 617  	u32 ipif_isr;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 618  	int status =3D IRQ_NONE;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 619  =

ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 620  	/* Get the IPIF interrupts, and clear them immediately */
86fc593599c11b drivers/spi/xilinx_spi.c Richard R=C3=B6jfors         2009-1=
1-13  621  	ipif_isr =3D xspi->read_fn(xspi->regs + XIPIF_V123B_IISR_OFFSET=
);
86fc593599c11b drivers/spi/xilinx_spi.c Richard R=C3=B6jfors         2009-1=
1-13  622  	xspi->write_fn(ipif_isr, xspi->regs + XIPIF_V123B_IISR_OFFSET);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 623  	if (ipif_isr & XSPI_INTR_TX_EMPTY)  {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 624  		/* Transmission completed */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 625  		xspi->rx_fifo(xspi);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 626  		if (xspi->bytes_to_transfer) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 627  			/* There is more data to send */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 628  			xspi->tx_fifo(xspi);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 629  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 630  		status =3D IRQ_HANDLED;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 631  	}
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 632  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 633  	if (!xspi->bytes_to_receive && !xspi->bytes_to_transfer) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 634  		spi_finalize_current_transfer(master);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 635  		/* Disable the interrupts here. */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 636  		xspi->write_fn(0x0, xspi->regs + XIPIF_V123B_DGIER_OFFSET);
4c9a761402d780 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 637  	}
4c9a761402d780 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 638  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 639  	return status;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 640  }
7cb2abd05fe1f9 drivers/spi/spi-xilinx.c Mark Brown              2013-07-05 =
 641  static int xilinx_spi_probe(struct platform_device *pdev)
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 642  {
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 643  	struct xilinx_spi *xspi;
ad3fdbcaf98dc1 drivers/spi/spi-xilinx.c Michal Simek            2013-07-08 =
 644  	struct resource *res;
7b3b7432ae7848 drivers/spi/spi-xilinx.c Michal Simek            2013-07-09 =
 645  	int ret, num_cs =3D 0, bits_per_word =3D 8;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 646  	u32 cs_num;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown              2013-07-03 =
 647  	struct spi_master *master;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 648  	struct device_node *nc;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 649  	u32 tmp, rx_bus_width, fifo_size;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 650  	bool startup_block;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown              2013-07-03 =
 651  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 652  	of_property_read_u32(pdev->dev.of_node, "num-cs",
be3acdff943f46 drivers/spi/spi-xilinx.c Michal Simek            2013-07-08 =
 653  				&num_cs);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 654  	if (!num_cs)
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 655  		num_cs =3D 1;
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown              2013-07-03 =
 656  =

eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 657  	if (num_cs > XILINX_SPI_MAX_CS) {
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 658  		dev_err(&pdev->dev, "Invalid number of spi slaves\n");
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 659  		return -EINVAL;
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 660  	}
eb25f16c6f4469 drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 661  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 662  	startup_block =3D of_property_read_bool(pdev->dev.of_node,
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 663  					      "xlnx,startup-block");
7cb2abd05fe1f9 drivers/spi/spi-xilinx.c Mark Brown              2013-07-05 =
 664  	master =3D spi_alloc_master(&pdev->dev, sizeof(struct xilinx_spi));
d5af91a1faca68 drivers/spi/xilinx_spi.c Richard R=C3=B6jfors         2009-1=
1-13  665  	if (!master)
d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown              2013-07-03 =
 666  		return -ENODEV;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 667  =

ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 668  	xspi =3D spi_master_get_devdata(master);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 669  	master->dev.of_node =3D pdev->dev.of_node;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 670  	platform_set_drvdata(pdev, master);
ad3fdbcaf98dc1 drivers/spi/spi-xilinx.c Michal Simek            2013-07-08 =
 671  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
ad3fdbcaf98dc1 drivers/spi/spi-xilinx.c Michal Simek            2013-07-08 =
 672  	xspi->regs =3D devm_ioremap_resource(&pdev->dev, res);
c40537d008ab1b drivers/spi/spi-xilinx.c Mark Brown              2013-07-01 =
 673  	if (IS_ERR(xspi->regs)) {
c40537d008ab1b drivers/spi/spi-xilinx.c Mark Brown              2013-07-01 =
 674  		ret =3D PTR_ERR(xspi->regs);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 675  		goto put_master;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 676  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 677  	ret =3D of_property_read_u32(pdev->dev.of_node, "fifo-size",
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 678  				   &fifo_size);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 679  	if (ret < 0) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 680  		dev_err(&pdev->dev,
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 681  			"Missing fifo size\n");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 682  		return -EINVAL;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 683  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 684  	of_property_read_u32(pdev->dev.of_node, "bits-per-word",
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 685  			     &bits_per_word);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 686  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 687  	xspi->rx_bus_width =3D XSPI_ONE_BITS_PER_WORD;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 688  	for_each_available_child_of_node(pdev->dev.of_node, nc) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 689  		if (startup_block) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 690  			ret =3D of_property_read_u32(nc, "reg",
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 691  						   &cs_num);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 692  			if (ret < 0)
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 693  				return -EINVAL;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 694  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 695  		ret =3D of_property_read_u32(nc, "spi-rx-bus-width",
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 696  					   &rx_bus_width);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 697  		if (!ret) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 698  			xspi->rx_bus_width =3D rx_bus_width;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 699  			break;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 700  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 701  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 702  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 703  	xspi->axi_clk =3D devm_clk_get(&pdev->dev, "axi_clk");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 704  	if (IS_ERR(xspi->axi_clk)) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 705  		if (PTR_ERR(xspi->axi_clk) !=3D -ENOENT) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 706  			ret =3D PTR_ERR(xspi->axi_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 707  			goto put_master;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 708  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 709  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 710  		/*
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 711  		 * Clock framework support is optional, continue on,
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 712  		 * anyways if we don't find a matching clock
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 713  		 */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 714  		xspi->axi_clk =3D NULL;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 715  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 716  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 717  	ret =3D clk_prepare(xspi->axi_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 718  	if (ret) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 719  		dev_err(&pdev->dev, "Failed to prepare AXI clock\n");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 720  		goto put_master;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 721  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 722  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 723  	xspi->axi4_clk =3D devm_clk_get(&pdev->dev, "axi4_clk");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 724  	if (IS_ERR(xspi->axi4_clk)) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 725  		if (PTR_ERR(xspi->axi4_clk) !=3D -ENOENT) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 726  			ret =3D PTR_ERR(xspi->axi4_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 727  			goto clk_unprepare_axi_clk;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 728  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 729  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 730  		/*
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 731  		 * Clock framework support is optional, continue on,
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 732  		 * anyways if we don't find a matching clock
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 733  		 */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 734  		xspi->axi4_clk =3D NULL;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 735  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 736  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 737  	ret =3D clk_prepare(xspi->axi4_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 738  	if (ret) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 739  		dev_err(&pdev->dev, "Failed to prepare AXI4 clock\n");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 740  		goto clk_unprepare_axi_clk;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 741  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 742  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 743  	xspi->spi_clk =3D devm_clk_get(&pdev->dev, "spi_clk");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 744  	if (IS_ERR(xspi->spi_clk)) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 745  		if (PTR_ERR(xspi->spi_clk) !=3D -ENOENT) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 746  			ret =3D PTR_ERR(xspi->spi_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 747  			goto clk_unprepare_axi4_clk;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 748  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 749  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 750  		/*
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 751  		 * Clock framework support is optional, continue on,
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 752  		 * anyways if we don't find a matching clock
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 753  		 */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 754  		xspi->spi_clk =3D NULL;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 755  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 756  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 757  	ret =3D clk_prepare(xspi->spi_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 758  	if (ret) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 759  		dev_err(&pdev->dev, "Failed to prepare SPI clock\n");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 760  		goto clk_unprepare_axi4_clk;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 761  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 762  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 763  	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT=
);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 764  	pm_runtime_use_autosuspend(&pdev->dev);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 765  	pm_runtime_enable(&pdev->dev);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 766  	ret =3D pm_runtime_get_sync(&pdev->dev);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 767  	if (ret < 0)
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 768  		goto clk_unprepare_all;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 769  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 770  	xspi->dev =3D &pdev->dev;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 771  =

082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 772  	/*
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 773  	 * Detect endianess on the IP via loop bit in CR. Detection
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 774  	 * must be done before reset is sent because incorrect reset
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 775  	 * value generates error interrupt.
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 776  	 * Setup little endian helper functions first and try to use them
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 777  	 * and check if bit was correctly setup or not.
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 778  	 */
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown              2015-01-30 =
 779  	xspi->read_fn =3D xspi_read32;
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown              2015-01-30 =
 780  	xspi->write_fn =3D xspi_write32;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 781  =

082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 782  	xspi->write_fn(XSPI_CR_LOOP, xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 783  	tmp =3D xspi->read_fn(xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 784  	tmp &=3D XSPI_CR_LOOP;
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 785  	if (tmp !=3D XSPI_CR_LOOP) {
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown              2015-01-30 =
 786  		xspi->read_fn =3D xspi_read32_be;
0635287a308d38 drivers/spi/spi-xilinx.c Mark Brown              2015-01-30 =
 787  		xspi->write_fn =3D xspi_write32_be;
86fc593599c11b drivers/spi/xilinx_spi.c Richard R=C3=B6jfors         2009-1=
1-13  788  	}
082339bc63cccf drivers/spi/spi-xilinx.c Michal Simek            2013-06-04 =
 789  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 790  	xspi->buffer_size =3D fifo_size;
7b3b7432ae7848 drivers/spi/spi-xilinx.c Michal Simek            2013-07-09 =
 791  	xspi->irq =3D platform_get_irq(pdev, 0);
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen      2016-07-15 =
 792  	if (xspi->irq < 0 && xspi->irq !=3D -ENXIO) {
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen      2016-07-15 =
 793  		ret =3D xspi->irq;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 794  		goto clk_unprepare_all;
4db9bf548bb00d drivers/spi/spi-xilinx.c Lars-Peter Clausen      2016-07-15 =
 795  	} else if (xspi->irq >=3D 0) {
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 796  		/* Register for SPI Interrupt */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 797  		ret =3D devm_request_irq(&pdev->dev, xspi->irq, xilinx_spi_irq,
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 798  				       0, dev_name(&pdev->dev), master);
d5af91a1faca68 drivers/spi/xilinx_spi.c Richard R=C3=B6jfors         2009-1=
1-13  799  		if (ret)
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 800  			goto clk_unprepare_all;
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 801  	}
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 802  =

5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 803  	/* SPI controller initializations */
5fe11cc09ce81b drivers/spi/spi-xilinx.c Ricardo Ribalda Delgado 2015-01-28 =
 804  	xspi_init_hw(xspi);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 805  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 806  	pm_runtime_put(&pdev->dev);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 807  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 808  	master->bus_num =3D pdev->id;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 809  	master->num_chipselect =3D num_cs;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 810  	master->setup =3D xspi_setup;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 811  	master->set_cs =3D xspi_chipselect;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 812  	master->transfer_one =3D xspi_start_transfer;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 813  	master->prepare_transfer_hardware =3D xspi_prepare_transfer_hardware;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 814  	master->unprepare_transfer_hardware =3D xspi_unprepare_transfer_hard=
ware;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 815  	master->bits_per_word_mask =3D SPI_BPW_MASK(8);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 816  	master->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 817  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 818  	xspi->bytes_per_word =3D bits_per_word / 8;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 819  	xspi->tx_fifo =3D xspi_fill_tx_fifo_8;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 820  	xspi->rx_fifo =3D xspi_read_rx_fifo_8;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 821  	if (xspi->rx_bus_width =3D=3D XSPI_RX_ONE_WIRE) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 822  		if (xspi->bytes_per_word =3D=3D XSPI_TWO_BITS_PER_WORD) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 823  			xspi->tx_fifo =3D xspi_fill_tx_fifo_16;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 824  			xspi->rx_fifo =3D xspi_read_rx_fifo_16;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 825  		} else if (xspi->bytes_per_word =3D=3D XSPI_FOUR_BITS_PER_WORD) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 826  			xspi->tx_fifo =3D xspi_fill_tx_fifo_32;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 827  			xspi->rx_fifo =3D xspi_read_rx_fifo_32;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 828  		}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 829  	} else if (xspi->rx_bus_width =3D=3D XSPI_RX_FOUR_WIRE) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 830  		master->mode_bits |=3D SPI_TX_QUAD | SPI_RX_QUAD;
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 831  	} else {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 832  		dev_err(&pdev->dev, "Dual Mode not supported\n");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 833  		goto clk_unprepare_all;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 834  	}
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 835  	xspi->cs_inactive =3D 0xffffffff;
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 836  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 837  	/*
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 838  	 * This is the work around for the startup block issue in
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 839  	 * the spi controller. SPI clock is passing through STARTUP
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 840  	 * block to FLASH. STARTUP block don't provide clock as soon
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 841  	 * as QSPI provides command. So first command fails.
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 842  	 */
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 843  	if (startup_block)
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
@844  		xilinx_spi_startup_block(xspi, cs_num);
8fd8821b62397f drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 845  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 846  	ret =3D spi_register_master(master);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 847  	if (ret) {
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 848  		dev_err(&pdev->dev, "spi_register_master failed\n");
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 849  		goto clk_unprepare_all;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 850  	}
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 851  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 852  	return ret;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 853  =

9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 854  clk_unprepare_all:
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 855  	pm_runtime_disable(&pdev->dev);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 856  	pm_runtime_set_suspended(&pdev->dev);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 857  	clk_unprepare(xspi->spi_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 858  clk_unprepare_axi4_clk:
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 859  	clk_unprepare(xspi->axi4_clk);
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 860  clk_unprepare_axi_clk:
9f025ab296df66 drivers/spi/spi-xilinx.c Amit Kumar Mahapatra    2020-01-26 =
 861  	clk_unprepare(xspi->axi_clk);
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 862  put_master:
ae918c02d365c8 drivers/spi/xilinx_spi.c Andrei Konovalov        2007-07-17 =
 863  	spi_master_put(master);
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 864  =

d81c0bbbf84086 drivers/spi/spi-xilinx.c Mark Brown              2013-07-03 =
 865  	return ret;
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 866  }
eae6cb31d890e2 drivers/spi/xilinx_spi.c Grant Likely            2010-10-14 =
 867  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2489277319104011439==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
EOrt4H+i9RFV6CcCAA==
--===============2489277319104011439==--

