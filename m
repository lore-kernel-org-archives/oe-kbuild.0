Content-Type: multipart/mixed; boundary="===============0311434618747008978=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/kcsan/kcsan_test.c:953:1: warning: the frame size of 2928 bytes is larger than 2048 bytes
Date: Mon, 21 Feb 2022 08:39:41 +0800
Message-ID: <202202210849.bnXkHus8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0311434618747008978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Leoshkevich <iii@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

Hi Ilya,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   77478077349f14c78e30faeac358cf1187c0f0c1
commit: e37b3dd063a1a68e28a7cfaf77c84c472112e330 s390: enable KCSAN
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: s390-randconfig-p002-20220220 (https://download.01.org/0day-ci/arch=
ive/20220221/202202210849.bnXkHus8-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De37b3dd063a1a68e28a7cfaf77c84c472112e330
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e37b3dd063a1a68e28a7cfaf77c84c472112e330
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 O=3Dbuild_dir ARCH=3Ds390 SHELL=3D/bin/bash kernel/kcsan/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/kcsan/kcsan_test.c: In function 'test_atomic_builtins':
   kernel/kcsan/kcsan_test.c:945:17: warning: 'atomic_thread_fence' is not =
supported with '-fsanitize=3Dthread' [-Wtsan]
     945 |                 __atomic_thread_fence(__ATOMIC_SEQ_CST);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcsan/kcsan_test.c:953:1: warning: the frame size of 2928 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
     953 | }
         | ^


vim +953 kernel/kcsan/kcsan_test.c

1fe84fd4a4027a kernel/kcsan/kcsan-test.c Marco Elver 2020-05-05  901  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  902  /*
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  903   * Te=
st atomic builtins work and required instrumentation functions exist. We
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  904   * al=
so test that KCSAN understands they're atomic by racing with them via
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  905   * te=
st_kernel_atomic_builtins(), and expect no reports.
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  906   *
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  907   * Th=
e atomic builtins _SHOULD NOT_ be used in normal kernel code!
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  908   */
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  909  stati=
c void test_atomic_builtins(struct kunit *test)
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  910  {
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  911  	bool=
 match_never =3D false;
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  912  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  913  	begi=
n_test_checks(test_kernel_atomic_builtins, test_kernel_atomic_builtins);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  914  	do {
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  915  		lon=
g tmp;
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  916  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  917  		kcs=
an_enable_current();
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  918  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  919  		__a=
tomic_store_n(&test_var, 42L, __ATOMIC_RELAXED);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  920  		KUN=
IT_EXPECT_EQ(test, 42L, __atomic_load_n(&test_var, __ATOMIC_RELAXED));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  921  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  922  		KUN=
IT_EXPECT_EQ(test, 42L, __atomic_exchange_n(&test_var, 20, __ATOMIC_RELAXED=
));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  923  		KUN=
IT_EXPECT_EQ(test, 20L, test_var);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  924  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  925  		tmp=
 =3D 20L;
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  926  		KUN=
IT_EXPECT_TRUE(test, __atomic_compare_exchange_n(&test_var, &tmp, 30L,
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  927  					=
			    0, __ATOMIC_RELAXED,
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  928  					=
			    __ATOMIC_RELAXED));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  929  		KUN=
IT_EXPECT_EQ(test, tmp, 20L);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  930  		KUN=
IT_EXPECT_EQ(test, test_var, 30L);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  931  		KUN=
IT_EXPECT_FALSE(test, __atomic_compare_exchange_n(&test_var, &tmp, 40L,
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  932  					=
			     1, __ATOMIC_RELAXED,
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  933  					=
			     __ATOMIC_RELAXED));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  934  		KUN=
IT_EXPECT_EQ(test, tmp, 30L);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  935  		KUN=
IT_EXPECT_EQ(test, test_var, 30L);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  936  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  937  		KUN=
IT_EXPECT_EQ(test, 30L, __atomic_fetch_add(&test_var, 1, __ATOMIC_RELAXED));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  938  		KUN=
IT_EXPECT_EQ(test, 31L, __atomic_fetch_sub(&test_var, 1, __ATOMIC_RELAXED));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  939  		KUN=
IT_EXPECT_EQ(test, 30L, __atomic_fetch_and(&test_var, 0xf, __ATOMIC_RELAXED=
));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  940  		KUN=
IT_EXPECT_EQ(test, 14L, __atomic_fetch_xor(&test_var, 0xf, __ATOMIC_RELAXED=
));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  941  		KUN=
IT_EXPECT_EQ(test, 1L, __atomic_fetch_or(&test_var, 0xf0, __ATOMIC_RELAXED)=
);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  942  		KUN=
IT_EXPECT_EQ(test, 241L, __atomic_fetch_nand(&test_var, 0xf, __ATOMIC_RELAX=
ED));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  943  		KUN=
IT_EXPECT_EQ(test, -2L, test_var);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  944  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  945  		__a=
tomic_thread_fence(__ATOMIC_SEQ_CST);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  946  		__a=
tomic_signal_fence(__ATOMIC_SEQ_CST);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  947  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  948  		kcs=
an_disable_current();
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  949  =

f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  950  		mat=
ch_never =3D report_available();
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  951  	} wh=
ile (!end_test_checks(match_never));
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  952  	KUNI=
T_EXPECT_FALSE(test, match_never);
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03 @953  }
f9ea6319313547 kernel/kcsan/kcsan-test.c Marco Elver 2020-07-03  954  =


:::::: The code at line 953 was first introduced by commit
:::::: f9ea63193135473ed6b6ff06f016eb6248100041 kcsan: Add atomic builtin t=
est case

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0311434618747008978==--

