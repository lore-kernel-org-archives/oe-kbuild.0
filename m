Content-Type: multipart/mixed; boundary="===============1472900220414478267=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 09/12] ARM: dts: Configure simple-pm-bus for omap4 l4_wkup
Date: Tue, 09 Mar 2021 15:18:50 +0800
Message-ID: <202103091522.L6Ugm6rO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1472900220414478267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)01.org
In-Reply-To: <20210308133910.12454-10-tony@atomide.com>
References: <20210308133910.12454-10-tony@atomide.com>
TO: Tony Lindgren <tony@atomide.com>
TO: linux-omap(a)vger.kernel.org
CC: "Beno=C3=AEt Cousson" <bcousson@baylibre.com>
CC: devicetree(a)vger.kernel.org

Hi Tony,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on omap/for-next v5.12-rc2 next-20210305]
[cannot apply to balbi-usb/testing/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tony-Lindgren/Update-omap4=
-devicetree-files-to-probe-with-genpd/20210308-214124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: bandgap(a)4a002=
260:reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: $nodename:0: 'o=
cp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+=
)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: dsp: {'type': '=
object'} is not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': =
[[153, 772, 0]], 'iommus': [[154]], 'resets': [[95, 0]], 'clocks': [[94, 0,=
 0]], 'firmware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[155, 156]], 'sta=
tus': ['disabled']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: regulator-abb-m=
pu: {'type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 're=
gulator-name': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], =
'ti,tranxdone-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': =
[[50]], 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408,=
 8], [1244684308, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,ab=
b_info': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0=
, 0, 0, 1375000, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: ocp: regulator-abb-i=
va: {'type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 're=
gulator-name': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], =
'ti,tranxdone-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-=
time': [[50]], 'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[=
1244691416, 8], [1244684304, 4]], 'reg-names': ['base-address', 'int-addres=
s']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: interconnect(a)4a300=
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
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: prm(a)0: $nodename:0=
: 'prm(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[=
0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml: prm(a)0: clocks: {'t=
ype': 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells':=
 [[0]], 'sys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mu=
x-clock'], 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272=
]], 'ti,index-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_cl=
k_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'c=
locks': [[15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[=
51]]}, 'abe_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible'=
: ['ti,mux-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50=
]]}, 'dbgclk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-=
clock'], 'clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wk=
up_clk_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'=
], 'clocks': [[15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#cloc=
k-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg=
': [[256]], 'ti,max-div': [[2]], 'phandle': [[146]]}, 'usim_ck(a)1858': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], =
'ti,bit-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phan=
dle': [[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['=
ti,gate-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]},=
 'trace_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-=
clock'], 'clocks': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888'=
: {'#clock-cells': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]]=
, 'ti,bit-shift': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: dsp: {'type': 'object=
'} is not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[153,=
 772, 0]], 'iommus': [[154]], 'resets': [[95, 0]], 'clocks': [[94, 0, 0]], =
'firmware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[155, 156]], 'status': =
['disabled']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: regulator-abb-mpu: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]]=
, 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [=
1244684308, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_info=
': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0, 0=
, 1375000, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: ocp: regulator-abb-iva: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time':=
 [[50]], 'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[124469=
1416, 8], [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: prm(a)0: $nodename:0: 'prm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml: prm(a)0: clocks: {'type': =
'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]]=
, 'sys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 't=
i,index-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_=
ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]},=
 'abe_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti=
