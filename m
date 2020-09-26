Content-Type: multipart/mixed; boundary="===============7690796871140839401=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
Date: Sun, 27 Sep 2020 07:17:25 +0800
Message-ID: <202009270718.VbTE2gz2%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7690796871140839401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1bffa48745afbb54cb4f873bba783b2ae8be042
commit: f566e1fbadb686e28f1c307e356114b2865ef588 kbuild: make multiple dire=
ctory targets work
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: m68k-randconfig-s031-20200927 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df566e1fbadb686e28f1c307e356114b2865ef588
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f566e1fbadb686e28f1c307e356114b2865ef588
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/mtd/spi-nor/spi-nor.c:3602:34: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:3602:34: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:3602:34: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:3602:34: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:3602:34: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:3602:34: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:3889:38: sparse: sparse: dubious: x | !y
   drivers/mtd/spi-nor/spi-nor.c:4075:27: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4075:27: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4075:27: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4075:27: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4075:27: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4075:27: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4169:29: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4169:29: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4169:29: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4169:29: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4169:29: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4169:29: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4309:13: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4309:13: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4309:13: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4309:13: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4309:13: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c:4309:13: sparse: sparse: cast to restricte=
d __le32
   drivers/mtd/spi-nor/spi-nor.c: note: in included file (through include/l=
inux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/hwmon/nct6775.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/hwmon/tmp513.c: note: in included file (through include/linux/bi=
tops.h, include/linux/hwmon.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/hwmon/hwmon.c: note: in included file (through include/linux/bit=
ops.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/mtdcore.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/mtd_blkdevs.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/chips/cfi_cmdset_0001.c:1397:15: sparse: sparse: incorrect t=
ype in assignment (different address spaces) @@     expected void * @@     =
got void [noderef] <asn:2> * @@
   drivers/mtd/chips/cfi_cmdset_0001.c:1397:15: sparse:     expected void *
   drivers/mtd/chips/cfi_cmdset_0001.c:1397:15: sparse:     got void [noder=
ef] <asn:2> *
   drivers/mtd/chips/cfi_cmdset_0001.c:179:30: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned int [usert=
ype] FeatureSupport @@     got restricted __le32 [usertype] @@
   drivers/mtd/chips/cfi_cmdset_0001.c:179:30: sparse:     expected unsigne=
d int [usertype] FeatureSupport
   drivers/mtd/chips/cfi_cmdset_0001.c:179:30: sparse:     got restricted _=
_le32 [usertype]
   drivers/mtd/chips/cfi_cmdset_0001.c:180:32: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] BlkStatusRegMask @@     got restricted __le16 [usertype] @@
   drivers/mtd/chips/cfi_cmdset_0001.c:180:32: sparse:     expected unsigne=
d short [usertype] BlkStatusRegMask
   drivers/mtd/chips/cfi_cmdset_0001.c:180:32: sparse:     got restricted _=
_le16 [usertype]
   drivers/mtd/chips/cfi_cmdset_0001.c:181:27: sparse: sparse: incorrect ty=
pe in assignment (different base types) @@     expected unsigned short [use=
rtype] ProtRegAddr @@     got restricted __le16 [usertype] @@
   drivers/mtd/chips/cfi_cmdset_0001.c:181:27: sparse:     expected unsigne=
d short [usertype] ProtRegAddr
   drivers/mtd/chips/cfi_cmdset_0001.c:181:27: sparse:     got restricted _=
_le16 [usertype]
   drivers/mtd/chips/cfi_cmdset_0001.c:415:32: sparse: sparse: cast to rest=
ricted __le32
   drivers/mtd/chips/cfi_cmdset_0001.c:415:32: sparse: sparse: cast to rest=
ricted __le32
   drivers/mtd/chips/cfi_cmdset_0001.c:415:32: sparse: sparse: cast to rest=
ricted __le32
   drivers/mtd/chips/cfi_cmdset_0001.c:415:32: sparse: sparse: cast to rest=
ricted __le32
   drivers/mtd/chips/cfi_cmdset_0001.c:415:32: sparse: sparse: cast to rest=
ricted __le32
   drivers/mtd/chips/cfi_cmdset_0001.c:415:32: sparse: sparse: cast to rest=
ricted __le32
   drivers/mtd/chips/cfi_cmdset_0001.c:416:34: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:416:34: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:416:34: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:416:34: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:417:29: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:417:29: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:417:29: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:417:29: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:454:51: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:454:51: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:454:51: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c:454:51: sparse: sparse: cast to rest=
ricted __le16
   drivers/mtd/chips/cfi_cmdset_0001.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/pinctrl/core.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/pinctrl/pinmux.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/pinctrl/pinctrl-single.c: note: in included file (through arch/m=
68k/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:215:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned short volatile [userty=
pe] @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:215:9: sparse:     expected unsigned short vola=
tile [usertype]
   include/asm-generic/io.h:215:9: sparse:     got restricted __le16 [usert=
ype]
   drivers/pinctrl/pinctrl-single.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/phy/freescale/phy-fsl-imx8-mipi-dphy.c: note: in included file (=
through include/linux/bitops.h, include/linux/kernel.h, include/linux/clk.h=
):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/dma/idma64.c: note: in included file (through include/linux/bito=
ps.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/video/fbdev/core/cfbfillrect.c:50:17: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:50:17: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:56:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:56:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:64:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:65:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:66:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:67:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:68:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:69:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:70:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:71:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:75:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:79:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:79:25: sparse: sparse: cast remov=
es address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:107:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:107:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:112:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:112:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:121:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:123:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:125:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:127:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:132:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:138:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:138:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:163:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:164:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:169:31: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:170:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:178:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:178:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:180:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:180:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:182:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:182:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:184:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:184:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:186:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:186:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:188:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:188:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:190:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:190:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:192:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:192:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:197:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:197:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:202:31: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:203:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:233:23: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:234:17: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:240:31: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:241:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:250:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:250:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:253:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:253:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:256:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:256:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:259:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:259:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:265:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:265:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:272:31: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:273:25: sparse: sparse: cast remo=
ves address space '<asn:2>' of expression
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/cfbfillrect.c:359:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/cfbfillrect.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned long wo=
rd @@     got restricted __le32 [usertype] @@
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     expected unsi=
gned long word
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse:     got restricte=
d __le32 [usertype]
   drivers/video/fbdev/core/sysfillrect.c:323:32: sparse: sparse: cast to r=
estricted __le32
   drivers/video/fbdev/core/sysfillrect.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c: note: in included file (=
through include/linux/bitops.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/regulator/helpers.c: note: in included file:
   drivers/regulator/internal.h:43:42: sparse: sparse: restricted suspend_s=
tate_t degrades to integer
   drivers/regulator/helpers.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/regulator/as3722-regulator.c: note: in included file (through in=
clude/linux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/regulator/da9063-regulator.c: note: in included file (through in=
clude/linux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/regulator/mt6323-regulator.c: note: in included file (through in=
clude/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/regulator/bd9571mwv-regulator.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/regulator/ltc3589.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/lpddr/qinfo_probe.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/dma/dw/core.c: note: in included file (through include/linux/bit=
ops.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/gpu/drm/drm_blend.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/asm-generic/bug.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mfd/tc3589x.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mfd/mc13xxx-core.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/misc/lis3lv02d/lis3lv02d.c:182:52: sparse: sparse: cast to restr=
icted __le16
   drivers/misc/lis3lv02d/lis3lv02d.c:182:52: sparse: sparse: cast to restr=
icted __le16
   drivers/misc/lis3lv02d/lis3lv02d.c:182:52: sparse: sparse: cast to restr=
icted __le16
   drivers/misc/lis3lv02d/lis3lv02d.c:182:52: sparse: sparse: cast to restr=
icted __le16
   drivers/misc/lis3lv02d/lis3lv02d.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/ata/libata-core.c:5094:26: sparse: sparse: cast to restricted __=
le16
   drivers/ata/libata-core.c:5094:26: sparse: sparse: cast to restricted __=
le16
   drivers/ata/libata-core.c:5094:26: sparse: sparse: cast to restricted __=
le16
   drivers/ata/libata-core.c:5094:26: sparse: sparse: cast to restricted __=
le16
   drivers/ata/libata-core.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void const *=
 @@     got void [noderef] <asn:2> * @@
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     expected void=
 const *
   drivers/mtd/nand/onenand/onenand_base.c:779:9: sparse:     got void [nod=
eref] <asn:2> *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse: sparse: incorrect=
 type in argument 2 (different address spaces) @@     expected void const *=
 @@     got void [noderef] <asn:2> * @@
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     expected void=
 const *
   drivers/mtd/nand/onenand/onenand_base.c:817:9: sparse:     got void [nod=
eref] <asn:2> *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse: sparse: incorrect=
 type in argument 1 (different address spaces) @@     expected void * @@   =
  got void [noderef] <asn:2> * @@
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     expected void=
 *
   drivers/mtd/nand/onenand/onenand_base.c:860:9: sparse:     got void [nod=
eref] <asn:2> *
   drivers/mtd/nand/onenand/onenand_base.c: note: in included file (through=
 arch/m68k/include/asm/io.h):
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:166:15: sparse: sparse: cast to restricted __le=
16
   include/asm-generic/io.h:215:9: sparse: sparse: incorrect type in assign=
ment (different base types) @@     expected unsigned short volatile [userty=
pe] @@     got restricted __le16 [usertype] @@
   include/asm-generic/io.h:215:9: sparse:     expected unsigned short vola=
tile [usertype]
   include/asm-generic/io.h:215:9: sparse:     got restricted __le16 [usert=
ype]
   drivers/mtd/nand/onenand/onenand_base.c: note: in included file (through=
 include/linux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/soundwire/bus.c: note: in included file (through include/linux/b=
itops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/soundwire/stream.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/delay.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/input/misc/axp20x-pek.c:194:1: sparse: sparse: symbol 'dev_attr_=
startup' was not declared. Should it be static?
   drivers/input/misc/axp20x-pek.c:195:1: sparse: sparse: symbol 'dev_attr_=
shutdown' was not declared. Should it be static?
   drivers/input/misc/axp20x-pek.c: note: in included file (through include=
/linux/bitops.h, include/linux/of.h, include/linux/irqdomain.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/i3c/master/dw-i3c-master.c: note: in included file (through incl=
ude/linux/bitops.h):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/media/v4l2-core/v4l2-common.c: note: in included file (through i=
nclude/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/md/bcache/bset.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/nand/raw/nandsim.c:1888:41: sparse: sparse: cast from restri=
cted __le16
   drivers/mtd/nand/raw/nandsim.c:2057:59: sparse: sparse: incorrect type i=
n assignment (different base types) @@     expected unsigned short [usertyp=
e] @@     got restricted __le16 [usertype] @@
   drivers/mtd/nand/raw/nandsim.c:2057:59: sparse:     expected unsigned sh=
ort [usertype]
   drivers/mtd/nand/raw/nandsim.c:2057:59: sparse:     got restricted __le1=
6 [usertype]
   drivers/mtd/nand/raw/nandsim.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
--
   drivers/mtd/nand/raw/nand_base.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:493:27: sparse: sparse: not addressable

vim +493 arch/m68k/include/asm/bitops.h

171d809df1896c Greg Ungerer  2011-05-17  481  =

171d809df1896c Greg Ungerer  2011-05-17  482  /*
171d809df1896c Greg Ungerer  2011-05-17  483   *	ffs: find first bit set. T=
his is defined the same way as
171d809df1896c Greg Ungerer  2011-05-17  484   *	the libc and compiler buil=
tin ffs routines, therefore
171d809df1896c Greg Ungerer  2011-05-17  485   *	differs in spirit from the=
 above ffz (man ffs).
171d809df1896c Greg Ungerer  2011-05-17  486   */
171d809df1896c Greg Ungerer  2011-05-17  487  static inline int ffs(int x)
171d809df1896c Greg Ungerer  2011-05-17  488  {
171d809df1896c Greg Ungerer  2011-05-17  489  	int cnt;
171d809df1896c Greg Ungerer  2011-05-17  490  =

171d809df1896c Greg Ungerer  2011-05-17  491  	__asm__ ("bfffo %1{#0:#0},%0"
171d809df1896c Greg Ungerer  2011-05-17  492  		: "=3Dd" (cnt)
171d809df1896c Greg Ungerer  2011-05-17 @493  		: "dm" (x & -x));
171d809df1896c Greg Ungerer  2011-05-17  494  	return 32 - cnt;
171d809df1896c Greg Ungerer  2011-05-17  495  }
384052e4ed2747 Mike Rapoport 2018-07-04  496  =


:::::: The code at line 493 was first introduced by commit
:::::: 171d809df1896c1022f9778cd2788be6c255a7dc m68k: merge mmu and non-mmu=
 bitops.h

:::::: TO: Greg Ungerer <gerg@uclinux.org>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7690796871140839401==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
m2NF0FUBAA==
--===============7690796871140839401==--

