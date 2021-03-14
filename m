Content-Type: multipart/mixed; boundary="===============7463883057132922943=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap:omap-for-v5.13/genpd-drop-legacy 39/45] dtbs_check: arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: interconnect@48000000: $nodename:0: 'interconnect@48000000' does not match
Date: Mon, 15 Mar 2021 07:45:42 +0800
Message-ID: <202103150740.HtmlzzZf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7463883057132922943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-omap(a)vger.kernel.org
TO: Tony Lindgren <tony@atomide.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.g=
it omap-for-v5.13/genpd-drop-legacy
head:   569519de002fafde35f889a8ea0348eae6ccc20f
commit: f483a3e123410bd1c78af295bf65feffb6769a98 [39/45] ARM: dts: Configur=
e simple-pm-bus for dra7 l4_per1
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)20000: 'anyOf' co=
nditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)30000: $nodename:=
0: 'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)30000: 'anyOf' co=
nditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: interconnect(a)48000000: $n=
odename:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)0: $nodename:0: '=
segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)0: 'anyOf' condit=
ional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: tmp102(a)48: '#thermal-sens=
or-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/trivial-devices.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: tlv320aic3104(a)18: 'clocks=
' is a dependency of 'assigned-clocks'
--
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)20000: 'any=
Of' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)30000: $nod=
ename:0: 'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)30000: 'any=
Of' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: interconnect(a)480000=
00: $nodename:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)=
?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)0: $nodenam=
e:0: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)0: 'anyOf' =
conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: tmp102(a)48: '#therma=
l-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/trivial-devices.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: tlv320aic3104(a)18: '=
clocks' is a dependency of 'assigned-clocks'
--
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)20000: 'anyO=
f' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)30000: $node=
name:0: 'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)30000: 'anyO=
f' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: interconnect(a)4800000=
0: $nodename:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?=
$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)0: $nodename=
:0: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)0: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: tmp102(a)48: '#thermal=
-sensor-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/trivial-devices.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: tlv320aic3104(a)18: 'c=
locks' is a dependency of 'assigned-clocks'
--
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)20000: 'anyOf' =
conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)30000: $nodenam=
e:0: 'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)30000: 'anyOf' =
conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: interconnect(a)48000000: =
$nodename:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)0: $nodename:0:=
 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)0: 'anyOf' cond=
itional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: stmpe_adc: 'iio-device(a)=
0' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: target-module(a)b2000: '1=
w(a)0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-=
cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$=
', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.=
*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)20000: 'anyOf' =
conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)30000: $nodenam=
e:0: 'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)30000: 'anyOf' =
conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: interconnect(a)48000000: =
$nodename:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)0: $nodename:0:=
 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)0: 'anyOf' cond=
itional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: atmel(a)50: $nodename:0: =
'atmel(a)50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	From schema: Documentation/devicetree/bindings/eeprom/at24.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: target-module(a)b2000: '1=
w(a)0' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-=
cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$=
', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.=
*__$', 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)20000: 'anyOf' con=
ditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)30000: $nodename:0=
: 'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)30000: 'anyOf' con=
ditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: interconnect(a)48000000: $no=
dename:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)0: $nodename:0: 's=
egment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)0: 'anyOf' conditi=
onal failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: atmel(a)50: $nodename:0: 'at=
mel(a)50' does not match '^eeprom@[0-9a-f]{1,2}$'
   	From schema: Documentation/devicetree/bindings/eeprom/at24.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: atmel(a)54: $nodename:0: 'at=
mel(a)54' does not match '^eeprom@[0-9a-f]{1,2}$'
--
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)20000: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)30000: $nodename:0: 'seg=
ment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)30000: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am572x-idk.dt.yaml: interconnect(a)48000000: $nodename=
:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)0: $nodename:0: 'segment=
(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)0: 'anyOf' conditional f=
ailed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: tc358778(a)e: compatible: ['toshib=
a,tc358778', 'toshiba,tc358768'] is too long
   	From schema: Documentation/devicetree/bindings/display/bridge/toshiba,t=
c358768.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: tc358778(a)e: compatible: Addition=
al items are not allowed ('toshiba,tc358768' was unexpected)
--
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)20000: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)30000: $nodename:0: 'seg=
ment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)30000: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am571x-idk.dt.yaml: interconnect(a)48000000: $nodename=
:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)0: $nodename:0: 'segment=
(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)0: 'anyOf' conditional f=
ailed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: tc358778(a)e: compatible: ['toshib=
a,tc358778', 'toshiba,tc358768'] is too long
   	From schema: Documentation/devicetree/bindings/display/bridge/toshiba,t=
c358768.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: tc358778(a)e: compatible: Addition=
al items are not allowed ('toshiba,tc358768' was unexpected)
--
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)20000: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)30000: $nodename:0: 'seg=
ment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)30000: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am574x-idk.dt.yaml: interconnect(a)48000000: $nodename=
:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)0: $nodename:0: 'segment=
(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)0: 'anyOf' conditional f=
ailed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: tc358778(a)e: compatible: ['toshib=
a,tc358778', 'toshiba,tc358768'] is too long
   	From schema: Documentation/devicetree/bindings/display/bridge/toshiba,t=
c358768.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: tc358778(a)e: compatible: Addition=
al items are not allowed ('toshiba,tc358768' was unexpected)
--
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)20000: 'anyOf' conditional=
 failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)30000: $nodename:0: 'segme=
nt(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)30000: 'anyOf' conditional=
 failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra7-evm.dt.yaml: interconnect(a)48000000: $nodename:0=
: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(a=
)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)0: 'anyOf' conditional fai=
led, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: p1: $nodename:0: 'p1' does not match=
 '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: target-module(a)b2000: '1w(a)0' does=
 not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^=
#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-=
Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pin=
ctrl-[0-9]+'
--
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)20000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)30000: $nodename:0: 'segm=
ent(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)30000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm.dt.yaml: interconnect(a)48000000: $nodename:=
0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: p1: $nodename:0: 'p1' does not matc=
h '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: target-module(a)b2000: '1w(a)0' doe=
s not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '=
^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA=
-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pi=
nctrl-[0-9]+'
--
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)20000: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)30000: $nodename:0: =
'segment(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)30000: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm-revc.dt.yaml: interconnect(a)48000000: $node=
name:0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: p1: $nodename:0: 'p1' does not=
 match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: target-module(a)b2000: '1w(a)0=
' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells=
$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^=
[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$'=
, 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)20000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)30000: $nodename:0: 'segm=
ent(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)30000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra71-evm.dt.yaml: interconnect(a)48000000: $nodename:=
0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: p1: $nodename:0: 'p1' does not matc=
h '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: p0: $nodename:0: 'p0' does not matc=
h '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
--
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)20000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)30000: $nodename:0: 'segm=
ent(a)30000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)30000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra76-evm.dt.yaml: interconnect(a)48000000: $nodename:=
0: 'interconnect(a)48000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: lp87565(a)60: 'gpio-controller' is =
a required property
   	From schema: Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: lp87565(a)60: '#gpio-cells' is a re=
quired property

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7463883057132922943==--

