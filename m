Content-Type: multipart/mixed; boundary="===============6816655787201213202=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/video/fbdev/atmel_lcdfb.c:1224:22: sparse: expected void
Date: Sat, 28 Nov 2020 12:08:10 +0800
Message-ID: <202011281200.yTAZLqk8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6816655787201213202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Stephen Boyd <sboyd@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

Hi Stephen,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c84e1efae022071a4fcf9f1899bf71777c49943a
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk =
framework to be selectable
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-s031-20201128 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-151-g540c2c4b-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbbd7ffdbef6888459f301c5889f3b14ada38b913
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"sparse warnings: (new ones prefixed by >>)"
   drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse: sparse: incorrect type=
 in assignment (different address spaces) @@     expected char [noderef] <a=
sn:2> *screen_base @@     got void * @@
   drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse:     expected char [nod=
eref] <asn:2> *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:354:27: sparse:     got void *
   drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse: sparse: incorrect type=
 in argument 1 (different address spaces) @@     expected void *s @@     go=
t char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse:     expected void *s
   drivers/video/fbdev/atmel_lcdfb.c:362:20: sparse:     got char [noderef]=
 <asn:2> *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:1224:22: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *addr @@   =
  got void [noderef] <asn:2> *mmio @@
>> drivers/video/fbdev/atmel_lcdfb.c:1224:22: sparse:     expected void *ad=
dr
   drivers/video/fbdev/atmel_lcdfb.c:1224:22: sparse:     got void [noderef=
] <asn:2> *mmio
   drivers/video/fbdev/atmel_lcdfb.c:1229:29: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *addr @@   =
  got char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:1229:29: sparse:     expected void *ad=
dr
   drivers/video/fbdev/atmel_lcdfb.c:1229:29: sparse:     got char [noderef=
] <asn:2> *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:1267:22: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *addr @@   =
  got void [noderef] <asn:2> *mmio @@
   drivers/video/fbdev/atmel_lcdfb.c:1267:22: sparse:     expected void *ad=
dr
   drivers/video/fbdev/atmel_lcdfb.c:1267:22: sparse:     got void [noderef=
] <asn:2> *mmio
   drivers/video/fbdev/atmel_lcdfb.c:1270:29: sparse: sparse: incorrect typ=
e in argument 1 (different address spaces) @@     expected void *addr @@   =
  got char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:1270:29: sparse:     expected void *ad=
dr
   drivers/video/fbdev/atmel_lcdfb.c:1270:29: sparse:     got char [noderef=
] <asn:2> *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse: sparse: incorrect type=
 in argument 3 (different address spaces) @@     expected void *cpu_addr @@=
     got char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     expected void *cpu=
_addr
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     got char [noderef]=
 <asn:2> *screen_base
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse: sparse: incorrect type=
 in argument 3 (different address spaces) @@     expected void *cpu_addr @@=
     got char [noderef] <asn:2> *screen_base @@
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     expected void *cpu=
_addr
   drivers/video/fbdev/atmel_lcdfb.c:333:59: sparse:     got char [noderef]=
 <asn:2> *screen_base
--
   sound/soc/samsung/spdif.c:451:22: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void *addr @@     got voi=
d [noderef] <asn:2> *regs @@
>> sound/soc/samsung/spdif.c:451:22: sparse:     expected void *addr
   sound/soc/samsung/spdif.c:451:22: sparse:     got void [noderef] <asn:2>=
 *regs
   sound/soc/samsung/spdif.c:467:22: sparse: sparse: incorrect type in argu=
