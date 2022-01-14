Content-Type: multipart/mixed; boundary="===============2837982495511535535=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] lkdtm/bugs: Check for the NULL pointer after calling kmalloc
Date: Sat, 15 Jan 2022 06:41:02 +0800
Message-ID: <202201150641.NvpCoUdU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2837982495511535535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220114082119.1270966-1-jiasheng@iscas.ac.cn>
References: <20220114082119.1270966-1-jiasheng@iscas.ac.cn>
TO: Jiasheng Jiang <jiasheng@iscas.ac.cn>
TO: keescook(a)chromium.org
TO: arnd(a)arndb.de
TO: gregkh(a)linuxfoundation.org
CC: linux-kernel(a)vger.kernel.org
CC: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Hi Jiasheng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on kees/for-next/pstore soc/for-next linus/master =
v5.16 next-20220114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiasheng-Jiang/lkdtm-bugs-=
Check-for-the-NULL-pointer-after-calling-kmalloc/20220114-162452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t d47c7407b4c88cf66098eba8893bc38279f301fc
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm-randconfig-m031-20220113 (https://download.01.org/0day-ci/archi=
ve/20220115/202201150641.NvpCoUdU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/lkdtm/bugs.c:331 lkdtm_ARRAY_BOUNDS() warn: possible memory le=
ak of 'checked'
drivers/misc/lkdtm/bugs.c:331 lkdtm_ARRAY_BOUNDS() warn: possible memory le=
ak of 'not_checked'

Old smatch warnings:
drivers/misc/lkdtm/bugs.c:346 lkdtm_ARRAY_BOUNDS() error: buffer overflow '=
checked->data' 8 <=3D 8

vim +/checked +331 drivers/misc/lkdtm/bugs.c

ae2e1aad3e48e4 Kees Cook      2020-04-06  321  =

ae2e1aad3e48e4 Kees Cook      2020-04-06  322  void lkdtm_ARRAY_BOUNDS(void)
ae2e1aad3e48e4 Kees Cook      2020-04-06  323  {
ae2e1aad3e48e4 Kees Cook      2020-04-06  324  	struct array_bounds_flex_ar=
ray *not_checked;
ae2e1aad3e48e4 Kees Cook      2020-04-06  325  	struct array_bounds *checke=
d;
ae2e1aad3e48e4 Kees Cook      2020-04-06  326  	volatile int i;
ae2e1aad3e48e4 Kees Cook      2020-04-06  327  =

ae2e1aad3e48e4 Kees Cook      2020-04-06  328  	not_checked =3D kmalloc(siz=
eof(*not_checked) * 2, GFP_KERNEL);
ae2e1aad3e48e4 Kees Cook      2020-04-06  329  	checked =3D kmalloc(sizeof(=
*checked) * 2, GFP_KERNEL);
6ac33daa73b3fe Jiasheng Jiang 2022-01-14  330  	if (!not_checked || !checke=
d)
6ac33daa73b3fe Jiasheng Jiang 2022-01-14 @331  		return;
ae2e1aad3e48e4 Kees Cook      2020-04-06  332  =

ae2e1aad3e48e4 Kees Cook      2020-04-06  333  	pr_info("Array access withi=
n bounds ...\n");
ae2e1aad3e48e4 Kees Cook      2020-04-06  334  	/* For both, touch all byte=
s in the actual member size. */
ae2e1aad3e48e4 Kees Cook      2020-04-06  335  	for (i =3D 0; i < sizeof(ch=
ecked->data); i++)
ae2e1aad3e48e4 Kees Cook      2020-04-06  336  		checked->data[i] =3D 'A';
ae2e1aad3e48e4 Kees Cook      2020-04-06  337  	/*
ae2e1aad3e48e4 Kees Cook      2020-04-06  338  	 * For the uninstrumented f=
lex array member, also touch 1 byte
ae2e1aad3e48e4 Kees Cook      2020-04-06  339  	 * beyond to verify it is c=
orrectly uninstrumented.
ae2e1aad3e48e4 Kees Cook      2020-04-06  340  	 */
ae2e1aad3e48e4 Kees Cook      2020-04-06  341  	for (i =3D 0; i < sizeof(no=
t_checked->data) + 1; i++)
ae2e1aad3e48e4 Kees Cook      2020-04-06  342  		not_checked->data[i] =3D '=
A';
ae2e1aad3e48e4 Kees Cook      2020-04-06  343  =

ae2e1aad3e48e4 Kees Cook      2020-04-06  344  	pr_info("Array access beyon=
d bounds ...\n");
ae2e1aad3e48e4 Kees Cook      2020-04-06  345  	for (i =3D 0; i < sizeof(ch=
ecked->data) + 1; i++)
ae2e1aad3e48e4 Kees Cook      2020-04-06  346  		checked->data[i] =3D 'B';
ae2e1aad3e48e4 Kees Cook      2020-04-06  347  =

ae2e1aad3e48e4 Kees Cook      2020-04-06  348  	kfree(not_checked);
ae2e1aad3e48e4 Kees Cook      2020-04-06  349  	kfree(checked);
464e86b4abadfc Kees Cook      2020-06-25  350  	pr_err("FAIL: survived arra=
y bounds overflow!\n");
c75be56e35b2ee Kees Cook      2021-08-18  351  	pr_expected_config(CONFIG_U=
BSAN_BOUNDS);
ae2e1aad3e48e4 Kees Cook      2020-04-06  352  }
ae2e1aad3e48e4 Kees Cook      2020-04-06  353  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2837982495511535535==--