,mux-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]}, '=
dbgclk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'=
], 'clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk=
_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [[2=
56]], 'ti,max-div': [[2]], 'phandle': [[146]]}, 'usim_ck(a)1858': {'#clock-=
cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,bi=
t-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle': =
[[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,gat=
e-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'trac=
e_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-clock'=
], 'clocks': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'#c=
lock-cells': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 'ti,=
bit-shift': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: bandgap(a)4a002260:=
reg:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: $nodename:0: 'ocp' =
does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: dsp: {'type': 'obje=
ct'} is not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[14=
3, 772, 0]], 'iommus': [[144]], 'resets': [[94, 0]], 'clocks': [[93, 0, 0]]=
, 'firmware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[145, 146]], 'status'=
: ['disabled']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: regulator-abb-mpu: =
{'type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regula=
tor-name': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,=
tranxdone-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50=
]], 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8],=
 [1244684308, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_in=
fo': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0,=
 0, 1375000, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: ocp: regulator-abb-iva: =
{'type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regula=
tor-name': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,=
tranxdone-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time=
': [[50]], 'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[1244=
691416, 8], [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: interconnect(a)4a300000:=
 $nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)0: $nodename:0=
: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: segment(a)0: 'anyOf' con=
ditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: prm(a)0: $nodename:0: 'p=
rm(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a=
-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml: prm(a)0: clocks: {'type'=
: 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0=
]], 'sys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cl=
ock'], 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], =
'ti,index-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mu=
x_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]=
}, 'abe_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['=
ti,mux-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]},=
 'dbgclk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-cloc=
