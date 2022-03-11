Content-Type: multipart/mixed; boundary="===============4245744913616055685=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9762/11953] drivers/spi/spidev.c:485 spidev_ioctl() error: uninitialized symbol 'n_ioc'.
Date: Fri, 11 Mar 2022 22:13:42 +0800
Message-ID: <202203112224.BrAROyWo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4245744913616055685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: b786e44a4dbfe64476e7120ec7990b89a37be37d [9762/11953] mm: Convert p=
age_vma_mapped_walk to work on PFNs
:::::: branch date: 29 hours ago
:::::: commit date: 8 days ago
config: riscv-randconfig-m031-20220310 (https://download.01.org/0day-ci/arc=
hive/20220311/202203112224.BrAROyWo-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/spi/spidev.c:485 spidev_ioctl() error: uninitialized symbol 'n_ioc'.
mm/page_vma_mapped.c:246 page_vma_mapped_walk() warn: always true condition=
 '(pvmw->nr_pages >=3D (1 << ( - (12)))) =3D> (0-u32max >=3D 0)'

vim +/n_ioc +485 drivers/spi/spidev.c

7782a1a94825db Ian Abbott         2015-01-30  342  =

4ef754b7d7971a Alan Cox           2008-07-23  343  static long
4ef754b7d7971a Alan Cox           2008-07-23  344  spidev_ioctl(struct file=
 *filp, unsigned int cmd, unsigned long arg)
814a8d50eb1d88 Andrea Paterniani  2007-05-08  345  {
814a8d50eb1d88 Andrea Paterniani  2007-05-08  346  	int			retval =3D 0;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  347  	struct spidev_data	*spi=
dev;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  348  	struct spi_device	*spi;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  349  	u32			tmp;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  350  	unsigned		n_ioc;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  351  	struct spi_ioc_transfer=
	*ioc;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  352  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  353  	/* Check type and comma=
nd number */
814a8d50eb1d88 Andrea Paterniani  2007-05-08  354  	if (_IOC_TYPE(cmd) !=3D=
 SPI_IOC_MAGIC)
814a8d50eb1d88 Andrea Paterniani  2007-05-08  355  		return -ENOTTY;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  356  =

25d5cb4b0375e5 David Brownell     2008-05-23  357  	/* guard against device=
 removal before, or while,
25d5cb4b0375e5 David Brownell     2008-05-23  358  	 * we issue this ioctl.
25d5cb4b0375e5 David Brownell     2008-05-23  359  	 */
814a8d50eb1d88 Andrea Paterniani  2007-05-08  360  	spidev =3D filp->privat=
e_data;
25d5cb4b0375e5 David Brownell     2008-05-23  361  	spin_lock_irq(&spidev->=
spi_lock);
25d5cb4b0375e5 David Brownell     2008-05-23  362  	spi =3D spi_dev_get(spi=
dev->spi);
25d5cb4b0375e5 David Brownell     2008-05-23  363  	spin_unlock_irq(&spidev=
->spi_lock);
25d5cb4b0375e5 David Brownell     2008-05-23  364  =

25d5cb4b0375e5 David Brownell     2008-05-23  365  	if (spi =3D=3D NULL)
25d5cb4b0375e5 David Brownell     2008-05-23  366  		return -ESHUTDOWN;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  367  =

4ef754b7d7971a Alan Cox           2008-07-23  368  	/* use the buffer lock =
here for triple duty:
4ef754b7d7971a Alan Cox           2008-07-23  369  	 *  - prevent I/O (from=
 us) so calling spi_setup() is safe;
4ef754b7d7971a Alan Cox           2008-07-23  370  	 *  - prevent concurren=
t SPI_IOC_WR_* from morphing
4ef754b7d7971a Alan Cox           2008-07-23  371  	 *    data fields while=
 SPI_IOC_RD_* reads them;
4ef754b7d7971a Alan Cox           2008-07-23  372  	 *  - SPI_IOC_MESSAGE n=
eeds the buffer locked "normally".
4ef754b7d7971a Alan Cox           2008-07-23  373  	 */
4ef754b7d7971a Alan Cox           2008-07-23  374  	mutex_lock(&spidev->buf=
_lock);
4ef754b7d7971a Alan Cox           2008-07-23  375  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  376  	switch (cmd) {
814a8d50eb1d88 Andrea Paterniani  2007-05-08  377  	/* read requests */
814a8d50eb1d88 Andrea Paterniani  2007-05-08  378  	case SPI_IOC_RD_MODE:
251d59515fe468 Al Viro            2017-04-20  379  		retval =3D put_user(sp=
i->mode & SPI_MODE_MASK,
814a8d50eb1d88 Andrea Paterniani  2007-05-08  380  					(__u8 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  381  		break;
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  382  	case SPI_IOC_RD_MODE32:
251d59515fe468 Al Viro            2017-04-20  383  		retval =3D put_user(sp=
i->mode & SPI_MODE_MASK,
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  384  					(__u32 __user *)arg=
);
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  385  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  386  	case SPI_IOC_RD_LSB_FIR=
ST:
251d59515fe468 Al Viro            2017-04-20  387  		retval =3D put_user((s=
pi->mode & SPI_LSB_FIRST) ?  1 : 0,
814a8d50eb1d88 Andrea Paterniani  2007-05-08  388  					(__u8 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  389  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  390  	case SPI_IOC_RD_BITS_PE=
R_WORD:
251d59515fe468 Al Viro            2017-04-20  391  		retval =3D put_user(sp=
i->bits_per_word, (__u8 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  392  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  393  	case SPI_IOC_RD_MAX_SPE=
ED_HZ:
251d59515fe468 Al Viro            2017-04-20  394  		retval =3D put_user(sp=
idev->speed_hz, (__u32 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  395  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  396  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  397  	/* write requests */
814a8d50eb1d88 Andrea Paterniani  2007-05-08  398  	case SPI_IOC_WR_MODE:
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  399  	case SPI_IOC_WR_MODE32:
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  400  		if (cmd =3D=3D SPI_IOC=
_WR_MODE)
251d59515fe468 Al Viro            2017-04-20  401  			retval =3D get_user(t=
mp, (u8 __user *)arg);
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  402  		else
251d59515fe468 Al Viro            2017-04-20  403  			retval =3D get_user(t=
mp, (u32 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  404  		if (retval =3D=3D 0) {
138c9c32f09089 Lukas Wunner       2020-02-18  405  			struct spi_controller=
 *ctlr =3D spi->controller;
e6456186cae76f Geert Uytterhoeven 2014-02-25  406  			u32	save =3D spi->mod=
e;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  407  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  408  			if (tmp & ~SPI_MODE_M=
ASK) {
814a8d50eb1d88 Andrea Paterniani  2007-05-08  409  				retval =3D -EINVAL;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  410  				break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  411  			}
814a8d50eb1d88 Andrea Paterniani  2007-05-08  412  =

138c9c32f09089 Lukas Wunner       2020-02-18  413  			if (ctlr->use_gpio_de=
scriptors && ctlr->cs_gpiods &&
138c9c32f09089 Lukas Wunner       2020-02-18  414  			    ctlr->cs_gpiods[s=
pi->chip_select])
138c9c32f09089 Lukas Wunner       2020-02-18  415  				tmp |=3D SPI_CS_HIGH;
138c9c32f09089 Lukas Wunner       2020-02-18  416  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  417  			tmp |=3D spi->mode & =
~SPI_MODE_MASK;
dd06a0c6b6f64f Andy Shevchenko    2021-11-22  418  			spi->mode =3D tmp & S=
PI_MODE_USER_MASK;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  419  			retval =3D spi_setup(=
spi);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  420  			if (retval < 0)
814a8d50eb1d88 Andrea Paterniani  2007-05-08  421  				spi->mode =3D save;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  422  			else
dc64d39b54c1e9 Geert Uytterhoeven 2014-02-25  423  				dev_dbg(&spi->dev, "=
spi mode %x\n", tmp);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  424  		}
814a8d50eb1d88 Andrea Paterniani  2007-05-08  425  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  426  	case SPI_IOC_WR_LSB_FIR=
ST:
251d59515fe468 Al Viro            2017-04-20  427  		retval =3D get_user(tm=
p, (__u8 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  428  		if (retval =3D=3D 0) {
e6456186cae76f Geert Uytterhoeven 2014-02-25  429  			u32	save =3D spi->mod=
e;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  430  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  431  			if (tmp)
814a8d50eb1d88 Andrea Paterniani  2007-05-08  432  				spi->mode |=3D SPI_L=
SB_FIRST;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  433  			else
814a8d50eb1d88 Andrea Paterniani  2007-05-08  434  				spi->mode &=3D ~SPI_=
LSB_FIRST;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  435  			retval =3D spi_setup(=
spi);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  436  			if (retval < 0)
814a8d50eb1d88 Andrea Paterniani  2007-05-08  437  				spi->mode =3D save;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  438  			else
814a8d50eb1d88 Andrea Paterniani  2007-05-08  439  				dev_dbg(&spi->dev, "=
%csb first\n",
814a8d50eb1d88 Andrea Paterniani  2007-05-08  440  						tmp ? 'l' : 'm');
814a8d50eb1d88 Andrea Paterniani  2007-05-08  441  		}
814a8d50eb1d88 Andrea Paterniani  2007-05-08  442  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  443  	case SPI_IOC_WR_BITS_PE=
R_WORD:
251d59515fe468 Al Viro            2017-04-20  444  		retval =3D get_user(tm=
p, (__u8 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  445  		if (retval =3D=3D 0) {
814a8d50eb1d88 Andrea Paterniani  2007-05-08  446  			u8	save =3D spi->bits=
_per_word;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  447  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  448  			spi->bits_per_word =
=3D tmp;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  449  			retval =3D spi_setup(=
spi);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  450  			if (retval < 0)
814a8d50eb1d88 Andrea Paterniani  2007-05-08  451  				spi->bits_per_word =
=3D save;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  452  			else
814a8d50eb1d88 Andrea Paterniani  2007-05-08  453  				dev_dbg(&spi->dev, "=
%d bits per word\n", tmp);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  454  		}
814a8d50eb1d88 Andrea Paterniani  2007-05-08  455  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  456  	case SPI_IOC_WR_MAX_SPE=
ED_HZ:
251d59515fe468 Al Viro            2017-04-20  457  		retval =3D get_user(tm=
p, (__u32 __user *)arg);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  458  		if (retval =3D=3D 0) {
814a8d50eb1d88 Andrea Paterniani  2007-05-08  459  			u32	save =3D spi->max=
_speed_hz;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  460  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  461  			spi->max_speed_hz =3D=
 tmp;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  462  			retval =3D spi_setup(=
spi);
4276fc82fc5d1a Oleksandr Suvorov  2020-02-29  463  			if (retval =3D=3D 0) {
9169051617df7f Mark Brown         2014-11-08  464  				spidev->speed_hz =3D=
 tmp;
4276fc82fc5d1a Oleksandr Suvorov  2020-02-29  465  				dev_dbg(&spi->dev, "=
%d Hz (max)\n",
4276fc82fc5d1a Oleksandr Suvorov  2020-02-29  466  					spidev->speed_hz);
4276fc82fc5d1a Oleksandr Suvorov  2020-02-29  467  			}
9169051617df7f Mark Brown         2014-11-08  468  			spi->max_speed_hz =3D=
 save;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  469  		}
814a8d50eb1d88 Andrea Paterniani  2007-05-08  470  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  471  =

814a8d50eb1d88 Andrea Paterniani  2007-05-08  472  	default:
814a8d50eb1d88 Andrea Paterniani  2007-05-08  473  		/* segmented and/or fu=
ll-duplex I/O request */
7782a1a94825db Ian Abbott         2015-01-30  474  		/* Check message and c=
opy into scratch area */
7782a1a94825db Ian Abbott         2015-01-30  475  		ioc =3D spidev_get_ioc=
_message(cmd,
7782a1a94825db Ian Abbott         2015-01-30  476  				(struct spi_ioc_tran=
sfer __user *)arg, &n_ioc);
7782a1a94825db Ian Abbott         2015-01-30  477  		if (IS_ERR(ioc)) {
7782a1a94825db Ian Abbott         2015-01-30  478  			retval =3D PTR_ERR(io=
c);
25d5cb4b0375e5 David Brownell     2008-05-23  479  			break;
25d5cb4b0375e5 David Brownell     2008-05-23  480  		}
7782a1a94825db Ian Abbott         2015-01-30  481  		if (!ioc)
7782a1a94825db Ian Abbott         2015-01-30  482  			break;	/* n_ioc is al=
so 0 */
814a8d50eb1d88 Andrea Paterniani  2007-05-08  483  =

7782a1a94825db Ian Abbott         2015-01-30  484  		/* translate to spi_me=
ssage, execute */
7782a1a94825db Ian Abbott         2015-01-30 @485  		retval =3D spidev_mess=
age(spidev, ioc, n_ioc);
7782a1a94825db Ian Abbott         2015-01-30  486  		kfree(ioc);
814a8d50eb1d88 Andrea Paterniani  2007-05-08  487  		break;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  488  	}
814a8d50eb1d88 Andrea Paterniani  2007-05-08  489  =

7782a1a94825db Ian Abbott         2015-01-30  490  	mutex_unlock(&spidev->b=
uf_lock);
7782a1a94825db Ian Abbott         2015-01-30  491  	spi_dev_put(spi);
7782a1a94825db Ian Abbott         2015-01-30  492  	return retval;
814a8d50eb1d88 Andrea Paterniani  2007-05-08  493  }
7782a1a94825db Ian Abbott         2015-01-30  494  =


:::::: The code at line 485 was first introduced by commit
:::::: 7782a1a94825db5163f376beb8db6148fdf1aef0 spi: spidev: Convert buf po=
inters for 32-bit compat SPI_IOC_MESSAGE(n)

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4245744913616055685==--

