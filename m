Content-Type: multipart/mixed; boundary="===============4586260552682344113=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/xattr.c:205:10: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 08 Feb 2022 00:29:29 +0800
Message-ID: <202202080056.UcPjy4YE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4586260552682344113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Liu Bo <bo.liu@linux.alibaba.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dfd42facf1e4ada021b939b4e19c935dcdd55566
commit: bb88e8da00253bea0e7f0f4cdfd7910572d7799f erofs: use meta buffers fo=
r xattr operations
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220206 (https://download.01.org/0day-ci/archi=
ve/20220208/202202080056.UcPjy4YE-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5=
a44925592c764c59219b0024ee06317028)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbb88e8da00253bea0e7f0f4cdfd7910572d7799f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bb88e8da00253bea0e7f0f4cdfd7910572d7799f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:307:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/list.h:37:2: note: Use of memory after it is freed
           WRITE_ONCE(list->next, list);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   fs/btrfs/block-group.c:3898:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3902:3: note: Calling 'btrfs_put_caching_control'
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:382:2: note: Taking true branch
           if (refcount_dec_and_test(&ctl->count))
           ^
   fs/btrfs/block-group.c:383:3: note: Memory is released
                   kfree(ctl);
                   ^~~~~~~~~~
   fs/btrfs/block-group.c:3902:3: note: Returning; memory was released via =