k'], 'clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_c=
lk_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], '=
clocks': [[15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-ce=
lls': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [=
[256]], 'ti,max-div': [[2]], 'phandle': [[133]]}, 'usim_ck(a)1858': {'#cloc=
k-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,=
bit-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle'=
: [[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,g=
ate-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'tr=
ace_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-cloc=
k'], 'clocks': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'=
#clock-cells': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 't=
i,bit-shift': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: bandgap(a)4a002260:reg:0: [124=
1522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: $nodename:0: 'ocp' does not ma=
tch '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: dsp: {'type': 'object'} is not=
 allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[130, 772, 0]]=
, 'iommus': [[131]], 'resets': [[93, 0]], 'clocks': [[92, 0, 0]], 'firmware=
-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[132, 133]], 'status': ['disable=
d']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: regulator-abb-mpu: {'type': 'o=
bject'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-name': =
['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxdone-s=
tatus-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]], 'ti,clo=
ck-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [124468430=
8, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_info': [[1025=
000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0, 0, 1375000=
, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: ocp: regulator-abb-iva: {'type': 'o=
bject'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-name': =
['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxdone-s=
tatus-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time': [[50]], =
'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[1244691416, 8],=
 [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-kc1.dt.yaml: interconnect(a)4a300000: $nodename:=
0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-kc1.dt.yaml: prm(a)0: clocks: {'type': 'object'}=
 is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_cl=
kin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clo=
cks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 'ti,index-s=
tarts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_ck(a)108'=
: {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[15], =
[16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]}, 'abe_dpl=
l_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]}, 'dbgclk_mu=
x_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clock=
s': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk_mux_ck(a=
)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [[256]], 'ti=
,max-div': [[2]], 'phandle': [[123]]}, 'usim_ck(a)1858': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,bit-shift':=
 [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle': [[19]]}, =
'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,gate-clock']=
, 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'trace_clk_div=
_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-clock'], 'clock=
s': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'#clock-cell=
s': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 'ti,bit-shift=
': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: bandgap(a)4a002260:reg:0: [1=
241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: $nodename:0: 'ocp' does not =
match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: dsp: {'type': 'object'} is n=
ot allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[144, 772, 0=
]], 'iommus': [[145]], 'resets': [[94, 0]], 'clocks': [[93, 0, 0]], 'firmwa=
re-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[146, 147]], 'status': ['okay'=
], 'memory-region': [[148]], 'ti,timers': [[149]], 'ti,watchdog-timers': [[=
150]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: regulator-abb-mpu: {'type': =
'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-name'=
: ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxdone=
-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]], 'ti,c=
lock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [1244684=
308, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_info': [[10=
25000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0, 0, 13750=
00, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: ocp: regulator-abb-iva: {'type': =
'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-name'=
: ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxdone=
-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time': [[50]]=
, 'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[1244691416, 8=
], [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-panda.dt.yaml: interconnect(a)4a300000: $nodenam=
e:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)0: $nodename:0: 'segmen=
t(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: segment(a)0: 'anyOf' conditional =
failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' d=
oes not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda.dt.yaml: prm(a)0: clocks: {'type': 'object=
'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_=
clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'c=
locks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 'ti,index=
-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_ck(a)10=
8': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[15]=
, [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]}, 'abe_d=
pll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cl=
ock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]}, 'dbgclk_=
mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clo=
cks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk_mux_ck=
(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': =
[[15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-cells': [[0=
]], 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [[256]], '=
ti,max-div': [[2]], 'phandle': [[136]]}, 'usim_ck(a)1858': {'#clock-cells':=
 [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,bit-shift=
': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle': [[19]]}=
, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,gate-clock=
'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'trace_clk_d=
iv_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-clock'], 'clo=
cks': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'#clock-ce=
lls': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 'ti,bit-shi=
ft': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: bandgap(a)4a002260:reg:0:=
 [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: $nodename:0: 'ocp' does n=
ot match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: dsp: {'type': 'object'} i=
s not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[144, 772=
, 0]], 'iommus': [[145]], 'resets': [[94, 0]], 'clocks': [[93, 0, 0]], 'fir=
mware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[146, 147]], 'status': ['ok=
ay'], 'memory-region': [[148]], 'ti,timers': [[149]], 'ti,watchdog-timers':=
 [[150]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: regulator-abb-mpu: {'type=
': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-na=
me': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxd=
one-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]], 't=
i,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [1244=
684308, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_info': [=
[1025000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0, 0, 13=
75000, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: ocp: regulator-abb-iva: {'type=
': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-na=
me': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxd=
one-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time': [[5=
0]], 'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[1244691416=
, 8], [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-panda-a4.dt.yaml: interconnect(a)4a300000: $node=
name:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?=
$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml: prm(a)0: clocks: {'type': 'obj=
ect'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 's=
ys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'],=
 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 'ti,in=
dex-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_ck(a=
)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]}, 'ab=
e_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux=
-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]}, 'dbgc=
lk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], '=
clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk_mux=
_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks=
': [[15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-cells': =
[[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [[256]]=
, 'ti,max-div': [[2]], 'phandle': [[136]]}, 'usim_ck(a)1858': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,bit-sh=
ift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle': [[19=
]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,gate-cl=
ock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'trace_cl=
k_div_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-clock'], '=
clocks': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'#clock=
-cells': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 'ti,bit-=
shift': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: $nodename:0: 'ocp' does n=
ot match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: bandgap(a)4a002260:reg:0:=
 [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: dsp: {'type': 'object'} i=
s not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[148, 772=
, 0]], 'iommus': [[149]], 'resets': [[96, 0]], 'clocks': [[95, 0, 0]], 'fir=
mware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[150, 151]], 'status': ['ok=
ay'], 'memory-region': [[152]], 'ti,timers': [[153]], 'ti,watchdog-timers':=
 [[154]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: regulator-abb-mpu: {'type=
': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-na=
me': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxd=
one-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]], 't=
i,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [1244=
684308, 4], [1241522792, 4]], 'reg-names': ['base-address', 'int-address', =
'efuse-address'], 'ti,abb_info': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0=
, 0, 0, 1313000, 0, 0, 1048576, 262144, 0, 1375000, 1, 0, 0, 0, 0, 1389000,=
 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: ocp: regulator-abb-iva: {'type=
': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-na=
me': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxd=
one-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time': [[5=
0]], 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691416, 8]=
, [1244684304, 4], [1241522792, 4]], 'reg-names': ['base-address', 'int-add=
ress', 'efuse-address'], 'ti,abb_info': [[950000, 0, 0, 0, 0, 0, 1140000, 0=
, 0, 0, 0, 0, 1291000, 0, 0, 2097152, 0, 0, 1375000, 1, 0, 0, 0, 0, 1376000=
, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-panda-es.dt.yaml: interconnect(a)4a300000: $node=
name:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?=
$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-panda-es.dt.yaml: prm(a)0: clocks: {'type': 'obj=
ect'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 's=
ys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'],=
 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 'ti,in=
dex-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_ck(a=
)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[53]]}, 'ab=
e_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux=
-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[52]]}, 'dbgc=
lk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], '=
clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk_mux=
_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks=
': [[15], [17]], 'reg': [[264]], 'phandle': [[21]]}, 'syc_clk_div_ck(a)100'=
: {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[1=
5]], 'reg': [[256]], 'ti,max-div': [[2]], 'phandle': [[140]]}, 'usim_ck(a)1=
858': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[18]], 'ti,bit-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18=
]], 'phandle': [[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compat=
ible': ['ti,gate-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [=
[6232]]}, 'trace_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['ti,cl=
kdm-gate-clock'], 'clocks': [[20, 0, 24]], 'phandle': [[23]]}, 'div_ts_ck(a=
)1888': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[21]], 'ti,bit-shift': [[24]], 'reg': [[6280]], 'ti,dividers': [[8], [1=
6], [32]], 'phandle': [[22]]}, 'bandgap_ts_fclk(a)1888': {'#clock-cells': [=
[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[22]], 'ti,bit-shift': [[=
8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: bandgap(a)4a002260:reg:0: [124=
1522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: $nodename:0: 'ocp' does not ma=
tch '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: dsp: {'type': 'object'} is not=
 allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[152, 772, 0]]=
, 'iommus': [[153]], 'resets': [[93, 0]], 'clocks': [[92, 0, 0]], 'firmware=
-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[154, 155]], 'status': ['disable=
d']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: regulator-abb-mpu: {'type': 'o=
bject'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-name': =
['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxdone-s=
tatus-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]], 'ti,clo=
ck-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [124468430=
8, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_info': [[1025=
000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0, 0, 1375000=
, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: ocp: regulator-abb-iva: {'type': 'o=
bject'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulator-name': =
['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tranxdone-s=
tatus-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time': [[50]], =
'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[1244691416, 8],=
 [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-sdp.dt.yaml: interconnect(a)4a300000: $nodename:=
0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp.dt.yaml: prm(a)0: clocks: {'type': 'object'}=
 is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_cl=
kin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clo=
cks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 'ti,index-s=
tarts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_ck(a)108'=
: {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[15], =
[16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]}, 'abe_dpl=
l_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]}, 'dbgclk_mu=
x_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clock=
s': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk_mux_ck(a=
)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [[256]], 'ti=
,max-div': [[2]], 'phandle': [[144]]}, 'usim_ck(a)1858': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,bit-shift':=
 [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle': [[19]]}, =
'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,gate-clock']=
, 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'trace_clk_div=
_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-clock'], 'clock=
s': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'#clock-cell=
s': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 'ti,bit-shift=
': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: dsp: {'type': 'object=
'} is not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[152,=
 772, 0]], 'iommus': [[153]], 'resets': [[93, 0]], 'clocks': [[92, 0, 0]], =
'firmware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[154, 155]], 'status': =
['disabled']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: regulator-abb-mpu: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]]=
, 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [=
1244684308, 4]], 'reg-names': ['base-address', 'int-address'], 'ti,abb_info=
': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, 0, 0, 0, 0, 1313000, 0, 0, 0, 0, 0=
, 1375000, 1, 0, 0, 0, 0, 1389000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: ocp: regulator-abb-iva: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time':=
 [[50]], 'ti,clock-cycles': [[16]], 'status': ['disabled'], 'reg': [[124469=
1416, 8], [1244684304, 4]], 'reg-names': ['base-address', 'int-address']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: prm(a)0: $nodename:0: 'prm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml: prm(a)0: clocks: {'type': =
'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]]=
, 'sys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 't=
i,index-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_=
ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[51]]},=
 'abe_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti=
