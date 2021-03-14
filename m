Content-Type: multipart/mixed; boundary="===============8076401027764097293=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap:omap-for-v5.13/genpd-drop-legacy 38/45] dtbs_check: arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: interconnect@4ae00000: $nodename:0: 'interconnect@4ae00000' does not match
Date: Sun, 14 Mar 2021 16:12:13 +0800
Message-ID: <202103141611.OzLkWFEL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8076401027764097293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-omap(a)vger.kernel.org
TO: Tony Lindgren <tony@atomide.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.g=
it omap-for-v5.13/genpd-drop-legacy
head:   569519de002fafde35f889a8ea0348eae6ccc20f
commit: 9a75368b6426739e8b798592f084cb682d760568 [38/45] ARM: dts: Configur=
e simple-pm-bus for dra7 l4_wkup
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: l4per-clkctrl(a)28: 'clocks=
' is a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: phy(a)4000: 'phy-supply' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: phy(a)5000: 'phy-supply' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)100000: $nodename=
:0: 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|=
ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)200000: $nodename=
:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|=
ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: interconnect(a)4ae00000: $n=
odename:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)0: $nodename:0: '=
segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: segment(a)0: 'anyOf' condit=
ional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: prm(a)0: $nodename:0: 'prm(=
a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]=
+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: prm(a)0: clocks: {'type': '=
object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]],=
 'sys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock']=
, 'clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272=
]], 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_m=
ux(a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_=
mux(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks=
': [[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)1=
0c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[11=
2], [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 're=
g': [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)1=
78': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': =
[[113]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_gic=
lk_div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)=
1d8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, =
'abe_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider=
-clock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfcl=
k_mux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#cl=
ock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 't=
i,max-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle=
': [[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible=
': ['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[=
460]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk=
_div(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'c=
locks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-t=
wo': True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]=
], 'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64=
]], 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gp=
u_dclk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-=
two': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells'=
: [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div=
': [[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]=
]}, 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,=
divider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], '=
ti,index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#cloc=
k-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], '=
clock-mult': [[1]], 'clock-div': [[2]], 'phandle': [[179]]}, 'l3init_480m_d=
clk_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'],=
 'clocks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of=
-two': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells'=
: [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div=
': [[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]=
]}, 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,ind=
ex-power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 't=
i,max-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle=
': [[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': [=
'ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]=
], 'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194'=
: {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[1=
7]], 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, '=
phandle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'c=
ompatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], =
'reg': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkout=
mux0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock']=
, 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131],=
 [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [141=
], [142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cel=
ls': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125],=
 [126], [127], [128], [129], [130], [131], [118], [132], [133], [134], [135=
], [136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]}=
, 'clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mu=
x-clock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130=
], [131], [118], [132], [133], [134], [135], [136], [137], [138], [139], [1=
40], [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_s=
ys_gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock']=
, 'clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)18=
0': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52]=
, [55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]]=
, 'compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]},=
 'mlb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power=
-of-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['=
ti,divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]]=
, 'ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-c=
ells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,ma=
x-div': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_=
clk_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'],=
 'clocks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[150]]}=
, 'video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,m=
ux-clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(=
a)16c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [=
[17], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [=
[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264=
]], 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: prm(a)0: clockdomains: {'ty=
pe': 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15.dt.yaml: scm_conf(a)0: compatible: '=
anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: l4per-clkctrl(a)28: '=
clocks' is a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: phy(a)4000: 'phy-supp=
ly' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: phy(a)5000: 'phy-supp=
ly' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)100000: $no=
dename:0: 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|so=
c|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)200000: $no=
dename:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|so=
c|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: interconnect(a)4ae000=
00: $nodename:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)=
?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)0: $nodenam=
e:0: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: segment(a)0: 'anyOf' =
conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: prm(a)0: $nodename:0:=
 'prm(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0=