ment 1 (different address spaces) @@     expected void *addr @@     got voi=
d [noderef] <asn:2> *regs @@
   sound/soc/samsung/spdif.c:467:22: sparse:     expected void *addr
   sound/soc/samsung/spdif.c:467:22: sparse:     got void [noderef] <asn:2>=
 *regs
   sound/soc/samsung/spdif.c: note: in included file (through arch/openrisc=
/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
--
   sound/soc/samsung/idma.c:344:18: sparse: sparse: incorrect type in argum=
ent 1 (different address spaces) @@     expected void *addr @@     got void=
 [noderef] <asn:2> * @@
>> sound/soc/samsung/idma.c:344:18: sparse:     expected void *addr
   sound/soc/samsung/idma.c:344:18: sparse:     got void [noderef] <asn:2> *
   sound/soc/samsung/idma.c: note: in included file (through arch/openrisc/=
include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:179:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:225:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:225:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:225:22: sparse:     got restricted __le32 [user=
type]

vim +1224 drivers/video/fbdev/atmel_lcdfb.c

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1041  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1042  static int __init atmel_lcdfb_probe(struct platfo=
rm_device *pdev)
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1043  {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1044  	struct device *dev =3D &pdev->dev;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1045  	struct fb_info *info;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1046  	struct atmel_lcdfb_info *sinfo;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1047  	struct resource *regs =3D NULL;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1048  	struct resource *map =3D NULL;
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1049  	struct fb_modelist *modelist;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1050  	int ret;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1051  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1052  	dev_dbg(dev, "%s BEGIN\n", __func__);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1053  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1054  	ret =3D -ENOMEM;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1055  	info =3D framebuffer_alloc(sizeof(struct atmel_l=
cdfb_info), dev);
0adcdbcb179624d drivers/video/fbdev/atmel_lcdfb.c Bartlomiej Zolnierkiewicz=
        2019-06-28  1056  	if (!info)
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1057  		goto out;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1058  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1059  	sinfo =3D info->par;
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1060  	sinfo->pdev =3D pdev;
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1061  	sinfo->info =3D info;
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1062  =

b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1063  	INIT_LIST_HEAD(&info->modelist);
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1064  =

b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1065  	if (pdev->dev.of_node) {
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1066  		ret =3D atmel_lcdfb_of_init(sinfo);
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1067  		if (ret)
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1068  			goto free_info;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1069  	} else {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1070  		dev_err(dev, "cannot get default configuration\=
n");
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1071  		goto free_info;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1072  	}
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1073  =

bbd44f6bd9d1aa7 drivers/video/atmel_lcdfb.c       Johan Hovold             =
        2013-02-07  1074  	if (!sinfo->config)
bbd44f6bd9d1aa7 drivers/video/atmel_lcdfb.c       Johan Hovold             =
        2013-02-07  1075  		goto free_info;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1076  =

2d6054564313438 drivers/video/fbdev/atmel_lcdfb.c Alexander Stein          =
        2014-07-15  1077  	sinfo->reg_lcd =3D devm_regulator_get(&pdev->dev=
, "lcd");
2d6054564313438 drivers/video/fbdev/atmel_lcdfb.c Alexander Stein          =
        2014-07-15  1078  	if (IS_ERR(sinfo->reg_lcd))
2d6054564313438 drivers/video/fbdev/atmel_lcdfb.c Alexander Stein          =
        2014-07-15  1079  		sinfo->reg_lcd =3D NULL;
2d6054564313438 drivers/video/fbdev/atmel_lcdfb.c Alexander Stein          =
        2014-07-15  1080  =

546f98c1e94157d drivers/video/fbdev/atmel_lcdfb.c Alexandre Belloni        =
        2019-04-01  1081  	info->flags =3D FBINFO_DEFAULT | FBINFO_PARTIAL_=
PAN_OK |
546f98c1e94157d drivers/video/fbdev/atmel_lcdfb.c Alexandre Belloni        =
        2019-04-01  1082  		      FBINFO_HWACCEL_YPAN;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1083  	info->pseudo_palette =3D sinfo->pseudo_palette;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1084  	info->fbops =3D &atmel_lcdfb_ops;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1085  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1086  	info->fix =3D atmel_lcdfb_fix;
b7e4ab50418d5b3 drivers/video/atmel_lcdfb.c       Bo Shen                  =
        2014-03-19  1087  	strcpy(info->fix.id, sinfo->pdev->name);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1088  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1089  	/* Enable LCDC Clocks */
557b7d5d0787997 drivers/video/atmel_lcdfb.c       Johan Hovold             =
        2013-02-07  1090  	sinfo->bus_clk =3D clk_get(dev, "hclk");
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1091  	if (IS_ERR(sinfo->bus_clk)) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1092  		ret =3D PTR_ERR(sinfo->bus_clk);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1093  		goto free_info;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1094  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1095  	sinfo->lcdc_clk =3D clk_get(dev, "lcdc_clk");
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1096  	if (IS_ERR(sinfo->lcdc_clk)) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1097  		ret =3D PTR_ERR(sinfo->lcdc_clk);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1098  		goto put_bus_clk;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1099  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1100  	atmel_lcdfb_start_clock(sinfo);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1101  =

b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1102  	modelist =3D list_first_entry(&info->modelist,
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1103  			struct fb_modelist, list);
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1104  	fb_videomode_to_var(&info->var, &modelist->mode);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1105  =

b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1106  	atmel_lcdfb_check_var(&info->var, info);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1107  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1108  	regs =3D platform_get_resource(pdev, IORESOURCE_=
MEM, 0);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1109  	if (!regs) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1110  		dev_err(dev, "resources unusable\n");
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1111  		ret =3D -ENXIO;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1112  		goto stop_clk;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1113  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1114  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1115  	sinfo->irq_base =3D platform_get_irq(pdev, 0);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1116  	if (sinfo->irq_base < 0) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1117  		dev_err(dev, "unable to get irq\n");
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1118  		ret =3D sinfo->irq_base;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1119  		goto stop_clk;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1120  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1121  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1122  	/* Initialize video memory */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1123  	map =3D platform_get_resource(pdev, IORESOURCE_M=
EM, 1);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1124  	if (map) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1125  		/* use a pre-allocated memory buffer */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1126  		info->fix.smem_start =3D map->start;
28f65c11f2ffb39 drivers/video/atmel_lcdfb.c       Joe Perches              =
        2011-06-09  1127  		info->fix.smem_len =3D resource_size(map);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1128  		if (!request_mem_region(info->fix.smem_start,
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1129  					info->fix.smem_len, pdev->name)) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1130  			ret =3D -EBUSY;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1131  			goto stop_clk;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1132  		}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1133  =

1e43a20396ee34a drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez        =
        2015-04-21  1134  		info->screen_base =3D ioremap_wc(info->fix.smem=
_start,
1e43a20396ee34a drivers/video/fbdev/atmel_lcdfb.c Luis R. Rodriguez        =
        2015-04-21  1135  					       info->fix.smem_len);
130320bfe0ca88b drivers/video/atmel_lcdfb.c       Peter Senna Tschudin     =
        2012-09-18  1136  		if (!info->screen_base) {
130320bfe0ca88b drivers/video/atmel_lcdfb.c       Peter Senna Tschudin     =
        2012-09-18  1137  			ret =3D -ENOMEM;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1138  			goto release_intmem;
130320bfe0ca88b drivers/video/atmel_lcdfb.c       Peter Senna Tschudin     =
        2012-09-18  1139  		}
01d3a5e7fab7732 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen       =
        2008-04-28  1140  =

01d3a5e7fab7732 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen       =
        2008-04-28  1141  		/*
01d3a5e7fab7732 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen       =
        2008-04-28  1142  		 * Don't clear the framebuffer -- someone may h=
ave set
01d3a5e7fab7732 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen       =
        2008-04-28  1143  		 * up a splash image.
01d3a5e7fab7732 drivers/video/atmel_lcdfb.c       Haavard Skinnemoen       =
        2008-04-28  1144  		 */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1145  	} else {
ff0c26424c1d993 drivers/video/atmel_lcdfb.c       Masanari Iida            =
        2012-07-22  1146  		/* allocate memory buffer */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1147  		ret =3D atmel_lcdfb_alloc_video_memory(sinfo);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1148  		if (ret < 0) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1149  			dev_err(dev, "cannot allocate framebuffer: %d\=
n", ret);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1150  			goto stop_clk;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1151  		}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1152  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1153  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1154  	/* LCDC registers */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1155  	info->fix.mmio_start =3D regs->start;
28f65c11f2ffb39 drivers/video/atmel_lcdfb.c       Joe Perches              =
        2011-06-09  1156  	info->fix.mmio_len =3D resource_size(regs);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1157  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1158  	if (!request_mem_region(info->fix.mmio_start,
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1159  				info->fix.mmio_len, pdev->name)) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1160  		ret =3D -EBUSY;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1161  		goto free_fb;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1162  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1163  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1164  	sinfo->mmio =3D ioremap(info->fix.mmio_start, in=
fo->fix.mmio_len);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1165  	if (!sinfo->mmio) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1166  		dev_err(dev, "cannot map LCDC registers\n");
130320bfe0ca88b drivers/video/atmel_lcdfb.c       Peter Senna Tschudin     =
        2012-09-18  1167  		ret =3D -ENOMEM;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1168  		goto release_mem;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1169  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1170  =

a9a84c37d1ee50d drivers/video/atmel_lcdfb.c       David Brownell           =
        2008-02-06  1171  	/* Initialize PWM for contrast or backlight ("of=
f") */
a9a84c37d1ee50d drivers/video/atmel_lcdfb.c       David Brownell           =
        2008-02-06  1172  	init_contrast(sinfo);
a9a84c37d1ee50d drivers/video/atmel_lcdfb.c       David Brownell           =
        2008-02-06  1173  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1174  	/* interrupt */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1175  	ret =3D request_irq(sinfo->irq_base, atmel_lcdfb=
_interrupt, 0, pdev->name, info);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1176  	if (ret) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1177  		dev_err(dev, "request_irq failed: %d\n", ret);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1178  		goto unmap_mmio;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1179  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1180  =

d22579b837358cb drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2008-07-23  1181  	/* Some operations on the LCDC might sleep and
d22579b837358cb drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2008-07-23  1182  	 * require a preemptible task context */
d22579b837358cb drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2008-07-23  1183  	INIT_WORK(&sinfo->task, atmel_lcdfb_task);
d22579b837358cb drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2008-07-23  1184  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1185  	ret =3D atmel_lcdfb_init_fbinfo(sinfo);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1186  	if (ret < 0) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1187  		dev_err(dev, "init fbinfo failed: %d\n", ret);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1188  		goto unregister_irqs;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1189  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1190  =

7d3477d801808a5 drivers/video/atmel_lcdfb.c       Antoine Tenart           =
        2014-03-07  1191  	ret =3D atmel_lcdfb_set_par(info);
7d3477d801808a5 drivers/video/atmel_lcdfb.c       Antoine Tenart           =
        2014-03-07  1192  	if (ret < 0) {
7d3477d801808a5 drivers/video/atmel_lcdfb.c       Antoine Tenart           =
        2014-03-07  1193  		dev_err(dev, "set par failed: %d\n", ret);
7d3477d801808a5 drivers/video/atmel_lcdfb.c       Antoine Tenart           =
        2014-03-07  1194  		goto unregister_irqs;
7d3477d801808a5 drivers/video/atmel_lcdfb.c       Antoine Tenart           =
        2014-03-07  1195  	}
7d3477d801808a5 drivers/video/atmel_lcdfb.c       Antoine Tenart           =
        2014-03-07  1196  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1197  	dev_set_drvdata(dev, info);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1198  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1199  	/*
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1200  	 * Tell the world that we're ready to go
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1201  	 */
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1202  	ret =3D register_framebuffer(info);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1203  	if (ret < 0) {
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1204  		dev_err(dev, "failed to register framebuffer de=
vice: %d\n", ret);
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1205  		goto reset_drvdata;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1206  	}
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1207  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1208  	/* Power up the LCDC screen */
42110e91de7f66f drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-04-11  1209  	atmel_lcdfb_power_control(sinfo, 1);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1210  =

93f6ced9e442de2 drivers/video/atmel_lcdfb.c       Claudio Scordino         =
        2009-10-09  1211  	dev_info(dev, "fb%d: Atmel LCDC at 0x%08lx (mapp=
ed@%p), irq %d\n",
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1212  		       info->node, info->fix.mmio_start, sinfo-=
>mmio, sinfo->irq_base);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1213  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1214  	return 0;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1215  =

b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1216  reset_drvdata:
b985172b328abc6 drivers/video/atmel_lcdfb.c       Jean-Christophe PLAGNIOL-=
VILLARD 2013-03-29  1217  	dev_set_drvdata(dev, NULL);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1218  	fb_dealloc_cmap(&info->cmap);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1219  unregister_irqs:
d22579b837358cb drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2008-07-23  1220  	cancel_work_sync(&sinfo->task);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1221  	free_irq(sinfo->irq_base, info);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1222  unmap_mmio:
a9a84c37d1ee50d drivers/video/atmel_lcdfb.c       David Brownell           =
        2008-02-06  1223  	exit_backlight(sinfo);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10 @1224  	iounmap(sinfo->mmio);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1225  release_mem:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1226   	release_mem_region(info->fix.mmio_start, info->=
fix.mmio_len);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1227  free_fb:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1228  	if (map)
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1229  		iounmap(info->screen_base);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1230  	else
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1231  		atmel_lcdfb_free_video_memory(sinfo);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1232  =

14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1233  release_intmem:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1234  	if (map)
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1235  		release_mem_region(info->fix.smem_start, info->=
fix.smem_len);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1236  stop_clk:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1237  	atmel_lcdfb_stop_clock(sinfo);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1238  	clk_put(sinfo->lcdc_clk);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1239  put_bus_clk:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1240  	clk_put(sinfo->bus_clk);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1241  free_info:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1242  	framebuffer_release(info);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1243  out:
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1244  	dev_dbg(dev, "%s FAILED\n", __func__);
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1245  	return ret;
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1246  }
14340586148e7c8 drivers/video/atmel_lcdfb.c       Nicolas Ferre            =
        2007-05-10  1247  =


:::::: The code at line 1224 was first introduced by commit
:::::: 14340586148e7c88d7b1b752876f5b5227b200b9 atmel_lcdfb: AT91/AT32 LCD =
Controller framebuffer driver

:::::: TO: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6816655787201213202==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
Lq0wD3apner2/wArj1pD84ECAA==
--===============6816655787201213202==--

