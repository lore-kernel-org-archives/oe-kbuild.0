Content-Type: multipart/mixed; boundary="===============3832605254439339132=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/boot/compressed/../../../../lib/lz4/lz4_decompress.c:502:5: warning: no previous prototype for function 'LZ4_decompress_safe_forceExtDict'
Date: Sun, 28 Nov 2021 08:44:30 +0800
Message-ID: <202111280832.e8SPzokz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3832605254439339132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: 5445a0c0d3366358e7ac44efa108b6fd359873e3 memory: pl353-smc: fix com=
pile test on !ARM_AMBA
date:   1 year ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-c002-20211118 (https://download.01.org/0day-ci/archi=
ve/20211128/202111280832.e8SPzokz-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c46bec=
f500df2a7fb4b4fce16178a036c344315a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5445a0c0d3366358e7ac44efa108b6fd359873e3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5445a0c0d3366358e7ac44efa108b6fd359873e3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/boot/compressed/../../../../lib/lz4/lz4_decompress.c:502:5: war=
ning: no previous prototype for function 'LZ4_decompress_safe_forceExtDict'=
 [-Wmissing-prototypes]
   int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
       ^
   arch/arm/boot/compressed/../../../../lib/lz4/lz4_decompress.c:502:1: not=
e: declare 'static' if the function is not intended to be used outside of t=
his translation unit
   int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
   ^
   static =

   arch/arm/boot/compressed/decompress.c:59:5: warning: no previous prototy=
pe for function 'do_decompress' [-Wmissing-prototypes]
   int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x))
       ^
   arch/arm/boot/compressed/decompress.c:59:1: note: declare 'static' if th=
e function is not intended to be used outside of this translation unit
   int do_decompress(u8 *input, int len, u8 *output, void (*error)(char *x))
   ^
   static =

   3 warnings generated.


vim +/LZ4_decompress_safe_forceExtDict +502 arch/arm/boot/compressed/../../=
../../lib/lz4/lz4_decompress.c

cffb78b0e0b3a3 Kyungsik Lee 2013-07-08  501  =

2209fda323e2fd Gao Xiang    2018-10-30 @502  int LZ4_decompress_safe_forceE=
xtDict(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  503  				     int compressedSize, i=
nt maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  504  				     const void *dictStart=
, size_t dictSize)
2209fda323e2fd Gao Xiang    2018-10-30  505  {
2209fda323e2fd Gao Xiang    2018-10-30  506  	return LZ4_decompress_generic=
(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  507  				      compressedSize, maxO=
utputSize,
2209fda323e2fd Gao Xiang    2018-10-30  508  				      endOnInputSize, deco=
de_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  509  				      usingExtDict, (BYTE =
*)dest,
2209fda323e2fd Gao Xiang    2018-10-30  510  				      (const BYTE *)dictSt=
art, dictSize);
2209fda323e2fd Gao Xiang    2018-10-30  511  }
2209fda323e2fd Gao Xiang    2018-10-30  512  =


:::::: The code at line 502 was first introduced by commit
:::::: 2209fda323e2fd2a2d0885595fd5097717f8d2aa lib/lz4: update LZ4 decompr=
essor module

:::::: TO: Gao Xiang <gaoxiang25@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3832605254439339132==--

