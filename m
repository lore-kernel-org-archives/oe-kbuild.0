Content-Type: multipart/mixed; boundary="===============2749651494491906675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/lkdtm/bugs.c:247:16: warning: Array accessed at index 8, which is out of bounds.
Date: Wed, 10 Mar 2021 09:35:10 +0800
Message-ID: <202103100907.hjEkZsn6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2749651494491906675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b3d9f9cf108ebf2c48fbbbf30a8d1346d9cc7d6
commit: ae2e1aad3e48e495878d9f149e437a308bfdaefa drivers/misc/lkdtm/bugs.c:=
 add arithmetic overflow and array bounds checks
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/misc/lkdtm/bugs.c:247:16: warning: Array 'checked->data[8]' acce=
ssed at index 8, which is out of bounds. [arrayIndexOutOfBounds]
     checked->data[i] =3D 'B';
                  ^
>> drivers/misc/lkdtm/bugs.c:247:12: warning: Array 'checked.data[8]' acces=
sed at index 8, which is out of bounds. [arrayIndexOutOfBounds]
     checked->data[i] =3D 'B';
              ^

vim +247 drivers/misc/lkdtm/bugs.c

ae2e1aad3e48e4 Kees Cook 2020-04-06  224  =

ae2e1aad3e48e4 Kees Cook 2020-04-06  225  void lkdtm_ARRAY_BOUNDS(void)
ae2e1aad3e48e4 Kees Cook 2020-04-06  226  {
ae2e1aad3e48e4 Kees Cook 2020-04-06  227  	struct array_bounds_flex_array *=
not_checked;
ae2e1aad3e48e4 Kees Cook 2020-04-06  228  	struct array_bounds *checked;
ae2e1aad3e48e4 Kees Cook 2020-04-06  229  	volatile int i;
ae2e1aad3e48e4 Kees Cook 2020-04-06  230  =

ae2e1aad3e48e4 Kees Cook 2020-04-06  231  	not_checked =3D kmalloc(sizeof(*=
not_checked) * 2, GFP_KERNEL);
ae2e1aad3e48e4 Kees Cook 2020-04-06  232  	checked =3D kmalloc(sizeof(*chec=
ked) * 2, GFP_KERNEL);
ae2e1aad3e48e4 Kees Cook 2020-04-06  233  =

ae2e1aad3e48e4 Kees Cook 2020-04-06  234  	pr_info("Array access within bou=
nds ...\n");
ae2e1aad3e48e4 Kees Cook 2020-04-06  235  	/* For both, touch all bytes in =
the actual member size. */
ae2e1aad3e48e4 Kees Cook 2020-04-06  236  	for (i =3D 0; i < sizeof(checked=
->data); i++)
ae2e1aad3e48e4 Kees Cook 2020-04-06  237  		checked->data[i] =3D 'A';
ae2e1aad3e48e4 Kees Cook 2020-04-06  238  	/*
ae2e1aad3e48e4 Kees Cook 2020-04-06  239  	 * For the uninstrumented flex a=
rray member, also touch 1 byte
ae2e1aad3e48e4 Kees Cook 2020-04-06  240  	 * beyond to verify it is correc=
tly uninstrumented.
ae2e1aad3e48e4 Kees Cook 2020-04-06  241  	 */
ae2e1aad3e48e4 Kees Cook 2020-04-06  242  	for (i =3D 0; i < sizeof(not_che=
cked->data) + 1; i++)
ae2e1aad3e48e4 Kees Cook 2020-04-06  243  		not_checked->data[i] =3D 'A';
ae2e1aad3e48e4 Kees Cook 2020-04-06  244  =

ae2e1aad3e48e4 Kees Cook 2020-04-06  245  	pr_info("Array access beyond bou=
nds ...\n");
ae2e1aad3e48e4 Kees Cook 2020-04-06  246  	for (i =3D 0; i < sizeof(checked=
->data) + 1; i++)
ae2e1aad3e48e4 Kees Cook 2020-04-06 @247  		checked->data[i] =3D 'B';
ae2e1aad3e48e4 Kees Cook 2020-04-06  248  =

ae2e1aad3e48e4 Kees Cook 2020-04-06  249  	kfree(not_checked);
ae2e1aad3e48e4 Kees Cook 2020-04-06  250  	kfree(checked);
ae2e1aad3e48e4 Kees Cook 2020-04-06  251  }
ae2e1aad3e48e4 Kees Cook 2020-04-06  252  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2749651494491906675==--

