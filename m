Content-Type: multipart/mixed; boundary="===============6459364498264251948=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer operation overflow
Date: Wed, 09 Mar 2022 13:17:51 +0800
Message-ID: <202203091323.ZH5QynBW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6459364498264251948==
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
head:   92f90cc9fe0e7a984ea3d4bf3d120e30ba8a2118
commit: 8f8d8b0334cc4e7908b78e73936a7673bbef0411 thermal/drivers/tegra: Cor=
rect compile-testing of drivers
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-s031-20220302 (https://download.01.org/0day-ci/arch=
ive/20220309/202203091323.ZH5QynBW-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
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
ips SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   drivers/thermal/tegra/soctherm.c: note: in included file (through includ=
e/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow
>> arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer =
operation overflow

vim +445 arch/mips/include/asm/bitops.h

6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  431  =

6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  432  /*
bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7  433   * ffs - find first bit set.
6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  434   * @word: The word to search
6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  435   *
bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7  436   * This is defined the same way as
bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7  437   * the libc and compiler builtin ffs routines, therefore
99b40ced9ef63ce arch/mips/include/asm/bitops.h Geert Uytterhoeven 2021-01-0=
8  438   * differs in spirit from the below ffz (man ffs).
6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  439   */
bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7  440  static inline int ffs(int word)
6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  441  {
bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7  442  	if (!word)
bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7  443  		return 0;
2caf190002770b5 include/asm-mips/bitops.h      Ralf Baechle       2006-01-3=
0  444  =

bc818247203a7bf include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-1=
7 @445  	return fls(word & -word);
6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  446  }
6590326505e3f7b include/asm-mips/bitops.h      Ralf Baechle       2005-07-1=
2  447  =


:::::: The code at line 445 was first introduced by commit
:::::: bc818247203a7bfc40296a3f5b760de84fb8e0d1 [MIPS] Fix bitops for MIPS3=
2/MIPS64 CPUs.

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6459364498264251948==--

