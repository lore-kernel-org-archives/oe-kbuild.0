Content-Type: multipart/mixed; boundary="===============1430256560941042910=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] serial: samsung: use dma_ops of DMA if attached
Date: Sat, 26 Jun 2021 07:08:46 +0800
Message-ID: <202106260603.rah2UyG9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1430256560941042910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210622091710.44032-1-m.shams@samsung.com>
References: <20210622091710.44032-1-m.shams@samsung.com>
TO: Tamseel Shams <m.shams@samsung.com>
TO: krzysztof.kozlowski(a)canonical.com
TO: gregkh(a)linuxfoundation.org
TO: jirislaby(a)kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-samsung-soc(a)vger.kernel.org
CC: linux-serial(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: alim.akhtar(a)samsung.com
CC: ajaykumar.rs(a)samsung.com
CC: Tamseel Shams <m.shams@samsung.com>

Hi Tamseel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on usb/usb-testing soc/for-next clk/clk-next v5.13=
-rc7 next-20210625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tamseel-Shams/serial-samsu=
ng-use-dma_ops-of-DMA-if-attached/20210622-195936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-m031-20210625 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/serial/samsung_tty.c:347 s3c24xx_serial_tx_dma_complete() error=
: we previously assumed 'dma' could be null (see line 344)
drivers/tty/serial/samsung_tty.c:347 s3c24xx_serial_tx_dma_complete() error=
: we previously assumed 'dma->tx_chan' could be null (see line 344)
drivers/tty/serial/samsung_tty.c:458 s3c24xx_serial_start_tx_dma() error: w=
e previously assumed 'dma' could be null (see line 452)
drivers/tty/serial/samsung_tty.c:538 s3c24xx_uart_copy_rx_to_tty() error: w=
e previously assumed 'dma' could be null (see line 532)
drivers/tty/serial/samsung_tty.c:664 s3c64xx_start_rx_dma() error: we previ=
ously assumed 'dma' could be null (see line 661)
drivers/tty/serial/samsung_tty.c:1132 s3c24xx_serial_request_dma() warn: va=
riable dereferenced before check 'dma' (see line 1077)

Old smatch warnings:
drivers/tty/serial/samsung_tty.c:2129 s3c24xx_serial_init_port() warn: miss=
ing error code 'ret'

vim +/dma +347 drivers/tty/serial/samsung_tty.c

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  331  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  332  static void s3c24xx_serial_tx_dma_complete(void *args)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  333  {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  334  	struct s3c24xx_uart_port *ourport =3D args;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  335  	struct uart_port *port =3D &ourport->port;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  336  	struct circ_buf *xmit =3D &port->state->xmit;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  337  	struct s3c24xx_uart_dma *dma =3D ourport->dma;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  338  	struct dma_tx_state state;
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  339  	struct device *dma_map_ops_dev =3D ourport->port.dev;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  340  	unsigned long flags;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  341  	int count;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  342  =

36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  343  	/* Null pointer check for "dma" and "dma->tx_chan" */
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22 @344  	if (dma && dma->tx_chan)
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  345  		dma_map_ops_dev =3D dma->tx_chan->device->dev;
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  346  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10 @347  	dmaengine_tx_status(dma->tx_chan, dma->tx_cookie, &state);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  348  	count =3D dma->tx_bytes_requested - state.residue;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  349  	async_tx_ack(dma->tx_desc);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  350  =

36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  351  	dma_sync_single_for_cpu(dma_map_ops_dev, dma->tx_transfer_addr,
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  352  				dma->tx_size, DMA_TO_DEVICE);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  353  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  354  	spin_lock_irqsave(&port->lock, flags);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  355  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  356  	xmit->tail =3D (xmit->tail + count) & (UART_XMIT_SIZE - 1);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  357  	port->icount.tx +=3D count;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  358  	ourport->tx_in_progress =3D 0;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  359  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  360  	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  361  		uart_write_wakeup(port);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  362  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  363  	s3c24xx_serial_start_next_tx(ourport);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  364  	spin_unlock_irqrestore(&port->lock, flags);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  365  }
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  366  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  367  static void enable_tx_dma(struct s3c24xx_uart_port *ourport)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  368  {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  369  	struct uart_port *port =3D &ourport->port;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  370  	u32 ucon;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  371  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  372  	/* Mask Tx interrupt */
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  373  	switch (ourport->info->type) {
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  374  	case TYPE_S3C6400:
bbb5ff91225dfb drivers/tty/serial/samsung.c     Matthew Leach       2016-06=
-22  375  		s3c24xx_set_bit(port, S3C64XX_UINTM_TXD, S3C64XX_UINTM);
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  376  		break;
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  377  	case TYPE_APPLE_S5L:
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  378  		WARN_ON(1); // No DMA
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  379  		break;
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  380  	default:
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  381  		disable_irq_nosync(ourport->tx_irq);
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  382  		break;
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  383  	}
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  384  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  385  	/* Enable tx dma mode */
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  386  	ucon =3D rd_regl(port, S3C2410_UCON);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  387  	ucon &=3D ~(S3C64XX_UCON_TXBURST_MASK | S3C64XX_UCON_TXMODE_MASK=
);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  388  	ucon |=3D (dma_get_cache_alignment() >=3D 16) ?
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  389  		S3C64XX_UCON_TXBURST_16 : S3C64XX_UCON_TXBURST_1;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  390  	ucon |=3D S3C64XX_UCON_TXMODE_DMA;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  391  	wr_regl(port,  S3C2410_UCON, ucon);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  392  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  393  	ourport->tx_mode =3D S3C24XX_TX_DMA;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  394  }
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  395  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  396  static void enable_tx_pio(struct s3c24xx_uart_port *ourport)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  397  {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  398  	struct uart_port *port =3D &ourport->port;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  399  	u32 ucon, ufcon;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  400  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  401  	/* Set ufcon txtrig */
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  402  	ourport->tx_in_progress =3D S3C24XX_TX_PIO;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  403  	ufcon =3D rd_regl(port, S3C2410_UFCON);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  404  	wr_regl(port,  S3C2410_UFCON, ufcon);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  405  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  406  	/* Enable tx pio mode */
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  407  	ucon =3D rd_regl(port, S3C2410_UCON);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  408  	ucon &=3D ~(S3C64XX_UCON_TXMODE_MASK);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  409  	ucon |=3D S3C64XX_UCON_TXMODE_CPU;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  410  	wr_regl(port,  S3C2410_UCON, ucon);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  411  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  412  	/* Unmask Tx interrupt */
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  413  	switch (ourport->info->type) {
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  414  	case TYPE_S3C6400:
bbb5ff91225dfb drivers/tty/serial/samsung.c     Matthew Leach       2016-06=
-22  415  		s3c24xx_clear_bit(port, S3C64XX_UINTM_TXD,
bbb5ff91225dfb drivers/tty/serial/samsung.c     Matthew Leach       2016-06=
-22  416  				  S3C64XX_UINTM);
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  417  		break;
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  418  	case TYPE_APPLE_S5L:
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  419  		ucon |=3D APPLE_S5L_UCON_TXTHRESH_ENA_MSK;
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  420  		wr_regl(port, S3C2410_UCON, ucon);
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  421  		break;
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  422  	default:
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  423  		enable_irq(ourport->tx_irq);
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  424  		break;
aaf144059ba474 drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  425  	}
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  426  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  427  	ourport->tx_mode =3D S3C24XX_TX_PIO;
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  428  =

fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  429  	/*
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  430  	 * The Apple version only has edge triggered TX IRQs, so we need
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  431  	 * to kick off the process by sending some characters here.
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  432  	 */
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  433  	if (ourport->info->type =3D=3D TYPE_APPLE_S5L)
fcbba344907afe drivers/tty/serial/samsung_tty.c Hector Martin       2021-03=
-05  434  		s3c24xx_serial_tx_chars(ourport);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  435  }
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  436  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  437  static void s3c24xx_serial_start_tx_pio(struct s3c24xx_uart_port =
*ourport)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  438  {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  439  	if (ourport->tx_mode !=3D S3C24XX_TX_PIO)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  440  		enable_tx_pio(ourport);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  441  }
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  442  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  443  static int s3c24xx_serial_start_tx_dma(struct s3c24xx_uart_port *=
ourport,
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  444  				      unsigned int count)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  445  {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  446  	struct uart_port *port =3D &ourport->port;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  447  	struct circ_buf *xmit =3D &port->state->xmit;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  448  	struct s3c24xx_uart_dma *dma =3D ourport->dma;
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  449  	struct device *dma_map_ops_dev =3D ourport->port.dev;
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  450  =

36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  451  	/* Null pointer check for "dma" and "dma->tx_chan" */
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22 @452  	if (dma && dma->tx_chan)
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  453  		dma_map_ops_dev =3D dma->tx_chan->device->dev;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  454  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  455  	if (ourport->tx_mode !=3D S3C24XX_TX_DMA)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  456  		enable_tx_dma(ourport);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  457  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10 @458  	dma->tx_size =3D count & ~(dma_get_cache_alignment() - 1);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  459  	dma->tx_transfer_addr =3D dma->tx_addr + xmit->tail;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  460  =

36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  461  	dma_sync_single_for_device(dma_map_ops_dev, dma->tx_transfer_add=
r,
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  462  				dma->tx_size, DMA_TO_DEVICE);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  463  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  464  	dma->tx_desc =3D dmaengine_prep_slave_single(dma->tx_chan,
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  465  				dma->tx_transfer_addr, dma->tx_size,
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  466  				DMA_MEM_TO_DEV, DMA_PREP_INTERRUPT);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  467  	if (!dma->tx_desc) {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  468  		dev_err(ourport->port.dev, "Unable to get desc for Tx\n");
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  469  		return -EIO;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  470  	}
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  471  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  472  	dma->tx_desc->callback =3D s3c24xx_serial_tx_dma_complete;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  473  	dma->tx_desc->callback_param =3D ourport;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  474  	dma->tx_bytes_requested =3D dma->tx_size;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  475  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  476  	ourport->tx_in_progress =3D S3C24XX_TX_DMA;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  477  	dma->tx_cookie =3D dmaengine_submit(dma->tx_desc);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  478  	dma_async_issue_pending(dma->tx_chan);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  479  	return 0;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  480  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  481  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  482  static void s3c24xx_serial_start_next_tx(struct s3c24xx_uart_port=
 *ourport)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  483  {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  484  	struct uart_port *port =3D &ourport->port;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  485  	struct circ_buf *xmit =3D &port->state->xmit;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  486  	unsigned long count;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  487  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  488  	/* Get data size up to the end of buffer */
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  489  	count =3D CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE=
);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  490  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  491  	if (!count) {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  492  		s3c24xx_serial_stop_tx(port);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  493  		return;
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  494  	}
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  495  =

81ccb2a69f76b8 drivers/tty/serial/samsung.c     Marek Szyprowski    2015-07=
-31  496  	if (!ourport->dma || !ourport->dma->tx_chan ||
736cd79f483fd7 drivers/tty/serial/samsung.c     Robert Baldyga      2015-07=
-31  497  	    count < ourport->min_dma_size ||
736cd79f483fd7 drivers/tty/serial/samsung.c     Robert Baldyga      2015-07=
-31  498  	    xmit->tail & (dma_get_cache_alignment() - 1))
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  499  		s3c24xx_serial_start_tx_pio(ourport);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  500  	else
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  501  		s3c24xx_serial_start_tx_dma(ourport, count);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  502  }
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  503  =

75781979f8d33e drivers/tty/serial/samsung.c     Krzysztof Kozlowski 2015-05=
-02  504  static void s3c24xx_serial_start_tx(struct uart_port *port)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  505  {
b73c289cc90138 drivers/serial/samsung.c         Ben Dooks           2008-10=
-21  506  	struct s3c24xx_uart_port *ourport =3D to_ourport(port);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  507  	struct circ_buf *xmit =3D &port->state->xmit;
b73c289cc90138 drivers/serial/samsung.c         Ben Dooks           2008-10=
-21  508  =

8336240ebb248b drivers/tty/serial/samsung_tty.c Greg Kroah-Hartman  2019-12=
-17  509  	if (!ourport->tx_enabled) {
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  510  		if (port->flags & UPF_CONS_FLOW)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  511  			s3c24xx_serial_rx_disable(port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  512  =

8336240ebb248b drivers/tty/serial/samsung_tty.c Greg Kroah-Hartman  2019-12=
-17  513  		ourport->tx_enabled =3D 1;
ba019a3e2ad53d drivers/tty/serial/samsung.c     Robert Baldyga      2015-01=
-28  514  		if (!ourport->dma || !ourport->dma->tx_chan)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  515  			s3c24xx_serial_start_tx_pio(ourport);
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  516  	}
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  517  =

29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  518  	if (ourport->dma && ourport->dma->tx_chan) {
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  519  		if (!uart_circ_empty(xmit) && !ourport->tx_in_progress)
29bef79908459d drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  520  			s3c24xx_serial_start_next_tx(ourport);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  521  	}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  522  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks           2008-07=
-03  523  =

b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  524  static void s3c24xx_uart_copy_rx_to_tty(struct s3c24xx_uart_port =
*ourport,
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  525  		struct tty_port *tty, int count)
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  526  {
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  527  	struct s3c24xx_uart_dma *dma =3D ourport->dma;
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  528  	struct device *dma_map_ops_dev =3D ourport->port.dev;
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  529  	int copied;
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  530  =

36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  531  	/* Null pointer check for "dma" and "dma->rx_chan" */
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22 @532  	if (dma && dma->rx_chan)
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  533  		dma_map_ops_dev =3D dma->rx_chan->device->dev;
36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22  534  =

b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  535  	if (!count)
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  536  		return;
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  537  =

36f392dcc64c96 drivers/tty/serial/samsung_tty.c Tamseel Shams       2021-06=
-22 @538  	dma_sync_single_for_cpu(dma_map_ops_dev, dma->rx_addr,
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  539  				dma->rx_size, DMA_FROM_DEVICE);
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  540  =

b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  541  	ourport->port.icount.rx +=3D count;
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  542  	if (!tty) {
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  543  		dev_err(ourport->port.dev, "No tty port\n");
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  544  		return;
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  545  	}
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  546  	copied =3D tty_insert_flip_string(tty,
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  547  			((unsigned char *)(ourport->dma->rx_buf)), count);
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  548  	if (copied !=3D count) {
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  549  		WARN_ON(1);
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  550  		dev_err(ourport->port.dev, "RxData copy to tty layer failed\n");
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  551  	}
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  552  }
b543c301c2c5fb drivers/tty/serial/samsung.c     Robert Baldyga      2014-12=
-10  553  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1430256560941042910==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1430256560941042910==--

