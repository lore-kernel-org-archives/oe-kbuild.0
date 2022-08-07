Content-Type: multipart/mixed; boundary="===============3576652403534230630=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/ux500/ux500-soc-id.c:179:31: sparse: sparse: incorrect type in argument 1 (different address spaces)
Date: Mon, 08 Aug 2022 06:10:16 +0800
Message-ID: <202208080650.Q2srrXN0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3576652403534230630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bc1bc0b59d04e997db25b84babf459ca1cd80b7
commit: a19402634c435a4eae226df53c141cdbb9922e7b random: make consistent us=
e of buf and len
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-s031-20220805 (https://download.01.org/0day-ci/archi=
ve/20220808/202208080650.Q2srrXN0-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da19402634c435a4eae226df53c141cdbb9922e7b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a19402634c435a4eae226df53c141cdbb9922e7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/soc/ux500/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/ux500/ux500-soc-id.c:179:31: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const *buf @@=
     got void [noderef] __iomem *[assigned] uid @@
   drivers/soc/ux500/ux500-soc-id.c:179:31: sparse:     expected void const=
 *buf
   drivers/soc/ux500/ux500-soc-id.c:179:31: sparse:     got void [noderef] =
__iomem *[assigned] uid
   drivers/soc/ux500/ux500-soc-id.c:181:26: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
   drivers/soc/ux500/ux500-soc-id.c:181:26: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/ux500/ux500-soc-id.c:181:26: sparse:     expected void const=
 volatile [noderef] __iomem *addr
   drivers/soc/ux500/ux500-soc-id.c:181:26: sparse:     got unsigned int [u=
sertype] *
   drivers/soc/ux500/ux500-soc-id.c:182:26: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
   drivers/soc/ux500/ux500-soc-id.c:182:26: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/ux500/ux500-soc-id.c:182:26: sparse:     expected void const=
 volatile [noderef] __iomem *addr
   drivers/soc/ux500/ux500-soc-id.c:182:26: sparse:     got unsigned int [u=
sertype] *
   drivers/soc/ux500/ux500-soc-id.c:182:47: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
   drivers/soc/ux500/ux500-soc-id.c:182:47: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/ux500/ux500-soc-id.c:182:47: sparse:     expected void const=
 volatile [noderef] __iomem *addr
   drivers/soc/ux500/ux500-soc-id.c:182:47: sparse:     got unsigned int [u=
sertype] *
   drivers/soc/ux500/ux500-soc-id.c:183:26: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
   drivers/soc/ux500/ux500-soc-id.c:183:26: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/ux500/ux500-soc-id.c:183:26: sparse:     expected void const=
 volatile [noderef] __iomem *addr
   drivers/soc/ux500/ux500-soc-id.c:183:26: sparse:     got unsigned int [u=
sertype] *
   drivers/soc/ux500/ux500-soc-id.c:183:47: sparse: sparse: cast removes ad=
dress space '__iomem' of expression
   drivers/soc/ux500/ux500-soc-id.c:183:47: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/ux500/ux500-soc-id.c:183:47: sparse:     expected void const=
 volatile [noderef] __iomem *addr
   drivers/soc/ux500/ux500-soc-id.c:183:47: sparse:     got unsigned int [u=
sertype] *

vim +179 drivers/soc/ux500/ux500-soc-id.c

d7a1a4f47d804b drivers/soc/ux500/ux500-soc-id.c Sudeep Holla  2020-05-23  1=
66  =

18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
67  static const char *db8500_read_soc_id(struct device_node *backupram)
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
68  {
18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
69  	void __iomem *base;
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
70  	void __iomem *uid;
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
71  	const char *retstr;
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
72  =

18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
73  	base =3D of_iomap(backupram, 0);
18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
74  	if (!base)
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
75  		return NULL;
18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
76  	uid =3D base + 0x1fc0;
18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
77  =

cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
78  	/* Throw these device-specific numbers into the entropy pool */
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20 @1=
79  	add_device_randomness(uid, 0x14);
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
80  	retstr =3D kasprintf(GFP_KERNEL, "%08x%08x%08x%08x%08x",
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
81  			 readl((u32 *)uid+0),
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
82  			 readl((u32 *)uid+1), readl((u32 *)uid+2),
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
83  			 readl((u32 *)uid+3), readl((u32 *)uid+4));
18a992787896fe drivers/soc/ux500/ux500-soc-id.c Arnd Bergmann 2016-06-22  1=
84  	iounmap(base);
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
85  	return retstr;
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
86  }
cd1dc431d02afd arch/arm/mach-ux500/id.c         Arnd Bergmann 2016-06-20  1=
87  =


:::::: The code at line 179 was first introduced by commit
:::::: cd1dc431d02afda521bed53b7c87a678a3ac246f ARM: ux500: consolidate soc=
_device code in id.c

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3576652403534230630==--

