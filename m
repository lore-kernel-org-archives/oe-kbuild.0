Content-Type: multipart/mixed; boundary="===============5404076235521464691=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 861/1029] drivers/spi/spi-xilinx.c:848 xilinx_spi_probe() error: uninitialized symbol 'cs_num'.
Date: Sat, 26 Mar 2022 11:13:08 +0800
Message-ID: <202203261113.auGddv76-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5404076235521464691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
CC: Tejas Prajapati Rameshchandra <tejaspra@xilinx.com>
CC: Naga Sureshkumar Relli <nagasure@xilinx.com>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: 3973536c456079bf3d09e9a97bf33d29422b183f [861/1029] spi: spi-xilinx=
: Updated axi-qspi controller driver
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: nios2-randconfig-m031-20220324 (https://download.01.org/0day-ci/arc=
hive/20220326/202203261113.auGddv76-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/spi/spi-xilinx.c:848 xilinx_spi_probe() error: uninitialized symbol=
 'cs_num'.

vim +/cs_num +848 drivers/spi/spi-xilinx.c

ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
07  =

ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
08  /* This driver supports single master mode only. Hence Tx FIFO Empty
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
09   * is the only interrupt we care about.
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
10   * Receive FIFO Overrun, Transmit FIFO Underrun, Mode Fault, and Slave =
Mode
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
11   * Fault are not to happen.
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
12   */
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
13  static irqreturn_t xilinx_spi_irq(int irq, void *dev_id)
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
14  {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
15  	struct spi_master *master =3D dev_id;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
16  	struct xilinx_spi *xspi =3D spi_master_get_devdata(dev_id);
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
17  	u32 ipif_isr;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
18  	irqreturn_t status =3D IRQ_NONE;
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
19  =

ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
20  	/* Get the IPIF interrupts, and clear them immediately */
86fc593599c11b6 drivers/spi/xilinx_spi.c Richard R=C3=B6jfors      2009-11-=
13  621  	ipif_isr =3D xspi->read_fn(xspi->regs + XIPIF_V123B_IISR_OFFSET);
86fc593599c11b6 drivers/spi/xilinx_spi.c Richard R=C3=B6jfors      2009-11-=
13  622  	xspi->write_fn(ipif_isr, xspi->regs + XIPIF_V123B_IISR_OFFSET);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
23  	if (ipif_isr & XSPI_INTR_TX_EMPTY)  {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
24  		/* Transmission completed */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
25  		xspi->rx_fifo(xspi);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
26  		if (xspi->bytes_to_transfer) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
27  			/* There is more data to send */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
28  			xspi->tx_fifo(xspi);
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
29  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
30  		status =3D IRQ_HANDLED;
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
31  	}
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
32  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
33  	if (!xspi->bytes_to_receive && !xspi->bytes_to_transfer) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
34  		spi_finalize_current_transfer(master);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
35  		/* Disable the interrupts here. */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
36  		xspi->write_fn(0x0, xspi->regs + XIPIF_V123B_DGIER_OFFSET);
4c9a761402d780b drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
37  	}
4c9a761402d780b drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
38  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
39  	return status;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
40  }
7cb2abd05fe1f9a drivers/spi/spi-xilinx.c Mark Brown           2013-07-05  6=
41  static int xilinx_spi_probe(struct platform_device *pdev)
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
42  {
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
43  	struct xilinx_spi *xspi;
ad3fdbcaf98dc12 drivers/spi/spi-xilinx.c Michal Simek         2013-07-08  6=
44  	struct resource *res;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
45  	int ret;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
46  	u32 num_cs =3D 0, bits_per_word =3D 8;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
47  	u32 cs_num;
d81c0bbbf840865 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  6=
48  	struct spi_master *master;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
49  	struct device_node *nc;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
50  	u32 tmp, rx_bus_width, fifo_size;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
51  	bool startup_block;
d81c0bbbf840865 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  6=
52  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
53  	if (of_property_read_u32(pdev->dev.of_node, "num-cs", &num_cs))
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
54  		dev_info(&pdev->dev,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
55  			 "Missing num-cs optional property, assuming default as <1>\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
56  	if (!num_cs)
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
57  		num_cs =3D 1;
d81c0bbbf840865 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  6=
58  =

eb25f16c6f44693 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
59  	if (num_cs > XILINX_SPI_MAX_CS) {
eb25f16c6f44693 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
60  		dev_err(&pdev->dev, "Invalid number of spi slaves\n");
eb25f16c6f44693 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
61  		return -EINVAL;
eb25f16c6f44693 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
62  	}
eb25f16c6f44693 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  6=
63  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
64  	startup_block =3D of_property_read_bool(pdev->dev.of_node,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
65  					      "xlnx,startup-block");
7cb2abd05fe1f9a drivers/spi/spi-xilinx.c Mark Brown           2013-07-05  6=
66  	master =3D spi_alloc_master(&pdev->dev, sizeof(struct xilinx_spi));
d5af91a1faca68e drivers/spi/xilinx_spi.c Richard R=C3=B6jfors      2009-11-=
13  667  	if (!master)
d81c0bbbf840865 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  6=
68  		return -ENODEV;
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
69  =

ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
70  	xspi =3D spi_master_get_devdata(master);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
71  	master->dev.of_node =3D pdev->dev.of_node;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
72  	platform_set_drvdata(pdev, master);
ad3fdbcaf98dc12 drivers/spi/spi-xilinx.c Michal Simek         2013-07-08  6=
73  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
ad3fdbcaf98dc12 drivers/spi/spi-xilinx.c Michal Simek         2013-07-08  6=
74  	xspi->regs =3D devm_ioremap_resource(&pdev->dev, res);
c40537d008ab1b4 drivers/spi/spi-xilinx.c Mark Brown           2013-07-01  6=
75  	if (IS_ERR(xspi->regs)) {
c40537d008ab1b4 drivers/spi/spi-xilinx.c Mark Brown           2013-07-01  6=
76  		ret =3D PTR_ERR(xspi->regs);
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
77  		goto put_master;
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  6=
78  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
79  	ret =3D of_property_read_u32(pdev->dev.of_node, "fifo-size",
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
80  				   &fifo_size);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
81  	if (ret < 0) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
82  		dev_err(&pdev->dev,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
83  			"Missing fifo size\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
84  		return -EINVAL;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
85  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
86  	if (of_property_read_u32(pdev->dev.of_node, "bits-per-word",
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
87  				 &bits_per_word))
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
88  		dev_info(&pdev->dev,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
89  			 "Missing bits-per-word optional property, assuming default as <8>\n=
");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
90  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
91  	xspi->rx_bus_width =3D XSPI_ONE_BITS_PER_WORD;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
92  	for_each_available_child_of_node(pdev->dev.of_node, nc) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
93  		if (startup_block) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
94  			ret =3D of_property_read_u32(nc, "reg",
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
95  						   &cs_num);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
96  			if (ret < 0)
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
97  				return -EINVAL;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
98  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  6=
99  		ret =3D of_property_read_u32(nc, "spi-rx-bus-width",
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
00  					   &rx_bus_width);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
01  		if (!ret) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
02  			xspi->rx_bus_width =3D rx_bus_width;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
03  			break;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
04  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
05  	}
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  7=
06  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
07  	xspi->axi_clk =3D devm_clk_get(&pdev->dev, "axi_clk");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
08  	if (IS_ERR(xspi->axi_clk)) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
09  		if (PTR_ERR(xspi->axi_clk) !=3D -ENOENT) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
10  			ret =3D PTR_ERR(xspi->axi_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
11  			goto put_master;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
12  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
13  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
14  		/*
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
15  		 * Clock framework support is optional, continue on,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
16  		 * anyways if we don't find a matching clock
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
17  		 */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
18  		xspi->axi_clk =3D NULL;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
19  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
20  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
21  	ret =3D clk_prepare(xspi->axi_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
22  	if (ret) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
23  		dev_err(&pdev->dev, "Failed to prepare AXI clock\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
24  		goto put_master;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
25  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
26  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
27  	xspi->axi4_clk =3D devm_clk_get(&pdev->dev, "axi4_clk");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
28  	if (IS_ERR(xspi->axi4_clk)) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
29  		if (PTR_ERR(xspi->axi4_clk) !=3D -ENOENT) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
30  			ret =3D PTR_ERR(xspi->axi4_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
31  			goto clk_unprepare_axi_clk;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
32  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
33  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
34  		/*
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
35  		 * Clock framework support is optional, continue on,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
36  		 * anyways if we don't find a matching clock
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
37  		 */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
38  		xspi->axi4_clk =3D NULL;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
39  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
40  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
41  	ret =3D clk_prepare(xspi->axi4_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
42  	if (ret) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
43  		dev_err(&pdev->dev, "Failed to prepare AXI4 clock\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
44  		goto clk_unprepare_axi_clk;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
45  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
46  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
47  	xspi->spi_clk =3D devm_clk_get(&pdev->dev, "spi_clk");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
48  	if (IS_ERR(xspi->spi_clk)) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
49  		if (PTR_ERR(xspi->spi_clk) !=3D -ENOENT) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
50  			ret =3D PTR_ERR(xspi->spi_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
51  			goto clk_unprepare_axi4_clk;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
52  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
53  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
54  		/*
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
55  		 * Clock framework support is optional, continue on,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
56  		 * anyways if we don't find a matching clock
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
57  		 */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
58  		xspi->spi_clk =3D NULL;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
59  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
60  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
61  	ret =3D clk_prepare(xspi->spi_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
62  	if (ret) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
63  		dev_err(&pdev->dev, "Failed to prepare SPI clock\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
64  		goto clk_unprepare_axi4_clk;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
65  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
66  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
67  	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
68  	pm_runtime_use_autosuspend(&pdev->dev);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
69  	pm_runtime_enable(&pdev->dev);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
70  	ret =3D pm_runtime_get_sync(&pdev->dev);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
71  	if (ret < 0)
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
72  		goto clk_unprepare_all;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
73  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
74  	xspi->dev =3D &pdev->dev;
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
75  =

082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
76  	/*
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
77  	 * Detect endianess on the IP via loop bit in CR. Detection
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
78  	 * must be done before reset is sent because incorrect reset
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
79  	 * value generates error interrupt.
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
80  	 * Setup little endian helper functions first and try to use them
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
81  	 * and check if bit was correctly setup or not.
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
82  	 */
0635287a308d38b drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  7=
83  	xspi->read_fn =3D xspi_read32;
0635287a308d38b drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  7=
84  	xspi->write_fn =3D xspi_write32;
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
85  =

082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
86  	xspi->write_fn(XSPI_CR_LOOP, xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
87  	tmp =3D xspi->read_fn(xspi->regs + XSPI_CR_OFFSET);
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
88  	tmp &=3D XSPI_CR_LOOP;
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
89  	if (tmp !=3D XSPI_CR_LOOP) {
0635287a308d38b drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  7=
90  		xspi->read_fn =3D xspi_read32_be;
0635287a308d38b drivers/spi/spi-xilinx.c Mark Brown           2015-01-30  7=
91  		xspi->write_fn =3D xspi_write32_be;
86fc593599c11b6 drivers/spi/xilinx_spi.c Richard R=C3=B6jfors      2009-11-=
13  792  	}
082339bc63cccf8 drivers/spi/spi-xilinx.c Michal Simek         2013-06-04  7=
93  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
94  	xspi->buffer_size =3D fifo_size;
7b3b7432ae7848a drivers/spi/spi-xilinx.c Michal Simek         2013-07-09  7=
95  	xspi->irq =3D platform_get_irq(pdev, 0);
4db9bf548bb00d8 drivers/spi/spi-xilinx.c Lars-Peter Clausen   2016-07-15  7=
96  	if (xspi->irq < 0 && xspi->irq !=3D -ENXIO) {
4db9bf548bb00d8 drivers/spi/spi-xilinx.c Lars-Peter Clausen   2016-07-15  7=
97  		ret =3D xspi->irq;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  7=
98  		goto clk_unprepare_all;
4db9bf548bb00d8 drivers/spi/spi-xilinx.c Lars-Peter Clausen   2016-07-15  7=
99  	} else if (xspi->irq >=3D 0) {
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  8=
00  		/* Register for SPI Interrupt */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
01  		ret =3D devm_request_irq(&pdev->dev, xspi->irq, xilinx_spi_irq,
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
02  				       0, dev_name(&pdev->dev), master);
d5af91a1faca68e drivers/spi/xilinx_spi.c Richard R=C3=B6jfors      2009-11-=
13  803  		if (ret)
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
04  			goto clk_unprepare_all;
5fe11cc09ce81b0 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  8=
05  	}
5fe11cc09ce81b0 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  8=
06  =

5fe11cc09ce81b0 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  8=
07  	/* SPI controller initializations */
5fe11cc09ce81b0 drivers/spi/spi-xilinx.c Ricardo Ribalda      2015-01-28  8=
08  	xspi_init_hw(xspi);
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  8=
09  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
10  	pm_runtime_put(&pdev->dev);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
11  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
12  	master->bus_num =3D pdev->id;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
13  	master->num_chipselect =3D num_cs;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
14  	master->setup =3D xspi_setup;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
15  	master->set_cs =3D xspi_chipselect;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
16  	master->transfer_one =3D xspi_start_transfer;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
17  	master->prepare_transfer_hardware =3D xspi_prepare_transfer_hardware;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
18  	master->unprepare_transfer_hardware =3D xspi_unprepare_transfer_hardwa=
re;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
19  	master->bits_per_word_mask =3D SPI_BPW_MASK(8);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
20  	master->mode_bits =3D SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
21  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
22  	xspi->bytes_per_word =3D bits_per_word / 8;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
23  	xspi->tx_fifo =3D xspi_fill_tx_fifo_8;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
24  	xspi->rx_fifo =3D xspi_read_rx_fifo_8;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
25  	if (xspi->rx_bus_width =3D=3D XSPI_RX_ONE_WIRE) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
26  		if (xspi->bytes_per_word =3D=3D XSPI_TWO_BITS_PER_WORD) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
27  			xspi->tx_fifo =3D xspi_fill_tx_fifo_16;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
28  			xspi->rx_fifo =3D xspi_read_rx_fifo_16;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
29  		} else if (xspi->bytes_per_word =3D=3D XSPI_FOUR_BITS_PER_WORD) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
30  			xspi->tx_fifo =3D xspi_fill_tx_fifo_32;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
31  			xspi->rx_fifo =3D xspi_read_rx_fifo_32;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
32  		}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
33  	} else if (xspi->rx_bus_width =3D=3D XSPI_RX_FOUR_WIRE) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
34  		master->mode_bits |=3D SPI_TX_QUAD | SPI_RX_QUAD;
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
35  	} else {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
36  		dev_err(&pdev->dev, "Dual Mode not supported\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
37  		goto clk_unprepare_all;
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  8=
38  	}
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
39  	xspi->cs_inactive =3D 0xffffffff;
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  8=
40  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
41  	/*
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
42  	 * This is the work around for the startup block issue in
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
43  	 * the spi controller. SPI clock is passing through STARTUP
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
44  	 * block to FLASH. STARTUP block don't provide clock as soon
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
45  	 * as QSPI provides command. So first command fails.
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
46  	 */
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
47  	if (startup_block)
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26 @8=
48  		xilinx_spi_startup_block(xspi, cs_num);
8fd8821b62397f8 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
49  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
50  	ret =3D spi_register_master(master);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
51  	if (ret) {
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
52  		dev_err(&pdev->dev, "spi_register_master failed\n");
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
53  		goto clk_unprepare_all;
eae6cb31d890e28 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
54  	}
eae6cb31d890e28 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
55  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
56  	return ret;
eae6cb31d890e28 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
57  =

3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
58  clk_unprepare_all:
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
59  	pm_runtime_disable(&pdev->dev);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
60  	pm_runtime_set_suspended(&pdev->dev);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
61  	clk_unprepare(xspi->spi_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
62  clk_unprepare_axi4_clk:
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
63  	clk_unprepare(xspi->axi4_clk);
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
64  clk_unprepare_axi_clk:
3973536c456079b drivers/spi/spi-xilinx.c Amit Kumar Mahapatra 2020-01-26  8=
65  	clk_unprepare(xspi->axi_clk);
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  8=
66  put_master:
ae918c02d365c88 drivers/spi/xilinx_spi.c Andrei Konovalov     2007-07-17  8=
67  	spi_master_put(master);
eae6cb31d890e28 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
68  =

d81c0bbbf840865 drivers/spi/spi-xilinx.c Mark Brown           2013-07-03  8=
69  	return ret;
eae6cb31d890e28 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
70  }
eae6cb31d890e28 drivers/spi/xilinx_spi.c Grant Likely         2010-10-14  8=
71  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5404076235521464691==--

