Content-Type: multipart/mixed; boundary="===============6051089424531291066=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/8] ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
Date: Sat, 13 Mar 2021 07:28:24 +0800
Message-ID: <202103130709.2fyUAKHP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6051089424531291066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1615530274-31422-5-git-send-email-dillon.minfei@gmail.com>
References: <1615530274-31422-5-git-send-email-dillon.minfei@gmail.com>
TO: dillon.minfei(a)gmail.com
TO: robh+dt(a)kernel.org
TO: alexandre.torgue(a)foss.st.com
TO: a.fatoum(a)pengutronix.de
TO: mcoquelin.stm32(a)gmail.com
TO: alexandre.torgue(a)st.com
TO: devicetree(a)vger.kernel.org
TO: linux-stm32(a)st-md-mailman.stormreply.com
TO: linux-arm-kernel(a)lists.infradead.org
TO: linux-kernel(a)vger.kernel.org
TO: linux(a)armlinux.org.uk

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on stm32/stm32-next]
[also build test WARNING on robh/for-next soc/for-next v5.12-rc2 next-20210=
312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/dillon-minfei-gmail-com/AR=
M-STM32-add-art-pi-stm32h750xbh6-board-support/20210312-142805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git s=
tm32-next
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"
>> arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: pin-controller: {'type':=
 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[1]=
], 'ranges': [[0, 1476526080, 12288]], 'interrupt-parent': [[17]], 'st,sysc=
fg': [[23, 8]], 'pins-are-numbered': True, 'compatible': ['st,stm32h743-pin=
ctrl'], 'gpio(a)58020000': {'gpio-controller': True, '#gpio-cells': [[2]], =
'reg': [[0, 1024]], 'clocks': [[2, 86]], 'st,bank-name': ['GPIOA'], 'interr=
upt-controller': True, '#interrupt-cells': [[2]]}, 'gpio(a)58020400': {'gpi=
o-controller': True, '#gpio-cells': [[2]], 'reg': [[1024, 1024]], 'clocks':=
 [[2, 85]], 'st,bank-name': ['GPIOB'], 'interrupt-controller': True, '#inte=
rrupt-cells': [[2]]}, 'gpio(a)58020800': {'gpio-controller': True, '#gpio-c=
ells': [[2]], 'reg': [[2048, 1024]], 'clocks': [[2, 84]], 'st,bank-name': [=
'GPIOC'], 'interrupt-controller': True, '#interrupt-cells': [[2]]}, 'gpio(a=
)58020c00': {'gpio-controller': True, '#gpio-cells': [[2]], 'reg': [[3072, =
1024]], 'clocks': [[2, 83]], 'st,bank-name': ['GPIOD'], 'interrupt-controll=
er': True, '#interrupt-cells': [[2]]}, 'gpio(a)58021000': {'gpio-controller=
': True, '#gpio-cells': [[2]], 'reg': [[4096, 1024]], 'clocks': [[2, 82]], =
'st,bank-name': ['GPIOE'], 'interrupt-controller': True, '#interrupt-cells'=
: [[2]]}, 'gpio(a)58021400': {'gpio-controller': True, '#gpio-cells': [[2]]=
, 'reg': [[5120, 1024]], 'clocks': [[2, 81]], 'st,bank-name': ['GPIOF'], 'i=
nterrupt-controller': True, '#interrupt-cells': [[2]]}, 'gpio(a)58021800': =
{'gpio-controller': True, '#gpio-cells': [[2]], 'reg': [[6144, 1024]], 'clo=
cks': [[2, 80]], 'st,bank-name': ['GPIOG'], 'interrupt-controller': True, '=
#interrupt-cells': [[2]]}, 'gpio(a)58021c00': {'gpio-controller': True, '#g=
pio-cells': [[2]], 'reg': [[7168, 1024]], 'clocks': [[2, 79]], 'st,bank-nam=
e': ['GPIOH'], 'interrupt-controller': True, '#interrupt-cells': [[2]]}, 'g=
pio(a)58022000': {'gpio-controller': True, '#gpio-cells': [[2]], 'reg': [[8=
192, 1024]], 'clocks': [[2, 78]], 'st,bank-name': ['GPIOI'], 'interrupt-con=
troller': True, '#interrupt-cells': [[2]]}, 'gpio(a)58022400': {'gpio-contr=
oller': True, '#gpio-cells': [[2]], 'reg': [[9216, 1024]], 'clocks': [[2, 7=
7]], 'st,bank-name': ['GPIOJ'], 'interrupt-controller': True, '#interrupt-c=
ells': [[2]]}, 'gpio(a)58022800': {'gpio-controller': True, '#gpio-cells': =
[[2]], 'reg': [[10240, 1024]], 'clocks': [[2, 76]], 'st,bank-name': ['GPIOK=
'], 'interrupt-controller': True, '#interrupt-cells': [[2]]}, 'i2c1-0': {'p=
handle': [[3]], 'pins': {'pinmux': [[5637], [5893]], 'bias-disable': True, =
'drive-open-drain': True, 'slew-rate': [[0]]}}, 'rmii-0': {'phandle': [[24]=
], 'pins': {'pinmux': [[27404], [27916], [27660], [9228], [9484], [1804], [=
8460], [524], [268]], 'slew-rate': [[2]]}}, 'sdmmc1-b4-0': {'phandle': [[11=
]], 'pins': {'pinmux': [[10253], [10509], [10765], [11021], [11277], [12813=
]], 'slew-rate': [[3]], 'drive-push-pull': True, 'bias-disable': True}}, 's=
dmmc1-b4-od-0': {'phandle': [[13]], 'pins1': {'pinmux': [[10253], [10509], =
[10765], [11021], [11277]], 'slew-rate': [[3]], 'drive-push-pull': True, 'b=
ias-disable': True}, 'pins2': {'pinmux': [[12813]], 'slew-rate': [[3]], 'dr=
ive-open-drain': True, 'bias-disable': True}}, 'sdmmc1-b4-sleep-0': {'phand=
le': [[14]], 'pins': {'pinmux': [[10257], [10513], [10769], [11025], [11281=
], [12817]]}}, 'sdmmc1-dir-0': {'phandle': [[12]], 'pins1': {'pinmux': [[97=
37], [9993], [6408]], 'slew-rate': [[3]], 'drive-push-pull': True, 'bias-pu=
ll-up': True}, 'pins2': {'pinmux': [[6152]], 'bias-pull-up': True}}, 'sdmmc=
1-dir-sleep-0': {'phandle': [[15]], 'pins': {'pinmux': [[9745], [10001], [6=
417], [6161]]}}, 'usart1-0': {'phandle': [[4]], 'pins1': {'pinmux': [[7685]=
], 'bias-disable': True, 'drive-push-pull': True, 'slew-rate': [[0]]}, 'pin=
s2': {'pinmux': [[7941]], 'bias-disable': True}}, 'usart2-0': {'pins1': {'p=
inmux': [[13576]], 'bias-disable': True, 'drive-push-pull': True, 'slew-rat=
e': [[0]]}, 'pins2': {'pinmux': [[13832]], 'bias-disable': True}}, 'usbotg-=
hs-0': {'phandle': [[9]], 'pins': {'pinmux': [[29707], [35595], [8203], [12=
91], [779], [4107], [4363], [6667], [6923], [7179], [7435], [5387]], 'bias-=
disable': True, 'drive-push-pull': True, 'slew-rate': [[2]]}}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: 'i2c(a)40005C00', 'i2c(a=
)58001C00' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[^=
@]+$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
--
>> arch/arm/boot/dts/stm32h743i-disco.dt.yaml: soc: pin-controller: {'type'=
: 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells': [[1=
]], 'ranges': [[0, 1476526080, 12288]], 'interrupt-parent': [[11]], 'st,sys=
cfg': [[17, 8]], 'pins-are-numbered': True, 'compatible': ['st,stm32h743-pi=
nctrl'], 'gpio(a)58020000': {'gpio-controller': True, '#gpio-cells': [[2]],=
 'reg': [[0, 1024]], 'clocks': [[2, 86]], 'st,bank-name': ['GPIOA'], 'inter=
