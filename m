Content-Type: multipart/mixed; boundary="===============5503076536404331076=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
Date: Sat, 04 Jun 2022 15:32:35 +0800
Message-ID: <202206041548.1DQm3xF1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5503076536404331076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selecte=
d. No NOR chip support can work."
:::::: =


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
head:   032dcf09e2bf7c822be25b4abef7a6c913870d98
commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816 mtd: spi-nor: intel-spi: C=
onvert to SPI MEM
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-s032-20220603 (https://download.01.org/0day-ci/archi=
ve/20220604/202206041548.1DQm3xF1-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-18-g56afb504-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De23e5a05d1fd9479586c40ffbcc056b3e34ef816
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e23e5a05d1fd9479586c40ffbcc056b3e34ef816
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rc SHELL=3D/bin/bash arch/arc/kernel/ drivers/spi/

If you fix the issue, kindly add following tag where applicable
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
--===============5503076536404331076==--

