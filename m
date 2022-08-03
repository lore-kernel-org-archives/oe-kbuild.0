Content-Type: multipart/mixed; boundary="===============1029816549778625759=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer operation overflow
Date: Thu, 04 Aug 2022 06:03:03 +0800
Message-ID: <202208040526.IREZlE2g-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1029816549778625759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/mips/include/asm/bitops.h:445:27: sparse: sparse: constant integer op=
eration overflow"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ff89dd08c0f0a3fd330c9ef9d775e880f82c291e
commit: 8f8d8b0334cc4e7908b78e73936a7673bbef0411 thermal/drivers/tegra: Cor=
rect compile-testing of drivers
date:   12 months ago
:::::: branch date: 51 minutes ago
:::::: commit date: 12 months ago
config: mips-randconfig-s052-20220801 (https://download.01.org/0day-ci/arch=
ive/20220804/202208040526.IREZlE2g-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
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
ips SHELL=3D/bin/bash drivers/thermal/tegra/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
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

6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  431  =

6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  432  /*
bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
  433   * ffs - find first bit set.
6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  434   * @word: The word to search
6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  435   *
bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
  436   * This is defined the same way as
bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
  437   * the libc and compiler builtin ffs routines, therefore
99b40ced9ef63c arch/mips/include/asm/bitops.h Geert Uytterhoeven 2021-01-08=
  438   * differs in spirit from the below ffz (man ffs).
6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  439   */
bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
  440  static inline int ffs(int word)
6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  441  {
bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
  442  	if (!word)
bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
  443  		return 0;
2caf190002770b include/asm-mips/bitops.h      Ralf Baechle       2006-01-30=
  444  =

bc818247203a7b include/asm-mips/bitops.h      Atsushi Nemoto     2006-04-17=
 @445  	return fls(word & -word);
6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  446  }
6590326505e3f7 include/asm-mips/bitops.h      Ralf Baechle       2005-07-12=
  447  =


:::::: The code at line 445 was first introduced by commit
:::::: bc818247203a7bfc40296a3f5b760de84fb8e0d1 [MIPS] Fix bitops for MIPS3=
2/MIPS64 CPUs.

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1029816549778625759==--

