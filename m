Content-Type: multipart/mixed; boundary="===============6713663682525824609=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nomadik:ux500-gavini-v5.13-rc1 1/5] dtbs_check: arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/scu@a0410000: failed to match any schema with compatible: ['arm, cortex-a9-scu']
Date: Sun, 13 Jun 2021 14:04:21 +0800
Message-ID: <202106131418.kBIhtn8W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6713663682525824609==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-gavini-v5.13-rc1
head:   2dd1d4c6b852a045a2591eb647df303399b8666c
commit: a9311cbfae8f7cc0a7ec89c25448238762e54a95 [1/5] ARM: dts: ux500: Add=
 device tree for Samsung Gavini
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


dtcheck warnings: (new ones prefixed by >>)
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/si=
mple-bus.yaml
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml: soc: dma-controller(=
a)801C0000:reg:0: [2149318656, 4096, 1073807360, 2048] is too long
   	From schema: /usr/local/lib/python3.9/dist-packages/dtschema/schemas/re=
g.yaml
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc: failed to =
match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/ptm(a)801ae=
000: failed to match any schema with compatible: ['arm,coresight-etm3x', 'a=
rm,primecell']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/ptm(a)801af=
000: failed to match any schema with compatible: ['arm,coresight-etm3x', 'a=
rm,primecell']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/funnel(a)80=
1a6000: failed to match any schema with compatible: ['arm,coresight-dynamic=
-funnel', 'arm,primecell']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/replicator:=
 failed to match any schema with compatible: ['arm,coresight-static-replica=
tor']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/tpiu(a)8019=
0000: failed to match any schema with compatible: ['arm,coresight-tpiu', 'a=
rm,primecell']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/etb(a)801a4=
000: failed to match any schema with compatible: ['arm,coresight-etb10', 'a=
rm,primecell']
>> arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/scu(a)a0410=
000: failed to match any schema with compatible: ['arm,cortex-a9-scu']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/backupram(a=
)80150000: failed to match any schema with compatible: ['ste,dbx500-backupr=
am']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/pm_domains0=
: failed to match any schema with compatible: ['stericsson,ux500-pm-domains=
']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/clocks: fai=
led to match any schema with compatible: ['stericsson,u8500-clks']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/mtu(a)a03c6=
000: failed to match any schema with compatible: ['st,nomadik-mtu']
>> arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/timer(a)a04=
10600: failed to match any schema with compatible: ['arm,cortex-a9-twd-time=
r']
>> arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/watchdog(a)=
a0410620: failed to match any schema with compatible: ['arm,cortex-a9-twd-w=
dt']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/rtc(a)80154=
000: failed to match any schema with compatible: ['arm,pl031', 'arm,primece=
ll']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8012=
e000: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8012=
e000: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8012=
e080: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8012=
e080: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8000=
e000: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8000=
e000: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8000=
e080: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8000=
e080: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']
   arch/arm/boot/dts/ste-ux500-samsung-gavini.dt.yaml:0:0: /soc/gpio(a)8000=
e100: failed to match any schema with compatible: ['stericsson,db8500-gpio'=
, 'st,nomadik-gpio']

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6713663682525824609==--

