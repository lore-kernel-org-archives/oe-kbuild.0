Content-Type: multipart/mixed; boundary="===============5257993567262318144=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [shenki:ast2600-gfx 1/5] dtbs_check: arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/display@1e6e6000: failed to match any schema with compatible: ['aspeed, ast2600-gfx', 'aspeed, ast2500-gfx', 'syscon']
Date: Thu, 29 Jul 2021 02:05:50 +0800
Message-ID: <202107290228.NNRYTyek-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5257993567262318144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux ast2600-gfx
head:   3b264a666202b833a073b12c7529e08c8dc0a4c3
commit: 4e9ebeac96d1d7523b1cbf4ce841e6033280f8cd [1/5] ARM: dts: aspeed: Ad=
d GFX node to AST2600
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 10.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml: pinctrl: usb2ad_default=
:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC=
12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'AD=
C7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', '=
FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4'=
, 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', '=
GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C1=
4', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8=
', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC'=
, 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'M=
ACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2',=
 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'N=
DSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3',=
 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'P=
WM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3',=
 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII=
3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', '=
RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15',=
 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', '=
SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIO=
PBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1',=
 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TA=
CH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', =
'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'TH=
RU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11',=
 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP',=
 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1'=
, 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml: pinctrl: usb11bhid_defa=
ult:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11'=
, 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6=
', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FS=
I2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', '=
GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPI=
U4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13',=
 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7',=
 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ',=
 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK=
