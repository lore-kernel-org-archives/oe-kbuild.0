Content-Type: multipart/mixed; boundary="===============5270179498531034270=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/overflow 4/7] lib/overflow_kunit.c:485:13-14: WARNING: array_size is used later (line 492) to compute the same size
Date: Thu, 24 Feb 2022 21:48:11 +0800
Message-ID: <202202242123.sYLn090M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5270179498531034270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Vitor Massaru Iha <vitor@massaru.org>
CC: Daniel Latypov <dlatypov@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/overflow
head:   2ee9b438ef95e4d1a41fba18fd837d1cea67d4a8
commit: 8c7cda57cfb9c6be06dafe8d5077483e7ded637c [4/7] lib: overflow: Conve=
rt to Kunit
:::::: branch date: 8 hours ago
:::::: commit date: 7 days ago
config: powerpc64-randconfig-c023-20220223 (https://download.01.org/0day-ci=
/archive/20220224/202202242123.sYLn090M-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> lib/overflow_kunit.c:485:13-14: WARNING: array_size is used later (line =
492) to compute the same size

vim +485 lib/overflow_kunit.c

ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  469  =

ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  470  #define DEFI=
NE_TEST_ALLOC(func, free_func, want_arg, want_gfp, want_node)\
8c7cda57cfb9c6 lib/overflow_kunit.c Kees Cook 2022-02-16  471  static void =
test_ ## func (struct kunit *test, void *arg)		\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  472  {									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  473  	volatile si=
ze_t a =3D TEST_SIZE;					\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  474  	volatile si=
ze_t b =3D (SIZE_MAX / TEST_SIZE) + 1;			\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  475  	void *ptr;	=
						\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  476  									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  477  	/* Tiny all=
ocation test. */					\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  478  	ptr =3D all=
oc ## want_arg ## want_gfp ## want_node (func, arg, 1);\
8c7cda57cfb9c6 lib/overflow_kunit.c Kees Cook 2022-02-16  479  	KUNIT_ASSER=
T_NOT_ERR_OR_NULL_MSG(test, ptr,			\
8c7cda57cfb9c6 lib/overflow_kunit.c Kees Cook 2022-02-16  480  			    #func=
 " failed regular allocation?!\n");	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  481  	free ## wan=
t_arg (free_func, arg, ptr);				\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  482  									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  483  	/* Wrapped =
allocation test. */					\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  484  	ptr =3D all=
oc ## want_arg ## want_gfp ## want_node (func, arg,	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10 @485  							  a *=
 b);	\
8c7cda57cfb9c6 lib/overflow_kunit.c Kees Cook 2022-02-16  486  	KUNIT_ASSER=
T_NOT_ERR_OR_NULL_MSG(test, ptr,			\
8c7cda57cfb9c6 lib/overflow_kunit.c Kees Cook 2022-02-16  487  			    #func=
 " unexpectedly failed bad wrapping?!\n"); \
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  488  	free ## wan=
t_arg (free_func, arg, ptr);				\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  489  									\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  490  	/* Saturate=
d allocation test. */				\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  491  	ptr =3D all=
oc ## want_arg ## want_gfp ## want_node (func, arg,	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10 @492  						   arr=
ay_size(a, b));	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  493  	if (ptr) {	=
						\
8c7cda57cfb9c6 lib/overflow_kunit.c Kees Cook 2022-02-16  494  		KUNIT_FAIL=
(test, #func " missed saturation!\n");	\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  495  		free ## wa=
nt_arg (free_func, arg, ptr);			\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  496  	}								\
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  497  }
ca90800a91ba72 lib/test_overflow.c  Kees Cook 2018-05-10  498  =


:::::: The code at line 485 was first introduced by commit
:::::: ca90800a91ba723d78ded634d037c1d2df8b54d6 test_overflow: Add memory a=
llocation overflow tests

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5270179498531034270==--

