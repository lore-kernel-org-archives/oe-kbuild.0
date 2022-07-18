Content-Type: multipart/mixed; boundary="===============9161151595291055127=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
Date: Tue, 19 Jul 2022 01:31:10 +0800
Message-ID: <202207190139.SQIB1Kfy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9161151595291055127==
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
head:   ff6992735ade75aae3e35d16b17da1008d753d28
commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816 mtd: spi-nor: intel-spi: C=
onvert to SPI MEM
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: arc-randconfig-s052-20220718 (https://download.01.org/0day-ci/archi=
ve/20220719/202207190139.SQIB1Kfy-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De23e5a05d1fd9479586c40ffbcc056b3e34ef816
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e23e5a05d1fd9479586c40ffbcc056b3e34ef816
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rc SHELL=3D/bin/bash drivers/spi/

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
--===============9161151595291055127==--

