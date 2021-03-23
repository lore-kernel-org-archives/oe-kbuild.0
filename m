Content-Type: multipart/mixed; boundary="===============8075767765346795118=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5724/6512] dtbs_check: arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: touchscreen@4a: 'interrupt-names' does not match any of the regexes:
Date: Tue, 23 Mar 2021 21:06:05 +0800
Message-ID: <202103232100.CATrcvc9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8075767765346795118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   d949689e7383cd5271470f2b99dbe2fd3199bffd
commit: 09fde2078dfa03607ad3b70de90ff56a86203622 [5724/6512] dt-bindings: i=
nput: atmel,maxtouch: add wakeup-source
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)300000: $n=
odename:0: 'segment(a)300000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|s=
oc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: interconnect(a)48000=
000: $nodename:0: 'interconnect(a)48000000' does not match '^([a-z][a-z0-9\=
\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)0: $nodena=
me:0: 'segment(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb=
|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: tmp105(a)48: 'interr=
upt-names', 'interrupts-extended', 'wakeup-source' do not match any of the =
regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwmon/lm75.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: touchscreen(a)4a: in=
terrupts-extended: [[109, 23, 8], [106, 352]] is too long
   	From schema: Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>> arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: touchscreen(a)4a: 'i=
nterrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: mmc(a)0: More than o=
ne condition true in oneOf schema:
   	{'oneOf': [{'required': ['interrupts']},
   	           {'required': ['interrupts-extended']}]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/in=
terrupts.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: target-module(a)b200=
0: '1w(a)0' does not match any of the regexes: '.*-names$', '.*-supply$', '=
^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0=
,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', =
'^__.*__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt=
-core.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)200000: $n=
odename:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|s=
oc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: magnetometer(a)c: 'r=
otation-matrix' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)300000: $nodenam=
e:0: 'segment(a)300000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi=
|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: interconnect(a)48000000: $=
nodename:0: 'interconnect(a)48000000' does not match '^([a-z][a-z0-9\\-]+-b=
us|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(=
@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: tmp105(a)48: 'interrupt-na=
mes', 'interrupts-extended', 'wakeup-source' do not match any of the regexe=
s: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/hwmon/lm75.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: touchscreen(a)4a: interrup=
ts-extended: [[109, 23, 8], [106, 352]] is too long
   	From schema: Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
>> arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: touchscreen(a)4a: 'interru=
pt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: mmc(a)0: More than one con=
dition true in oneOf schema:
   	{'oneOf': [{'required': ['interrupts']},
   	           {'required': ['interrupts-extended']}]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/in=
terrupts.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: target-module(a)b2000: '1w=
(a)0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-c=
ells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$'=
, '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*=
__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt=
-core.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)200000: $nodenam=
e:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi=
|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: magnetometer(a)c: 'rotatio=
n-matrix' does not match any of the regexes: 'pinctrl-[0-9]+'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8075767765346795118==--

