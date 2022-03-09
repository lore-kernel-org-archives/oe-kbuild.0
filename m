Content-Type: multipart/mixed; boundary="===============1179136047574587879=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: too many errors
Date: Wed, 09 Mar 2022 18:57:52 +0800
Message-ID: <202203091831.n1xZUZYm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1179136047574587879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 8f8d8b0334cc4e7908b78e73936a7673bbef0411 thermal/drivers/tegra: Cor=
rect compile-testing of drivers
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220309=
/202203091831.n1xZUZYm-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f8d8b0334cc4e7908b78e73936a7673bbef0411
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f8d8b0334cc4e7908b78e73936a7673bbef0411
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
68k SHELL=3D/bin/bash drivers/thermal/tegra/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: not addressable
>> arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: too many errors

vim +491 arch/m68k/include/asm/bitops.h

171d809df1896c Greg Ungerer  2011-05-17  479  =

171d809df1896c Greg Ungerer  2011-05-17  480  /*
171d809df1896c Greg Ungerer  2011-05-17  481   *	ffs: find first bit set. T=
his is defined the same way as
171d809df1896c Greg Ungerer  2011-05-17  482   *	the libc and compiler buil=
tin ffs routines, therefore
171d809df1896c Greg Ungerer  2011-05-17  483   *	differs in spirit from the=
 above ffz (man ffs).
171d809df1896c Greg Ungerer  2011-05-17  484   */
171d809df1896c Greg Ungerer  2011-05-17  485  static inline int ffs(int x)
171d809df1896c Greg Ungerer  2011-05-17  486  {
171d809df1896c Greg Ungerer  2011-05-17  487  	int cnt;
171d809df1896c Greg Ungerer  2011-05-17  488  =

171d809df1896c Greg Ungerer  2011-05-17  489  	__asm__ ("bfffo %1{#0:#0},%0"
171d809df1896c Greg Ungerer  2011-05-17  490  		: "=3Dd" (cnt)
171d809df1896c Greg Ungerer  2011-05-17 @491  		: "dm" (x & -x));
171d809df1896c Greg Ungerer  2011-05-17  492  	return 32 - cnt;
171d809df1896c Greg Ungerer  2011-05-17  493  }
384052e4ed2747 Mike Rapoport 2018-07-04  494  =


:::::: The code at line 491 was first introduced by commit
:::::: 171d809df1896c1022f9778cd2788be6c255a7dc m68k: merge mmu and non-mmu=
 bitops.h

:::::: TO: Greg Ungerer <gerg@uclinux.org>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1179136047574587879==--

