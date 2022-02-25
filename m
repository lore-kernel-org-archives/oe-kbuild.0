Content-Type: multipart/mixed; boundary="===============2103584366814327080=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:506:5: warning: no previous prototype for function 'LZ4_decompress_safe_forceExtDict'
Date: Fri, 25 Feb 2022 23:41:18 +0800
Message-ID: <202202252346.u16uicku-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2103584366814327080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Mark Brown <broonie@kernel.org>
CC: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen =
<mazziesaccount@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   53ab78cd6d5aba25575a7cfb95729336ba9497d8
commit: 5ba3747dbc9ade2d22a8f5bff3c928cb41d35030 regulator: bd71815: add se=
lect to fix build
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-c004-20220225 (https://download.01.org/0day-ci/arch=
ive/20220225/202202252346.u16uicku-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5ba3747dbc9ade2d22a8f5bff3c928cb41d35030
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5ba3747dbc9ade2d22a8f5bff3c928cb41d35030
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:506:5: wa=
rning: no previous prototype for function 'LZ4_decompress_safe_forceExtDict=
' [-Wmissing-prototypes]
   int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
       ^
   arch/mips/boot/compressed/../../../../lib/lz4/lz4_decompress.c:506:1: no=
te: declare 'static' if the function is not intended to be used outside of =
this translation unit
   int LZ4_decompress_safe_forceExtDict(const char *source, char *dest,
   ^
   static =

   arch/mips/boot/compressed/decompress.c:83:6: warning: no previous protot=
ype for function '__stack_chk_fail' [-Wmissing-prototypes]
   void __stack_chk_fail(void)
        ^
   arch/mips/boot/compressed/decompress.c:83:1: note: declare 'static' if t=
he function is not intended to be used outside of this translation unit
   void __stack_chk_fail(void)
   ^
   static =

   arch/mips/boot/compressed/decompress.c:88:6: warning: no previous protot=
ype for function 'decompress_kernel' [-Wmissing-prototypes]
   void decompress_kernel(unsigned long boot_heap_start)
        ^
   arch/mips/boot/compressed/decompress.c:88:1: note: declare 'static' if t=
he function is not intended to be used outside of this translation unit
   void decompress_kernel(unsigned long boot_heap_start)
   ^
   static =

   5 warnings generated.


vim +/LZ4_decompress_safe_forceExtDict +506 arch/mips/boot/compressed/../..=
/../../lib/lz4/lz4_decompress.c

2209fda323e2fd Gao Xiang    2018-10-30  483  =

2209fda323e2fd Gao Xiang    2018-10-30 @484  int LZ4_decompress_safe_withPr=
efix64k(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  485  				      int compressedSize, =
int maxOutputSize)
2209fda323e2fd Gao Xiang    2018-10-30  486  {
2209fda323e2fd Gao Xiang    2018-10-30  487  	return LZ4_decompress_generic=
(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  488  				      compressedSize, maxO=
utputSize,
2209fda323e2fd Gao Xiang    2018-10-30  489  				      endOnInputSize, deco=
de_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  490  				      withPrefix64k,
2209fda323e2fd Gao Xiang    2018-10-30  491  				      (BYTE *)dest - 64 * =
KB, NULL, 0);
2209fda323e2fd Gao Xiang    2018-10-30  492  }
2209fda323e2fd Gao Xiang    2018-10-30  493  =

2209fda323e2fd Gao Xiang    2018-10-30  494  static int LZ4_decompress_safe=
_withSmallPrefix(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  495  					       int compressedSize,
2209fda323e2fd Gao Xiang    2018-10-30  496  					       int maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  497  					       size_t prefixSize)
2209fda323e2fd Gao Xiang    2018-10-30  498  {
2209fda323e2fd Gao Xiang    2018-10-30  499  	return LZ4_decompress_generic=
(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  500  				      compressedSize, maxO=
utputSize,
2209fda323e2fd Gao Xiang    2018-10-30  501  				      endOnInputSize, deco=
de_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  502  				      noDict,
2209fda323e2fd Gao Xiang    2018-10-30  503  				      (BYTE *)dest - prefi=
xSize, NULL, 0);
4e1a33b105ddf2 Sven Schmidt 2017-02-24  504  }
cffb78b0e0b3a3 Kyungsik Lee 2013-07-08  505  =

2209fda323e2fd Gao Xiang    2018-10-30 @506  int LZ4_decompress_safe_forceE=
xtDict(const char *source, char *dest,
2209fda323e2fd Gao Xiang    2018-10-30  507  				     int compressedSize, i=
nt maxOutputSize,
2209fda323e2fd Gao Xiang    2018-10-30  508  				     const void *dictStart=
, size_t dictSize)
2209fda323e2fd Gao Xiang    2018-10-30  509  {
2209fda323e2fd Gao Xiang    2018-10-30  510  	return LZ4_decompress_generic=
(source, dest,
2209fda323e2fd Gao Xiang    2018-10-30  511  				      compressedSize, maxO=
utputSize,
2209fda323e2fd Gao Xiang    2018-10-30  512  				      endOnInputSize, deco=
de_full_block,
2209fda323e2fd Gao Xiang    2018-10-30  513  				      usingExtDict, (BYTE =
*)dest,
2209fda323e2fd Gao Xiang    2018-10-30  514  				      (const BYTE *)dictSt=
art, dictSize);
2209fda323e2fd Gao Xiang    2018-10-30  515  }
2209fda323e2fd Gao Xiang    2018-10-30  516  =


:::::: The code at line 506 was first introduced by commit
:::::: 2209fda323e2fd2a2d0885595fd5097717f8d2aa lib/lz4: update LZ4 decompr=
essor module

:::::: TO: Gao Xiang <gaoxiang25@huawei.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2103584366814327080==--

