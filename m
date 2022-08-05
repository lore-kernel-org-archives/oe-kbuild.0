Content-Type: multipart/mixed; boundary="===============0230621716307979712=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: too many errors
Date: Fri, 05 Aug 2022 16:50:50 +0800
Message-ID: <202208051617.g7uFGgye-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0230621716307979712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/m68k/include/asm/bitops.h:491:27: sparse: sparse: too many errors"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2a88c212e652e94f1e4b635910972ac57ba4e97
commit: 8f8d8b0334cc4e7908b78e73936a7673bbef0411 thermal/drivers/tegra: Cor=
rect compile-testing of drivers
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: m68k-randconfig-s051-20220805 (https://download.01.org/0day-ci/arch=
ive/20220805/202208051617.g7uFGgye-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8f8d8b0334cc4e7908b78e73936a7673bbef0411
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8f8d8b0334cc4e7908b78e73936a7673bbef0411
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
68k SHELL=3D/bin/bash drivers/thermal/tegra/

If you fix the issue, kindly add following tag where applicable
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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0230621716307979712==--

