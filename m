Content-Type: multipart/mixed; boundary="===============1396152200766895518=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 39/39] kasan: improve vmalloc tests
Date: Tue, 01 Feb 2022 12:07:09 +0800
Message-ID: <202202011229.CGse5glc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1396152200766895518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <bbdc1c0501c5275e7f26fdb8e2a7b14a40a9f36b.1643047180.git.andre=
yknvl@google.com>
References: <bbdc1c0501c5275e7f26fdb8e2a7b14a40a9f36b.1643047180.git.andrey=
knvl@google.com>
TO: andrey.konovalov(a)linux.dev

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc2]
[cannot apply to arm64/for-next/core rostedt-trace/for-next next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/andrey-konovalov-linux-dev=
/kasan-vmalloc-arm64-add-vmalloc-tagging-support-for-SW-HW_TAGS/20220125-02=
1005
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-m031-20220131 (https://download.01.org/0day-ci/arc=
hive/20220201/202202011229.CGse5glc-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
lib/test_kasan.c:1111 vmalloc_oob() error: buffer overflow 'v_ptr' 32755 <=
=3D 32760

Old smatch warnings:
lib/test_kasan.c:140 kmalloc_oob_right() error: buffer overflow 'ptr' 115 <=
=3D 120
lib/test_kasan.c:143 kmalloc_oob_right() error: buffer overflow 'ptr' 115 <=
=3D 128
lib/test_kasan.c:169 kmalloc_node_oob_right() error: buffer overflow 'ptr' =
4096 <=3D 4096
lib/test_kasan.c:296 krealloc_more_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:296 krealloc_more_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:325 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:325 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[size2]'
lib/test_kasan.c:339 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[middle]'
lib/test_kasan.c:339 krealloc_less_oob_helper() warn: potentially one past =
the end of array 'ptr2[middle]'
lib/test_kasan.c:388 krealloc_uaf() warn: passing freed memory 'ptr1'
lib/test_kasan.c:426 kmalloc_uaf_16() error: dereferencing freed memory 'pt=
r2'
lib/test_kasan.c:567 kmalloc_uaf_memset() warn: passing freed memory 'ptr'
lib/test_kasan.c:719 kasan_global_oob_right() error: buffer overflow 'array=
' 10 <=3D 13
lib/test_kasan.c:752 ksize_unpoisons_memory() error: buffer overflow 'ptr' =
123 <=3D 123
lib/test_kasan.c:773 ksize_uaf() warn: passing freed memory 'ptr'
lib/test_kasan.c:837 kmem_cache_double_free() error: double free of 'p'

vim +/v_ptr +1111 lib/test_kasan.c

0455c9f282348e Andrey Konovalov 2022-01-24  1082  =

73228c7ecc5e40 Patricia Alfonso 2020-10-13  1083  static void vmalloc_oob(s=
truct kunit *test)
06513916930125 Daniel Axtens    2019-11-30  1084  {
0455c9f282348e Andrey Konovalov 2022-01-24  1085  	char *v_ptr, *p_ptr;
0455c9f282348e Andrey Konovalov 2022-01-24  1086  	struct page *page;
0455c9f282348e Andrey Konovalov 2022-01-24  1087  	size_t size =3D PAGE_SIZ=
E / 2 - KASAN_GRANULE_SIZE - 5;
06513916930125 Daniel Axtens    2019-11-30  1088  =

da17e377723f50 Andrey Konovalov 2021-02-24  1089  	KASAN_TEST_NEEDS_CONFIG_=
ON(test, CONFIG_KASAN_VMALLOC);
06513916930125 Daniel Axtens    2019-11-30  1090  =

0455c9f282348e Andrey Konovalov 2022-01-24  1091  	v_ptr =3D vmalloc(size);
0455c9f282348e Andrey Konovalov 2022-01-24  1092  	KUNIT_ASSERT_NOT_ERR_OR_=
NULL(test, v_ptr);
0455c9f282348e Andrey Konovalov 2022-01-24  1093  =

06513916930125 Daniel Axtens    2019-11-30  1094  	/*
0455c9f282348e Andrey Konovalov 2022-01-24  1095  	 * We have to be careful=
 not to hit the guard page in vmalloc tests.
06513916930125 Daniel Axtens    2019-11-30  1096  	 * The MMU will catch th=
at and crash us.
06513916930125 Daniel Axtens    2019-11-30  1097  	 */
06513916930125 Daniel Axtens    2019-11-30  1098  =

0455c9f282348e Andrey Konovalov 2022-01-24  1099  	/* Make sure in-bounds a=
ccesses are valid. */
0455c9f282348e Andrey Konovalov 2022-01-24  1100  	v_ptr[0] =3D 0;
0455c9f282348e Andrey Konovalov 2022-01-24  1101  	v_ptr[size - 1] =3D 0;
0455c9f282348e Andrey Konovalov 2022-01-24  1102  =

0455c9f282348e Andrey Konovalov 2022-01-24  1103  	/*
0455c9f282348e Andrey Konovalov 2022-01-24  1104  	 * An unaligned access p=
ast the requested vmalloc size.
0455c9f282348e Andrey Konovalov 2022-01-24  1105  	 * Only generic KASAN ca=
n precisely detect these.
0455c9f282348e Andrey Konovalov 2022-01-24  1106  	 */
0455c9f282348e Andrey Konovalov 2022-01-24  1107  	if (IS_ENABLED(CONFIG_KA=
SAN_GENERIC))
0455c9f282348e Andrey Konovalov 2022-01-24  1108  		KUNIT_EXPECT_KASAN_FAIL=
(test, ((volatile char *)v_ptr)[size]);
0455c9f282348e Andrey Konovalov 2022-01-24  1109  =

0455c9f282348e Andrey Konovalov 2022-01-24  1110  	/* An aligned access int=
o the first out-of-bounds granule. */
0455c9f282348e Andrey Konovalov 2022-01-24 @1111  	KUNIT_EXPECT_KASAN_FAIL(=
test, ((volatile char *)v_ptr)[size + 5]);
0455c9f282348e Andrey Konovalov 2022-01-24  1112  =

0455c9f282348e Andrey Konovalov 2022-01-24  1113  	/* Check that in-bounds =
accesses to the physical page are valid. */
0455c9f282348e Andrey Konovalov 2022-01-24  1114  	page =3D vmalloc_to_page=
(v_ptr);
0455c9f282348e Andrey Konovalov 2022-01-24  1115  	KUNIT_ASSERT_NOT_ERR_OR_=
NULL(test, page);
0455c9f282348e Andrey Konovalov 2022-01-24  1116  	p_ptr =3D page_address(p=
age);
0455c9f282348e Andrey Konovalov 2022-01-24  1117  	KUNIT_ASSERT_NOT_ERR_OR_=
NULL(test, p_ptr);
0455c9f282348e Andrey Konovalov 2022-01-24  1118  	p_ptr[0] =3D 0;
0455c9f282348e Andrey Konovalov 2022-01-24  1119  =

0455c9f282348e Andrey Konovalov 2022-01-24  1120  	vfree(v_ptr);
0455c9f282348e Andrey Konovalov 2022-01-24  1121  =

0455c9f282348e Andrey Konovalov 2022-01-24  1122  	/*
0455c9f282348e Andrey Konovalov 2022-01-24  1123  	 * We can't check for us=
e-after-unmap bugs in this nor in the following
0455c9f282348e Andrey Konovalov 2022-01-24  1124  	 * vmalloc tests, as the=
 page might be fully unmapped and accessing it
0455c9f282348e Andrey Konovalov 2022-01-24  1125  	 * will crash the kernel.
0455c9f282348e Andrey Konovalov 2022-01-24  1126  	 */
0455c9f282348e Andrey Konovalov 2022-01-24  1127  }
0455c9f282348e Andrey Konovalov 2022-01-24  1128  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1396152200766895518==--