2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'N=
CTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR=
2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', '=
NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM=
0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', '=
PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', =
'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RX=
D3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SA=
LT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SAL=
T8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL'=
, 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', '=
SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0=
', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TA=
CH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0=
', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UA=
RT11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'US=
BADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WD=
TRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['aspe=
ed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['aspe=
ed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/smp-memram(a)180: failed to match any schema with compatible: ['asp=
eed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/interrupt-controller(a)560: failed to match any schema with compati=
ble: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/interrupt-controller(a)570: failed to match any schema with compati=
ble: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/hwrng(a)1e=
6e2524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/display(a)=
1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx'=
, 'aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/display(a)=
1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx'=
, 'aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/xdma(a)1e6=
e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/gpio(a)1e7=
80000: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/gpio(a)1e7=
80800: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/rtc(a)1e78=
1000: failed to match any schema with compatible: ['aspeed,ast2600-rtc']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/timer(a)1e=
782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e785000: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e785040: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e785080: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e7850c0: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-ast2600-evb-a1.dt.yaml: lpc(a)1e789000: lhc(a)a=
0:reg:0: [160, 36, 200, 8] is too long
--
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: pinctrl: usb2ad_default:fu=
nction:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12'=
, 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7'=
, 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWS=
PIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', '=
GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPI=
U5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14',=
 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', =
'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', '=
LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACL=
INK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'N=
CTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR=
3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'N=
RI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1=
', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'P=
WM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3',=
 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD=
4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'S=
ALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SAL=
T9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI=
', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'S=
PI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1=
', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TA=
CH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1=
', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'U=
ART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'U=
SB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', '=
WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: pinctrl: usb11bhid_default=
:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', '=
ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', =
'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2'=
, 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPI=
T4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4'=
, 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I=
2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I=
2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'L=
PC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2',=
 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS=
2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2',=
 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI=
3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0',=
 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM=
3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RG=
MII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3'=
, 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT1=
5', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8'=
, 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', '=
SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI=
1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', =
'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2=
', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', =
'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART1=
1', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBAD=
P', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRS=
T1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/syscon(a)1e6e=
2000/silicon-id(a)14: failed to match any schema with compatible: ['aspeed,=
ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/syscon(a)1e6e=
2000/silicon-id(a)14: failed to match any schema with compatible: ['aspeed,=
ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/syscon(a)1e6e=
2000/smp-memram(a)180: failed to match any schema with compatible: ['aspeed=
,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/syscon(a)1e6e=
2000/interrupt-controller(a)560: failed to match any schema with compatible=
: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/syscon(a)1e6e=
2000/interrupt-controller(a)570: failed to match any schema with compatible=
: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/hwrng(a)1e6e2=
524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/display(a)1e6=
e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', '=
aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/display(a)1e6=
e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx', '=
aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/xdma(a)1e6e70=
00: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/gpio(a)1e7800=
00: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/gpio(a)1e7808=
00: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/rtc(a)1e78100=
0: failed to match any schema with compatible: ['aspeed,ast2600-rtc']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/timer(a)1e782=
000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/watchdog(a)1e=
785000: failed to match any schema with compatible: ['aspeed,ast2600-wdt']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/watchdog(a)1e=
785040: failed to match any schema with compatible: ['aspeed,ast2600-wdt']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/watchdog(a)1e=
785080: failed to match any schema with compatible: ['aspeed,ast2600-wdt']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml:0:0: /ahb/apb/watchdog(a)1e=
7850c0: failed to match any schema with compatible: ['aspeed,ast2600-wdt']
   arch/arm/boot/dts/aspeed-ast2600-evb.dt.yaml: lpc(a)1e789000: lhc(a)a0:r=
eg:0: [160, 36, 200, 8] is too long
--
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml: pinctrl: usb2ad_defaul=
t:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'AD=
C12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'A=
DC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', =
'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4=
', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', =
'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C=
14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C=
8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC=
', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', '=
MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2'=
, 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', '=
NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3'=
, 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', '=
PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3'=
, 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMI=
I3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', =
'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15'=
, 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', =
'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SI=
OPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1'=
, 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'T=
ACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2',=
 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'T=
HRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11'=
, 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP'=
, 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1=
', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml: pinctrl: usb11bhid_def=
ault:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11=
', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC=
6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'F=
SI2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', =
'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GP=
IU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13'=
, 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7'=
, 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ'=
, 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLIN=
K2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', '=
NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDS=
R2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', =
'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PW=
M0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', =
'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2',=
 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'R=
XD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'S=
ALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SA=
LT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL=
', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', =
'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH=
0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'T=
ACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU=
0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'U=
ART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'U=
SBADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'W=
DTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['asp=
eed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['asp=
eed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/smp-memram(a)180: failed to match any schema with compatible: ['as=
peed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/interrupt-controller(a)560: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/interrupt-controller(a)570: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/hwrng(a)1=
e6e2524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/display(a=
)1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx=
', 'aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/display(a=
)1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx=
', 'aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/xdma(a)1e=
6e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/gpio(a)1e=
780000: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/gpio(a)1e=
780800: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/rtc(a)1e7=
81000: failed to match any schema with compatible: ['aspeed,ast2600-rtc']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/timer(a)1=
e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer=
']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/watchdog(=
a)1e785000: failed to match any schema with compatible: ['aspeed,ast2600-wd=
t']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/watchdog(=
a)1e785040: failed to match any schema with compatible: ['aspeed,ast2600-wd=
t']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/watchdog(=
a)1e785080: failed to match any schema with compatible: ['aspeed,ast2600-wd=
t']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml:0:0: /ahb/apb/watchdog(=
a)1e7850c0: failed to match any schema with compatible: ['aspeed,ast2600-wd=
t']
   arch/arm/boot/dts/aspeed-bmc-ibm-everest.dt.yaml: lpc(a)1e789000: lhc(a)=
a0:reg:0: [160, 36, 200, 8] is too long
--
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml: pinctrl: usb2ad_defaul=
t:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'AD=
C12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'A=
DC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', =
'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4=
', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', =
'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C=
14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C=
8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC=
', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', '=
MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2'=
, 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', '=
NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3'=
, 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', '=
PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3'=
, 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMI=
I3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', =
'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15'=
, 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', =
'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SI=
OPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1'=
, 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'T=
ACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2',=
 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'T=
HRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11'=
, 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP'=
, 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1=
', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml: pinctrl: usb11bhid_def=
ault:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11=
', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC=
6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'F=
SI2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', =
'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GP=
IU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13'=
, 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7'=
, 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ'=
, 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLIN=
K2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', '=
NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDS=
R2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', =
'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PW=
M0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', =
'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2',=
 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'R=
XD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'S=
ALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SA=
LT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL=
', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', =
'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH=
0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'T=
ACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU=
0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'U=
ART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'U=
SBADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'W=
DTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['asp=
eed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['asp=
eed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/smp-memram(a)180: failed to match any schema with compatible: ['as=
peed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/interrupt-controller(a)560: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/syscon(a)=
1e6e2000/interrupt-controller(a)570: failed to match any schema with compat=
ible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/hwrng(a)1=
e6e2524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/display(a=
)1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx=
', 'aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/display(a=
)1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx=
', 'aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/xdma(a)1e=
6e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/gpio(a)1e=
780000: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml: pin_mclr_vpp: $nodenam=
e:0: 'pin_mclr_vpp' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml: i2c3_mux_oe_n: $nodena=
me:0: 'i2c3_mux_oe_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/gpio(a)1e=
780800: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/rtc(a)1e7=
81000: failed to match any schema with compatible: ['aspeed,ast2600-rtc']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/timer(a)1=
e782000: failed to match any schema with compatible: ['aspeed,ast2600-timer=
']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dt.yaml:0:0: /ahb/apb/watchdog(=
a)1e785000: failed to match any schema with compatible: ['aspeed,ast2600-wd=
t']
--
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml: pinctrl: usb2ad_d=
efault:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11'=
, 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6=
', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FS=
I2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', '=
GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPI=
U4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13',=
 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7',=
 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ',=
 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK=
2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'N=
CTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR=
2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', '=
NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM=
0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', '=
PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', =
'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RX=
D3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SA=
LT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SAL=
T8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL'=
, 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', '=
SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0=
', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TA=
CH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0=
', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UA=
RT11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'US=
BADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WD=
TRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml: pinctrl: usb11bhi=
d_default:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', '=
ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5',=
 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1=
', 'FSI2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPI=
T3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3'=
, 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I=
2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', '=
I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LH=
SIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'M=
ACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS=
1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1',=
 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NR=
I2', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE'=
, 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PW=
M2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGM=
II2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2=
', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14=
', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7'=
, 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOO=
NCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOS=
CI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', =
'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15=
', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', =
'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10=
', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD=
', 'USBADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS=
', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/sysc=
on(a)1e6e2000/silicon-id(a)14: failed to match any schema with compatible: =
['aspeed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/sysc=
on(a)1e6e2000/silicon-id(a)14: failed to match any schema with compatible: =
['aspeed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/sysc=
on(a)1e6e2000/smp-memram(a)180: failed to match any schema with compatible:=
 ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/sysc=
on(a)1e6e2000/interrupt-controller(a)560: failed to match any schema with c=
ompatible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/sysc=
on(a)1e6e2000/interrupt-controller(a)570: failed to match any schema with c=
ompatible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/hwrn=
g(a)1e6e2524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/disp=
lay(a)1e6e6000: failed to match any schema with compatible: ['aspeed,ast260=
0-gfx', 'aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/disp=
lay(a)1e6e6000: failed to match any schema with compatible: ['aspeed,ast260=
0-gfx', 'aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/xdma=
(a)1e6e7000: failed to match any schema with compatible: ['aspeed,ast2600-x=
dma']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/gpio=
(a)1e780000: failed to match any schema with compatible: ['aspeed,ast2600-g=
pio']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml: pin_mclr_vpp: $no=
dename:0: 'pin_mclr_vpp' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml: i2c3_mux_oe_n: $n=
odename:0: 'i2c3_mux_oe_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/gpio=
(a)1e780800: failed to match any schema with compatible: ['aspeed,ast2600-g=
pio']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/rtc(=
a)1e781000: failed to match any schema with compatible: ['aspeed,ast2600-rt=
c']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/time=
r(a)1e782000: failed to match any schema with compatible: ['aspeed,ast2600-=
timer']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dt.yaml:0:0: /ahb/apb/watc=
hdog(a)1e785000: failed to match any schema with compatible: ['aspeed,ast26=
00-wdt']
--
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml: pinctrl: usb2ad_def=
ault:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', =
'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6',=
 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2=
', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GP=
IT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4=
', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', '=
I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', '=
I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', '=
LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2'=
, 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCT=
S2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2'=
, 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NR=
I3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0'=
, 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PW=
M3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'R=
GMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3=
', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT=
15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8=
', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', =
'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SP=
I1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0',=
 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH=
2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0',=
 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART=
11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBA=
DP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTR=
ST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml: pinctrl: usb11bhid_=
default:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'AD=
C11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', '=
ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1',=
 'FSI2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3=
', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', =
'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C=
13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2=
C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSI=
RQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MAC=
LINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1'=
, 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', '=
NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2=
', 'NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', =
'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2=
', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII=
2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2',=
 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14',=
 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', =
'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONC=
TRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI=
', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'T=
ACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15',=
 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'T=
HRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10',=
 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD',=
 'USBADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS',=
 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/syscon=
(a)1e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['=
aspeed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/syscon=
(a)1e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['=
aspeed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/syscon=
(a)1e6e2000/smp-memram(a)180: failed to match any schema with compatible: [=
'aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/syscon=
(a)1e6e2000/interrupt-controller(a)560: failed to match any schema with com=
patible: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/syscon=
(a)1e6e2000/interrupt-controller(a)570: failed to match any schema with com=
patible: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/hwrng(=
a)1e6e2524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/displa=
y(a)1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-=
gfx', 'aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/displa=
y(a)1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-=
gfx', 'aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/xdma(a=
)1e6e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdm=
a']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/gpio(a=
)1e780000: failed to match any schema with compatible: ['aspeed,ast2600-gpi=
o']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml: pin_mclr_vpp: $node=
name:0: 'pin_mclr_vpp' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml: i2c3_mux_oe_n: $nod=
ename:0: 'i2c3_mux_oe_n' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/gp=
io/gpio-hog.yaml
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/gpio(a=
)1e780800: failed to match any schema with compatible: ['aspeed,ast2600-gpi=
o']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/rtc(a)=
1e781000: failed to match any schema with compatible: ['aspeed,ast2600-rtc']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/timer(=
a)1e782000: failed to match any schema with compatible: ['aspeed,ast2600-ti=
mer']
   arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dt.yaml:0:0: /ahb/apb/watchd=
og(a)1e785000: failed to match any schema with compatible: ['aspeed,ast2600=
-wdt']
--
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml: pinctrl: usb2ad_default=
:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC=
12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'AD=
C7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', '=
FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4'=
, 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', '=
GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C1=
4', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8=
', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC'=
, 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'M=
ACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2',=
 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'N=
DSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3',=
 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'P=
WM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3',=
 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII=
3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', '=
RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15',=
 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', '=
SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIO=
PBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1',=
 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TA=
CH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', =
'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'TH=
RU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11',=
 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP',=
 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1'=
, 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml: pinctrl: usb11bhid_defa=
ult:function:0: 'USB11BHID' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11'=
, 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6=
', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FS=
I2', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', '=
GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPI=
U4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13',=
 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7',=
 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ',=
 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK=
2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'N=
CTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR=
2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', '=
NRI3', 'NRI4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM=
0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', '=
PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', =
'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RX=
D3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SA=
LT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SAL=
T8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL'=
, 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', '=
SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0=
', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TA=
CH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0=
', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UA=
RT11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'US=
BADP', 'USB2AH', 'USB2AHP', 'USB2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WD=
TRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']
   	From schema: Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-p=
inctrl.yaml
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['aspe=
ed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/silicon-id(a)14: failed to match any schema with compatible: ['aspe=
ed,ast2600-silicon-id', 'aspeed,silicon-id']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/smp-memram(a)180: failed to match any schema with compatible: ['asp=
eed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/interrupt-controller(a)560: failed to match any schema with compati=
ble: ['aspeed,ast2600-scu-ic0']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/syscon(a)1=
e6e2000/interrupt-controller(a)570: failed to match any schema with compati=
ble: ['aspeed,ast2600-scu-ic1']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/hwrng(a)1e=
6e2524: failed to match any schema with compatible: ['timeriomem_rng']
>> arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/display(a)=
1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx'=
, 'aspeed,ast2500-gfx', 'syscon']
>> arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/display(a)=
1e6e6000: failed to match any schema with compatible: ['aspeed,ast2600-gfx'=
, 'aspeed,ast2500-gfx', 'syscon']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/xdma(a)1e6=
e7000: failed to match any schema with compatible: ['aspeed,ast2600-xdma']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/gpio(a)1e7=
80000: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/gpio(a)1e7=
80800: failed to match any schema with compatible: ['aspeed,ast2600-gpio']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/rtc(a)1e78=
1000: failed to match any schema with compatible: ['aspeed,ast2600-rtc']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/timer(a)1e=
782000: failed to match any schema with compatible: ['aspeed,ast2600-timer']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e785000: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e785040: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e785080: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml:0:0: /ahb/apb/watchdog(a=
)1e7850c0: failed to match any schema with compatible: ['aspeed,ast2600-wdt=
']
   arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dt.yaml: lpc(a)1e789000: lhc(a)a=
0:reg:0: [160, 36, 200, 8] is too long

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5257993567262318144==--

