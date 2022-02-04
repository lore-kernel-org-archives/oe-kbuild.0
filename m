Content-Type: multipart/mixed; boundary="===============0371822931875468545=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] serial: 8250_bcm2835aux: Add ACPI support
Date: Fri, 04 Feb 2022 15:37:08 +0800
Message-ID: <202202041538.SeioshQ2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0371822931875468545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220203213408.441407-1-athierry@redhat.com>
References: <20220203213408.441407-1-athierry@redhat.com>
TO: Adrien Thierry <athierry@redhat.com>
TO: linux-serial(a)vger.kernel.org
TO: linux-rpi-kernel(a)lists.infradead.org
TO: linux-arm-kernel(a)lists.infradead.org
TO: linux-kernel(a)vger.kernel.org
CC: Adrien Thierry <athierry@redhat.com>
CC: Jeremy Linton <jeremy.linton@arm.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jirislaby@kernel.org>
CC: Nicolas Saenz Julienne <nsaenz@kernel.org>
CC: Florian Fainelli <f.fainelli@gmail.com>

Hi Adrien,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1f2cfdd349b7647f438c1e552dc1b983da86d830]

url:    https://github.com/0day-ci/linux/commits/Adrien-Thierry/serial-8250=
_bcm2835aux-Add-ACPI-support/20220204-053621
base:   1f2cfdd349b7647f438c1e552dc1b983da86d830
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: powerpc-randconfig-m031-20220130 (https://download.01.org/0day-ci/a=
rchive/20220204/202202041538.SeioshQ2-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/tty/serial/8250/8250_bcm2835aux.c:187 bcm2835aux_serial_probe() err=
or: uninitialized symbol 'uartclk'.

vim +/uartclk +187 drivers/tty/serial/8250/8250_bcm2835aux.c

f93bf758911476 Lukas Wunner        2020-02-28   85  =

bdc5f300958062 Martin Sperl        2016-01-17   86  static int bcm2835aux_s=
erial_probe(struct platform_device *pdev)
bdc5f300958062 Martin Sperl        2016-01-17   87  {
8c3cde5dd639af Lukas Wunner        2020-01-16   88  	struct uart_8250_port =
up =3D { };
bdc5f300958062 Martin Sperl        2016-01-17   89  	struct bcm2835aux_data=
 *data;
58f6820e77d214 Adrien Thierry      2022-02-03   90  	struct bcm2835_aux_ser=
ial_acpi_driver_data *acpi_data;
bdc5f300958062 Martin Sperl        2016-01-17   91  	struct resource *res;
bdc5f300958062 Martin Sperl        2016-01-17   92  	int ret;
58f6820e77d214 Adrien Thierry      2022-02-03   93  	resource_size_t offset=
 =3D 0;
58f6820e77d214 Adrien Thierry      2022-02-03   94  	unsigned int uartclk;
bdc5f300958062 Martin Sperl        2016-01-17   95  =

bdc5f300958062 Martin Sperl        2016-01-17   96  	/* allocate the custom=
 structure */
bdc5f300958062 Martin Sperl        2016-01-17   97  	data =3D devm_kzalloc(=
&pdev->dev, sizeof(*data), GFP_KERNEL);
bdc5f300958062 Martin Sperl        2016-01-17   98  	if (!data)
bdc5f300958062 Martin Sperl        2016-01-17   99  		return -ENOMEM;
bdc5f300958062 Martin Sperl        2016-01-17  100  =

bdc5f300958062 Martin Sperl        2016-01-17  101  	/* initialize data */
8c3cde5dd639af Lukas Wunner        2020-01-16  102  	up.capabilities =3D UA=
RT_CAP_FIFO | UART_CAP_MINI;
8c3cde5dd639af Lukas Wunner        2020-01-16  103  	up.port.dev =3D &pdev-=
>dev;
8c3cde5dd639af Lukas Wunner        2020-01-16  104  	up.port.regshift =3D 2;
8c3cde5dd639af Lukas Wunner        2020-01-16  105  	up.port.type =3D PORT_=
16550;
8c3cde5dd639af Lukas Wunner        2020-01-16  106  	up.port.iotype =3D UPI=
O_MEM;
8c3cde5dd639af Lukas Wunner        2020-01-16  107  	up.port.fifosize =3D 8;
8c3cde5dd639af Lukas Wunner        2020-01-16  108  	up.port.flags =3D UPF_=
SHARE_IRQ | UPF_FIXED_PORT | UPF_FIXED_TYPE |
644d776c7729e7 Lukas Wunner        2020-01-16  109  			UPF_SKIP_TEST | UPF_=
IOREMAP;
f93bf758911476 Lukas Wunner        2020-02-28  110  	up.port.rs485_config =
=3D serial8250_em485_config;
f93bf758911476 Lukas Wunner        2020-02-28  111  	up.rs485_start_tx =3D =
bcm2835aux_rs485_start_tx;
f93bf758911476 Lukas Wunner        2020-02-28  112  	up.rs485_stop_tx =3D b=
cm2835aux_rs485_stop_tx;
f93bf758911476 Lukas Wunner        2020-02-28  113  =

f93bf758911476 Lukas Wunner        2020-02-28  114  	/* initialize cached c=
opy with power-on reset value */
f93bf758911476 Lukas Wunner        2020-02-28  115  	data->cntl =3D BCM2835=
_AUX_UART_CNTL_RXEN | BCM2835_AUX_UART_CNTL_TXEN;
f93bf758911476 Lukas Wunner        2020-02-28  116  =

f93bf758911476 Lukas Wunner        2020-02-28  117  	platform_set_drvdata(p=
dev, data);
bdc5f300958062 Martin Sperl        2016-01-17  118  =

bdc5f300958062 Martin Sperl        2016-01-17  119  	/* get the clock - thi=
s also enables the HW */
bdc5f300958062 Martin Sperl        2016-01-17  120  	data->clk =3D devm_clk=
_get(&pdev->dev, NULL);
58f6820e77d214 Adrien Thierry      2022-02-03  121  	if (IS_ERR(data->clk))=
 {
58f6820e77d214 Adrien Thierry      2022-02-03  122  		ret =3D device_proper=
ty_read_u32(&pdev->dev, "clock-frequency", &uartclk);
58f6820e77d214 Adrien Thierry      2022-02-03  123  		if (ret)
58f6820e77d214 Adrien Thierry      2022-02-03  124  			return dev_err_probe=
(&pdev->dev, ret, "could not get clk\n");
58f6820e77d214 Adrien Thierry      2022-02-03  125  	}
bdc5f300958062 Martin Sperl        2016-01-17  126  =

bdc5f300958062 Martin Sperl        2016-01-17  127  	/* get the interrupt */
e1a7d248279e37 Martin Sperl        2016-02-09  128  	ret =3D platform_get_i=
rq(pdev, 0);
1df217868178bd Stephen Boyd        2019-07-30  129  	if (ret < 0)
e1a7d248279e37 Martin Sperl        2016-02-09  130  		return ret;
8c3cde5dd639af Lukas Wunner        2020-01-16  131  	up.port.irq =3D ret;
bdc5f300958062 Martin Sperl        2016-01-17  132  =

bdc5f300958062 Martin Sperl        2016-01-17  133  	/* map the main regist=
ers */
bdc5f300958062 Martin Sperl        2016-01-17  134  	res =3D platform_get_r=
esource(pdev, IORESOURCE_MEM, 0);
bdc5f300958062 Martin Sperl        2016-01-17  135  	if (!res) {
bdc5f300958062 Martin Sperl        2016-01-17  136  		dev_err(&pdev->dev, "=
memory resource not found");
bdc5f300958062 Martin Sperl        2016-01-17  137  		return -EINVAL;
bdc5f300958062 Martin Sperl        2016-01-17  138  	}
bdc5f300958062 Martin Sperl        2016-01-17  139  =

58f6820e77d214 Adrien Thierry      2022-02-03  140  	if (has_acpi_companion=
(&pdev->dev)) {
58f6820e77d214 Adrien Thierry      2022-02-03  141  		const struct acpi_dev=
ice_id *match;
58f6820e77d214 Adrien Thierry      2022-02-03  142  =

58f6820e77d214 Adrien Thierry      2022-02-03  143  		match =3D acpi_match_=
device(pdev->dev.driver->acpi_match_table, &pdev->dev);
58f6820e77d214 Adrien Thierry      2022-02-03  144  		if (!match)
58f6820e77d214 Adrien Thierry      2022-02-03  145  			return -ENODEV;
58f6820e77d214 Adrien Thierry      2022-02-03  146  =

58f6820e77d214 Adrien Thierry      2022-02-03  147  		acpi_data =3D (struct=
 bcm2835_aux_serial_acpi_driver_data *)match->driver_data;
58f6820e77d214 Adrien Thierry      2022-02-03  148  =

58f6820e77d214 Adrien Thierry      2022-02-03  149  		/* Some UEFI implemen=
tations (e.g. tianocore/edk2 for the Raspberry Pi)
58f6820e77d214 Adrien Thierry      2022-02-03  150  		 * describe the miniu=
art with a base address that encompasses the auxiliary
58f6820e77d214 Adrien Thierry      2022-02-03  151  		 * registers shared b=
etween the miniuart and spi.
58f6820e77d214 Adrien Thierry      2022-02-03  152  		 *
58f6820e77d214 Adrien Thierry      2022-02-03  153  		 * This is due to his=
torical reasons, see discussion here :
58f6820e77d214 Adrien Thierry      2022-02-03  154  		 * https://edk2.group=
s.io/g/devel/topic/87501357#84349
58f6820e77d214 Adrien Thierry      2022-02-03  155  		 *
58f6820e77d214 Adrien Thierry      2022-02-03  156  		 * We need to add the=
 offset between the miniuart and auxiliary
58f6820e77d214 Adrien Thierry      2022-02-03  157  		 * registers to get t=
he real miniuart base address.
58f6820e77d214 Adrien Thierry      2022-02-03  158  		 */
58f6820e77d214 Adrien Thierry      2022-02-03  159  		offset =3D acpi_data-=
>offset;
58f6820e77d214 Adrien Thierry      2022-02-03  160  	}
58f6820e77d214 Adrien Thierry      2022-02-03  161  =

58f6820e77d214 Adrien Thierry      2022-02-03  162  	up.port.mapbase =3D re=
s->start + offset;
58f6820e77d214 Adrien Thierry      2022-02-03  163  	up.port.mapsize =3D re=
source_size(res) - offset;
58f6820e77d214 Adrien Thierry      2022-02-03  164  =

58f6820e77d214 Adrien Thierry      2022-02-03  165  	if (dev_of_node(&pdev-=
>dev)) {
bdc5f300958062 Martin Sperl        2016-01-17  166  		/* Check for a fixed =
line number */
bdc5f300958062 Martin Sperl        2016-01-17  167  		ret =3D of_alias_get_=
id(pdev->dev.of_node, "serial");
bdc5f300958062 Martin Sperl        2016-01-17  168  		if (ret >=3D 0)
8c3cde5dd639af Lukas Wunner        2020-01-16  169  			up.port.line =3D ret;
bdc5f300958062 Martin Sperl        2016-01-17  170  =

bdc5f300958062 Martin Sperl        2016-01-17  171  		/* enable the clock a=
s a last step */
bdc5f300958062 Martin Sperl        2016-01-17  172  		ret =3D clk_prepare_e=
nable(data->clk);
bdc5f300958062 Martin Sperl        2016-01-17  173  		if (ret) {
bdc5f300958062 Martin Sperl        2016-01-17  174  			dev_err(&pdev->dev, =
"unable to enable uart clock - %d\n",
bdc5f300958062 Martin Sperl        2016-01-17  175  				ret);
bdc5f300958062 Martin Sperl        2016-01-17  176  			return ret;
bdc5f300958062 Martin Sperl        2016-01-17  177  		}
bdc5f300958062 Martin Sperl        2016-01-17  178  =

58f6820e77d214 Adrien Thierry      2022-02-03  179  		uartclk =3D clk_get_r=
ate(data->clk);
58f6820e77d214 Adrien Thierry      2022-02-03  180  	}
58f6820e77d214 Adrien Thierry      2022-02-03  181  =

bdc5f300958062 Martin Sperl        2016-01-17  182  	/* the HW-clock divide=
r for bcm2835aux is 8,
bdc5f300958062 Martin Sperl        2016-01-17  183  	 * but 8250 expects a =
divider of 16,
bdc5f300958062 Martin Sperl        2016-01-17  184  	 * so we have to multi=
ply the actual clock by 2
bdc5f300958062 Martin Sperl        2016-01-17  185  	 * to get identical ba=
udrates.
bdc5f300958062 Martin Sperl        2016-01-17  186  	 */
58f6820e77d214 Adrien Thierry      2022-02-03 @187  	up.port.uartclk =3D ua=
rtclk * 2;
bdc5f300958062 Martin Sperl        2016-01-17  188  =

bdc5f300958062 Martin Sperl        2016-01-17  189  	/* register the port */
8c3cde5dd639af Lukas Wunner        2020-01-16  190  	ret =3D serial8250_reg=
ister_8250_port(&up);
bdc5f300958062 Martin Sperl        2016-01-17  191  	if (ret < 0) {
ea43a60b15486b Krzysztof Kozlowski 2020-09-01  192  		dev_err_probe(&pdev->=
dev, ret, "unable to register 8250 port\n");
bdc5f300958062 Martin Sperl        2016-01-17  193  		goto dis_clk;
bdc5f300958062 Martin Sperl        2016-01-17  194  	}
bdc5f300958062 Martin Sperl        2016-01-17  195  	data->line =3D ret;
bdc5f300958062 Martin Sperl        2016-01-17  196  =

bdc5f300958062 Martin Sperl        2016-01-17  197  	return 0;
bdc5f300958062 Martin Sperl        2016-01-17  198  =

bdc5f300958062 Martin Sperl        2016-01-17  199  dis_clk:
58f6820e77d214 Adrien Thierry      2022-02-03  200  	if (dev_of_node(&pdev-=
>dev))
bdc5f300958062 Martin Sperl        2016-01-17  201  		clk_disable_unprepare=
(data->clk);
58f6820e77d214 Adrien Thierry      2022-02-03  202  =

bdc5f300958062 Martin Sperl        2016-01-17  203  	return ret;
bdc5f300958062 Martin Sperl        2016-01-17  204  }
bdc5f300958062 Martin Sperl        2016-01-17  205  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0371822931875468545==--

