Content-Type: multipart/mixed; boundary="===============7923156378891979123=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [ambarus:spi-nor/next 1/15] drivers/spi/atmel-quadspi.c:1202 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'
Date: Fri, 11 Feb 2022 16:37:00 +0300
Message-ID: <20220211133700.GB1978@kadam>
In-Reply-To: <5f2ddbf7-381a-870e-e533-5261bbc9337b@microchip.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7923156378891979123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 08:30:48AM +0000, Tudor.Ambarus(a)microchip.com wro=
te:
> On 2/11/22 10:04, Dan Carpenter wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know =
the content is safe
> > =

> > tree:   https://github.com/ambarus/linux-0day  spi-nor/next
> > head:   038b3fa2d89f1a00fdb8767704cdb799a0fe746b
> > commit: ff51c966a3c5144ae964797349747e680ee47c3a [1/15] spi: atmel-quad=
spi: Add support for sama7g5 QSPI
> > config: openrisc-randconfig-m031-20220210 (https://download.01.org/0day=
-ci/archive/20220211/202202110830.1OGwXRWt-lkp(a)intel.com/config )
> > compiler: or1k-linux-gcc (GCC) 11.2.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/spi/atmel-quadspi.c:1202 atmel_qspi_dma_init() warn: passing ze=
ro to 'PTR_ERR'
> > =

> > vim +/PTR_ERR +1202 drivers/spi/atmel-quadspi.c
> > =

> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1194  static int atmel_qspi_dma_init(struct spi_controller *ctrl)
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1195  {
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1196     struct atmel_qspi *aq =3D spi_controller_get_devdata(ctrl);
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1197     int ret;
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1198
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1199     aq->rx_chan =3D dma_request_chan(&aq->pdev->dev, "rx");
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1200     if (IS_ERR(aq->rx_chan)) {
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1201             aq->rx_chan =3D NULL;
> > =

> > Need to preserve the error code before setting this to NULL
> > =

> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19 @1202             return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->r=
x_chan),
> > ff51c966a3c514 drivers/spi/atmel-quadspi.c         Tudor Ambarus   2020=
-10-19  1203                                  "RX DMA channel is not availa=
ble\n");
> > =

> > This will return success.
> > =

> =

> Indeed, thanks! This is a personal development branch, I'll fix it inline=
 since
> the patch that adds support for this has not been integrated in mainline =
yet.
> I'm not sure if I have to add the Reported-by tags or how to give credit =
to
> a bug spotted on a patch that has not yet landed in mainline. Maybe by ad=
ding
> a comment in the comments section of the patch "---"?

This is an automated email from the kbuild-bot.  Feel free to ignore it
when you want to.  I just look it over and hit the forward button.

regards,
dan carpenter

--===============7923156378891979123==--

