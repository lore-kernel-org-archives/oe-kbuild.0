Content-Type: multipart/mixed; boundary="===============8339994872790427164=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_kasan.c:467:7: warning: Variable 'alloca_array' is not assigned a value.
Date: Tue, 09 Mar 2021 02:34:25 +0800
Message-ID: <202103090212.L8oQcsdN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8339994872790427164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)01.org
CC: linux-kernel(a)vger.kernel.org
TO: Patricia Alfonso <trishalfonso@google.com>
CC: David Gow <davidgow@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Brendan Higgins <brendanhiggins@google.com>
CC: Andrey Konovalov <andreyknvl@google.com>
CC: Dmitry Vyukov <dvyukov@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
commit: 73228c7ecc5e40c0851c4703c5ec6ed38123e989 KASAN: port KASAN Tests to=
 KUnit
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> lib/test_kasan.c:467:7: warning: Variable 'alloca_array' is not assigned=
 a value. [unassignedVariable]
    char alloca_array[i];
         ^
   lib/test_kasan.c:481:7: warning: Variable 'alloca_array' is not assigned=
 a value. [unassignedVariable]
    char alloca_array[i];
         ^
>> lib/test_kasan.c:468:25: warning: Undefined behaviour, pointer arithmeti=
c 'alloca_array-1' is out of bounds. [pointerOutOfBounds]
    char *p =3D alloca_array - 1;
                           ^
