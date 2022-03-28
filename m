Content-Type: multipart/mixed; boundary="===============7924515248362866974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
Date: Mon, 28 Mar 2022 18:53:47 +0800
Message-ID: <202203281855.0hd6bzRE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7924515248362866974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Mauro Lima <mauro.lima@eclypsium.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816 mtd: spi-nor: intel-spi: C=
onvert to SPI MEM
date:   6 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-s002-20220328 (https://download.01.org/0day-ci/arch=
ive/20220328/202203281855.0hd6bzRE-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De23e5a05d1fd9479586c40ffbcc056b3e34ef816
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e23e5a05d1fd9479586c40ffbcc056b3e34ef816
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash arch/x86/ drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-intel.c: note: in included file (through include/linux/m=
td/spi-nor.h):
>> include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selec=
ted. No NOR chip support can work.

vim +62 include/linux/mtd/cfi.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  60  =

241651d04d672f David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672f David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_I=
x selected. No NOR chip support can work.
241651d04d672f David Woodhouse 2007-09-06  63  static inline int cfi_interl=
eave(void *cfi)
241651d04d672f David Woodhouse 2007-09-06  64  {
241651d04d672f David Woodhouse 2007-09-06  65  	BUG();
241651d04d672f David Woodhouse 2007-09-06  66  	return 0;
241651d04d672f David Woodhouse 2007-09-06  67  }
241651d04d672f David Woodhouse 2007-09-06  68  #endif
241651d04d672f David Woodhouse 2007-09-06  69  =


:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error w=
hen no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7924515248362866974==--

