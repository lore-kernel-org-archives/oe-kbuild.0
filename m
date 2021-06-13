Content-Type: multipart/mixed; boundary="===============4780229527947111308=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap:omap-for-v5.14/dt 22/24] dtbs_check: arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/gpio@20: failed to match any schema with compatible: ['nxp, pcf8575']
Date: Sun, 13 Jun 2021 13:07:51 +0800
Message-ID: <202106131348.GVetlhDR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4780229527947111308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-omap(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Tony Lindgren <tony@atomide.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.g=
it omap-for-v5.14/dt
head:   9b11fec7345f21995f4ea4bafb0e108b9a620238
commit: 794fd4a55ec55b9443c143388a8addee92671157 [22/24] ARM: dts: dra7x-ev=
m: Drop "ti,pcf8575"
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)6c000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)6c000/serial(a)0: failed to match any schema with =
compatible: ['ti,dra742-uart']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)6e000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)6e000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)6e000/serial(a)0: failed to match any schema with =
compatible: ['ti,dra742-uart']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000/i2c(a)0: failed to match any schema with com=
patible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000/i2c(a)0/tps659038(a)58: failed to match any =
schema with compatible: ['ti,tps659038']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000/i2c(a)0/tps659038(a)58/tps659038_pmic: faile=
d to match any schema with compatible: ['ti,tps659038-pmic']
>> arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000/i2c(a)0/gpio(a)20: failed to match any schem=
a with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000/i2c(a)0/gpio(a)21: failed to match any schem=
a with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)70000/i2c(a)0/tlv320aic3106(a)19: failed to match =
any schema with compatible: ['ti,tlv320aic3106']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)72000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)72000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)72000/i2c(a)0: failed to match any schema with com=
patible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)72000/i2c(a)0/gpio(a)26: failed to match any schem=
a with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)78000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)78000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)78000/elm(a)0: failed to match any schema with com=
patible: ['ti,am3352-elm']
   arch/arm/boot/dts/dra7-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/seg=
ment(a)0/target-module(a)7a000: failed to match any schema with compatible:=
 ['ti,sysc-omap2', 'ti,sysc']
--
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)72000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000/elm(a)0: failed to match any schema with co=
mpatible: ['ti,am3352-elm']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
>> arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000/i2c(a)0/pcf8575(a)26: failed to match any s=
chema with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000/i2c(a)0/ov5640(a)3c: failed to match any sc=
hema with compatible: ['ovti,ov5640']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)86000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)86000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)86000/timer(a)0: failed to match any schema with =
compatible: ['ti,omap5430-timer']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)88000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)88000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)88000/timer(a)0: failed to match any schema with =
compatible: ['ti,omap5430-timer']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)90000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)90000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)90000/rng(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-rng']
--
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)72000/i2c(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)78000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)78000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)78000/elm(a)0: failed to match any schema wi=
th compatible: ['ti,am3352-elm']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7a000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7a000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7a000/i2c(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7c000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7c000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7c000/i2c(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-i2c']
>> arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7c000/i2c(a)0/pcf8575(a)26: failed to match =
any schema with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)7c000/i2c(a)0/ov5640(a)3c: failed to match a=
ny schema with compatible: ['ovti,ov5640']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)86000: failed to match any schema with compa=
tible: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)86000: failed to match any schema with compa=
tible: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)86000/timer(a)0: failed to match any schema =
with compatible: ['ti,omap5430-timer']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)88000: failed to match any schema with compa=
tible: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)88000: failed to match any schema with compa=
tible: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)88000/timer(a)0: failed to match any schema =
with compatible: ['ti,omap5430-timer']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)90000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)90000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra72-evm-revc.dt.yaml:0:0: /ocp/interconnect(a)480000=
00/segment(a)0/target-module(a)90000/rng(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-rng']
--
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)72000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000/elm(a)0: failed to match any schema with co=
mpatible: ['ti,am3352-elm']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
>> arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000/i2c(a)0/pcf8575(a)26: failed to match any s=
chema with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7c000/i2c(a)0/ov5640(a)3c: failed to match any sc=
hema with compatible: ['ovti,ov5640']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)86000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)86000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)86000/timer(a)0: failed to match any schema with =
compatible: ['ti,omap5430-timer']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)88000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)88000: failed to match any schema with compatible=
: ['ti,sysc-omap4-timer', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)88000/timer(a)0: failed to match any schema with =
compatible: ['ti,omap5430-timer']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)90000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)90000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra71-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)90000/rng(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-rng']
--
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/tps65917(a)58: failed to match any =
schema with compatible: ['ti,tps65917']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/tps65917(a)58/tps65917_pmic: failed=
 to match any schema with compatible: ['ti,tps65917-pmic']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/tps65917(a)58/tps65917_power_button=
: failed to match any schema with compatible: ['ti,palmas-pwrbutton']
   arch/arm/boot/dts/dra76-evm.dt.yaml: lp87565(a)60: 'gpio-controller' is =
a required property
   	From schema: Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
   arch/arm/boot/dts/dra76-evm.dt.yaml: lp87565(a)60: '#gpio-cells' is a re=
quired property
   	From schema: Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml
>> arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/pcf8757(a)20: failed to match any s=
chema with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/pcf8757(a)21: failed to match any s=
chema with compatible: ['nxp,pcf8575']
>> arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/pcf8575(a)26: failed to match any s=
chema with compatible: ['nxp,pcf8575']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)70000/i2c(a)0/tlv320aic3106(a)19: failed to match=
 any schema with compatible: ['ti,tlv320aic3106']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)72000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)72000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)72000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)78000/elm(a)0: failed to match any schema with co=
mpatible: ['ti,am3352-elm']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/dra76-evm.dt.yaml:0:0: /ocp/interconnect(a)48000000/se=
gment(a)0/target-module(a)7a000/i2c(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-i2c']

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4780229527947111308==--

