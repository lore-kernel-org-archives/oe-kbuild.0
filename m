Content-Type: multipart/mixed; boundary="===============3775078472331956954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 03/11] irqchip: add sl28cpld interrupt controller support
Date: Sat, 06 Jun 2020 07:42:32 +0800
Message-ID: <202006060733.XII9xUPe%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3775078472331956954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200604211039.12689-4-michael@walle.cc>
References: <20200604211039.12689-4-michael@walle.cc>
TO: Michael Walle <michael@walle.cc>
TO: linux-gpio(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: linux-hwmon(a)vger.kernel.org
TO: linux-pwm(a)vger.kernel.org
TO: linux-watchdog(a)vger.kernel.org
TO: linux-arm-kernel(a)lists.infradead.org
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC: Rob Herring <robh+dt@kernel.org>

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20200604]
[cannot apply to gpio/for-next hwmon/hwmon-next ljones-mfd/for-mfd-next sha=
wnguo/for-next v5.7 v5.7-rc7 v5.7-rc6 v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Michael-Walle/Add-support-=
for-Kontron-sl28cpld/20200605-051333
base:    d4899e5542c15062cc55cac0ca99025bb64edc61
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/irqchip/irq-sl28cpld.c:56:10: warning: Checking if unsigned vari=
able 'irq' is less than zero. [unsignedLessThanZero]
    if (irq < 0)
            ^

# https://github.com/0day-ci/linux/commit/b13743c1f1a52746beaa071e5d008c84d=
59fbd7f
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout b13743c1f1a52746beaa071e5d008c84d59fbd7f
vim +/irq +56 drivers/irqchip/irq-sl28cpld.c

b13743c1f1a527 Michael Walle 2020-06-04  35  =

b13743c1f1a527 Michael Walle 2020-06-04  36  static int sl28cpld_intc_probe=
(struct platform_device *pdev)
b13743c1f1a527 Michael Walle 2020-06-04  37  {
b13743c1f1a527 Michael Walle 2020-06-04  38  	struct device *dev =3D &pdev-=
>dev;
b13743c1f1a527 Michael Walle 2020-06-04  39  	struct sl28cpld_intc *irqchip;
b13743c1f1a527 Michael Walle 2020-06-04  40  	unsigned int irq;
b13743c1f1a527 Michael Walle 2020-06-04  41  	u32 base;
b13743c1f1a527 Michael Walle 2020-06-04  42  	int ret;
b13743c1f1a527 Michael Walle 2020-06-04  43  =

b13743c1f1a527 Michael Walle 2020-06-04  44  	if (!dev->parent)
b13743c1f1a527 Michael Walle 2020-06-04  45  		return -ENODEV;
b13743c1f1a527 Michael Walle 2020-06-04  46  =

b13743c1f1a527 Michael Walle 2020-06-04  47  	irqchip =3D devm_kzalloc(dev,=
 sizeof(*irqchip), GFP_KERNEL);
b13743c1f1a527 Michael Walle 2020-06-04  48  	if (!irqchip)
b13743c1f1a527 Michael Walle 2020-06-04  49  		return -ENOMEM;
b13743c1f1a527 Michael Walle 2020-06-04  50  =

b13743c1f1a527 Michael Walle 2020-06-04  51  	irqchip->regmap =3D dev_get_r=
egmap(dev->parent, NULL);
b13743c1f1a527 Michael Walle 2020-06-04  52  	if (!irqchip->regmap)
b13743c1f1a527 Michael Walle 2020-06-04  53  		return -ENODEV;
b13743c1f1a527 Michael Walle 2020-06-04  54  =

b13743c1f1a527 Michael Walle 2020-06-04  55  	irq =3D platform_get_irq(pdev=
, 0);
b13743c1f1a527 Michael Walle 2020-06-04 @56  	if (irq < 0)
b13743c1f1a527 Michael Walle 2020-06-04  57  		return irq;
b13743c1f1a527 Michael Walle 2020-06-04  58  =

b13743c1f1a527 Michael Walle 2020-06-04  59  	ret =3D device_property_read_=
u32(&pdev->dev, "reg", &base);
b13743c1f1a527 Michael Walle 2020-06-04  60  	if (ret)
b13743c1f1a527 Michael Walle 2020-06-04  61  		return -EINVAL;
b13743c1f1a527 Michael Walle 2020-06-04  62  =

b13743c1f1a527 Michael Walle 2020-06-04  63  	irqchip->chip.name =3D "sl28c=
pld-intc";
b13743c1f1a527 Michael Walle 2020-06-04  64  	irqchip->chip.irqs =3D sl28cp=
ld_irqs;
b13743c1f1a527 Michael Walle 2020-06-04  65  	irqchip->chip.num_irqs =3D AR=
RAY_SIZE(sl28cpld_irqs);
b13743c1f1a527 Michael Walle 2020-06-04  66  	irqchip->chip.num_regs =3D 1;
b13743c1f1a527 Michael Walle 2020-06-04  67  	irqchip->chip.status_base =3D=
 base + INTC_IP;
b13743c1f1a527 Michael Walle 2020-06-04  68  	irqchip->chip.mask_base =3D b=
ase + INTC_IE;
b13743c1f1a527 Michael Walle 2020-06-04  69  	irqchip->chip.mask_invert =3D=
 true,
b13743c1f1a527 Michael Walle 2020-06-04  70  	irqchip->chip.ack_base =3D ba=
se + INTC_IP;
b13743c1f1a527 Michael Walle 2020-06-04  71  =

b13743c1f1a527 Michael Walle 2020-06-04  72  	return devm_regmap_add_irq_ch=
ip_np(&pdev->dev, dev->of_node,
b13743c1f1a527 Michael Walle 2020-06-04  73  					   irqchip->regmap, irq,
b13743c1f1a527 Michael Walle 2020-06-04  74  					   IRQF_SHARED | IRQF_ONE=
SHOT, 0,
b13743c1f1a527 Michael Walle 2020-06-04  75  					   &irqchip->chip, &irqch=
ip->irq_data);
b13743c1f1a527 Michael Walle 2020-06-04  76  }
b13743c1f1a527 Michael Walle 2020-06-04  77  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3775078472331956954==--

