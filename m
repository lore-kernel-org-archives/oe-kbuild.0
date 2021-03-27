Content-Type: multipart/mixed; boundary="===============3436972937100616833=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tegra:for-5.13/arm/dt 15/15] dtbs_check: arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: touchscreen@4c: 'atmel, wakeup-method' does not match any of the regexes: 'pinctrl-[0-9]+'
Date: Sun, 28 Mar 2021 04:59:31 +0800
Message-ID: <202103280428.GlNwTmoV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3436972937100616833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-tegra(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for=
-5.13/arm/dt
head:   3a6c267dd7b8822eb722835b503c5a438cbd3700
commit: 3a6c267dd7b8822eb722835b503c5a438cbd3700 [15/15] ARM: tegra: acer-a=
500: Add atmel,wakeup-method property
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: /: regulator(a)4: '=
anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: /: regulator(a)5: '=
anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml
>> arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: touchscreen(a)4c: '=
atmel,wakeup-method' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: accelerometer(a)f: =
'interrupt-parent', 'interrupts' do not match any of the regexes: 'pinctrl-=
[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/accel/kionix,kxcjk10=
13.yaml
   arch/arm/boot/dts/tegra20-acer-a500-picasso.dt.yaml: usb(a)c5004000: com=
patible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra20-ehci', 'usb-ehci'] is too long
   	Additional items are not allowed ('usb-ehci' was unexpected)
   	'nvidia,tegra20-ehci' is not one of ['allwinner,sun4i-a10-ehci', 'allwi=
nner,sun50i-a64-ehci', 'allwinner,sun50i-h6-ehci', 'allwinner,sun5i-a13-ehc=
i', 'allwinner,sun6i-a31-ehci', 'allwinner,sun7i-a20-ehci', 'allwinner,sun8=
i-a23-ehci', 'allwinner,sun8i-h3-ehci', 'allwinner,sun8i-r40-ehci', 'allwin=
ner,sun9i-a80-ehci', 'aspeed,ast2400-ehci', 'aspeed,ast2500-ehci', 'aspeed,=
ast2600-ehci', 'brcm,bcm3384-ehci', 'brcm,bcm63268-ehci', 'brcm,bcm6328-ehc=
i', 'brcm,bcm6358-ehci', 'brcm,bcm6362-ehci', 'brcm,bcm6368-ehci', 'brcm,bc=
m7125-ehci', 'brcm,bcm7346-ehci', 'brcm,bcm7358-ehci', 'brcm,bcm7360-ehci',=
 'brcm,bcm7362-ehci', 'brcm,bcm7420-ehci', 'brcm,bcm7425-ehci', 'brcm,bcm74=
35-ehci', 'ibm,476gtr-ehci', 'nxp,lpc1850-ehci', 'qca,ar7100-ehci', 'snps,h=
sdk-v1.0-ehci', 'socionext,uniphier-ehci']
   	'nvidia,tegra20-ehci' is not one of ['cavium,octeon-6335-ehci', 'ibm,us=
b-ehci-440epx', 'ibm,usb-ehci-460ex', 'nintendo,hollywood-usb-ehci', 'st,sp=
ear600-ehci']
   	'nvidia,tegra20-ehci' is not one of ['generic-ehci', 'usb-ehci']
   	'generic-ehci' was expected

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3436972937100616833==--

