Content-Type: multipart/mixed; boundary="===============2872543659399037037=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap:omap-for-v5.13/genpd-omap4 51/52] dtbs_check: arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: $nodename:0: 'ocp' does not match
Date: Sat, 13 Mar 2021 14:00:52 +0800
Message-ID: <202103131450.Cqv4Xwaq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2872543659399037037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-omap(a)vger.kernel.org
TO: Tony Lindgren <tony@atomide.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.g=
it omap-for-v5.13/genpd-omap4
head:   2584d7e7f87ad0a57683dda8e7f17d8630c2eefc
commit: 3e1ea524d6db00b432eb93897f9de7091af9e549 [51/52] ARM: OMAP2+: Drop =
legacy platform data for omap4 l3
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: /: usb-phy(a)2: 'any=
Of' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: sram(a)40304000: '#a=
ddress-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: sram(a)40304000: '#s=
ize-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: sram(a)40304000: 'ra=
nges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: $nodename:0: 'o=
cp' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: bandgap(a)4a002=
260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: interconnect(a)4a300=
000: $nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+=
)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)0: $nodena=
me:0: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)0: 'anyOf'=
 conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: /: usb-phy(a)2: 'anyOf' co=
nditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: sram(a)40304000: '#address=
-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: sram(a)40304000: '#size-ce=
lls' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: sram(a)40304000: 'ranges' =
is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: sram(a)40304000: '#addre=
ss-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: sram(a)40304000: '#size-=
cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: sram(a)40304000: 'ranges=
' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: $nodename:0: 'ocp' =
does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: bandgap(a)4a002260:=
reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: interconnect(a)4a300000:=
 $nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)0: $nodename:0=
: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)0: 'anyOf' con=
ditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-kc1.dt.yaml: sram(a)40304000: '#address-cells' i=
s a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: sram(a)40304000: '#size-cells' is a=
 required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: sram(a)40304000: 'ranges' is a requ=
ired property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: $nodename:0: 'ocp' does not ma=
tch '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: bandgap(a)4a002260:reg:0: [124=
1522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: interconnect(a)4a300000: $nodename:=
0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-panda.dt.yaml: sram(a)40304000: '#address-cells'=
 is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: sram(a)40304000: '#size-cells' is=
 a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: sram(a)40304000: 'ranges' is a re=
quired property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: $nodename:0: 'ocp' does not =
match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: bandgap(a)4a002260:reg:0: [1=
241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: interconnect(a)4a300000: $nodenam=
e:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)0: $nodename:0: 'segmen=
t(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)0: 'anyOf' conditional =
failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: /: 'model' is a required prope=
rty
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/ro=
ot-node.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: sram(a)40304000: '#address-cel=
ls' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: sram(a)40304000: '#size-cells'=
 is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: sram(a)40304000: 'ranges' is a=
 required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: $nodename:0: 'ocp' does n=
ot match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: bandgap(a)4a002260:reg:0:=
 [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: interconnect(a)4a300000: $node=
name:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: sram(a)40304000: '#address-cel=
ls' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: sram(a)40304000: '#size-cells'=
 is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: sram(a)40304000: 'ranges' is a=
 required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: $nodename:0: 'ocp' does n=
ot match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: bandgap(a)4a002260:reg:0:=
 [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: interconnect(a)4a300000: $node=
name:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-sdp.dt.yaml: sram(a)40304000: '#address-cells' i=
s a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: sram(a)40304000: '#size-cells' is a=
 required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: sram(a)40304000: 'ranges' is a requ=
ired property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: $nodename:0: 'ocp' does not ma=
tch '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: bandgap(a)4a002260:reg:0: [124=
1522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: interconnect(a)4a300000: $nodename:=
0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: sram(a)40304000: '#address=
-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: sram(a)40304000: '#size-ce=
lls' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: sram(a)40304000: 'ranges' =
is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: sram(a)40304000: '#address=
-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: sram(a)40304000: '#size-ce=
lls' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: sram(a)40304000: 'ranges' =
is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
--
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: sram(a)40304000: '#address=
-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: sram(a)40304000: '#size-ce=
lls' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: sram(a)40304000: 'ranges' =
is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2872543659399037037==--