-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: prm(a)0: clocks: {'ty=
pe': 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': =
[[0]], 'sys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-c=
lock'], 'clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg':=
 [[272]], 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys=
_clk_mux(a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'c=
locks': [[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypas=
s_clk_mux(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], '=
clocks': [[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_m=
ux(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[112], [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': =
{'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]=
], 'reg': [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fc=
lk(a)178': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clo=
cks': [[113]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'a=
be_giclk_div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clo=
ck'], 'clocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_=
div(a)1d8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cl=
ocks': [[22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[14=
6]]}, 'abe_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,d=
ivider-clock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'ad=
c_gfclk_mux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'],=
 'clocks': [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8':=
 {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17=
]], 'ti,max-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'p=
handle': [[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'comp=
atible': ['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 're=
g': [[460]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x=
1_dclk_div(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock=
'], 'clocks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-powe=
r-of-two': True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells'=
: [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div'=
: [[64]], 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]=
}, 'gpu_dclk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clo=
ck'], 'clocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-pow=
er-of-two': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-=
cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,m=
ax-div': [[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': =
[[131]]}, 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible':=
 ['ti,divider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[41=
2]], 'ti,index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {=
'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[11=
8]], 'clock-mult': [[1]], 'clock-div': [[2]], 'phandle': [[179]]}, 'l3init_=
480m_dclk_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cl=
ock'], 'clocks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-po=
wer-of-two': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-=
cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,m=
ax-div': [[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': =
[[137]]}, 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti=
,divider-clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], '=
ti,index-power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': =
{'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120=
]], 'ti,max-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'p=
handle': [[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatib=
le': ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': =
[[436]], 'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(=
a)194': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[17]], 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': T=
rue, 'phandle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0=
]], 'compatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[=
64]], 'reg': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, '=
clkoutmux0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-c=
lock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], =
[131], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140]=
, [141], [142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], =
[125], [126], [127], [128], [129], [130], [131], [118], [132], [133], [134]=
, [135], [136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[=
348]]}, 'clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': [=
'ti,mux-clock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129]=
, [130], [131], [118], [132], [133], [134], [135], [136], [137], [138], [13=
9], [140], [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custe=
fuse_sys_gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-c=
lock'], 'clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_cl=
k(a)180': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks':=
 [[52], [55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells':=
 [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[3=
56]]}, 'mlb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-=
clock'], 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index=
-power-of-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatibl=
e': ['ti,divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [=
[304]], 'ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#c=
lock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], =
'ti,max-div': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'time=
r_sys_clk_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cl=
ock'], 'clocks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[=
150]]}, 'video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': =
['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_cl=
k_mux(a)16c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[17], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cel=
ls': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg':=
 [[264]], 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: prm(a)0: clockdomains=
: {'type': 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revb1.dt.yaml: scm_conf(a)0: compati=
ble: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: l4per-clkctrl(a)28: 'c=
locks' is a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: phy(a)4000: 'phy-suppl=
y' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: phy(a)5000: 'phy-suppl=
y' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)100000: $nod=
ename:0: 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc=
|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)200000: $nod=
ename:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc=
|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: interconnect(a)4ae0000=
0: $nodename:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?=
$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)0: $nodename=
:0: 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: segment(a)0: 'anyOf' c=
onditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: prm(a)0: $nodename:0: =
'prm(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-=
9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: prm(a)0: clocks: {'typ=
e': 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [=
[0]], 'sys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cl=
ock'], 'clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': =
[[272]], 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_=
clk_mux(a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass=
_clk_mux(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'c=
locks': [[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mu=
x(a)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks':=
 [[112], [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {=
'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]]=
, 'reg': [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fcl=
k(a)178': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[113]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'ab=
e_giclk_div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_d=
iv(a)1d8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clo=
cks': [[22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146=
]]}, 'abe_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,di=
vider-clock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc=
_gfclk_mux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], =
'clocks': [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': =
{'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]=
], 'ti,max-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'ph=
andle': [[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compa=
tible': ['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg=
': [[460]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1=
_dclk_div(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power=
-of-two': True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells':=
 [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div':=
 [[64]], 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}=
, 'gpu_dclk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-powe=
r-of-two': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-c=
ells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,ma=
x-div': [[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [=
[131]]}, 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': =
['ti,divider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412=
]], 'ti,index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'=
#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118=
]], 'clock-mult': [[1]], 'clock-div': [[2]], 'phandle': [[178]]}, 'l3init_4=
80m_dclk_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clo=
ck'], 'clocks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-pow=
er-of-two': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-c=
ells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,ma=
x-div': [[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [=
[137]]}, 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,=
divider-clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 't=
i,index-power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {=
'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]=
], 'ti,max-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'ph=
andle': [[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatibl=
e': ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [=
[436]], 'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a=
)194': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[17]], 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]=
], 'compatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[6=
4]], 'reg': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'c=
lkoutmux0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cl=
ock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [=
131], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140],=
 [141], [142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#cloc=
k-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [=
125], [126], [127], [128], [129], [130], [131], [118], [132], [133], [134],=
 [135], [136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[3=
48]]}, 'clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['=
ti,mux-clock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129],=
 [130], [131], [118], [132], [133], [134], [135], [136], [137], [138], [139=
], [140], [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custef=
use_sys_gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-cl=
ock'], 'clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk=
(a)180': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': =
[[52], [55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': =
[[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[35=
6]]}, 'mlb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-c=
lock'], 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-=
power-of-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible=
': ['ti,divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[=
304]], 'ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#cl=
ock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], '=
ti,max-div': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer=
_sys_clk_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clo=
ck'], 'clocks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[1=
50]]}, 'video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': [=
'ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk=
_mux(a)16c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[17], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cell=
s': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': =
[[264]], 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: prm(a)0: clockdomains:=
 {'type': 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-beagle-x15-revc.dt.yaml: scm_conf(a)0: compatib=
le: 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: l4per-clkctrl(a)28: 'cloc=
ks' is a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: phy(a)4000: 'phy-supply' =
does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: phy(a)5000: 'phy-supply' =
does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)100000: $nodena=
me:0: 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|ax=
i|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)200000: $nodena=
me:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|ax=
i|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: interconnect(a)4ae00000: =
$nodename:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)0: $nodename:0:=
 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: segment(a)0: 'anyOf' cond=
itional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: prm(a)0: $nodename:0: 'pr=
m(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-=
f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: prm(a)0: clocks: {'type':=
 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]=
], 'sys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[2=
72]], 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk=
_mux(a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_cl=
k_mux(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a=
)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
112], [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#c=
lock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], '=
reg': [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a=
)178': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[113]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_g=
iclk_div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(=
a)1d8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}=
, 'abe_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gf=
clk_mux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], =
'ti,max-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phand=
le': [[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatib=
le': ['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': =
[[460]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dc=
lk_div(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of=
-two': True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[=
0]], 'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[=
64]], 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, '=
gpu_dclk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-o=
f-two': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-d=
iv': [[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[13=
1]]}, 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['t=
i,divider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]],=
 'ti,index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#cl=
ock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]],=
 'clock-mult': [[1]], 'clock-div': [[2]], 'phandle': [[176]]}, 'l3init_480m=
_dclk_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-=
of-two': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-d=
iv': [[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[13=
7]]}, 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,div=
ider-clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,i=
ndex-power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#c=
lock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], =
'ti,max-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phand=
le': [[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible':=
 ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[43=
6]], 'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)19=
4': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [=
[17]], 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True,=
 'phandle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], =
'compatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]]=
, 'reg': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clko=
utmux0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131=
], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [1=
41], [142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-c=
ells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125=
], [126], [127], [128], [129], [130], [131], [118], [132], [133], [134], [1=
35], [136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]=
]}, 'clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,=
mux-clock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [1=
30], [131], [118], [132], [133], [134], [135], [136], [137], [138], [139], =
[140], [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse=
_sys_gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock=
'], 'clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)=
180': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[5=
2], [55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0=
]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]=
}, 'mlb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-pow=
er-of-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': =
['ti,divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304=
]], 'ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock=
-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,=
max-div': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sy=
s_clk_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[149]=
]}, 'video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti=
,mux-clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mu=
x(a)16c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks':=
 [[17], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells':=
 [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[2=
64]], 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: prm(a)0: clockdomains: {'=
type': 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am5729-beagleboneai.dt.yaml: scm_conf(a)0: compatible:=
 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: l4per-clkctrl(a)28: 'cloc=
ks' is a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: phy(a)4000: 'phy-supply' =
does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: phy(a)5000: 'phy-supply' =
does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)100000: $nodena=
me:0: 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|ax=
i|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)200000: $nodena=
me:0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|ax=
i|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: interconnect(a)4ae00000: =
$nodename:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)0: $nodename:0:=
 'segment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: segment(a)0: 'anyOf' cond=
itional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: prm(a)0: $nodename:0: 'pr=
m(a)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-=
f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: prm(a)0: clocks: {'type':=
 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]=
], 'sys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[2=
72]], 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk=
_mux(a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_cl=
k_mux(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a=
)10c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
112], [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#c=
lock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], '=
reg': [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a=
)178': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[113]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_g=
iclk_div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(=
a)1d8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}=
, 'abe_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gf=
clk_mux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cl=
ocks': [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], =
'ti,max-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phand=
le': [[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatib=
le': ['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': =
[[460]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dc=
lk_div(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of=
-two': True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[=
0]], 'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[=
64]], 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, '=
gpu_dclk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-o=
f-two': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-d=
iv': [[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[13=
1]]}, 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['t=
i,divider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]],=
 'ti,index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#cl=
