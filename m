Content-Type: multipart/mixed; boundary="===============4606792070822163266=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/4] dt-bindings: spi: Convert cadence-quadspi.txt to cadence-quadspi.yaml
Date: Mon, 29 Mar 2021 09:14:31 +0800
Message-ID: <202103290953.ptafZBx6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4606792070822163266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210326130034.15231-5-p.yadav@ti.com>
References: <20210326130034.15231-5-p.yadav@ti.com>
TO: Pratyush Yadav <p.yadav@ti.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Nishanth Menon <nm@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: linux-spi(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
TO: linux-arm-kernel(a)lists.infradead.org
CC: Pratyush Yadav <p.yadav@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

Hi Pratyush,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20210326]
[cannot apply to robh/for-next spi/for-next v5.12-rc4 v5.12-rc3 v5.12-rc2 v=
5.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Pratyush-Yadav/Convert-Cad=
ence-QSPI-bindings-to-yaml/20210326-210515
base:    931294922e65a23e1aad6398b9ae02df74044679
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/l3regs(a)0xff80=
0000: failed to match any schema with compatible: ['altr,l3regs', 'syscon']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/dwmmc0(a)ff7040=
00: failed to match any schema with compatible: ['altr,socfpga-dw-mshc']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: nand(a)ff900000: $nodena=
me:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: sram(a)ffff0000: '#addre=
ss-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: sram(a)ffff0000: '#size-=
cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: sram(a)ffff0000: 'ranges=
' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: spi(a)ff705000: resets: =
[[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: flash(a)0: 'partition(a)=
qspi-boot', 'partition(a)qspi-rootfs' do not match any of the regexes: '.*-=
names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-z=
A-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA=
-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt=
-core.yaml
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/rstmgr(a)ffd050=
00: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/snoop-control-u=
nit(a)fffec000: failed to match any schema with compatible: ['arm,cortex-a9=
-scu']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/sdr(a)ffc25000:=
 failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/sdramedac: fail=
ed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/sysmgr(a)ffd080=
00: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml:0:0: /soc/timer(a)fffec60=
0: failed to match any schema with compatible: ['arm,cortex-a9-twd-timer']
   arch/arm/boot/dts/socfpga_arria5_socdk.dt.yaml: timer0(a)ffc08000: 'rese=
t-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/l3regs(=
a)0xff800000: failed to match any schema with compatible: ['altr,l3regs', '=
syscon']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/dwmmc0(=
a)ff704000: failed to match any schema with compatible: ['altr,socfpga-dw-m=
shc']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: nand(a)ff900000:=
 $nodename:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: sram(a)ffff0000:=
 '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: sram(a)ffff0000:=
 '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: sram(a)ffff0000:=
 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: spi(a)ff705000: =
resets: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/rstmgr(=
a)ffd05000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/snoop-c=
ontrol-unit(a)fffec000: failed to match any schema with compatible: ['arm,c=
ortex-a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/sdr(a)f=
fc25000: failed to match any schema with compatible: ['altr,sdr-ctl', 'sysc=
on']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/sdramed=
ac: failed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/sysmgr(=
a)ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 's=
yscon']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml:0:0: /soc/timer(a=
)fffec600: failed to match any schema with compatible: ['arm,cortex-a9-twd-=
timer']
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: timer0(a)ffc0800=
0: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
   arch/arm/boot/dts/socfpga_cyclone5_chameleon96.dt.yaml: timer1(a)ffc0900=
0: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/l3regs(a)0xf=
f800000: failed to match any schema with compatible: ['altr,l3regs', 'sysco=
n']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/dwmmc0(a)ff7=
04000: failed to match any schema with compatible: ['altr,socfpga-dw-mshc']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: nand(a)ff900000: $nod=
ename:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: sram(a)ffff0000: '#ad=
dress-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: sram(a)ffff0000: '#si=
ze-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: sram(a)ffff0000: 'ran=
ges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: spi(a)ff705000: reset=
s: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/rstmgr(a)ffd=
05000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/snoop-contro=
l-unit(a)fffec000: failed to match any schema with compatible: ['arm,cortex=
-a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/sdr(a)ffc250=
00: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/sdramedac: f=
ailed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/sysmgr(a)ffd=
08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon=
']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml:0:0: /soc/timer(a)fffe=
c600: failed to match any schema with compatible: ['arm,cortex-a9-twd-timer=
']
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: timer0(a)ffc08000: 'r=
eset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
   arch/arm/boot/dts/socfpga_cyclone5_mcvevk.dt.yaml: timer1(a)ffc09000: 'r=
eset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/l3regs(a)0xff=
800000: failed to match any schema with compatible: ['altr,l3regs', 'syscon=
']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/dwmmc0(a)ff70=
4000: failed to match any schema with compatible: ['altr,socfpga-dw-mshc']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml: nand(a)ff900000: $node=
name:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml: sram(a)ffff0000: '#add=
ress-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml: sram(a)ffff0000: '#siz=
e-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml: sram(a)ffff0000: 'rang=
es' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml: spi(a)ff705000: resets=
: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml: n25q00(a)0: 'partition=
(a)qspi-boot', 'partition(a)qspi-rootfs' do not match any of the regexes: '=
.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[=
a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a=
-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/dt=
-core.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/spi(a)ff70500=
0/n25q00(a)0: failed to match any schema with compatible: ['n25q00']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/rstmgr(a)ffd0=
5000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/snoop-control=
-unit(a)fffec000: failed to match any schema with compatible: ['arm,cortex-=
a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/sdr(a)ffc2500=
0: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/sdramedac: fa=
iled to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/spi(a)fff0000=
0/spidev(a)0: failed to match any schema with compatible: ['rohm,dh2228fv']
   arch/arm/boot/dts/socfpga_cyclone5_socdk.dt.yaml:0:0: /soc/sysmgr(a)ffd0=
8000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
--
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/l3regs=
(a)0xff800000: failed to match any schema with compatible: ['altr,l3regs', =
'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/dwmmc0=
(a)ff704000: failed to match any schema with compatible: ['altr,socfpga-dw-=
mshc']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: nand(a)ff900000=
: $nodename:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: sram(a)ffff0000=
: '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: sram(a)ffff0000=
: '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: sram(a)ffff0000=
: 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: spi(a)ff705000:=
 resets: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/rstmgr=
(a)ffd05000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/snoop-=
control-unit(a)fffec000: failed to match any schema with compatible: ['arm,=
cortex-a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/sdr(a)=
ffc25000: failed to match any schema with compatible: ['altr,sdr-ctl', 'sys=
con']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/sdrame=
dac: failed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/sysmgr=
(a)ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', '=
syscon']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml:0:0: /soc/timer(=
a)fffec600: failed to match any schema with compatible: ['arm,cortex-a9-twd=
-timer']
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: timer0(a)ffc080=
00: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
   arch/arm/boot/dts/socfpga_cyclone5_de0_nano_soc.dt.yaml: timer1(a)ffc090=
00: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/l3regs(a)0xf=
f800000: failed to match any schema with compatible: ['altr,l3regs', 'sysco=
n']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/dwmmc0(a)ff7=
04000: failed to match any schema with compatible: ['altr,socfpga-dw-mshc']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml: nand(a)ff900000: $nod=
ename:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml: sram(a)ffff0000: '#ad=
dress-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml: sram(a)ffff0000: '#si=
ze-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml: sram(a)ffff0000: 'ran=
ges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml: spi(a)ff705000: reset=
s: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/spi(a)ff7050=
00/flash(a)0: failed to match any schema with compatible: ['n25q00']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/rstmgr(a)ffd=
05000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/snoop-contro=
l-unit(a)fffec000: failed to match any schema with compatible: ['arm,cortex=
-a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/sdr(a)ffc250=
00: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/sdramedac: f=
ailed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/sysmgr(a)ffd=
08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon=
']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml:0:0: /soc/timer(a)fffe=
c600: failed to match any schema with compatible: ['arm,cortex-a9-twd-timer=
']
   arch/arm/boot/dts/socfpga_cyclone5_sockit.dt.yaml: timer0(a)ffc08000: 'r=
eset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
--
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/l3regs(a)0=
xff800000: failed to match any schema with compatible: ['altr,l3regs', 'sys=
con']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/dwmmc0(a)f=
f704000: failed to match any schema with compatible: ['altr,socfpga-dw-mshc=
']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: nand(a)ff900000: $n=
odename:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: sram(a)ffff0000: '#=
address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: sram(a)ffff0000: '#=
size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: sram(a)ffff0000: 'r=
anges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: spi(a)ff705000: res=
ets: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/rstmgr(a)f=
fd05000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/snoop-cont=
rol-unit(a)fffec000: failed to match any schema with compatible: ['arm,cort=
ex-a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/sdr(a)ffc2=
5000: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/sdramedac:=
 failed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/sysmgr(a)f=
fd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'sysc=
on']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml:0:0: /soc/timer(a)ff=
fec600: failed to match any schema with compatible: ['arm,cortex-a9-twd-tim=
er']
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: timer0(a)ffc08000: =
'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
   arch/arm/boot/dts/socfpga_cyclone5_socrates.dt.yaml: timer1(a)ffc09000: =
'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/l3regs(a)0xff=
800000: failed to match any schema with compatible: ['altr,l3regs', 'syscon=
']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/dwmmc0(a)ff70=
4000: failed to match any schema with compatible: ['altr,socfpga-dw-mshc']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: nand(a)ff900000: $node=
name:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: sram(a)ffff0000: '#add=
ress-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: sram(a)ffff0000: '#siz=
e-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: sram(a)ffff0000: 'rang=
es' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: spi(a)ff705000: resets=
: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/rstmgr(a)ffd0=
5000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/snoop-control=
-unit(a)fffec000: failed to match any schema with compatible: ['arm,cortex-=
a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/sdr(a)ffc2500=
0: failed to match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/sdramedac: fa=
iled to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/sysmgr(a)ffd0=
8000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml:0:0: /soc/timer(a)fffec=
600: failed to match any schema with compatible: ['arm,cortex-a9-twd-timer']
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: timer0(a)ffc08000: 're=
set-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
   arch/arm/boot/dts/socfpga_cyclone5_sodia.dt.yaml: timer1(a)ffc09000: 're=
set-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/l3regs(=
a)0xff800000: failed to match any schema with compatible: ['altr,l3regs', '=
syscon']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/dwmmc0(=
a)ff704000: failed to match any schema with compatible: ['altr,socfpga-dw-m=
shc']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml: nand(a)ff900000:=
 $nodename:0: 'nand(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml: sram(a)ffff0000:=
 '#address-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml: sram(a)ffff0000:=
 '#size-cells' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml: sram(a)ffff0000:=
 'ranges' is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml: spi(a)ff705000: =
resets: [[6, 37]] is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/spi(a)f=
f705000/n25q128(a)0: failed to match any schema with compatible: ['n25q128']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/spi(a)f=
f705000/n25q00(a)1: failed to match any schema with compatible: ['n25q00']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/rstmgr(=
a)ffd05000: failed to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/snoop-c=
ontrol-unit(a)fffec000: failed to match any schema with compatible: ['arm,c=
ortex-a9-scu']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/sdr(a)f=
fc25000: failed to match any schema with compatible: ['altr,sdr-ctl', 'sysc=
on']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/sdramed=
ac: failed to match any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/sysmgr(=
a)ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 's=
yscon']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml:0:0: /soc/timer(a=
)fffec600: failed to match any schema with compatible: ['arm,cortex-a9-twd-=
timer']
   arch/arm/boot/dts/socfpga_cyclone5_vining_fpga.dt.yaml: timer0(a)ffc0800=
0: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/l3regs(a)0xff800000: fail=
ed to match any schema with compatible: ['altr,l3regs', 'syscon']
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/dwmmc0(a)ff704000: failed=
 to match any schema with compatible: ['altr,socfpga-dw-mshc']
   arch/arm/boot/dts/socfpga_vt.dt.yaml: nand(a)ff900000: $nodename:0: 'nan=
d(a)ff900000' does not match '^nand-controller(@.*)?'
   	From schema: Documentation/devicetree/bindings/mtd/denali,nand.yaml
   arch/arm/boot/dts/socfpga_vt.dt.yaml: sram(a)ffff0000: '#address-cells' =
is a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_vt.dt.yaml: sram(a)ffff0000: '#size-cells' is =
a required property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
   arch/arm/boot/dts/socfpga_vt.dt.yaml: sram(a)ffff0000: 'ranges' is a req=
uired property
   	From schema: Documentation/devicetree/bindings/sram/sram.yaml
>> arch/arm/boot/dts/socfpga_vt.dt.yaml: spi(a)ff705000: resets: [[6, 37]] =
is too short
   	From schema: Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/rstmgr(a)ffd05000: failed=
 to match any schema with compatible: ['altr,rst-mgr']
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/snoop-control-unit(a)fffe=
c000: failed to match any schema with compatible: ['arm,cortex-a9-scu']
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/sdr(a)ffc25000: failed to=
 match any schema with compatible: ['altr,sdr-ctl', 'syscon']
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/sdramedac: failed to matc=
h any schema with compatible: ['altr,sdram-edac']
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/sysmgr(a)ffd08000: failed=
 to match any schema with compatible: ['altr,sys-mgr', 'syscon']
   arch/arm/boot/dts/socfpga_vt.dt.yaml:0:0: /soc/timer(a)fffec600: failed =
to match any schema with compatible: ['arm,cortex-a9-twd-timer']
   arch/arm/boot/dts/socfpga_vt.dt.yaml: timer0(a)ffc08000: 'reset-names' d=
oes not match any of the regexes: 'pinctrl-[0-9]+'
   	From schema: Documentation/devicetree/bindings/timer/snps,dw-apb-timer.=
yaml
   arch/arm/boot/dts/socfpga_vt.dt.yaml: timer0(a)ffc08000: More than one c=
ondition true in oneOf schema:

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4606792070822163266==--

