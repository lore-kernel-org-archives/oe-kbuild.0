Content-Type: multipart/mixed; boundary="===============5267986958657345808=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/slub_kunit.c:82 test_first_word() error: dereferencing freed memory 'p'
Date: Thu, 09 Dec 2021 06:11:26 +0800
Message-ID: <202112090618.yt3w9zDV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5267986958657345808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oliver Glitta <glittao@gmail.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 1f9f78b1b376f82cdd8ed73cc0abdb74d0453d43 mm/slub, kunit: add a KUni=
t test for SLUB debugging functionality
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/arc=
hive/20211209/202112090618.yt3w9zDV-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
lib/slub_kunit.c:82 test_first_word() error: dereferencing freed memory 'p'

vim +/p +82 lib/slub_kunit.c

1f9f78b1b376f8 Oliver Glitta 2021-06-28  74  =

1f9f78b1b376f8 Oliver Glitta 2021-06-28  75  static void test_first_word(st=
ruct kunit *test)
1f9f78b1b376f8 Oliver Glitta 2021-06-28  76  {
1f9f78b1b376f8 Oliver Glitta 2021-06-28  77  	struct kmem_cache *s =3D kmem=
_cache_create("TestSlub_1th_word_free", 64, 0,
1f9f78b1b376f8 Oliver Glitta 2021-06-28  78  				SLAB_POISON, NULL);
1f9f78b1b376f8 Oliver Glitta 2021-06-28  79  	u8 *p =3D kmem_cache_alloc(s,=
 GFP_KERNEL);
1f9f78b1b376f8 Oliver Glitta 2021-06-28  80  =

1f9f78b1b376f8 Oliver Glitta 2021-06-28  81  	kmem_cache_free(s, p);
1f9f78b1b376f8 Oliver Glitta 2021-06-28 @82  	*p =3D 0x78;
1f9f78b1b376f8 Oliver Glitta 2021-06-28  83  =

1f9f78b1b376f8 Oliver Glitta 2021-06-28  84  	validate_slab_cache(s);
1f9f78b1b376f8 Oliver Glitta 2021-06-28  85  	KUNIT_EXPECT_EQ(test, 2, slab=
_errors);
1f9f78b1b376f8 Oliver Glitta 2021-06-28  86  =

1f9f78b1b376f8 Oliver Glitta 2021-06-28  87  	kmem_cache_destroy(s);
1f9f78b1b376f8 Oliver Glitta 2021-06-28  88  }
1f9f78b1b376f8 Oliver Glitta 2021-06-28  89  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5267986958657345808==--