ock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]],=
 'clock-mult': [[1]], 'clock-div': [[2]], 'phandle': [[174]]}, 'l3init_480m=
_dclk_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-=
of-two': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-d=
iv': [[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[13=
7]]}, 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,div=
ider-clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,i=
ndex-power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#c=
lock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], =
'ti,max-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phand=
le': [[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible':=
 ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[43=
6]], 'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)19=
4': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [=
[17]], 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True,=
 'phandle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], =
'compatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]]=
, 'reg': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clko=
utmux0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131=
], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [1=
41], [142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-c=
ells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125=
], [126], [127], [128], [129], [130], [131], [118], [132], [133], [134], [1=
35], [136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]=
]}, 'clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,=
mux-clock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [1=
30], [131], [118], [132], [133], [134], [135], [136], [137], [138], [139], =
[140], [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse=
_sys_gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock=
'], 'clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)=
180': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[5=
2], [55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0=
]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]=
}, 'mlb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-pow=
er-of-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': =
['ti,divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304=
]], 'ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock=
-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,=
max-div': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sy=
s_clk_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[149]=
]}, 'video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti=
,mux-clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mu=
x(a)16c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks':=
 [[17], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells':=
 [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[2=
64]], 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: prm(a)0: clockdomains: {'=
type': 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-cl-som-am57x.dt.yaml: scm_conf(a)0: compatible:=
 'anyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: l4per-clkctrl(a)28: 'clocks'=
 is a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: phy(a)4000: 'phy-supply' doe=
s not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: phy(a)5000: 'phy-supply' doe=
s not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)100000: $nodename:=
0: 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|a=
hb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)200000: $nodename:=
0: 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|a=
hb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: interconnect(a)4ae00000: $no=
dename:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)0: $nodename:0: 's=
egment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: segment(a)0: 'anyOf' conditi=
onal failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: prm(a)0: $nodename:0: 'prm(a=
)0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+=
)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: prm(a)0: clocks: {'type': 'o=
bject'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], =
'sys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'],=
 'clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272]=
], 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_mu=
x(a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks':=
 [[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_m=
ux(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)10=
c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112=
], [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#cloc=
k-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 'reg=
': [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)17=
8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [=
[113]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_gicl=
k_div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], '=
clocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1=
d8': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': =
[[22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, '=
abe_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-=
clock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk=
_mux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti=
,max-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle'=
: [[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible'=
: ['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[4=
60]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk_=
div(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cl=
ocks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-tw=
o': True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64]=
], 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gpu=
_dclk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], '=
clocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-t=
wo': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells':=
 [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div'=
: [[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]]=
}, 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,d=
ivider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], 't=
i,index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#clock=
-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], 'c=
lock-mult': [[1]], 'clock-div': [[2]], 'phandle': [[180]]}, 'l3init_480m_dc=
lk_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-=
two': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells':=
 [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div'=
: [[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]]=
}, 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divide=
r-clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,inde=
x-power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#cloc=
k-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 'ti=
,max-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle'=
: [[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['=
ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]]=
, 'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194':=
 {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17=
]], 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'p=
handle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'co=
mpatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], '=
reg': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkoutm=
ux0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'],=
 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131], =
[118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [141]=
, [142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cell=
s': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125], =
[126], [127], [128], [129], [130], [131], [118], [132], [133], [134], [135]=
, [136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]},=
 'clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux=
-clock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130]=
, [131], [118], [132], [133], [134], [135], [136], [137], [138], [139], [14=
0], [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_sy=
s_gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'],=
 'clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180=
': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52],=
 [55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]],=
 'compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]}, =
'mlb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-=
of-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['t=
i,divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]],=
 'ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-ce=
lls': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max=
-div': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_c=
lk_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[151]]},=
 'video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mu=