rupt-controller': True, '#interrupt-cells': [[2]]}, 'gpio(a)58020400': {'gp=
io-controller': True, '#gpio-cells': [[2]], 'reg': [[1024, 1024]], 'clocks'=
: [[2, 85]], 'st,bank-name': ['GPIOB'], 'interrupt-controller': True, '#int=
errupt-cells': [[2]]}, 'gpio(a)58020800': {'gpio-controller': True, '#gpio-=
cells': [[2]], 'reg': [[2048, 1024]], 'clocks': [[2, 84]], 'st,bank-name': =
['GPIOC'], 'interrupt-controller': True, '#interrupt-cells': [[2]]}, 'gpio(=
a)58020c00': {'gpio-controller': True, '#gpio-cells': [[2]], 'reg': [[3072,=
 1024]], 'clocks': [[2, 83]], 'st,bank-name': ['GPIOD'], 'interrupt-control=
ler': True, '#interrupt-cells': [[2]]}, 'gpio(a)58021000': {'gpio-controlle=
r': True, '#gpio-cells': [[2]], 'reg': [[4096, 1024]], 'clocks': [[2, 82]],=
 'st,bank-name': ['GPIOE'], 'interrupt-controller': True, '#interrupt-cells=
': [[2]]}, 'gpio(a)58021400': {'gpio-controller': True, '#gpio-cells': [[2]=
], 'reg': [[5120, 1024]], 'clocks': [[2, 81]], 'st,bank-name': ['GPIOF'], '=
interrupt-controller': True, '#interrupt-cells': [[2]]}, 'gpio(a)58021800':=
 {'gpio-controller': True, '#gpio-cells': [[2]], 'reg': [[6144, 1024]], 'cl=
ocks': [[2, 80]], 'st,bank-name': ['GPIOG'], 'interrupt-controller': True, =
'#interrupt-cells': [[2]]}, 'gpio(a)58021c00': {'gpio-controller': True, '#=
gpio-cells': [[2]], 'reg': [[7168, 1024]], 'clocks': [[2, 79]], 'st,bank-na=
me': ['GPIOH'], 'interrupt-controller': True, '#interrupt-cells': [[2]]}, '=
gpio(a)58022000': {'gpio-controller': True, '#gpio-cells': [[2]], 'reg': [[=
8192, 1024]], 'clocks': [[2, 78]], 'st,bank-name': ['GPIOI'], 'interrupt-co=
ntroller': True, '#interrupt-cells': [[2]]}, 'gpio(a)58022400': {'gpio-cont=
roller': True, '#gpio-cells': [[2]], 'reg': [[9216, 1024]], 'clocks': [[2, =
77]], 'st,bank-name': ['GPIOJ'], 'interrupt-controller': True, '#interrupt-=
cells': [[2]]}, 'gpio(a)58022800': {'gpio-controller': True, '#gpio-cells':=
 [[2]], 'reg': [[10240, 1024]], 'clocks': [[2, 76]], 'st,bank-name': ['GPIO=
K'], 'interrupt-controller': True, '#interrupt-cells': [[2]]}, 'i2c1-0': {'=
pins': {'pinmux': [[5637], [5893]], 'bias-disable': True, 'drive-open-drain=
': True, 'slew-rate': [[0]]}}, 'rmii-0': {'phandle': [[18]], 'pins': {'pinm=
ux': [[27404], [27916], [27660], [9228], [9484], [1804], [8460], [524], [26=
8]], 'slew-rate': [[2]]}}, 'sdmmc1-b4-0': {'phandle': [[7]], 'pins': {'pinm=
ux': [[10253], [10509], [10765], [11021], [11277], [12813]], 'slew-rate': [=
[3]], 'drive-push-pull': True, 'bias-disable': True}}, 'sdmmc1-b4-od-0': {'=
phandle': [[8]], 'pins1': {'pinmux': [[10253], [10509], [10765], [11021], [=
11277]], 'slew-rate': [[3]], 'drive-push-pull': True, 'bias-disable': True}=
, 'pins2': {'pinmux': [[12813]], 'slew-rate': [[3]], 'drive-open-drain': Tr=
ue, 'bias-disable': True}}, 'sdmmc1-b4-sleep-0': {'phandle': [[9]], 'pins':=
 {'pinmux': [[10257], [10513], [10769], [11025], [11281], [12817]]}}, 'sdmm=
