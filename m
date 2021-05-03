Content-Type: multipart/mixed; boundary="===============2567127236565241096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [omap-audio:peter/linux-next-wip 64/64] dtbs_check: arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnect@40100000/segment@0/target-module@28000/mcasp@0: failed to match any schema with compatible: ['ti, omap4-mcasp-audio']
Date: Mon, 03 May 2021 16:37:08 +0800
Message-ID: <202105031605.pO67ZcXm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2567127236565241096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   15d96d4574948fd5f3de831d83379e91d33e4d71
commit: 15d96d4574948fd5f3de831d83379e91d33e4d71 [64/64] omap4: mcasp DIT w=
ip
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)22000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match a=
ny schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)24000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)24000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match a=
ny schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)26000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)26000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match a=
ny schema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)28000: failed to match any schema =
with compatible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)28000: failed to match any schema =
with compatible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match a=
ny schema with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match a=
ny schema with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)2e000: failed to match any schema =
with compatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)2e000: failed to match any schema =
with compatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match an=
y schema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)30000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)30000: failed to match any schema =
with compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any=
 schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any=
 schema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)32000: failed to match any schema =
with compatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid-bionic-xt875.dt.yaml:0:0: /ocp/interconnec=
t(a)40100000/segment(a)0/target-module(a)32000: failed to match any schema =
with compatible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any sche=
ma with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-droid4-xt894.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)22000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any s=
chema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)24000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)24000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any s=
chema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)26000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)26000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any s=
chema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)28000: failed to match any schema with=
 compatible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)28000: failed to match any schema with=
 compatible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any s=
chema with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any s=
chema with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)2e000: failed to match any schema with=
 compatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)2e000: failed to match any schema with=
 compatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any sc=
hema with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)30000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)30000: failed to match any schema with=
 compatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)32000: failed to match any schema with=
 compatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-duovero-parlor.dt.yaml:0:0: /ocp/interconnect(a)=
40100000/segment(a)0/target-module(a)32000: failed to match any schema with=
 compatible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)22000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)24000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)24000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)26000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)26000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000: failed to match any schema with compatible=
: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000: failed to match any schema with compatible=
: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000/mcasp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000/mcasp(a)1: failed to match any schema with =
compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)2e000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)2e000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)2e000/dmic(a)0: failed to match any schema with c=
ompatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)32000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-kc1.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)32000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)22000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any schema wit=
h compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)24000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)24000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any schema wit=
h compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)26000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)26000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any schema wit=
h compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)28000: failed to match any schema with compatib=
le: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)28000: failed to match any schema with compatib=
le: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any schema wit=
h compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any schema wit=
h compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)2e000: failed to match any schema with compatib=
le: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)2e000: failed to match any schema with compatib=
le: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any schema with=
 compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)30000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)30000: failed to match any schema with compatib=
le: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema with =
compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema with =
compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)32000: failed to match any schema with compatib=
le: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda.dt.yaml:0:0: /ocp/interconnect(a)40100000/=
segment(a)0/target-module(a)32000: failed to match any schema with compatib=
le: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)22000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)24000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)24000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)26000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)26000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000: failed to match any schema with compa=
tible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000: failed to match any schema with compa=
tible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any schema =
with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)2e000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)2e000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any schema w=
ith compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)32000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-a4.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)32000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)22000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)24000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)24000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)26000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)26000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000: failed to match any schema with compa=
tible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000: failed to match any schema with compa=
tible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any schema =
with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any schema =
with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)2e000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)2e000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any schema w=
ith compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000: failed to match any schema with compa=
tible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema wi=
th compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)32000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-panda-es.dt.yaml:0:0: /ocp/interconnect(a)401000=
00/segment(a)0/target-module(a)32000: failed to match any schema with compa=
tible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)22000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)24000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)24000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)26000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)26000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000: failed to match any schema with compatible=
: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000: failed to match any schema with compatible=
: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000/mcasp(a)0: failed to match any schema with =
compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)28000/mcasp(a)1: failed to match any schema with =
compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)2e000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)2e000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)2e000/dmic(a)0: failed to match any schema with c=
ompatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000: failed to match any schema with compatible=
: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)30000/wdt(a)0: failed to match any schema with co=
mpatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)32000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp.dt.yaml:0:0: /ocp/interconnect(a)40100000/se=
gment(a)0/target-module(a)32000: failed to match any schema with compatible=
: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any sche=
ma with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-sdp-es23plus.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any sche=
ma with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-dvk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
--
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)22000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)24000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)26000/mcbsp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcbsp']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000: failed to match any schema with c=
ompatible: ['ti,sysc-mcasp', 'ti,sysc']
>> arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)0: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp-audio']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)28000/mcasp(a)1: failed to match any sch=
ema with compatible: ['ti,omap4-mcasp']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)2e000/dmic(a)0: failed to match any sche=
ma with compatible: ['ti,omap4-dmic']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000: failed to match any schema with c=
ompatible: ['ti,sysc-omap2', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)30000/wdt(a)0: failed to match any schem=
a with compatible: ['ti,omap4-wdt', 'ti,omap3-wdt']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']
   arch/arm/boot/dts/omap4-var-stk-om44.dt.yaml:0:0: /ocp/interconnect(a)40=
100000/segment(a)0/target-module(a)32000: failed to match any schema with c=
ompatible: ['ti,sysc-omap4', 'ti,sysc']

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2567127236565241096==--