>> lib/test_kasan.c:302:2: warning: Invalid memmove() argument nr 3. The va=
lue is -2 but the valid values are '0:'. [invalidFunctionArg]
    KUNIT_EXPECT_KASAN_FAIL(test,
    ^
   lib/test_kasan.c:295:34: note: Assignment 'invalid_size=3D-2', assigned =
value is -2
    volatile size_t invalid_size =3D -2;
                                    ^
   lib/test_kasan.c:302:2: note: Invalid argument
    KUNIT_EXPECT_KASAN_FAIL(test,
    ^

vim +/alloca_array +467 lib/test_kasan.c

3f15801cdc2379 Andrey Ryabinin     2015-02-13  290  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  291  static void kmalloc_mem=
move_invalid_size(struct kunit *test)
98f3b56fa62a61 Walter Wu           2020-04-01  292  {
98f3b56fa62a61 Walter Wu           2020-04-01  293  	char *ptr;
98f3b56fa62a61 Walter Wu           2020-04-01  294  	size_t size =3D 64;
98f3b56fa62a61 Walter Wu           2020-04-01  295  	volatile size_t invali=
d_size =3D -2;
98f3b56fa62a61 Walter Wu           2020-04-01  296  =

98f3b56fa62a61 Walter Wu           2020-04-01  297  	ptr =3D kmalloc(size, =
GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  298  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
98f3b56fa62a61 Walter Wu           2020-04-01  299  =

98f3b56fa62a61 Walter Wu           2020-04-01  300  	memset((char *)ptr, 0,=
 64);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  301  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13 @302  	KUNIT_EXPECT_KASAN_FAI=
L(test,
73228c7ecc5e40 Patricia Alfonso    2020-10-13  303  		memmove((char *)ptr, =
(char *)ptr + 4, invalid_size));
98f3b56fa62a61 Walter Wu           2020-04-01  304  	kfree(ptr);
98f3b56fa62a61 Walter Wu           2020-04-01  305  }
98f3b56fa62a61 Walter Wu           2020-04-01  306  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  307  static void kmalloc_uaf=
(struct kunit *test)
3f15801cdc2379 Andrey Ryabinin     2015-02-13  308  {
3f15801cdc2379 Andrey Ryabinin     2015-02-13  309  	char *ptr;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  310  	size_t size =3D 10;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  311  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  312  	ptr =3D kmalloc(size, =
GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  313  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  314  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  315  	kfree(ptr);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  316  	KUNIT_EXPECT_KASAN_FAI=
L(test, *(ptr + 8) =3D 'x');
3f15801cdc2379 Andrey Ryabinin     2015-02-13  317  }
3f15801cdc2379 Andrey Ryabinin     2015-02-13  318  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  319  static void kmalloc_uaf=
_memset(struct kunit *test)
3f15801cdc2379 Andrey Ryabinin     2015-02-13  320  {
3f15801cdc2379 Andrey Ryabinin     2015-02-13  321  	char *ptr;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  322  	size_t size =3D 33;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  323  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  324  	ptr =3D kmalloc(size, =
GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  325  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  326  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  327  	kfree(ptr);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  328  	KUNIT_EXPECT_KASAN_FAI=
L(test, memset(ptr, 0, size));
3f15801cdc2379 Andrey Ryabinin     2015-02-13  329  }
3f15801cdc2379 Andrey Ryabinin     2015-02-13  330  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  331  static void kmalloc_uaf=
2(struct kunit *test)
3f15801cdc2379 Andrey Ryabinin     2015-02-13  332  {
3f15801cdc2379 Andrey Ryabinin     2015-02-13  333  	char *ptr1, *ptr2;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  334  	size_t size =3D 43;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  335  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  336  	ptr1 =3D kmalloc(size,=
 GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  337  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr1);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  338  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  339  	kfree(ptr1);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  340  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  341  	ptr2 =3D kmalloc(size,=
 GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  342  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr2);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  343  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  344  	KUNIT_EXPECT_KASAN_FAI=
L(test, ptr1[40] =3D 'x');
73228c7ecc5e40 Patricia Alfonso    2020-10-13  345  	KUNIT_EXPECT_PTR_NE(te=
st, ptr1, ptr2);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  346  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  347  	kfree(ptr2);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  348  }
3f15801cdc2379 Andrey Ryabinin     2015-02-13  349  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  350  static void kfree_via_p=
age(struct kunit *test)
b92a953cb7f727 Mark Rutland        2019-09-23  351  {
b92a953cb7f727 Mark Rutland        2019-09-23  352  	char *ptr;
b92a953cb7f727 Mark Rutland        2019-09-23  353  	size_t size =3D 8;
b92a953cb7f727 Mark Rutland        2019-09-23  354  	struct page *page;
b92a953cb7f727 Mark Rutland        2019-09-23  355  	unsigned long offset;
b92a953cb7f727 Mark Rutland        2019-09-23  356  =

b92a953cb7f727 Mark Rutland        2019-09-23  357  	ptr =3D kmalloc(size, =
GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  358  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
b92a953cb7f727 Mark Rutland        2019-09-23  359  =

b92a953cb7f727 Mark Rutland        2019-09-23  360  	page =3D virt_to_page(=
ptr);
b92a953cb7f727 Mark Rutland        2019-09-23  361  	offset =3D offset_in_p=
age(ptr);
b92a953cb7f727 Mark Rutland        2019-09-23  362  	kfree(page_address(pag=
e) + offset);
b92a953cb7f727 Mark Rutland        2019-09-23  363  }
b92a953cb7f727 Mark Rutland        2019-09-23  364  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  365  static void kfree_via_p=
hys(struct kunit *test)
b92a953cb7f727 Mark Rutland        2019-09-23  366  {
b92a953cb7f727 Mark Rutland        2019-09-23  367  	char *ptr;
b92a953cb7f727 Mark Rutland        2019-09-23  368  	size_t size =3D 8;
b92a953cb7f727 Mark Rutland        2019-09-23  369  	phys_addr_t phys;
b92a953cb7f727 Mark Rutland        2019-09-23  370  =

b92a953cb7f727 Mark Rutland        2019-09-23  371  	ptr =3D kmalloc(size, =
GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  372  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
b92a953cb7f727 Mark Rutland        2019-09-23  373  =

b92a953cb7f727 Mark Rutland        2019-09-23  374  	phys =3D virt_to_phys(=
ptr);
b92a953cb7f727 Mark Rutland        2019-09-23  375  	kfree(phys_to_virt(phy=
s));
b92a953cb7f727 Mark Rutland        2019-09-23  376  }
b92a953cb7f727 Mark Rutland        2019-09-23  377  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  378  static void kmem_cache_=
oob(struct kunit *test)
3f15801cdc2379 Andrey Ryabinin     2015-02-13  379  {
3f15801cdc2379 Andrey Ryabinin     2015-02-13  380  	char *p;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  381  	size_t size =3D 200;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  382  	struct kmem_cache *cac=
he =3D kmem_cache_create("test_cache",
3f15801cdc2379 Andrey Ryabinin     2015-02-13  383  						size, 0,
3f15801cdc2379 Andrey Ryabinin     2015-02-13  384  						0, NULL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  385  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, cache);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  386  	p =3D kmem_cache_alloc=
(cache, GFP_KERNEL);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  387  	if (!p) {
73228c7ecc5e40 Patricia Alfonso    2020-10-13  388  		kunit_err(test, "Allo=
cation failed: %s\n", __func__);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  389  		kmem_cache_destroy(ca=
che);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  390  		return;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  391  	}
3f15801cdc2379 Andrey Ryabinin     2015-02-13  392  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  393  	KUNIT_EXPECT_KASAN_FAI=
L(test, *p =3D p[size + OOB_TAG_OFF]);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  394  	kmem_cache_free(cache,=
 p);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  395  	kmem_cache_destroy(cac=
he);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  396  }
3f15801cdc2379 Andrey Ryabinin     2015-02-13  397  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  398  static void memcg_accou=
nted_kmem_cache(struct kunit *test)
0386bf385d9dbb Greg Thelen         2017-02-24  399  {
0386bf385d9dbb Greg Thelen         2017-02-24  400  	int i;
0386bf385d9dbb Greg Thelen         2017-02-24  401  	char *p;
0386bf385d9dbb Greg Thelen         2017-02-24  402  	size_t size =3D 200;
0386bf385d9dbb Greg Thelen         2017-02-24  403  	struct kmem_cache *cac=
he;
0386bf385d9dbb Greg Thelen         2017-02-24  404  =

0386bf385d9dbb Greg Thelen         2017-02-24  405  	cache =3D kmem_cache_c=
reate("test_cache", size, 0, SLAB_ACCOUNT, NULL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  406  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, cache);
0386bf385d9dbb Greg Thelen         2017-02-24  407  =

0386bf385d9dbb Greg Thelen         2017-02-24  408  	/*
0386bf385d9dbb Greg Thelen         2017-02-24  409  	 * Several allocations=
 with a delay to allow for lazy per memcg kmem
0386bf385d9dbb Greg Thelen         2017-02-24  410  	 * cache creation.
0386bf385d9dbb Greg Thelen         2017-02-24  411  	 */
0386bf385d9dbb Greg Thelen         2017-02-24  412  	for (i =3D 0; i < 5; i=
++) {
0386bf385d9dbb Greg Thelen         2017-02-24  413  		p =3D kmem_cache_allo=
c(cache, GFP_KERNEL);
dc2bf000a2848c Markus Elfring      2017-11-17  414  		if (!p)
0386bf385d9dbb Greg Thelen         2017-02-24  415  			goto free_cache;
dc2bf000a2848c Markus Elfring      2017-11-17  416  =

0386bf385d9dbb Greg Thelen         2017-02-24  417  		kmem_cache_free(cache=
, p);
0386bf385d9dbb Greg Thelen         2017-02-24  418  		msleep(100);
0386bf385d9dbb Greg Thelen         2017-02-24  419  	}
0386bf385d9dbb Greg Thelen         2017-02-24  420  =

0386bf385d9dbb Greg Thelen         2017-02-24  421  free_cache:
0386bf385d9dbb Greg Thelen         2017-02-24  422  	kmem_cache_destroy(cac=
he);
0386bf385d9dbb Greg Thelen         2017-02-24  423  }
0386bf385d9dbb Greg Thelen         2017-02-24  424  =

3f15801cdc2379 Andrey Ryabinin     2015-02-13  425  static char global_arra=
y[10];
3f15801cdc2379 Andrey Ryabinin     2015-02-13  426  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  427  static void kasan_globa=
l_oob(struct kunit *test)
3f15801cdc2379 Andrey Ryabinin     2015-02-13  428  {
3f15801cdc2379 Andrey Ryabinin     2015-02-13  429  	volatile int i =3D 3;
3f15801cdc2379 Andrey Ryabinin     2015-02-13  430  	char *p =3D &global_ar=
ray[ARRAY_SIZE(global_array) + i];
3f15801cdc2379 Andrey Ryabinin     2015-02-13  431  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  432  	KUNIT_EXPECT_KASAN_FAI=
L(test, *(volatile char *)p);
3f15801cdc2379 Andrey Ryabinin     2015-02-13  433  }
3f15801cdc2379 Andrey Ryabinin     2015-02-13  434  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  435  static void ksize_unpoi=
sons_memory(struct kunit *test)
96fe805fb6fe9b Alexander Potapenko 2016-05-20  436  {
96fe805fb6fe9b Alexander Potapenko 2016-05-20  437  	char *ptr;
48c232395431c2 Colin Ian King      2018-02-06  438  	size_t size =3D 123, r=
eal_size;
96fe805fb6fe9b Alexander Potapenko 2016-05-20  439  =

96fe805fb6fe9b Alexander Potapenko 2016-05-20  440  	ptr =3D kmalloc(size, =
GFP_KERNEL);
73228c7ecc5e40 Patricia Alfonso    2020-10-13  441  	KUNIT_ASSERT_NOT_ERR_O=
R_NULL(test, ptr);
96fe805fb6fe9b Alexander Potapenko 2016-05-20  442  	real_size =3D ksize(pt=
r);
96fe805fb6fe9b Alexander Potapenko 2016-05-20  443  	/* This access doesn't=
 trigger an error. */
96fe805fb6fe9b Alexander Potapenko 2016-05-20  444  	ptr[size] =3D 'x';
96fe805fb6fe9b Alexander Potapenko 2016-05-20  445  	/* This one does. */
73228c7ecc5e40 Patricia Alfonso    2020-10-13  446  	KUNIT_EXPECT_KASAN_FAI=
L(test, ptr[real_size] =3D 'y');
96fe805fb6fe9b Alexander Potapenko 2016-05-20  447  	kfree(ptr);
96fe805fb6fe9b Alexander Potapenko 2016-05-20  448  }
96fe805fb6fe9b Alexander Potapenko 2016-05-20  449  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  450  static void kasan_stack=
_oob(struct kunit *test)
eae08dcab80c69 Andrey Ryabinin     2016-05-20  451  {
73228c7ecc5e40 Patricia Alfonso    2020-10-13  452  	char stack_array[10];
73228c7ecc5e40 Patricia Alfonso    2020-10-13  453  	volatile int i =3D OOB=
_TAG_OFF;
73228c7ecc5e40 Patricia Alfonso    2020-10-13  454  	char *p =3D &stack_arr=
ay[ARRAY_SIZE(stack_array) + i];
eae08dcab80c69 Andrey Ryabinin     2016-05-20  455  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  456  	if (!IS_ENABLED(CONFIG=
_KASAN_STACK)) {
73228c7ecc5e40 Patricia Alfonso    2020-10-13  457  		kunit_info(test, "CON=
FIG_KASAN_STACK is not enabled");
eae08dcab80c69 Andrey Ryabinin     2016-05-20  458  		return;
eae08dcab80c69 Andrey Ryabinin     2016-05-20  459  	}
eae08dcab80c69 Andrey Ryabinin     2016-05-20  460  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  461  	KUNIT_EXPECT_KASAN_FAI=
L(test, *(volatile char *)p);
eae08dcab80c69 Andrey Ryabinin     2016-05-20  462  }
eae08dcab80c69 Andrey Ryabinin     2016-05-20  463  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  464  static void kasan_alloc=
a_oob_left(struct kunit *test)
00a14294bb33af Paul Lawrence       2018-02-06  465  {
00a14294bb33af Paul Lawrence       2018-02-06  466  	volatile int i =3D 10;
00a14294bb33af Paul Lawrence       2018-02-06 @467  	char alloca_array[i];
00a14294bb33af Paul Lawrence       2018-02-06 @468  	char *p =3D alloca_arr=
ay - 1;
00a14294bb33af Paul Lawrence       2018-02-06  469  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  470  	if (!IS_ENABLED(CONFIG=
_KASAN_STACK)) {
73228c7ecc5e40 Patricia Alfonso    2020-10-13  471  		kunit_info(test, "CON=
FIG_KASAN_STACK is not enabled");
73228c7ecc5e40 Patricia Alfonso    2020-10-13  472  		return;
73228c7ecc5e40 Patricia Alfonso    2020-10-13  473  	}
73228c7ecc5e40 Patricia Alfonso    2020-10-13  474  =

73228c7ecc5e40 Patricia Alfonso    2020-10-13  475  	KUNIT_EXPECT_KASAN_FAI=
L(test, *(volatile char *)p);
00a14294bb33af Paul Lawrence       2018-02-06  476  }
00a14294bb33af Paul Lawrence       2018-02-06  477  =


:::::: The code@line 467 was first introduced by commit
:::::: 00a14294bb33af533f7ac002fb20623fdd8ea0d7 kasan: add tests for alloca=
 poisoning

:::::: TO: Paul Lawrence <paullawrence@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8339994872790427164==--