c1-dir-0': {'pins1': {'pinmux': [[9737], [9993], [6408]], 'slew-rate': [[3]=
], 'drive-push-pull': True, 'bias-pull-up': True}, 'pins2': {'pinmux': [[61=
52]], 'bias-pull-up': True}}, 'sdmmc1-dir-sleep-0': {'pins': {'pinmux': [[9=
745], [10001], [6417], [6161]]}}, 'usart1-0': {'pins1': {'pinmux': [[7685]]=
, 'bias-disable': True, 'drive-push-pull': True, 'slew-rate': [[0]]}, 'pins=
2': {'pinmux': [[7941]], 'bias-disable': True}}, 'usart2-0': {'phandle': [[=
3]], 'pins1': {'pinmux': [[13576]], 'bias-disable': True, 'drive-push-pull'=
: True, 'slew-rate': [[0]]}, 'pins2': {'pinmux': [[13832]], 'bias-disable':=
 True}}, 'usbotg-hs-0': {'pins': {'pinmux': [[29707], [35595], [8203], [129=
1], [779], [4107], [4363], [6667], [6923], [7179], [7435], [5387]], 'bias-d=
isable': True, 'drive-push-pull': True, 'slew-rate': [[2]]}}}
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/stm32h743i-disco.dt.yaml: soc: 'i2c(a)40005C00', 'i2c(=
a)58001C00' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$', '^[=
^@]+$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6051089424531291066==--