x-clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a=
)16c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
17], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[=
0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264]=
], 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: prm(a)0: clockdomains: {'typ=
e': 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am57xx-sbc-am57x.dt.yaml: scm_conf(a)0: compatible: 'a=
nyOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am572x-idk.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a =
dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: phy(a)4000: 'phy-supply' does not =
match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: phy(a)5000: 'phy-supply' does not =
match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)100000: $nodename:0: 'se=
gment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb=
)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)200000: $nodename:0: 'se=
gment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb=
)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am572x-idk.dt.yaml: interconnect(a)4ae00000: $nodename=
:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)0: $nodename:0: 'segment=
(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am572x-idk.dt.yaml: segment(a)0: 'anyOf' conditional f=
ailed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: prm(a)0: clocks: {'type': 'object'=
} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_c=
lkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272]], 'ti=
,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_mux(a)11=
8': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17]=
, [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_mux(a)1=
14': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[11=
2], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)10c': {'=
#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112], [80=
]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 'reg': [[2=
84]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)178': {'=
#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[113]]=
, 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_giclk_div(=
a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {=
'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]]=
, 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, 'abe_sy=
s_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a=
)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cel=
ls': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti,max-d=
iv': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[12=
3]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti=
,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[460]], =
'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk_div(a)=
1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'com=
patible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64]], 're=
g': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gpu_dclk(=
a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': T=
rue, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div': [[64=
]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]]}, 'gm=
ac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider=
-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,inde=
x-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#clock-cells=
': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], 'clock-m=
ult': [[1]], 'clock-div': [[2]], 'phandle': [[181]]}, 'l3init_480m_dclk_div=
(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': =
True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div': [[64=
]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]]}, 'sa=
ta_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-powe=
r-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 'ti,max-d=
iv': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[13=
9]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,div=
ider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,=
index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194': {'#cl=
ock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 't=
i,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle=
': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatib=
le': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], 'reg': =
[[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkoutmux0_cl=
k_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[123], [124], [125], [126], [127], [128], [129], [130], [131], [118],=
 [132], [133], [134], [135], [136], [137], [138], [139], [140], [141], [142=
], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[=
0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125], [126],=
 [127], [128], [129], [130], [131], [118], [132], [133], [134], [135], [136=
], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]}, 'clko=
utmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131=
], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [1=
41], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_sys_gfcl=
k_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'cloc=
ks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#=
clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52], [55]]=
, 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'comp=
atible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]}, 'mlb_c=
lk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clo=
cks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two=
': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divi=
der-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,i=
ndex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': =
[[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max-div':=
 [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div=
(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[152]]}, 'vide=
o1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c':=
 {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [=
111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], '=
compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264]], 'ph=
andle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: prm(a)0: clockdomains: {'type': 'o=
bject'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am572x-idk.dt.yaml: scm_conf(a)0: compatible: 'anyOf' =
conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am571x-idk.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a =
dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: phy(a)4000: 'phy-supply' does not =
match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: phy(a)5000: 'phy-supply' does not =
match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)100000: $nodename:0: 'se=
gment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb=
)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)200000: $nodename:0: 'se=
gment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb=
)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am571x-idk.dt.yaml: interconnect(a)4ae00000: $nodename=
:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)0: $nodename:0: 'segment=
(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am571x-idk.dt.yaml: segment(a)0: 'anyOf' conditional f=
ailed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: prm(a)0: clocks: {'type': 'object'=
} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_c=
lkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272]], 'ti=
,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_mux(a)11=
8': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17]=
, [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_mux(a)1=
14': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[11=
2], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)10c': {'=
#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112], [80=
]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 'reg': [[2=
84]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)178': {'=
#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[113]]=
, 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_giclk_div(=
a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {=
'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]]=
, 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, 'abe_sy=
s_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a=
)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cel=
ls': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti,max-d=
iv': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[12=
3]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti=
,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[460]], =
'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk_div(a)=
1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'com=
patible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64]], 're=
g': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gpu_dclk(=
a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': T=
rue, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div': [[64=
]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]]}, 'gm=
ac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider=
-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,inde=
x-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#clock-cells=
': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], 'clock-m=
ult': [[1]], 'clock-div': [[2]], 'phandle': [[184]]}, 'l3init_480m_dclk_div=
(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': =
True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div': [[64=
]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]]}, 'sa=
ta_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-powe=
r-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 'ti,max-d=
iv': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[13=
9]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,div=
ider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,=
index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194': {'#cl=
ock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 't=
i,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle=
': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatib=
le': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], 'reg': =
[[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkoutmux0_cl=
k_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[123], [124], [125], [126], [127], [128], [129], [130], [131], [118],=
 [132], [133], [134], [135], [136], [137], [138], [139], [140], [141], [142=
], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[=
0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125], [126],=
 [127], [128], [129], [130], [131], [118], [132], [133], [134], [135], [136=
], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]}, 'clko=
utmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131=
], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [1=
41], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_sys_gfcl=
k_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'cloc=
ks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#=
clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52], [55]]=
, 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'comp=
atible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]}, 'mlb_c=
lk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clo=
cks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two=
': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divi=
der-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,i=
ndex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': =
[[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max-div':=
 [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div=
(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[152]]}, 'vide=
o1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c':=
 {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [=
111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], '=
compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264]], 'ph=
andle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: prm(a)0: clockdomains: {'type': 'o=
bject'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am571x-idk.dt.yaml: scm_conf(a)0: compatible: 'anyOf' =
conditional failed, one must be fixed:
--
   arch/arm/boot/dts/am574x-idk.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a =
dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: phy(a)4000: 'phy-supply' does not =
match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: phy(a)5000: 'phy-supply' does not =
match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)100000: $nodename:0: 'se=
gment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb=
)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)200000: $nodename:0: 'se=
gment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb=
)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/am574x-idk.dt.yaml: interconnect(a)4ae00000: $nodename=
:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)0: $nodename:0: 'segment=
(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/am574x-idk.dt.yaml: segment(a)0: 'anyOf' conditional f=
ailed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' do=
es not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: prm(a)0: clocks: {'type': 'object'=
} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_c=
lkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[106], [107], [108], [109], [110], [111], [112]], 'reg': [[272]], 'ti=
,index-starts-at-one': True, 'phandle': [[21]]}, 'abe_dpll_sys_clk_mux(a)11=
8': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[21]=
, [113]], 'reg': [[280]], 'phandle': [[114]]}, 'abe_dpll_bypass_clk_mux(a)1=
14': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[11=
4], [82]], 'reg': [[276]], 'phandle': [[23]]}, 'abe_dpll_clk_mux(a)10c': {'=
#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[114], [82=
]], 'reg': [[268]], 'phandle': [[22]]}, 'abe_24m_fclk(a)11c': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[26]], 'reg': [[2=
84]], 'ti,dividers': [[8], [16]], 'phandle': [[90]]}, 'aess_fclk(a)178': {'=
#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]]=
, 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[116]]}, 'abe_giclk_div(=
a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[116]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {=
'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[26]]=
, 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[148]]}, 'abe_sy=
s_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[21]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a=
)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[=
21], [113], [82]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cel=
ls': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[21]], 'ti,max-d=
iv': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[12=
5]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti=
,divider-clock'], 'clocks': [[113]], 'ti,max-div': [[64]], 'reg': [[460]], =
'ti,index-power-of-two': True, 'phandle': [[126]]}, 'per_abe_x1_dclk_div(a)=
1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[117]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[127]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'com=
patible': ['ti,divider-clock'], 'clocks': [[37]], 'ti,max-div': [[64]], 're=
g': [[396]], 'ti,index-power-of-two': True, 'phandle': [[129]]}, 'gpu_dclk(=
a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[44]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': T=
rue, 'phandle': [[131]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[118]], 'ti,max-div': [[64=
]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[133]]}, 'gm=
ac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider=
-clock'], 'clocks': [[119]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,inde=
x-power-of-two': True, 'phandle': [[120]]}, 'gmac_main_clk': {'#clock-cells=
': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[120]], 'clock-m=
ult': [[1]], 'clock-div': [[2]], 'phandle': [[181]]}, 'l3init_480m_dclk_div=
(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[79]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': =
True, 'phandle': [[138]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]]=
, 'compatible': ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64=
]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[139]]}, 'sa=
ta_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cloc=
k'], 'clocks': [[21]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-powe=
r-of-two': True, 'phandle': [[140]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-d=
iv': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[14=
1]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,div=
ider-clock'], 'clocks': [[123]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,=
index-power-of-two': True, 'phandle': [[142]]}, 'emu_dclk_div(a)194': {'#cl=
ock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[21]], 't=
i,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle=
': [[143]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatib=
le': ['ti,divider-clock'], 'clocks': [[124]], 'ti,max-div': [[64]], 'reg': =
[[452]], 'ti,index-power-of-two': True, 'phandle': [[144]]}, 'clkoutmux0_cl=
k_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'cloc=
ks': [[125], [126], [127], [128], [129], [130], [131], [132], [133], [120],=
 [134], [135], [136], [137], [138], [139], [140], [141], [142], [143], [144=
], [145]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[=
0]], 'compatible': ['ti,mux-clock'], 'clocks': [[125], [126], [127], [128],=
 [129], [130], [131], [132], [133], [120], [134], [135], [136], [137], [138=
], [139], [140], [141], [142], [143], [144], [145]], 'reg': [[348]]}, 'clko=
utmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[125], [126], [127], [128], [129], [130], [131], [132], [133=
], [120], [134], [135], [136], [137], [138], [139], [140], [141], [142], [1=
43], [144], [145]], 'reg': [[352]], 'phandle': [[80]]}, 'custefuse_sys_gfcl=
k_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'cloc=
ks': [[21]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#=
clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[55], [58]]=
, 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'comp=
atible': ['ti,mux-clock'], 'clocks': [[21], [113]], 'reg': [[356]]}, 'mlb_c=
lk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clo=
cks': [[146]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two=
': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divi=
der-clock'], 'clocks': [[147]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,i=
ndex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': =
[[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[117]], 'ti,max-div':=
 [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div=
(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[21]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[154]]}, 'vide=
o1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-cloc=
k'], 'clocks': [[21], [113]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c':=
 {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[21], [=
113]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], '=
compatible': ['ti,mux-clock'], 'clocks': [[21], [148]], 'reg': [[264]], 'ph=
andle': [[87]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: prm(a)0: clockdomains: {'type': 'o=
bject'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/am574x-idk.dt.yaml: scm_conf(a)0: compatible: 'anyOf' =
conditional failed, one must be fixed:
--
   arch/arm/boot/dts/dra7-evm.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a de=
pendency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: phy(a)4000: 'phy-supply' does not ma=
tch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: phy(a)5000: 'phy-supply' does not ma=
tch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)100000: $nodename:0: 'segm=
ent(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(=
@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)200000: $nodename:0: 'segm=
ent(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(=
@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/dra7-evm.dt.yaml: interconnect(a)4ae00000: $nodename:0=
: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(a=
)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra7-evm.dt.yaml: segment(a)0: 'anyOf' conditional fai=
led, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' does=
 not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: prm(a)0: clocks: {'type': 'object'} =
is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_clk=
in1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks=
': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272]], 'ti,i=
ndex-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_mux(a)118'=
: {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], =
[111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_mux(a)114=
': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112]=
, [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)10c': {'#c=
lock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112], [80]]=
, 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#clock-cells'=
: [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 'reg': [[284=
]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)178': {'#c=
lock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[113]], =
'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_giclk_div(a)=
174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], =
'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, 'abe_sys_=
clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'],=
 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a)1=
dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17=
], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti,max-div=
': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[123]=
]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti,d=
ivider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[460]], 't=
i,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk_div(a)1b=
c': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [=
[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': True=
, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'compa=
tible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64]], 'reg'=
: [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gpu_dclk(a)=
1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks':=
 [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': Tru=
e, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]], =
'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div': [[64]]=
, 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]]}, 'gmac=
_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider-c=
lock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,index-=
power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#clock-cells':=
 [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], 'clock-mul=
t': [[1]], 'clock-div': [[2]], 'phandle': [[203]]}, 'l3init_480m_dclk_div(a=
)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]], =
'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div': [[64]]=
, 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]]}, 'sata=
_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'=
], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-power-=
of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cells'=
: [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 'ti,max-div=
': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[139]=
]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,in=
dex-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194': {'#cloc=
k-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti,=
max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle':=
 [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatible=
': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], 'reg': [[=
452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkoutmux0_clk_=
mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks=
': [[123], [124], [125], [126], [127], [128], [129], [130], [131], [118], [=
132], [133], [134], [135], [136], [137], [138], [139], [140], [141], [142],=
 [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[0]=
], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125], [126], [=
127], [128], [129], [130], [131], [118], [132], [133], [134], [135], [136],=
 [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]}, 'clkout=
mux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock']=
, 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131],=
 [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [141=
], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_sys_gfclk_=
div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks=
': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#cl=
ock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52], [55]], =
'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'compat=
ible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]}, 'mlb_clk=
(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clock=
s': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two':=
 True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divide=
r-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,ind=
ex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': [[=
0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max-div': [=
[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div(a=
)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[151]]}, 'video1=
_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'=
], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c': {=
'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [11=
1]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], 'co=
mpatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264]], 'phan=
dle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: prm(a)0: clockdomains: {'type': 'obj=
ect'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra7-evm.dt.yaml: scm_conf(a)0: compatible: 'anyOf' co=
nditional failed, one must be fixed:
--
   arch/arm/boot/dts/dra72-evm.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a d=
ependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: phy(a)4000: 'phy-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: phy(a)5000: 'phy-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)100000: $nodename:0: 'seg=
ment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)=
(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)200000: $nodename:0: 'seg=
ment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)=
(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/dra72-evm.dt.yaml: interconnect(a)4ae00000: $nodename:=
0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: prm(a)0: clocks: {'type': 'object'}=
 is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_cl=
kin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272]], 'ti,=
index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_mux(a)118=
': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17],=
 [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_mux(a)11=
4': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112=
], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)10c': {'#=
clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112], [80]=
], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 'reg': [[28=
4]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)178': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[113]],=
 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_giclk_div(a=
)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {'=
#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]],=
 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, 'abe_sys=
_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a)=
1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[1=
7], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti,max-di=
v': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[123=
]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti,=
divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[460]], '=
ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk_div(a)1=
bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': =
[[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': Tru=
e, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'comp=
atible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64]], 'reg=
': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gpu_dclk(a=
)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]],=
 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div': [[64]=
], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]]}, 'gma=
c_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider-=
clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,index=
-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#clock-cells'=
: [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], 'clock-mu=
lt': [[1]], 'clock-div': [[2]], 'phandle': [[195]]}, 'l3init_480m_dclk_div(=
a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': T=
rue, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]],=
 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div': [[64]=
], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]]}, 'sat=
a_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock=
'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-power=
-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 'ti,max-di=
v': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[139=
]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,divi=
der-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,i=
ndex-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti=
,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle'=
: [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatibl=
e': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], 'reg': [=
[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkoutmux0_clk=
_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[123], [124], [125], [126], [127], [128], [129], [130], [131], [118], =
[132], [133], [134], [135], [136], [137], [138], [139], [140], [141], [142]=
, [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[0=
]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125], [126], =
[127], [128], [129], [130], [131], [118], [132], [133], [134], [135], [136]=
, [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]}, 'clkou=
tmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'=
], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131]=
, [118], [132], [133], [134], [135], [136], [137], [138], [139], [140], [14=
1], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_sys_gfclk=
_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clock=
s': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#c=
lock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52], [55]],=
 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'compa=
tible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]}, 'mlb_cl=
k(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two'=
: True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,in=
dex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max-div': =
[[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div(=
a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[151]]}, 'video=
1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c': =
{'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [1=
11]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], 'c=
ompatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264]], 'pha=
ndle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: prm(a)0: clockdomains: {'type': 'ob=
ject'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm.dt.yaml: scm_conf(a)0: compatible: 'anyOf' c=
onditional failed, one must be fixed:
--
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: l4per-clkctrl(a)28: 'clocks' i=
s a dependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: phy(a)4000: 'phy-supply' does =
not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: phy(a)5000: 'phy-supply' does =
not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)100000: $nodename:0:=
 'segment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb=
