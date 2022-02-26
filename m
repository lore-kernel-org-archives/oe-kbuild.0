Content-Type: multipart/mixed; boundary="===============8005883889102525230=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tty:tty-testing 30/42] drivers/tty/serial/meson_uart.c:832 meson_uart_probe() warn: 'pclk' not released on lines: 779, 785, 790, 794, 799.
Date: Sun, 27 Feb 2022 04:16:10 +0800
Message-ID: <202202270400.rQqj5xav-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8005883889102525230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-serial(a)vger.kernel.org
TO: Yu Tu <yu.tu@amlogic.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
head:   71404f653cf7858fdbb81dd5419a8a4ac4ffa20c
commit: 44023b8e1f14bc72bb773dd84dc3563fc912d210 [30/42] tty: serial: meson=
: Describes the calculation of the UART baud rate clock using a clock frame
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arc-randconfig-m031-20220226 (https://download.01.org/0day-ci/archi=
ve/20220227/202202270400.rQqj5xav-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/tty/serial/meson_uart.c:832 meson_uart_probe() warn: 'pclk' not rel=
eased on lines: 779,785,790,794,799.

vim +/pclk +832 drivers/tty/serial/meson_uart.c

9f60e0e7aea66e Helmut Klein    2017-06-14  736  =

ff7693d079e58f Carlo Caione    2014-08-17  737  static int meson_uart_probe=
(struct platform_device *pdev)
ff7693d079e58f Carlo Caione    2014-08-17  738  {
44023b8e1f14bc Yu Tu           2022-02-25  739  	struct meson_uart_data *pr=
ivate_data;
5b680619834714 Lad Prabhakar   2021-12-24  740  	struct resource *res_mem;
ff7693d079e58f Carlo Caione    2014-08-17  741  	struct uart_port *port;
44023b8e1f14bc Yu Tu           2022-02-25  742  	struct clk *pclk;
27d44e05d7b85d Neil Armstrong  2021-05-18  743  	u32 fifosize =3D 64; /* De=
fault is 64, 128 for EE UART_0 */
ff7693d079e58f Carlo Caione    2014-08-17  744  	int ret =3D 0;
5b680619834714 Lad Prabhakar   2021-12-24  745  	int irq;
ff7693d079e58f Carlo Caione    2014-08-17  746  =

ff7693d079e58f Carlo Caione    2014-08-17  747  	if (pdev->dev.of_node)
ff7693d079e58f Carlo Caione    2014-08-17  748  		pdev->id =3D of_alias_get=
_id(pdev->dev.of_node, "serial");
ff7693d079e58f Carlo Caione    2014-08-17  749  =

a26988e8fef4b2 Loys Ollivier   2019-01-14  750  	if (pdev->id < 0) {
021212f5335229 Colin Ian King  2021-04-26  751  		int id;
021212f5335229 Colin Ian King  2021-04-26  752  =

a26988e8fef4b2 Loys Ollivier   2019-01-14  753  		for (id =3D AML_UART_PORT=
_OFFSET; id < AML_UART_PORT_NUM; id++) {
a26988e8fef4b2 Loys Ollivier   2019-01-14  754  			if (!meson_ports[id]) {
a26988e8fef4b2 Loys Ollivier   2019-01-14  755  				pdev->id =3D id;
a26988e8fef4b2 Loys Ollivier   2019-01-14  756  				break;
a26988e8fef4b2 Loys Ollivier   2019-01-14  757  			}
a26988e8fef4b2 Loys Ollivier   2019-01-14  758  		}
a26988e8fef4b2 Loys Ollivier   2019-01-14  759  	}
a26988e8fef4b2 Loys Ollivier   2019-01-14  760  =

ff7693d079e58f Carlo Caione    2014-08-17  761  	if (pdev->id < 0 || pdev->=
id >=3D AML_UART_PORT_NUM)
ff7693d079e58f Carlo Caione    2014-08-17  762  		return -EINVAL;
ff7693d079e58f Carlo Caione    2014-08-17  763  =

ff7693d079e58f Carlo Caione    2014-08-17  764  	res_mem =3D platform_get_r=
esource(pdev, IORESOURCE_MEM, 0);
ff7693d079e58f Carlo Caione    2014-08-17  765  	if (!res_mem)
ff7693d079e58f Carlo Caione    2014-08-17  766  		return -ENODEV;
ff7693d079e58f Carlo Caione    2014-08-17  767  =

44023b8e1f14bc Yu Tu           2022-02-25  768  	pclk =3D devm_clk_get(&pde=
v->dev, "pclk");
44023b8e1f14bc Yu Tu           2022-02-25  769  	if (IS_ERR(pclk))
44023b8e1f14bc Yu Tu           2022-02-25  770  		return dev_err_probe(&pde=
v->dev, PTR_ERR(pclk),
44023b8e1f14bc Yu Tu           2022-02-25  771  				     "Failed to get the=
 'pclk' clock\n");
44023b8e1f14bc Yu Tu           2022-02-25  772  =

44023b8e1f14bc Yu Tu           2022-02-25  773  	ret =3D clk_prepare_enable=
(pclk);
44023b8e1f14bc Yu Tu           2022-02-25  774  	if (ret)
44023b8e1f14bc Yu Tu           2022-02-25  775  		return ret;
44023b8e1f14bc Yu Tu           2022-02-25  776  =

5b680619834714 Lad Prabhakar   2021-12-24  777  	irq =3D platform_get_irq(p=
dev, 0);
5b680619834714 Lad Prabhakar   2021-12-24  778  	if (irq < 0)
5b680619834714 Lad Prabhakar   2021-12-24  779  		return irq;
ff7693d079e58f Carlo Caione    2014-08-17  780  =

27d44e05d7b85d Neil Armstrong  2021-05-18  781  	of_property_read_u32(pdev-=
>dev.of_node, "fifo-size", &fifosize);
27d44e05d7b85d Neil Armstrong  2021-05-18  782  =

ff7693d079e58f Carlo Caione    2014-08-17  783  	if (meson_ports[pdev->id])=
 {
ff7693d079e58f Carlo Caione    2014-08-17  784  		dev_err(&pdev->dev, "port=
 %d already allocated\n", pdev->id);
ff7693d079e58f Carlo Caione    2014-08-17  785  		return -EBUSY;
ff7693d079e58f Carlo Caione    2014-08-17  786  	}
ff7693d079e58f Carlo Caione    2014-08-17  787  =

ff7693d079e58f Carlo Caione    2014-08-17  788  	port =3D devm_kzalloc(&pde=
v->dev, sizeof(struct uart_port), GFP_KERNEL);
ff7693d079e58f Carlo Caione    2014-08-17  789  	if (!port)
ff7693d079e58f Carlo Caione    2014-08-17  790  		return -ENOMEM;
ff7693d079e58f Carlo Caione    2014-08-17  791  =

6436dd8f9b25ea Yu Tu           2022-02-25  792  	port->membase =3D devm_ior=
emap_resource(&pdev->dev, res_mem);
841f913e770f3c Yu Tu           2022-02-25  793  	if (IS_ERR(port->membase))
841f913e770f3c Yu Tu           2022-02-25  794  		return PTR_ERR(port->memb=
ase);
841f913e770f3c Yu Tu           2022-02-25  795  =

44023b8e1f14bc Yu Tu           2022-02-25  796  	private_data =3D devm_kzal=
loc(&pdev->dev, sizeof(*private_data),
44023b8e1f14bc Yu Tu           2022-02-25  797  				    GFP_KERNEL);
44023b8e1f14bc Yu Tu           2022-02-25  798  	if (!private_data)
44023b8e1f14bc Yu Tu           2022-02-25  799  		return -ENOMEM;
44023b8e1f14bc Yu Tu           2022-02-25  800  =

44023b8e1f14bc Yu Tu           2022-02-25  801  	if (device_get_match_data(=
&pdev->dev))
44023b8e1f14bc Yu Tu           2022-02-25  802  		private_data->use_xtal_cl=
k =3D true;
ff7693d079e58f Carlo Caione    2014-08-17  803  =

ff7693d079e58f Carlo Caione    2014-08-17  804  	port->iotype =3D UPIO_MEM;
ff7693d079e58f Carlo Caione    2014-08-17  805  	port->mapbase =3D res_mem-=
>start;
ff3b9cad7d6309 Heiner Kallweit 2017-04-19  806  	port->mapsize =3D resource=
_size(res_mem);
5b680619834714 Lad Prabhakar   2021-12-24  807  	port->irq =3D irq;
1b1ecaa69c4f90 Heiner Kallweit 2017-04-19  808  	port->flags =3D UPF_BOOT_A=
UTOCONF | UPF_LOW_LATENCY;
dca3ac8d3bc943 Dmitry Safonov  2019-12-13  809  	port->has_sysrq =3D IS_ENA=
BLED(CONFIG_SERIAL_MESON_CONSOLE);
ff7693d079e58f Carlo Caione    2014-08-17  810  	port->dev =3D &pdev->dev;
ff7693d079e58f Carlo Caione    2014-08-17  811  	port->line =3D pdev->id;
ff7693d079e58f Carlo Caione    2014-08-17  812  	port->type =3D PORT_MESON;
ff7693d079e58f Carlo Caione    2014-08-17  813  	port->x_char =3D 0;
ff7693d079e58f Carlo Caione    2014-08-17  814  	port->ops =3D &meson_uart_=
ops;
27d44e05d7b85d Neil Armstrong  2021-05-18  815  	port->fifosize =3D fifosiz=
e;
44023b8e1f14bc Yu Tu           2022-02-25  816  	port->private_data =3D pri=
vate_data;
44023b8e1f14bc Yu Tu           2022-02-25  817  =

44023b8e1f14bc Yu Tu           2022-02-25  818  	ret =3D meson_uart_probe_c=
locks(port);
44023b8e1f14bc Yu Tu           2022-02-25  819  	if (ret)
44023b8e1f14bc Yu Tu           2022-02-25  820  		return ret;
ff7693d079e58f Carlo Caione    2014-08-17  821  =

ff7693d079e58f Carlo Caione    2014-08-17  822  	meson_ports[pdev->id] =3D =
port;
ff7693d079e58f Carlo Caione    2014-08-17  823  	platform_set_drvdata(pdev,=
 port);
ff7693d079e58f Carlo Caione    2014-08-17  824  =

00661dd855b5b1 Ben Dooks       2015-11-18  825  	/* reset port before regis=
tering (and possibly registering console) */
00661dd855b5b1 Ben Dooks       2015-11-18  826  	meson_uart_reset(port);
00661dd855b5b1 Ben Dooks       2015-11-18  827  =

ff7693d079e58f Carlo Caione    2014-08-17  828  	ret =3D uart_add_one_port(=
&meson_uart_driver, port);
ff7693d079e58f Carlo Caione    2014-08-17  829  	if (ret)
ff7693d079e58f Carlo Caione    2014-08-17  830  		meson_ports[pdev->id] =3D=
 NULL;
ff7693d079e58f Carlo Caione    2014-08-17  831  =

ff7693d079e58f Carlo Caione    2014-08-17 @832  	return ret;
ff7693d079e58f Carlo Caione    2014-08-17  833  }
ff7693d079e58f Carlo Caione    2014-08-17  834  =


:::::: The code at line 832 was first introduced by commit
:::::: ff7693d079e58fb62d735b7b8085b53fcfb74528 ARM: meson: serial: add Mes=
onX SoC on-chip uart driver

:::::: TO: Carlo Caione <carlo@caione.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8005883889102525230==--

