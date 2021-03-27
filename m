Content-Type: multipart/mixed; boundary="===============4291282957076557985=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 3555/3568] dtbs_check: arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: pruss@20a80000: 'dma-coherent' does not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', 'cfg@[a-f0-9]+$', 'ecap@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a-f0-9]+$', 'mdio@[a-f0-...
Date: Sat, 27 Mar 2021 11:28:10 +0800
Message-ID: <202103271102.9C5NAqaK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4291282957076557985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Suman Anna <s-anna@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   89491bcc03ec2b17a2f0f6030a9765fe53c73b98
commit: a53b08f2628b0931b27a96f4514b55ce9ca80267 [3555/3568] dt-bindings: s=
oc: ti: pruss: Add eCAP documentation
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: usbphy: usb-phy(a)0:reg:0: [=
0] is too short
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: usbphy: usb-phy(a)1:reg:0: [=
1] is too short
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: usbphy: 'ranges' is a requir=
ed property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: soc(a)0: 'dss(a)02540000', '=
wdt(a)02250000' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$',=
 '^[^@]+$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: dss(a)02540000: '#address-ce=
lls', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-=
9]+'
   	From schema: Documentation/devicetree/bindings/display/ti/ti,k2g-dss.ya=
ml
>> arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: pruss(a)20a80000: 'dma-coher=
ent' does not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', 'cfg=
@[a-f0-9]+$', 'ecap@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a=
-f0-9]+$', 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',=
 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: pruss(a)20ac0000: 'dma-coher=
ent' does not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', 'cfg=
@[a-f0-9]+$', 'ecap@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a=
-f0-9]+$', 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',=
 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: leds1: led0:default-state:0:=
 'off' is not of type 'array'
   	From schema: Documentation/devicetree/bindings/leds/leds-gpio.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: leds1: led0:linux,default-tr=
igger:0: 'cpu0' is not one of ['backlight', 'default-on', 'heartbeat', 'dis=
k-activity', 'ide-disk', 'timer', 'pattern']
   	From schema: Documentation/devicetree/bindings/leds/leds-gpio.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: leds1: led1:default-state:0:=
 'off' is not of type 'array'
   	From schema: Documentation/devicetree/bindings/leds/leds-gpio.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: leds1: led2:default-state:0:=
 'off' is not of type 'array'
   	From schema: Documentation/devicetree/bindings/leds/leds-gpio.yaml
   arch/arm/boot/dts/keystone-k2g-ice.dt.yaml: leds1: led3:default-state:0:=
 'off' is not of type 'array'
--
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: usbphy: 'ranges' is a requir=
ed property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: usb-phy(a)0: '#phy-cells' is=
 a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ph=
y/phy-provider.yaml
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: usb-phy(a)1: '#phy-cells' is=
 a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ph=
y/phy-provider.yaml
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: soc(a)0: 'dss(a)02540000', '=
wdt(a)02250000' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$',=
 '^[^@]+$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: dss(a)02540000: '#address-ce=
lls', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-=
9]+'
   	From schema: Documentation/devicetree/bindings/display/ti/ti,k2g-dss.ya=
ml
>> arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: pruss(a)20a80000: 'dma-coher=
ent' does not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', 'cfg=
@[a-f0-9]+$', 'ecap@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a=
-f0-9]+$', 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',=
 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
>> arch/arm/boot/dts/keystone-k2g-evm.dt.yaml: pruss(a)20ac0000: 'dma-coher=
ent' does not match any of the regexes: '^(pru|rtu|txpru)@[0-9a-f]+$', 'cfg=
@[a-f0-9]+$', 'ecap@[a-f0-9]+$', 'iep@[a-f0-9]+$', 'interrupt-controller@[a=
-f0-9]+$', 'mdio@[a-f0-9]+$', 'memories@[a-f0-9]+$', 'mii-g-rt@[a-f0-9]+$',=
 'mii-rt@[a-f0-9]+$', 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4291282957076557985==--