1st parameter
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:3898:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3901:3: note: Calling 'list_del'
                   list_del(&caching_ctl->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:6: note: Assuming the condition is false
           if (!__list_del_entry_valid(entry))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   include/linux/list.h:149:14: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           entry->next =3D LIST_POISON1;
                       ^
   fs/btrfs/block-group.c:3898:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3902:3: note: Calling 'btrfs_put_caching_control'
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:382:2: note: Taking true branch
           if (refcount_dec_and_test(&ctl->count))
           ^
   fs/btrfs/block-group.c:383:3: note: Memory is released
                   kfree(ctl);
                   ^~~~~~~~~~
   fs/btrfs/block-group.c:3902:3: note: Returning; memory was released via =
1st parameter
                   btrfs_put_caching_control(caching_ctl);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/block-group.c:3898:2: note: Loop condition is true.  Entering l=
oop body
           while (!list_empty(&info->caching_block_groups)) {
           ^
   fs/btrfs/block-group.c:3901:3: note: Calling 'list_del'
                   list_del(&caching_ctl->list);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> fs/erofs/xattr.c:205:10: warning: Dereference of null pointer [clang-ana=
lyzer-core.NullDereference]
           entry =3D *(struct erofs_xattr_entry *)(it->kaddr + it->ofs);
                   ^
   fs/erofs/xattr.c:629:6: note: Assuming 'rcu' is false
           if (rcu)
               ^~~
   fs/erofs/xattr.c:629:2: note: Taking false branch
           if (rcu)
           ^
   fs/erofs/xattr.c:632:2: note: Control jumps to 'case 16384:'  at line 636
           switch (type) {
           ^
   fs/erofs/xattr.c:638:3: note:  Execution continues on line 643
                   break;
                   ^
   fs/erofs/xattr.c:643:7: note: Calling 'erofs_getxattr'
           rc =3D erofs_getxattr(inode, prefix, "", NULL, 0);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:400:7: note: 'name' is non-null
           if (!name)
                ^~~~
   fs/erofs/xattr.c:400:2: note: Taking false branch
           if (!name)
           ^
   fs/erofs/xattr.c:404:6: note: 'ret' is 0
           if (ret)
               ^~~
   fs/erofs/xattr.c:404:2: note: Taking false branch
           if (ret)
           ^
   fs/erofs/xattr.c:409:14: note: Field 'len' is <=3D EROFS_NAME_LEN
           if (it.name.len > EROFS_NAME_LEN)
                       ^
   fs/erofs/xattr.c:409:2: note: Taking false branch
           if (it.name.len > EROFS_NAME_LEN)
           ^
   fs/erofs/xattr.c:419:8: note: Calling 'inline_getxattr'
           ret =3D inline_getxattr(inode, &it);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:344:8: note: Calling 'inline_xattr_iter_begin'
           ret =3D inline_xattr_iter_begin(&it->it, inode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:166:6: note: Assuming 'xattr_header_sz' is < field 'xat=
tr_isize'
           if (xattr_header_sz >=3D vi->xattr_isize) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:166:2: note: Taking false branch
           if (xattr_header_sz >=3D vi->xattr_isize) {
           ^
   fs/erofs/xattr.c:178:2: note: Taking false branch
           if (IS_ERR(it->kaddr))
           ^
   fs/erofs/xattr.c:344:8: note: Returning from 'inline_xattr_iter_begin'
           ret =3D inline_xattr_iter_begin(&it->it, inode);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:345:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   fs/erofs/xattr.c:345:2: note: Taking false branch
           if (ret < 0)
           ^
   fs/erofs/xattr.c:349:2: note: Loop condition is true.  Entering loop body
           while (remaining) {
           ^
   fs/erofs/xattr.c:350:9: note: Calling 'xattr_foreach'
                   ret =3D xattr_foreach(&it->it, &find_xattr_handlers, &re=
maining);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   fs/erofs/xattr.c:196:8: note: Calling 'xattr_iter_fixup'
           err =3D xattr_iter_fixup(it);
                 ^~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:146:6: note: Assuming the condition is false
           if (it->ofs < EROFS_BLKSIZ)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:146:2: note: Taking false branch
           if (it->ofs < EROFS_BLKSIZ)
           ^
   fs/erofs/xattr.c:150:2: note: Value assigned to 'it.it.kaddr'
           it->kaddr =3D erofs_read_metabuf(&it->buf, it->sb, it->blkaddr,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:152:6: note: Assuming the condition is true
           if (IS_ERR(it->kaddr))
               ^~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:152:2: note: Taking true branch
           if (IS_ERR(it->kaddr))
           ^
   fs/erofs/xattr.c:153:3: note: Returning value, which participates in a c=
ondition later
                   return PTR_ERR(it->kaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:196:8: note: Returning from 'xattr_iter_fixup'
           err =3D xattr_iter_fixup(it);
                 ^~~~~~~~~~~~~~~~~~~~
   fs/erofs/xattr.c:197:6: note: Assuming 'err' is 0
           if (err)
               ^~~
   fs/erofs/xattr.c:197:2: note: Taking false branch
           if (err)
           ^
   fs/erofs/xattr.c:205:10: note: Dereference of null pointer
           entry =3D *(struct erofs_xattr_entry *)(it->kaddr + it->ofs);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +205 fs/erofs/xattr.c

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
182  =

bdf30cef10558d2 drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  =
183  /*
bdf30cef10558d2 drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  =
184   * Regardless of success or failure, `xattr_foreach' will end up with
bdf30cef10558d2 drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  =
185   * `ofs' pointing to the next xattr item rather than an arbitrary posi=
tion.
bdf30cef10558d2 drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  =
186   */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
187  static int xattr_foreach(struct xattr_iter *it,
447a3621b3835b6 drivers/staging/erofs/xattr.c Julian Merida    2019-03-18  =
188  			 const struct xattr_iter_handlers *op,
447a3621b3835b6 drivers/staging/erofs/xattr.c Julian Merida    2019-03-18  =
189  			 unsigned int *tlimit)
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
190  {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
191  	struct erofs_xattr_entry entry;
7dd68b147d60e5e drivers/staging/erofs/xattr.c Thomas Wei=C3=9Fschuh 2018-09=
-10  192  	unsigned int value_sz, processed, slice;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
193  	int err;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
194  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
195  	/* 0. fixup blkaddr, ofs, ipage */
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
196  	err =3D xattr_iter_fixup(it);
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
197  	if (err)
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
198  		return err;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
199  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
200  	/*
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
201  	 * 1. read xattr entry to the memory,
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
202  	 *    since we do EROFS_XATTR_ALIGN
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
203  	 *    therefore entry should be in the page
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
204  	 */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26 @=
205  	entry =3D *(struct erofs_xattr_entry *)(it->kaddr + it->ofs);
561fb35a9d04ca7 drivers/staging/erofs/xattr.c Bhanusree Pola   2019-03-22  =
206  	if (tlimit) {
b6796abd3cc155e fs/erofs/xattr.c              Gao Xiang        2019-09-04  =
207  		unsigned int entry_sz =3D erofs_xattr_entry_size(&entry);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
208  =

9ddc7004f6aae68 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  =
209  		/* xattr on-disk corruption: xattr entry beyond xattr_isize */
8d8a09b093d7073 fs/erofs/xattr.c              Gao Xiang        2019-08-30  =
210  		if (*tlimit < entry_sz) {
9ddc7004f6aae68 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  =
211  			DBG_BUGON(1);
a6b9b1d5eae61a6 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-14  =
212  			return -EFSCORRUPTED;
9ddc7004f6aae68 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  =
213  		}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
214  		*tlimit -=3D entry_sz;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
215  	}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
216  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
217  	it->ofs +=3D sizeof(struct erofs_xattr_entry);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
218  	value_sz =3D le16_to_cpu(entry.e_value_size);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
219  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
220  	/* handle entry */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
221  	err =3D op->entry(it, &entry);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
222  	if (err) {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
223  		it->ofs +=3D entry.e_name_len + value_sz;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
224  		goto out;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
225  	}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
226  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
227  	/* 2. handle xattr name (ofs will finally be at the end of name) */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
228  	processed =3D 0;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
229  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
230  	while (processed < entry.e_name_len) {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
231  		if (it->ofs >=3D EROFS_BLKSIZ) {
9ddc7004f6aae68 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  =
232  			DBG_BUGON(it->ofs > EROFS_BLKSIZ);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
233  =

cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
234  			err =3D xattr_iter_fixup(it);
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
235  			if (err)
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
236  				goto out;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
237  			it->ofs =3D 0;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
238  		}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
239  =

bb88e8da00253be fs/erofs/xattr.c              Gao Xiang        2022-01-02  =
240  		slice =3D min_t(unsigned int, EROFS_BLKSIZ - it->ofs,
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
241  			      entry.e_name_len - processed);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
242  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
243  		/* handle name */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
244  		err =3D op->name(it, processed, it->kaddr + it->ofs, slice);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
245  		if (err) {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
246  			it->ofs +=3D entry.e_name_len - processed + value_sz;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
247  			goto out;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
248  		}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
249  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
250  		it->ofs +=3D slice;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
251  		processed +=3D slice;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
252  	}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
253  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
254  	/* 3. handle xattr value */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
255  	processed =3D 0;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
256  =

561fb35a9d04ca7 drivers/staging/erofs/xattr.c Bhanusree Pola   2019-03-22  =
257  	if (op->alloc_buffer) {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
258  		err =3D op->alloc_buffer(it, value_sz);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
259  		if (err) {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
260  			it->ofs +=3D value_sz;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
261  			goto out;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
262  		}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
263  	}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
264  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
265  	while (processed < value_sz) {
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
266  		if (it->ofs >=3D EROFS_BLKSIZ) {
9ddc7004f6aae68 drivers/staging/erofs/xattr.c Gao Xiang        2019-08-13  =
267  			DBG_BUGON(it->ofs > EROFS_BLKSIZ);
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
268  =

cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
269  			err =3D xattr_iter_fixup(it);
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
270  			if (err)
cadf1ccf1b0021d drivers/staging/erofs/xattr.c Gao Xiang        2018-08-21  =
271  				goto out;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
272  			it->ofs =3D 0;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
273  		}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
274  =

bb88e8da00253be fs/erofs/xattr.c              Gao Xiang        2022-01-02  =
275  		slice =3D min_t(unsigned int, EROFS_BLKSIZ - it->ofs,
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
276  			      value_sz - processed);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
277  		op->value(it, processed, it->kaddr + it->ofs, slice);
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
278  		it->ofs +=3D slice;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
279  		processed +=3D slice;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
280  	}
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
281  =

b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
282  out:
bdf30cef10558d2 drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  =
283  	/* xattrs should be 4-byte aligned (on-disk constraint) */
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
284  	it->ofs =3D EROFS_XATTR_ALIGN(it->ofs);
6614f76530c102a drivers/staging/erofs/xattr.c Gao Xiang        2018-09-19  =
285  	return err < 0 ? err : 0;
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
286  }
b17500a0fdbae10 drivers/staging/erofs/xattr.c Gao Xiang        2018-07-26  =
287  =


:::::: The code@line 205 was first introduced by commit
:::::: b17500a0fdbae10a8ce274dd523106f16d114339 staging: erofs: introduce x=
attr & acl support

:::::: TO: Gao Xiang <gaoxiang25@huawei.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4586260552682344113==--