,mux-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[50]]}, '=
dbgclk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'=
], 'clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk=
_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[15], [17]], 'reg': [[264]]}, 'syc_clk_div_ck(a)100': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[15]], 'reg': [[2=
56]], 'ti,max-div': [[2]], 'phandle': [[144]]}, 'usim_ck(a)1858': {'#clock-=
cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[18]], 'ti,bi=
t-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14], [18]], 'phandle': =
[[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,gat=
e-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg': [[6232]]}, 'trac=
e_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['ti,clkdm-gate-clock'=
], 'clocks': [[20, 0, 24]], 'phandle': [[21]]}, 'bandgap_fclk(a)1888': {'#c=
lock-cells': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[16]], 'ti,=
bit-shift': [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: dsp: {'type': 'object=
'} is not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[150,=
 772, 0]], 'iommus': [[151]], 'resets': [[98, 0]], 'clocks': [[97, 0, 0]], =
'firmware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[152, 153]], 'status': =
['disabled']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: regulator-abb-mpu: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]]=
, 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [=
1244684308, 4], [1241522792, 4]], 'reg-names': ['base-address', 'int-addres=
s', 'efuse-address'], 'ti,abb_info': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, =
0, 0, 0, 0, 1313000, 0, 0, 1048576, 262144, 0, 1375000, 1, 0, 0, 0, 0, 1389=
000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: ocp: regulator-abb-iva: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time':=
 [[50]], 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691416=
, 8], [1244684304, 4], [1241522792, 4]], 'reg-names': ['base-address', 'int=
-address', 'efuse-address'], 'ti,abb_info': [[950000, 0, 0, 0, 0, 0, 114000=
0, 0, 0, 0, 0, 0, 1291000, 0, 0, 2097152, 0, 0, 1375000, 1, 0, 0, 0, 0, 137=
6000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: prm(a)0: $nodename:0: 'prm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml: prm(a)0: clocks: {'type': =
'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]]=
, 'sys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 't=
i,index-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_=
ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[55]]},=
 'abe_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti=
