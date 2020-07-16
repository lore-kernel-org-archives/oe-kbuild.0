Content-Type: multipart/mixed; boundary="===============3066826414558668875=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/pci/controller/pci-v3-semi.c:808:2-9: line 808 is redundant because platform_get_irq() already prints an error
Date: Thu, 16 Jul 2020 08:05:55 +0800
Message-ID: <202007160834.8yWyW6nn%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3066826414558668875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: YueHaibing <yuehaibing@huawei.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Stephen Boyd <swboyd@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e9919e11e219eaa5e8041b7b1a196839143e9125
commit: ca7ce5a2710ad2a57bf7d0c4c712590bb69a5e1c coccinelle: platform_get_i=
rq: Fix parse error
date:   10 months ago
:::::: branch date: 2 days ago
:::::: commit date: 10 months ago
config: arm-randconfig-c021-20200715 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/pci/controller/pci-v3-semi.c:808:2-9: line 808 is redundant beca=
use platform_get_irq() already prints an error

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dca7ce5a2710ad2a57bf7d0c4c712590bb69a5e1c
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout ca7ce5a2710ad2a57bf7d0c4c712590bb69a5e1c
vim +808 drivers/pci/controller/pci-v3-semi.c

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
0  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
1  static int v3_pci_probe(struct platform_device *pdev)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
2  {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
3  	struct device *dev =3D &pdev->dev;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
4  	struct device_node *np =3D dev->of_node;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
5  	resource_size_t io_base;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
6  	struct resource *regs;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
7  	struct resource_entry *win;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
8  	struct v3_pci *v3;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  73=
9  	struct pci_host_bridge *host;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
0  	struct clk *clk;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
1  	u16 val;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
2  	int irq;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
3  	int ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
4  	LIST_HEAD(res);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
5  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
6  	host =3D pci_alloc_host_bridge(sizeof(*v3));
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
7  	if (!host)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
8  		return -ENOMEM;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  74=
9  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
0  	host->dev.parent =3D dev;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
1  	host->ops =3D &v3_pci_ops;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
2  	host->busnr =3D 0;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
3  	host->msi =3D NULL;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
4  	host->map_irq =3D of_irq_parse_and_map_pci;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
5  	host->swizzle_irq =3D pci_common_swizzle;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
6  	v3 =3D pci_host_bridge_priv(host);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
7  	host->sysdata =3D v3;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
8  	v3->dev =3D dev;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  75=
9  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
0  	/* Get and enable host clock */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
1  	clk =3D devm_clk_get(dev, NULL);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
2  	if (IS_ERR(clk)) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
3  		dev_err(dev, "clock not found\n");
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
4  		return PTR_ERR(clk);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
5  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
6  	ret =3D clk_prepare_enable(clk);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
7  	if (ret) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
8  		dev_err(dev, "unable to enable clock\n");
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  76=
9  		return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
0  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
1  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
2  	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
3  	v3->base =3D devm_ioremap_resource(dev, regs);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
4  	if (IS_ERR(v3->base))
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
5  		return PTR_ERR(v3->base);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
6  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
7  	 * The hardware has a register with the physical base address
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
8  	 * of the V3 controller itself, verify that this is the same
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  77=
9  	 * as the physical memory we've remapped it from.
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
0  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
1  	if (readl(v3->base + V3_LB_IO_BASE) !=3D (regs->start >> 16))
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
2  		dev_err(dev, "V3_LB_IO_BASE =3D %08x but device is @%pR\n",
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
3  			readl(v3->base + V3_LB_IO_BASE), regs);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
4  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
5  	/* Configuration space is 16MB directly mapped */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
6  	regs =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
7  	if (resource_size(regs) !=3D SZ_16M) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
8  		dev_err(dev, "config mem is not 16MB!\n");
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  78=
9  		return -EINVAL;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
0  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
1  	v3->config_mem =3D regs->start;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
2  	v3->config_base =3D devm_ioremap_resource(dev, regs);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
3  	if (IS_ERR(v3->config_base))
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
4  		return PTR_ERR(v3->config_base);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
5  =

5bd51b35c7cbbc9 drivers/pci/host/pci-v3-semi.c Jan Kiszka    2018-05-15  79=
6  	ret =3D devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &res,
055f87a2a336409 drivers/pci/host/pci-v3-semi.c Jan Kiszka    2018-05-15  79=
7  						    &io_base);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
8  	if (ret)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  79=
9  		return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
0  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
1  	ret =3D devm_request_pci_bus_resources(dev, &res);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
2  	if (ret)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
3  		return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
4  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
5  	/* Get and request error IRQ resource */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
6  	irq =3D platform_get_irq(pdev, 0);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
7  	if (irq <=3D 0) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26 @80=
8  		dev_err(dev, "unable to obtain PCIv3 error IRQ\n");
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  80=
9  		return -ENODEV;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
0  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
1  	ret =3D devm_request_irq(dev, irq, v3_irq, 0,
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
2  			"PCIv3 error", v3);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
3  	if (ret < 0) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
4  		dev_err(dev,
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
5  			"unable to request PCIv3 error IRQ %d (%d)\n",
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
6  			irq, ret);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
7  		return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
8  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  81=
9  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
0  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
1  	 * Unlock V3 registers, but only if they were previously locked.
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
2  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
3  	if (readw(v3->base + V3_SYSTEM) & V3_SYSTEM_M_LOCK)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
4  		writew(V3_SYSTEM_UNLOCK, v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
5  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
6  	/* Disable all slave access while we set up the windows */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
7  	val =3D readw(v3->base + V3_PCI_CMD);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
8  	val &=3D ~(PCI_COMMAND_IO | PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  82=
9  	writew(val, v3->base + V3_PCI_CMD);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
0  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
1  	/* Put the PCI bus into reset */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
2  	val =3D readw(v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
3  	val &=3D ~V3_SYSTEM_M_RST_OUT;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
4  	writew(val, v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
5  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
6  	/* Retry until we're ready */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
7  	val =3D readw(v3->base + V3_PCI_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
8  	val |=3D V3_PCI_CFG_M_RETRY_EN;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  83=
9  	writew(val, v3->base + V3_PCI_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
0  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
1  	/* Set up the local bus protocol */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
2  	val =3D readw(v3->base + V3_LB_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
3  	val |=3D V3_LB_CFG_LB_BE_IMODE; /* Byte enable input */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
4  	val |=3D V3_LB_CFG_LB_BE_OMODE; /* Byte enable output */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
5  	val &=3D ~V3_LB_CFG_LB_ENDIAN; /* Little endian */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
6  	val &=3D ~V3_LB_CFG_LB_PPC_RDY; /* TODO: when using on PPC403Gx, set to=
 1 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
7  	writew(val, v3->base + V3_LB_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
8  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  84=
9  	/* Enable the PCI bus master */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
0  	val =3D readw(v3->base + V3_PCI_CMD);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
1  	val |=3D PCI_COMMAND_MASTER;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
2  	writew(val, v3->base + V3_PCI_CMD);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
3  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
4  	/* Get the I/O and memory ranges from DT */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
5  	resource_list_for_each_entry(win, &res) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
6  		ret =3D v3_pci_setup_resource(v3, io_base, host, win);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
7  		if (ret) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
8  			dev_err(dev, "error setting up resources\n");
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  85=
9  			return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
0  		}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
1  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
2  	ret =3D v3_pci_parse_map_dma_ranges(v3, np);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
3  	if (ret)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
4  		return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
5  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
6  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
7  	 * Disable PCI to host IO cycles, enable I/O buffers @3.3V,
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
8  	 * set AD_LOW0 to 1 if one of the LB_MAP registers choose
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  86=
9  	 * to use this (should be unused).
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
0  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
1  	writel(0x00000000, v3->base + V3_PCI_IO_BASE);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
2  	val =3D V3_PCI_CFG_M_IO_REG_DIS | V3_PCI_CFG_M_IO_DIS |
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
3  		V3_PCI_CFG_M_EN3V | V3_PCI_CFG_M_AD_LOW0;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
4  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
5  	 * DMA read and write from PCI bus commands types
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
6  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
7  	val |=3D  V3_PCI_CFG_TYPE_DEFAULT << V3_PCI_CFG_M_RTYPE_SHIFT;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
8  	val |=3D  V3_PCI_CFG_TYPE_DEFAULT << V3_PCI_CFG_M_WTYPE_SHIFT;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  87=
9  	writew(val, v3->base + V3_PCI_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
0  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
1  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
2  	 * Set the V3 FIFO such that writes have higher priority than
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
3  	 * reads, and local bus write causes local bus read fifo flush
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
4  	 * on aperture 1. Same for PCI.
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
5  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
6  	writew(V3_FIFO_PRIO_LB_RD1_FLUSH_AP1 |
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
7  	       V3_FIFO_PRIO_LB_RD0_FLUSH_AP1 |
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
8  	       V3_FIFO_PRIO_PCI_RD1_FLUSH_AP1 |
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  88=
9  	       V3_FIFO_PRIO_PCI_RD0_FLUSH_AP1,
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
0  	       v3->base + V3_FIFO_PRIORITY);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
1  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
2  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
3  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
4  	 * Clear any error interrupts, and enable parity and write error
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
5  	 * interrupts
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
6  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
7  	writeb(0, v3->base + V3_LB_ISTAT);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
8  	val =3D readw(v3->base + V3_LB_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  89=
9  	val |=3D V3_LB_CFG_LB_LB_INT;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
0  	writew(val, v3->base + V3_LB_CFG);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
1  	writeb(V3_LB_ISTAT_PCI_WR | V3_LB_ISTAT_PCI_PERR,
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
2  	       v3->base + V3_LB_IMASK);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
3  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
4  	/* Special Integrator initialization */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
5  	if (of_device_is_compatible(np, "arm,integrator-ap-pci")) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
6  		ret =3D v3_integrator_init(v3);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
7  		if (ret)
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
8  			return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  90=
9  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
0  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
1  	/* Post-init: enable PCI memory and invalidate (master already on) */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
2  	val =3D readw(v3->base + V3_PCI_CMD);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
3  	val |=3D PCI_COMMAND_MEMORY | PCI_COMMAND_INVALIDATE;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
4  	writew(val, v3->base + V3_PCI_CMD);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
5  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
6  	/* Clear pending interrupts */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
7  	writeb(0, v3->base + V3_LB_ISTAT);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
8  	/* Read or write errors and parity errors cause interrupts */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  91=
9  	writeb(V3_LB_ISTAT_PCI_RD | V3_LB_ISTAT_PCI_WR | V3_LB_ISTAT_PCI_PERR,
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
0  	       v3->base + V3_LB_IMASK);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
1  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
2  	/* Take the PCI bus out of reset so devices can initialize */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
3  	val =3D readw(v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
4  	val |=3D V3_SYSTEM_M_RST_OUT;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
5  	writew(val, v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
6  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
7  	/*
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
8  	 * Re-lock the system register.
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  92=
9  	 */
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
0  	val =3D readw(v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
1  	val |=3D V3_SYSTEM_M_LOCK;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
2  	writew(val, v3->base + V3_SYSTEM);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
3  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
4  	list_splice_init(&res, &host->windows);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
5  	ret =3D pci_scan_root_bus_bridge(host);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
6  	if (ret) {
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
7  		dev_err(dev, "failed to register host: %d\n", ret);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
8  		return ret;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  93=
9  	}
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
0  	v3->bus =3D host->bus;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
1  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
2  	pci_bus_assign_resources(v3->bus);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
3  	pci_bus_add_devices(v3->bus);
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
4  =

68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
5  	return 0;
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
6  }
68a15eb7bd0cf18 drivers/pci/host/pci-v3-semi.c Linus Walleij 2017-09-26  94=
7  =


:::::: The code at line 808 was first introduced by commit
:::::: 68a15eb7bd0cf180eb214c79aa4e1662c5eeb97c PCI: v3-semi: Add V3 Semico=
nductor PCI host driver

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3066826414558668875==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3066826414558668875==--