|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)200000: $nodename:0:=
 'segment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb=
|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/dra72-evm-revc.dt.yaml: interconnect(a)4ae00000: $node=
name:0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)0: $nodename:0: 'seg=
ment(a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra72-evm-revc.dt.yaml: segment(a)0: 'anyOf' condition=
al failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0=
' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?=
$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: prm(a)0: clocks: {'type': 'obj=
ect'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 's=
ys_clkin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], '=
clocks': [[104], [105], [106], [107], [108], [109], [110]], 'reg': [[272]],=
 'ti,index-starts-at-one': True, 'phandle': [[17]]}, 'abe_dpll_sys_clk_mux(=
a)118': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [=
[17], [111]], 'reg': [[280]], 'phandle': [[112]]}, 'abe_dpll_bypass_clk_mux=
(a)114': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': =
[[112], [80]], 'reg': [[276]], 'phandle': [[19]]}, 'abe_dpll_clk_mux(a)10c'=
: {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[112],=
 [80]], 'reg': [[268]], 'phandle': [[18]]}, 'abe_24m_fclk(a)11c': {'#clock-=
cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[22]], 'reg':=
 [[284]], 'ti,dividers': [[8], [16]], 'phandle': [[88]]}, 'aess_fclk(a)178'=
: {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[1=
13]], 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[114]]}, 'abe_giclk_=
div(a)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cl=
ocks': [[114]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8=
': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[=
22]], 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[146]]}, 'ab=
e_sys_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-cl=
ock'], 'clocks': [[17]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_m=
ux(a)1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks'=
: [[17], [111], [80]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock=
-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]], 'ti,m=
ax-div': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': =
[[123]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': =
['ti,divider-clock'], 'clocks': [[111]], 'ti,max-div': [[64]], 'reg': [[460=
]], 'ti,index-power-of-two': True, 'phandle': [[124]]}, 'per_abe_x1_dclk_di=
v(a)1bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[115]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two'=
: True, 'phandle': [[125]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], =
'compatible': ['ti,divider-clock'], 'clocks': [[33]], 'ti,max-div': [[64]],=
 'reg': [[396]], 'ti,index-power-of-two': True, 'phandle': [[127]]}, 'gpu_d=
clk(a)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cl=
ocks': [[40]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two=
': True, 'phandle': [[129]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[116]], 'ti,max-div': =
[[64]], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[131]]},=
 'gmac_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,div=
ider-clock'], 'clocks': [[117]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,=
index-power-of-two': True, 'phandle': [[118]]}, 'gmac_main_clk': {'#clock-c=
ells': [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[118]], 'clo=
ck-mult': [[1]], 'clock-div': [[2]], 'phandle': [[198]]}, 'l3init_480m_dclk=
_div(a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'c=
locks': [[77]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-tw=
o': True, 'phandle': [[136]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-div': =
[[64]], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[137]]},=
 'sata_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-=
clock'], 'clocks': [[17]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-=
power-of-two': True, 'phandle': [[138]]}, 'pcie2_dclk_div(a)1b8': {'#clock-=
cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[120]], 'ti,m=
ax-div': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': =
[[139]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti=
,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [[436]], =
'ti,index-power-of-two': True, 'phandle': [[140]]}, 'emu_dclk_div(a)194': {=
'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[17]]=
, 'ti,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'pha=
ndle': [[141]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'comp=
atible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-div': [[64]], 're=
g': [[452]], 'ti,index-power-of-two': True, 'phandle': [[142]]}, 'clkoutmux=
0_clk_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], '=
clocks': [[123], [124], [125], [126], [127], [128], [129], [130], [131], [1=
18], [132], [133], [134], [135], [136], [137], [138], [139], [140], [141], =
[142], [143]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells'=
: [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[123], [124], [125], [1=
26], [127], [128], [129], [130], [131], [118], [132], [133], [134], [135], =
[136], [137], [138], [139], [140], [141], [142], [143]], 'reg': [[348]]}, '=
clkoutmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-c=
lock'], 'clocks': [[123], [124], [125], [126], [127], [128], [129], [130], =
[131], [118], [132], [133], [134], [135], [136], [137], [138], [139], [140]=
, [141], [142], [143]], 'reg': [[352]], 'phandle': [[78]]}, 'custefuse_sys_=
gfclk_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], '=
clocks': [[17]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180':=
 {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[52], [=
55]], 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], '=
compatible': ['ti,mux-clock'], 'clocks': [[17], [111]], 'reg': [[356]]}, 'm=
lb_clk(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], =
'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of=
-two': True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,=
divider-clock'], 'clocks': [[145]], 'ti,max-div': [[64]], 'reg': [[304]], '=
ti,index-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max-d=
iv': [[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk=
_div(a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'c=
locks': [[17]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[151]]}, '=
video1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-=
clock'], 'clocks': [[17], [111]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)1=
6c': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[17=
], [111]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]=
], 'compatible': ['ti,mux-clock'], 'clocks': [[17], [146]], 'reg': [[264]],=
 'phandle': [[85]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: prm(a)0: clockdomains: {'type'=
: 'object'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml: scm_conf(a)0: compatible: 'any=
Of' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/dra71-evm.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a d=
ependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: phy(a)4000: 'phy-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: phy(a)5000: 'phy-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)100000: $nodename:0: 'seg=
ment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)=
(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)200000: $nodename:0: 'seg=
ment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)=
(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/dra71-evm.dt.yaml: interconnect(a)4ae00000: $nodename:=
0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra71-evm.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: prm(a)0: clocks: {'type': 'object'}=
 is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_cl=
kin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[103], [104], [105], [106], [107], [108], [109]], 'reg': [[272]], 'ti,=
index-starts-at-one': True, 'phandle': [[16]]}, 'abe_dpll_sys_clk_mux(a)118=
': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[16],=
 [110]], 'reg': [[280]], 'phandle': [[111]]}, 'abe_dpll_bypass_clk_mux(a)11=
4': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[111=
], [79]], 'reg': [[276]], 'phandle': [[18]]}, 'abe_dpll_clk_mux(a)10c': {'#=
clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[111], [79]=
], 'reg': [[268]], 'phandle': [[17]]}, 'abe_24m_fclk(a)11c': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[21]], 'reg': [[28=
4]], 'ti,dividers': [[8], [16]], 'phandle': [[87]]}, 'aess_fclk(a)178': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[112]],=
 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[113]]}, 'abe_giclk_div(a=
)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[113]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {'=
#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[21]],=
 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[145]]}, 'abe_sys=
