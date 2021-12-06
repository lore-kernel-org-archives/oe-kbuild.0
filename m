Content-Type: multipart/mixed; boundary="===============5053375860806843950=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [melver:kasan/dev 1/4] lib/test_kasan.c:718 kasan_global_oob_right() error: buffer overflow 'array' 10 <= 13
Date: Mon, 06 Dec 2021 22:24:55 +0800
Message-ID: <202112062202.wUxap8sZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5053375860806843950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: elver(a)google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ka=
san/dev
head:   96d518f350d75d04aa5cf44b01bcfeecadb7685c
commit: af20ac667de8a9cd873664238ead275e63f3a0c8 [1/4] kasan: test: add glo=
bals left-out-of-bounds test
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-m031-20211206 (https://download.01.org/0day-ci/archi=
ve/20211206/202112062202.wUxap8sZ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/test_kasan.c:718 kasan_global_oob_right() error: buffer overflow 'array=
' 10 <=3D 13

Old smatch warnings:
lib/test_kasan.c:139 kmalloc_oob_right() error: buffer overflow 'ptr' 115 <=
=3D 120
lib/test_kasan.c:142 kmalloc_oob_right() error: buffer overflow 'ptr' 115 <=
=3D 128
lib/test_kasan.c:168 kmalloc_node_oob_right() error: buffer overflow 'ptr' =
4096 <=3D 4096
lib/test_kasan.c:295 krealloc_more_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:295 krealloc_more_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:324 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:324 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:338 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[middle]'
lib/test_kasan.c:338 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[middle]'
lib/test_kasan.c:387 krealloc_uaf() warn: passing freed memory 'ptr1'
lib/test_kasan.c:425 kmalloc_uaf_16() error: dereferencing freed memory 'pt=
r2'
lib/test_kasan.c:566 kmalloc_uaf_memset() warn: passing freed memory 'ptr'
lib/test_kasan.c:751 ksize_unpoisons_memory() error: buffer overflow 'ptr' =
123 <=3D 123
lib/test_kasan.c:772 ksize_uaf() warn: passing freed memory 'ptr'
lib/test_kasan.c:836 kmem_cache_double_free() error: double free of 'p'

vim +/array +718 lib/test_kasan.c

3f15801cdc2379 Andrey Ryabinin     2015-02-13  702  =

af20ac667de8a9 Marco Elver         2021-11-16  703  static void kasan_globa=
l_oob_right(struct kunit *test)
3f15801cdc2379 Andrey Ryabinin     2015-02-13  704  {
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  705  	/*
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  706  	 * Deliberate out-of-b=
ounds access. To prevent CONFIG_UBSAN_LOCAL_BOUNDS
53b0fe36ab7c6e Zhen Lei            2021-07-07  707  	 * from failing here a=
nd panicking the kernel, access the array via a
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  708  	 * volatile pointer, w=
hich will prevent the compiler from being able to
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  709  	 * determine the array=
 bounds.
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  710  	 *
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  711  	 * This access uses a =
volatile pointer to char (char *volatile) rather
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  712  	 * than the more conve=
ntional pointer to volatile char (volatile char *)
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  713  	 * because we want to =
prevent the compiler from making inferences about
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  714  	 * the pointer itself =
(i.e. its array bounds), not the data that it
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  715  	 * refers to.
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  716  	 */
f649dc0e0d7b50 Peter Collingbourne 2021-05-14  717  	char *volatile array =
=3D global_array;
f649dc0e0d7b50 Peter Collingbourne 2021-05-14 @718  	char *p =3D &array[ARR=
AY_SIZE(global_array) + 3];
3f15801cdc2379 Andrey Ryabinin     2015-02-13  719  =

58b999d7a22c59 Andrey Konovalov    2020-11-01  720  	/* Only generic mode i=
nstruments globals. */
da17e377723f50 Andrey Konovalov    2021-02-24  721  	KASAN_TEST_NEEDS_CONFI=
G_ON(test, CONFIG_KASAN_GENERIC);
58b999d7a22c59 Andrey Konovalov    2020-11-01  722  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  723  	KUNIT_EXPECT_KASAN_FAI=
L(test, *(volatile char *)p);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  724  }
3f15801cdc2379 Andrey Ryabinin     2015-02-13  725  =


:::::: The code@line 718 was first introduced by commit
:::::: f649dc0e0d7b509c75570ee403723660f5b72ec7 kasan: fix unit tests with =
CONFIG_UBSAN_LOCAL_BOUNDS enabled

:::::: TO: Peter Collingbourne <pcc@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5053375860806843950==--

