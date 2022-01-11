Content-Type: multipart/mixed; boundary="===============7518649884644443459=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/5] erofs: use meta buffers for xattr operations
Date: Tue, 11 Jan 2022 08:26:38 +0800
Message-ID: <202201110814.WDpkZzWX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7518649884644443459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220102040017.51352-5-hsiangkao@linux.alibaba.com>
References: <20220102040017.51352-5-hsiangkao@linux.alibaba.com>
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

Hi Gao,

I love your patch! Perhaps something to improve:

[auto build test WARNING on xiang-erofs/dev-test]
[cannot apply to v5.16 next-20220110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gao-Xiang/erofs-get-rid-of=
-erofs_get_meta_page/20220102-120057
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev=
-test
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: i386-randconfig-c001-20220105 (https://download.01.org/0day-ci/arch=
ive/20220111/202201110814.WDpkZzWX-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e3=
0ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d7c5cceeea80de5a2a1b177d4=
952b9802a97edc0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Gao-Xiang/erofs-get-rid-of-erofs_g=
et_meta_page/20220102-120057
        git checkout d7c5cceeea80de5a2a1b177d4952b9802a97edc0
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   mm/page_alloc.c:8373:2: note: Loop condition is true.  Entering loop body
           for_each_zone(zone) {
           ^
   include/linux/mmzone.h:1122:2: note: expanded from macro 'for_each_zone'
           for (zone =3D (first_online_pgdat())->node_zones; \
           ^
   mm/page_alloc.c:8376:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&zone->lock, flags);
                   ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   mm/page_alloc.c:8376:3: note: Loop condition is false.  Exiting loop
                   spin_lock_irqsave(&zone->lock, flags);
                   ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   mm/page_alloc.c:8378:3: note: The value 0 is assigned to '__base'
                   do_div(tmp, lowmem_pages);
                   ^
   arch/x86/include/asm/div64.h:25:2: note: expanded from macro 'do_div'
           __base =3D (base);                                        \
           ^~~~~~~~~~~~~~~
   mm/page_alloc.c:8378:3: note: Left side of '&&' is false
                   do_div(tmp, lowmem_pages);
                   ^
   arch/x86/include/asm/div64.h:26:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) && is_power_of_2(__base)) { \
                                            ^
   mm/page_alloc.c:8378:3: note: Assuming '__high' is not equal to 0
                   do_div(tmp, lowmem_pages);
                   ^
   arch/x86/include/asm/div64.h:32:7: note: expanded from macro 'do_div'
                   if (__high) {                                   \
                       ^~~~~~
   mm/page_alloc.c:8378:3: note: Taking true branch
                   do_div(tmp, lowmem_pages);
                   ^
   arch/x86/include/asm/div64.h:32:3: note: expanded from macro 'do_div'
                   if (__high) {                                   \
                   ^
   mm/page_alloc.c:8378:3: note: Division by zero
                   do_div(tmp, lowmem_pages);
                   ^
   arch/x86/include/asm/div64.h:33:21: note: expanded from macro 'do_div'
                           __upper =3D __high % (__base);            \
                                     ~~~~~~~^~~~~~~~~~
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> fs/erofs/xattr.c:204:10: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
           entry =3D *(struct erofs_xattr_entry *)(it->kaddr + it->ofs);
                   ^
   fs/erofs/xattr.c:628:6: note: Assuming 'rcu' is false
           if (rcu)
               ^~~
   fs/erofs/xattr.c:628:2: note: Taking false branch
           if (rcu)
           ^
   fs/erofs/xattr.c:631:2: note: Control jumps to 'case 16384:'  at line 635
           switch (type) {
           ^
   fs/erofs/xattr.c:637:3: note:  Execution continues on line 642
                   break;
                   ^
   fs/erofs/xattr.c:642:7: note: Calling 'erofs_getxattr'
           rc =3D erofs_getxattr(inode, prefix, "", NULL, 0);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:399:7: note: 'name' is non-null
           if (!name)
                ^~~~
   fs/erofs/xattr.c:399:2: note: Taking false branch
           if (!name)
           ^
   fs/erofs/xattr.c:403:6: note: 'ret' is 0
           if (ret)
               ^~~
   fs/erofs/xattr.c:403:2: note: Taking false branch
           if (ret)
           ^
   fs/erofs/xattr.c:408:14: note: Field 'len' is <=3D EROFS_NAME_LEN
           if (it.name.len > EROFS_NAME_LEN)
                       ^
   fs/erofs/xattr.c:408:2: note: Taking false branch
           if (it.name.len > EROFS_NAME_LEN)
           ^
   fs/erofs/xattr.c:418:8: note: Calling 'inline_getxattr'
           ret =3D inline_getxattr(inode, &it);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:343:8: note: Calling 'inline_xattr_iter_begin'
           ret =3D inline_xattr_iter_begin(&it->it, inode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:165:6: note: Assuming 'xattr_header_sz' is < field 'xat=
tr_isize'
           if (xattr_header_sz >=3D vi->xattr_isize) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:165:2: note: Taking false branch
           if (xattr_header_sz >=3D vi->xattr_isize) {
           ^
   fs/erofs/xattr.c:177:2: note: Taking false branch
           if (IS_ERR(it->kaddr))
           ^
   fs/erofs/xattr.c:343:8: note: Returning from 'inline_xattr_iter_begin'
           ret =3D inline_xattr_iter_begin(&it->it, inode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:344:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   fs/erofs/xattr.c:344:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/erofs/xattr.c:348:2: note: Loop condition is true.  Entering loop body
           while (remaining) {
           ^
   fs/erofs/xattr.c:349:9: note: Calling 'xattr_foreach'
                   ret =3D xattr_foreach(&it->it, &find_xattr_handlers, &re=
maining);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/erofs/xattr.c:195:8: note: Calling 'xattr_iter_fixup'
           err =3D xattr_iter_fixup(it);
                 ^~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:145:6: note: Assuming the condition is false
           if (it->ofs < EROFS_BLKSIZ)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:145:2: note: Taking false branch
           if (it->ofs < EROFS_BLKSIZ)
           ^
   fs/erofs/xattr.c:149:2: note: Value assigned to 'it.it.kaddr'
           it->kaddr =3D erofs_read_metabuf(&it->buf, it->sb, it->blkaddr,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:151:6: note: Assuming the condition is true
           if (IS_ERR(it->kaddr))
               ^~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:151:2: note: Taking true branch
           if (IS_ERR(it->kaddr))
           ^
   fs/erofs/xattr.c:152:3: note: Returning value, which participates in a c=
ondition later
                   return PTR_ERR(it->kaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:195:8: note: Returning from 'xattr_iter_fixup'
           err =3D xattr_iter_fixup(it);
                 ^~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:196:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/erofs/xattr.c:196:2: note: Taking false branch
           if (err)
           ^
   fs/erofs/xattr.c:204:10: note: Dereference of null pointer
           entry =3D *(struct erofs_xattr_entry *)(it->kaddr + it->ofs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +204 fs/erofs/xattr.c

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
81  =

bdf30cef10558d drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  1=
82  /*
bdf30cef10558d drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  1=
83   * Regardless of success or failure, `xattr_foreach' will end up with
bdf30cef10558d drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  1=
84   * `ofs' pointing to the next xattr item rather than an arbitrary posit=
ion.
bdf30cef10558d drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  1=
85   */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
86  static int xattr_foreach(struct xattr_iter *it,
447a3621b3835b drivers/staging/erofs/xattr.c Julian Merida    2019-03-18  1=
87  			 const struct xattr_iter_handlers *op,
447a3621b3835b drivers/staging/erofs/xattr.c Julian Merida    2019-03-18  1=
88  			 unsigned int *tlimit)
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
89  {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
90  	struct erofs_xattr_entry entry;
7dd68b147d60e5 drivers/staging/erofs/xattr.c Thomas Wei=C3=9Fschuh 2018-09-=
10  191  	unsigned int value_sz, processed, slice;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
92  	int err;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
93  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
94  	/* 0. fixup blkaddr, ofs, ipage */
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  1=
95  	err =3D xattr_iter_fixup(it);
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  1=
96  	if (err)
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  1=
97  		return err;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
98  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  1=
99  	/*
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
00  	 * 1. read xattr entry to the memory,
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
01  	 *    since we do EROFS_XATTR_ALIGN
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
02  	 *    therefore entry should be in the page
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
03  	 */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26 @2=
04  	entry =3D *(struct erofs_xattr_entry *)(it->kaddr + it->ofs);
561fb35a9d04ca drivers/staging/erofs/xattr.c Bhanusree Pola   2019-03-22  2=
05  	if (tlimit) {
b6796abd3cc155 fs/erofs/xattr.c              Gao Xiang        2019-09-04  2=
06  		unsigned int entry_sz =3D erofs_xattr_entry_size(&entry);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
07  =

9ddc7004f6aae6 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  2=
08  		/* xattr on-disk corruption: xattr entry beyond xattr_isize */
8d8a09b093d707 fs/erofs/xattr.c              Gao Xiang        2019-08-30  2=
09  		if (*tlimit < entry_sz) {
9ddc7004f6aae6 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  2=
10  			DBG_BUGON(1);
a6b9b1d5eae61a drivers/staging/erofs/xattr.c Gao Xiang        2019-08-14  2=
11  			return -EFSCORRUPTED;
9ddc7004f6aae6 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  2=
12  		}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
13  		*tlimit -=3D entry_sz;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
14  	}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
15  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
16  	it->ofs +=3D sizeof(struct erofs_xattr_entry);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
17  	value_sz =3D le16_to_cpu(entry.e_value_size);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
18  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
19  	/* handle entry */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
20  	err =3D op->entry(it, &entry);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
21  	if (err) {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
22  		it->ofs +=3D entry.e_name_len + value_sz;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
23  		goto out;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
24  	}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
25  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
26  	/* 2. handle xattr name (ofs will finally be at the end of name) */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
27  	processed =3D 0;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
28  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
29  	while (processed < entry.e_name_len) {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
30  		if (it->ofs >=3D EROFS_BLKSIZ) {
9ddc7004f6aae6 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  2=
31  			DBG_BUGON(it->ofs > EROFS_BLKSIZ);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
32  =

cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
33  			err =3D xattr_iter_fixup(it);
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
34  			if (err)
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
35  				goto out;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
36  			it->ofs =3D 0;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
37  		}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
38  =

d7c5cceeea80de fs/erofs/xattr.c              Gao Xiang        2022-01-02  2=
39  		slice =3D min_t(unsigned int, EROFS_BLKSIZ - it->ofs,
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
40  			      entry.e_name_len - processed);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
41  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
42  		/* handle name */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
43  		err =3D op->name(it, processed, it->kaddr + it->ofs, slice);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
44  		if (err) {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
45  			it->ofs +=3D entry.e_name_len - processed + value_sz;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
46  			goto out;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
47  		}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
48  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
49  		it->ofs +=3D slice;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
50  		processed +=3D slice;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
51  	}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
52  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
53  	/* 3. handle xattr value */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
54  	processed =3D 0;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
55  =

561fb35a9d04ca drivers/staging/erofs/xattr.c Bhanusree Pola   2019-03-22  2=
56  	if (op->alloc_buffer) {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
57  		err =3D op->alloc_buffer(it, value_sz);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
58  		if (err) {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
59  			it->ofs +=3D value_sz;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
60  			goto out;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
61  		}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
62  	}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
63  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
64  	while (processed < value_sz) {
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
65  		if (it->ofs >=3D EROFS_BLKSIZ) {
9ddc7004f6aae6 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  2=
66  			DBG_BUGON(it->ofs > EROFS_BLKSIZ);
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
67  =

cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
68  			err =3D xattr_iter_fixup(it);
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
69  			if (err)
cadf1ccf1b0021 drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  2=
70  				goto out;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
71  			it->ofs =3D 0;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
72  		}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
73  =

d7c5cceeea80de fs/erofs/xattr.c              Gao Xiang        2022-01-02  2=
74  		slice =3D min_t(unsigned int, EROFS_BLKSIZ - it->ofs,
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
75  			      value_sz - processed);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
76  		op->value(it, processed, it->kaddr + it->ofs, slice);
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
77  		it->ofs +=3D slice;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
78  		processed +=3D slice;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
79  	}
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
80  =

b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
81  out:
bdf30cef10558d drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  2=
82  	/* xattrs should be 4-byte aligned (on-disk constraint) */
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
83  	it->ofs =3D EROFS_XATTR_ALIGN(it->ofs);
6614f76530c102 drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  2=
84  	return err < 0 ? err : 0;
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
85  }
b17500a0fdbae1 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  2=
86  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7518649884644443459==--