_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[16]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a)=
1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[1=
6], [110], [79]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[16]], 'ti,max-di=
v': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[122=
]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti,=
divider-clock'], 'clocks': [[110]], 'ti,max-div': [[64]], 'reg': [[460]], '=
ti,index-power-of-two': True, 'phandle': [[123]]}, 'per_abe_x1_dclk_div(a)1=
bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': =
[[114]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': Tru=
e, 'phandle': [[124]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'comp=
atible': ['ti,divider-clock'], 'clocks': [[32]], 'ti,max-div': [[64]], 'reg=
': [[396]], 'ti,index-power-of-two': True, 'phandle': [[126]]}, 'gpu_dclk(a=
)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[39]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[128]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]],=
 'compatible': ['ti,divider-clock'], 'clocks': [[115]], 'ti,max-div': [[64]=
], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[130]]}, 'gma=
c_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider-=
clock'], 'clocks': [[116]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,index=
-power-of-two': True, 'phandle': [[117]]}, 'gmac_main_clk': {'#clock-cells'=
: [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[117]], 'clock-mu=
lt': [[1]], 'clock-div': [[2]], 'phandle': [[196]]}, 'l3init_480m_dclk_div(=
a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[76]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': T=
rue, 'phandle': [[135]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]],=
 'compatible': ['ti,divider-clock'], 'clocks': [[118]], 'ti,max-div': [[64]=
], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[136]]}, 'sat=
a_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock=
'], 'clocks': [[16]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-power=
-of-two': True, 'phandle': [[137]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[119]], 'ti,max-di=
v': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[138=
]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,divi=
der-clock'], 'clocks': [[120]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,i=
ndex-power-of-two': True, 'phandle': [[139]]}, 'emu_dclk_div(a)194': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[16]], 'ti=
,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle'=
: [[140]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatibl=
e': ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]], 'reg': [=
[452]], 'ti,index-power-of-two': True, 'phandle': [[141]]}, 'clkoutmux0_clk=
_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[122], [123], [124], [125], [126], [127], [128], [129], [130], [117], =
[131], [132], [133], [134], [135], [136], [137], [138], [139], [140], [141]=
, [142]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[0=
]], 'compatible': ['ti,mux-clock'], 'clocks': [[122], [123], [124], [125], =
[126], [127], [128], [129], [130], [117], [131], [132], [133], [134], [135]=
, [136], [137], [138], [139], [140], [141], [142]], 'reg': [[348]]}, 'clkou=
tmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'=
], 'clocks': [[122], [123], [124], [125], [126], [127], [128], [129], [130]=
, [117], [131], [132], [133], [134], [135], [136], [137], [138], [139], [14=
0], [141], [142]], 'reg': [[352]], 'phandle': [[77]]}, 'custefuse_sys_gfclk=
_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clock=
s': [[16]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#c=
lock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[51], [54]],=
 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'compa=
tible': ['ti,mux-clock'], 'clocks': [[16], [110]], 'reg': [[356]]}, 'mlb_cl=
k(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[143]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two'=
: True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[144]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,in=
dex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[114]], 'ti,max-div': =
[[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div(=
a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[16]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[150]]}, 'video=
1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[16], [110]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c': =
{'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[16], [1=
10]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], 'c=
ompatible': ['ti,mux-clock'], 'clocks': [[16], [145]], 'reg': [[264]], 'pha=
ndle': [[84]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: prm(a)0: clockdomains: {'type': 'ob=
ject'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra71-evm.dt.yaml: scm_conf(a)0: compatible: 'anyOf' c=
onditional failed, one must be fixed:
--
   arch/arm/boot/dts/dra76-evm.dt.yaml: l4per-clkctrl(a)28: 'clocks' is a d=
ependency of 'assigned-clocks'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/cl=
ock/clock.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: phy(a)4000: 'phy-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: phy(a)5000: 'phy-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)100000: $nodename:0: 'seg=
ment(a)100000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)=
(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)200000: $nodename:0: 'seg=
ment(a)200000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)=
(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
>> arch/arm/boot/dts/dra76-evm.dt.yaml: interconnect(a)4ae00000: $nodename:=
0: 'interconnect(a)4ae00000' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)0: $nodename:0: 'segment(=
a)0' does not match '^bus(@[0-9a-f]+)?$'
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/dra76-evm.dt.yaml: segment(a)0: 'anyOf' conditional fa=
iled, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	From schema: Documentation/devicetree/bindings/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: prm(a)0: $nodename:0: 'prm(a)0' doe=
s not match '^([a-z][a-z0-9\\-]+-bus|bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: prm(a)0: clocks: {'type': 'object'}=
 is not allowed for {'#address-cells': [[1]], '#size-cells': [[0]], 'sys_cl=
kin1(a)110': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[106], [107], [108], [109], [110], [111], [112]], 'reg': [[272]], 'ti,=
index-starts-at-one': True, 'phandle': [[21]]}, 'abe_dpll_sys_clk_mux(a)118=
': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[21],=
 [113]], 'reg': [[280]], 'phandle': [[114]]}, 'abe_dpll_bypass_clk_mux(a)11=
4': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[114=
], [82]], 'reg': [[276]], 'phandle': [[23]]}, 'abe_dpll_clk_mux(a)10c': {'#=
clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[114], [82]=
], 'reg': [[268]], 'phandle': [[22]]}, 'abe_24m_fclk(a)11c': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[26]], 'reg': [[28=
4]], 'ti,dividers': [[8], [16]], 'phandle': [[90]]}, 'aess_fclk(a)178': {'#=
clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[115]],=
 'reg': [[376]], 'ti,max-div': [[2]], 'phandle': [[116]]}, 'abe_giclk_div(a=
)174': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[116]], 'reg': [[372]], 'ti,max-div': [[2]]}, 'abe_lp_clk_div(a)1d8': {'=
#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[26]],=
 'reg': [[472]], 'ti,dividers': [[16], [32]], 'phandle': [[148]]}, 'abe_sys=