,mux-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[54]]}, '=
dbgclk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'=
], 'clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk=
_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[15], [17]], 'reg': [[264]], 'phandle': [[21]]}, 'syc_clk_div_ck(a)=
100': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[15]], 'reg': [[256]], 'ti,max-div': [[2]], 'phandle': [[143]]}, 'usim_ck=
(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[18]], 'ti,bit-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14],=
 [18]], 'phandle': [[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'co=
mpatible': ['ti,gate-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg=
': [[6232]]}, 'trace_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['t=
i,clkdm-gate-clock'], 'clocks': [[20, 0, 24]], 'phandle': [[23]]}, 'div_ts_=
ck(a)1888': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cl=
ocks': [[21]], 'ti,bit-shift': [[24]], 'reg': [[6280]], 'ti,dividers': [[8]=
, [16], [32]], 'phandle': [[22]]}, 'bandgap_ts_fclk(a)1888': {'#clock-cells=
': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[22]], 'ti,bit-shift'=
: [[8]], 'reg': [[6280]]}}
--
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: $nodename:0: 'ocp' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: bandgap(a)4a002260:re=
g:0: [1241522784, 4, 1241522988, 4, 1241523064, 24] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: dsp: {'type': 'object=
'} is not allowed for {'compatible': ['ti,omap4-dsp'], 'ti,bootreg': [[150,=
 772, 0]], 'iommus': [[151]], 'resets': [[98, 0]], 'clocks': [[97, 0, 0]], =
