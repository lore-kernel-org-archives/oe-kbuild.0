Content-Type: multipart/mixed; boundary="===============4328152769151731937=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 11/12] ARM: dts: Configure simple-pm-bus for omap4 l4_cfg
Date: Wed, 10 Mar 2021 09:23:40 +0800
Message-ID: <202103100907.EKZTTU7b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4328152769151731937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)01.org
In-Reply-To: <20210308133910.12454-12-tony@atomide.com>
References: <20210308133910.12454-12-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: linux-omap(a)vger.kernel.org
CC: "Beno=C3=AEt Cousson" <bcousson@baylibre.com>
CC: devicetree(a)vger.kernel.org

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on omap/for-next v5.12-rc2 next-20210309]
[cannot apply to balbi-usb/testing/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tony-Lindgren/Update-omap4=
-devicetree-files-to-probe-with-genpd/20210308-214124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)10000: 'an=
yOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)20000: $no=
dename:0: 'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)20000: 'an=
yOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: interconnect(a)4a000=
000: $nodename:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+=
)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)0: $nodena=
me:0: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: segment(a)0: 'anyOf'=
 conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: scm(a)0: $nodename:0=
: 'scm(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[=
0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: scm_conf(a)0: compat=
ible: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)10000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)20000: $nodename=
:0: 'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)20000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: interconnect(a)4a000000: $=
nodename:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: scm(a)0: $nodename:0: 'scm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: scm_conf(a)0: compatible: =
'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)10000: 'anyOf'=
 conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)20000: $nodena=
me:0: 'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)20000: 'anyOf'=
 conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: interconnect(a)4a000000:=
 $nodename:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)0: $nodename:0=
: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)0: 'anyOf' con=
ditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: scm(a)0: $nodename:0: 's=
cm(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a=
-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: scm_conf(a)0: compatible=
: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)10000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)20000: $nodename:0: 'segm=
ent(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)20000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-kc1.dt.yaml: interconnect(a)4a000000: $nodename:=
0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: scm(a)0: $nodename:0: 'scm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: scm_conf(a)0: compatible: 'anyOf' c=
onditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)10000: 'anyOf' conditio=
nal failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)20000: $nodename:0: 'se=
gment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)20000: 'anyOf' conditio=
nal failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-panda.dt.yaml: interconnect(a)4a000000: $nodenam=
e:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)0: $nodename:0: 'segmen=
t(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)0: 'anyOf' conditional =
failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: scm(a)0: $nodename:0: 'scm(a)0' d=
oes not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: scm_conf(a)0: compatible: 'anyOf'=
 conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)10000: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)20000: $nodename:0: =
'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)20000: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-panda-a4.dt.yaml: interconnect(a)4a000000: $node=
name:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: scm(a)0: $nodename:0: 'scm(a)0=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?=
$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: scm_conf(a)0: compatible: 'any=
Of' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)10000: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)20000: $nodename:0: =
'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)20000: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-panda-es.dt.yaml: interconnect(a)4a000000: $node=
name:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: scm(a)0: $nodename:0: 'scm(a)0=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?=
$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: scm_conf(a)0: compatible: 'any=
Of' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)10000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)20000: $nodename:0: 'segm=
ent(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)20000: 'anyOf' conditiona=
l failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-sdp.dt.yaml: interconnect(a)4a000000: $nodename:=
0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: scm(a)0: $nodename:0: 'scm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: scm_conf(a)0: compatible: 'anyOf' c=
onditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)10000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)20000: $nodename=
:0: 'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)20000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: interconnect(a)4a000000: $=
nodename:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: scm(a)0: $nodename:0: 'scm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: scm_conf(a)0: compatible: =
'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)10000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)20000: $nodename=
:0: 'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)20000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: interconnect(a)4a000000: $=
nodename:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: scm(a)0: $nodename:0: 'scm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: scm_conf(a)0: compatible: =
'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)10000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)20000: $nodename=
:0: 'segment(a)20000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)20000: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: interconnect(a)4a000000: $=
nodename:0: 'interconnect(a)4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: scm(a)0: $nodename:0: 'scm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: scm_conf(a)0: compatible: =
'anyOf' conditional failed, one must be fixed:

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4328152769151731937==--