_clk_div(a)120': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock']=
, 'clocks': [[21]], 'reg': [[288]], 'ti,max-div': [[2]]}, 'adc_gfclk_mux(a)=
1dc': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[2=
1], [113], [82]], 'reg': [[476]]}, 'sys_clk1_dclk_div(a)1c8': {'#clock-cell=
s': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[21]], 'ti,max-di=
v': [[64]], 'reg': [[456]], 'ti,index-power-of-two': True, 'phandle': [[125=
]]}, 'sys_clk2_dclk_div(a)1cc': {'#clock-cells': [[0]], 'compatible': ['ti,=
divider-clock'], 'clocks': [[113]], 'ti,max-div': [[64]], 'reg': [[460]], '=
ti,index-power-of-two': True, 'phandle': [[126]]}, 'per_abe_x1_dclk_div(a)1=
bc': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': =
[[117]], 'ti,max-div': [[64]], 'reg': [[444]], 'ti,index-power-of-two': Tru=
e, 'phandle': [[127]]}, 'dsp_gclk_div(a)18c': {'#clock-cells': [[0]], 'comp=
atible': ['ti,divider-clock'], 'clocks': [[37]], 'ti,max-div': [[64]], 'reg=
': [[396]], 'ti,index-power-of-two': True, 'phandle': [[129]]}, 'gpu_dclk(a=
)1a0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks'=
: [[44]], 'ti,max-div': [[64]], 'reg': [[416]], 'ti,index-power-of-two': Tr=
ue, 'phandle': [[131]]}, 'emif_phy_dclk_div(a)190': {'#clock-cells': [[0]],=
 'compatible': ['ti,divider-clock'], 'clocks': [[118]], 'ti,max-div': [[64]=
], 'reg': [[400]], 'ti,index-power-of-two': True, 'phandle': [[133]]}, 'gma=
c_250m_dclk_div(a)19c': {'#clock-cells': [[0]], 'compatible': ['ti,divider-=
clock'], 'clocks': [[119]], 'ti,max-div': [[64]], 'reg': [[412]], 'ti,index=
-power-of-two': True, 'phandle': [[120]]}, 'gmac_main_clk': {'#clock-cells'=
: [[0]], 'compatible': ['fixed-factor-clock'], 'clocks': [[120]], 'clock-mu=
lt': [[1]], 'clock-div': [[2]], 'phandle': [[190]]}, 'l3init_480m_dclk_div(=
a)1ac': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[79]], 'ti,max-div': [[64]], 'reg': [[428]], 'ti,index-power-of-two': T=
rue, 'phandle': [[138]]}, 'usb_otg_dclk_div(a)184': {'#clock-cells': [[0]],=
 'compatible': ['ti,divider-clock'], 'clocks': [[121]], 'ti,max-div': [[64]=
], 'reg': [[388]], 'ti,index-power-of-two': True, 'phandle': [[139]]}, 'sat=
a_dclk_div(a)1c0': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock=
'], 'clocks': [[21]], 'ti,max-div': [[64]], 'reg': [[448]], 'ti,index-power=
-of-two': True, 'phandle': [[140]]}, 'pcie2_dclk_div(a)1b8': {'#clock-cells=
': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[122]], 'ti,max-di=
v': [[64]], 'reg': [[440]], 'ti,index-power-of-two': True, 'phandle': [[141=
]]}, 'pcie_dclk_div(a)1b4': {'#clock-cells': [[0]], 'compatible': ['ti,divi=
der-clock'], 'clocks': [[123]], 'ti,max-div': [[64]], 'reg': [[436]], 'ti,i=
ndex-power-of-two': True, 'phandle': [[142]]}, 'emu_dclk_div(a)194': {'#clo=
ck-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[21]], 'ti=
,max-div': [[64]], 'reg': [[404]], 'ti,index-power-of-two': True, 'phandle'=
: [[143]]}, 'secure_32k_dclk_div(a)1c4': {'#clock-cells': [[0]], 'compatibl=
e': ['ti,divider-clock'], 'clocks': [[124]], 'ti,max-div': [[64]], 'reg': [=
[452]], 'ti,index-power-of-two': True, 'phandle': [[144]]}, 'clkoutmux0_clk=
_mux(a)158': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clock=
s': [[125], [126], [127], [128], [129], [130], [131], [132], [133], [120], =
[134], [135], [136], [137], [138], [139], [140], [141], [142], [143], [144]=
, [145]], 'reg': [[344]]}, 'clkoutmux1_clk_mux(a)15c': {'#clock-cells': [[0=
]], 'compatible': ['ti,mux-clock'], 'clocks': [[125], [126], [127], [128], =
[129], [130], [131], [132], [133], [120], [134], [135], [136], [137], [138]=
, [139], [140], [141], [142], [143], [144], [145]], 'reg': [[348]]}, 'clkou=
tmux2_clk_mux(a)160': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'=
], 'clocks': [[125], [126], [127], [128], [129], [130], [131], [132], [133]=
, [120], [134], [135], [136], [137], [138], [139], [140], [141], [142], [14=
3], [144], [145]], 'reg': [[352]], 'phandle': [[80]]}, 'custefuse_sys_gfclk=
_div': {'#clock-cells': [[0]], 'compatible': ['fixed-factor-clock'], 'clock=
s': [[21]], 'clock-mult': [[1]], 'clock-div': [[2]]}, 'eve_clk(a)180': {'#c=
lock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[55], [58]],=
 'reg': [[384]]}, 'hdmi_dpll_clk_mux(a)164': {'#clock-cells': [[0]], 'compa=
tible': ['ti,mux-clock'], 'clocks': [[21], [113]], 'reg': [[356]]}, 'mlb_cl=
k(a)134': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'cloc=
ks': [[146]], 'ti,max-div': [[64]], 'reg': [[308]], 'ti,index-power-of-two'=
: True}, 'mlbp_clk(a)130': {'#clock-cells': [[0]], 'compatible': ['ti,divid=
er-clock'], 'clocks': [[147]], 'ti,max-div': [[64]], 'reg': [[304]], 'ti,in=
dex-power-of-two': True}, 'per_abe_x1_gfclk2_div(a)138': {'#clock-cells': [=
[0]], 'compatible': ['ti,divider-clock'], 'clocks': [[117]], 'ti,max-div': =
[[64]], 'reg': [[312]], 'ti,index-power-of-two': True}, 'timer_sys_clk_div(=
a)144': {'#clock-cells': [[0]], 'compatible': ['ti,divider-clock'], 'clocks=
': [[21]], 'reg': [[324]], 'ti,max-div': [[2]], 'phandle': [[151]]}, 'video=
1_dpll_clk_mux(a)168': {'#clock-cells': [[0]], 'compatible': ['ti,mux-clock=
'], 'clocks': [[21], [113]], 'reg': [[360]]}, 'video2_dpll_clk_mux(a)16c': =
{'#clock-cells': [[0]], 'compatible': ['ti,mux-clock'], 'clocks': [[21], [1=
13]], 'reg': [[364]]}, 'wkupaon_iclk_mux(a)108': {'#clock-cells': [[0]], 'c=
ompatible': ['ti,mux-clock'], 'clocks': [[21], [148]], 'reg': [[264]], 'pha=
ndle': [[87]]}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: prm(a)0: clockdomains: {'type': 'ob=
ject'} is not allowed for {}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: scm_conf(a)0: compatible: 'anyOf' c=
onditional failed, one must be fixed:

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8076401027764097293==--

