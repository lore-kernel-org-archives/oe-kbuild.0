Content-Type: multipart/mixed; boundary="===============1116899653791150298=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5162/10053] include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
Date: Thu, 03 Mar 2022 14:25:54 +0800
Message-ID: <202203031444.pNXbFT4u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1116899653791150298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Mauro Lima <mauro.lima@eclypsium.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   adaedcf826dccf01b69d9a1f1997c9446c6b2c54
commit: e23e5a05d1fd9479586c40ffbcc056b3e34ef816 [5162/10053] mtd: spi-nor:=
 intel-spi: Convert to SPI MEM
:::::: branch date: 20 hours ago
:::::: commit date: 2 weeks ago
config: riscv-randconfig-s031-20220302 (https://download.01.org/0day-ci/arc=
hive/20220303/202203031444.pNXbFT4u-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3De23e5a05d1fd9479586c40ffbcc056b3e34ef816
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e23e5a05d1fd9479586c40ffbcc056b3e34ef816
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/spi/spi-intel.c: note: in included file (through include/linux/m=
td/spi-nor.h):
>> include/linux/mtd/cfi.h:62:2: sparse: sparse: No CONFIG_MTD_CFI_Ix selec=
ted. No NOR chip support can work.

vim +62 include/linux/mtd/cfi.h

^1da177e4c3f415 Linus Torvalds  2005-04-16  60  =

241651d04d672fb David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672fb David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_=
Ix selected. No NOR chip support can work.
241651d04d672fb David Woodhouse 2007-09-06  63  static inline int cfi_inter=
leave(void *cfi)
241651d04d672fb David Woodhouse 2007-09-06  64  {
241651d04d672fb David Woodhouse 2007-09-06  65  	BUG();
241651d04d672fb David Woodhouse 2007-09-06  66  	return 0;
241651d04d672fb David Woodhouse 2007-09-06  67  }
241651d04d672fb David Woodhouse 2007-09-06  68  #endif
241651d04d672fb David Woodhouse 2007-09-06  69  =


:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error w=
hen no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1116899653791150298==--