'firmware-name': ['omap4-dsp-fw.xe64T'], 'mboxes': [[152, 153]], 'status': =
['disabled']}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: regulator-abb-mpu: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_mpu'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[128]], 'clocks': [[15]], 'ti,settling-time': [[50]]=
, 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691408, 8], [=
1244684308, 4], [1241522792, 4]], 'reg-names': ['base-address', 'int-addres=
s', 'efuse-address'], 'ti,abb_info': [[1025000, 0, 0, 0, 0, 0, 1200000, 0, =
0, 0, 0, 0, 1313000, 0, 0, 1048576, 262144, 0, 1375000, 1, 0, 0, 0, 0, 1389=
000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: ocp: regulator-abb-iva: {'=
type': 'object'} is not allowed for {'compatible': ['ti,abb-v2'], 'regulato=
r-name': ['abb_iva'], '#address-cells': [[0]], '#size-cells': [[0]], 'ti,tr=
anxdone-status-mask': [[2147483648]], 'clocks': [[15]], 'ti,settling-time':=
 [[50]], 'ti,clock-cycles': [[16]], 'status': ['okay'], 'reg': [[1244691416=
, 8], [1244684304, 4], [1241522792, 4]], 'reg-names': ['base-address', 'int=
-address', 'efuse-address'], 'ti,abb_info': [[950000, 0, 0, 0, 0, 0, 114000=
0, 0, 0, 0, 0, 0, 1291000, 0, 0, 2097152, 0, 0, 1375000, 1, 0, 0, 0, 0, 137=
6000, 1, 0, 0, 0, 0]]}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: interconnect(a)4a300000: $=
nodename:0: 'interconnect(a)4a300000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)0: $nodename:0: =
'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: segment(a)0: 'anyOf' condi=
tional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: prm(a)0: $nodename:0: 'prm=
(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f=
]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml: prm(a)0: clocks: {'type': =
'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]]=
, 'sys_clkin_ck(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[8], [9], [10], [11], [12], [13], [14]], 'reg': [[272]], 't=
i,index-starts-at-one': True, 'phandle': [[15]]}, 'abe_dpll_bypass_clk_mux_=
ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[15], [16]], 'ti,bit-shift': [[24]], 'reg': [[264]], 'phandle': [[55]]},=
 'abe_dpll_refclk_mux_ck(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti=
,mux-clock'], 'clocks': [[15], [16]], 'reg': [[268]], 'phandle': [[54]]}, '=
dbgclk_mux_ck': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'=
], 'clocks': [[15]], 'clock-mult': [[1]], 'clock-div': [[1]]}, 'l4_wkup_clk=
_mux_ck(a)108': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[15], [17]], 'reg': [[264]], 'phandle': [[21]]}, 'syc_clk_div_ck(a)=
100': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[15]], 'reg': [[256]], 'ti,max-div': [[2]], 'phandle': [[143]]}, 'usim_ck=
(a)1858': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[18]], 'ti,bit-shift': [[24]], 'reg': [[6232]], 'ti,dividers': [[14],=
 [18]], 'phandle': [[19]]}, 'usim_fclk(a)1858': {'#clock-cells': [[0]], 'co=
mpatible': ['ti,gate-clock'], 'clocks': [[19]], 'ti,bit-shift': [[8]], 'reg=
': [[6232]]}, 'trace_clk_div_ck': {'#clock-cells': [[0]], 'compatible': ['t=
i,clkdm-gate-clock'], 'clocks': [[20, 0, 24]], 'phandle': [[23]]}, 'div_ts_=
ck(a)1888': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cl=
ocks': [[21]], 'ti,bit-shift': [[24]], 'reg': [[6280]], 'ti,dividers': [[8]=
, [16], [32]], 'phandle': [[22]]}, 'bandgap_ts_fclk(a)1888': {'#clock-cells=
': [[0]], 'compatible': ['ti,gate-clock'], 'clocks': [[22]], 'ti,bit-shift'=
: [[8]], 'reg': [[6280]]}}

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1472900220414478267==--

