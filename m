Content-Type: multipart/mixed; boundary="===============1979672396905857321=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [keystone:for_5.13/keystone-dts 1/4] dtbs_check: arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc@0/mailbox@2a00000: failed to match any schema with compatible: ['ti, k2g-message-manager']
Date: Mon, 07 Jun 2021 12:46:04 +0800
Message-ID: <202106071257.Y8nEPBTN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1979672396905857321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Nishanth Menon <nm@ti.com>
CC: Santosh Shilimkar <santosh.shilimkar@oracle.com>
CC: Tero Kristo <kristo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keys=
tone.git for_5.13/keystone-dts
head:   0b5194dec85b9f3971900129f9a3584a6cb5918d
commit: 361a02c1e25f148b910fbfbfd77aeb51401e1ea9 [1/4] ARM: dts: keystone: =
k2g: Rename message-manager node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/can(a)260b200: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/can(a)260b200: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/can(a)260b400: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/can(a)260b400: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/i2c(a)2530000: =
failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/i2c(a)2530400: =
failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/i2c(a)2530400/s=
ii9022(a)3b: failed to match any schema with compatible: ['sil,sii9022']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/i2c(a)2530400/t=
lv320aic3106(a)1b: failed to match any schema with compatible: ['ti,tlv320a=
ic3106']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/i2c(a)2530800: =
failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/dsp(a)10800000:=
 failed to match any schema with compatible: ['ti,k2g-dsp']
>> arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/mailbox(a)2a000=
00: failed to match any schema with compatible: ['ti,k2g-message-manager']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00:=
 failed to match any schema with compatible: ['ti,k2g-sci']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00/=
power-controller: failed to match any schema with compatible: ['ti,sci-pm-d=
omain']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: clocks: 'clocks' is a depend=
ency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00/=
clocks: failed to match any schema with compatible: ['ti,k2g-sci-clk']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00/=
reset-controller: failed to match any schema with compatible: ['ti,sci-rese=
t']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/gpio(a)2603000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/gpio(a)2603000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/gpio(a)260a000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml:0:0: /soc(a)0/gpio(a)260a000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
--
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/device-state-co=
ntrol(a)2620000/keystone_irq(a)2a0: failed to match any schema with compati=
ble: ['ti,keystone-irq']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/device-state-co=
ntrol(a)2620000/keystone_dsp_gpio(a)240: failed to match any schema with co=
mpatible: ['ti,keystone-dsp-gpio']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/can(a)260b200: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/can(a)260b200: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/can(a)260b400: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/can(a)260b400: =
failed to match any schema with compatible: ['ti,am4372-d_can', 'ti,am3352-=
d_can']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/i2c(a)2530000: =
failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/i2c(a)2530400: =
failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/i2c(a)2530800: =
failed to match any schema with compatible: ['ti,keystone-i2c']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/dsp(a)10800000:=
 failed to match any schema with compatible: ['ti,k2g-dsp']
>> arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/mailbox(a)2a000=
00: failed to match any schema with compatible: ['ti,k2g-message-manager']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00:=
 failed to match any schema with compatible: ['ti,k2g-sci']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00/=
power-controller: failed to match any schema with compatible: ['ti,sci-pm-d=
omain']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00/=
clocks: failed to match any schema with compatible: ['ti,k2g-sci-clk']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/pmmc(a)2921c00/=
reset-controller: failed to match any schema with compatible: ['ti,sci-rese=
t']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/gpio(a)2603000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/gpio(a)2603000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/gpio(a)260a000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml:0:0: /soc(a)0/gpio(a)260a000:=
 failed to match any schema with compatible: ['ti,k2g-gpio', 'ti,keystone-g=
pio']
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: dss(a)02540000: '#address-ce=
lls', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-=
9]+'
   	From schema: Documentation/devicetree/bindings/display/ti/ti,k2g-dss.ya=
ml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1979672396905857321==--

