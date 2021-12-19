Content-Type: multipart/mixed; boundary="===============0165781244184488509=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/zswap.c:991:4: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 19 Dec 2021 16:17:24 +0800
Message-ID: <202112191613.lfTJakui-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0165781244184488509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tian Tao <tiantao6@hisilicon.com>
CC: Nathan Chancellor <natechancellor@gmail.com>
CC: Colin Ian King <colin.king@canonical.com>
CC: Vitaly Wool <vitaly.wool@konsulko.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3f667b5d4053ad54aee13dab5c94f04ff75ddfdf
commit: fc6697a89f56d9773b2fbff718d4cf2a6d63379d mm/zswap: add the flag can=
_sleep_mapped
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001-20211212 (https://download.01.org/0day-ci/arch=
ive/20211219/202112191613.lfTJakui-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dfc6697a89f56d9773b2fbff718d4cf2a6d63379d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fc6697a89f56d9773b2fbff718d4cf2a6d63379d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                     ^~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:760:6: note: Assuming 'zswap_init_failed' is false
           if (zswap_init_failed) {
               ^~~~~~~~~~~~~~~~~
   mm/zswap.c:760:2: note: Taking false branch
           if (zswap_init_failed) {
           ^
   mm/zswap.c:766:6: note: Assuming the condition is false
           if (!strcmp(s, *(char **)kp->arg) && zswap_has_pool)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:766:36: note: Left side of '&&' is false
           if (!strcmp(s, *(char **)kp->arg) && zswap_has_pool)
                                             ^
   mm/zswap.c:772:6: note: Assuming 'zswap_init_started' is true
           if (!zswap_init_started)
               ^~~~~~~~~~~~~~~~~~~
   mm/zswap.c:772:2: note: Taking false branch
           if (!zswap_init_started)
           ^
   mm/zswap.c:775:6: note: Assuming 'type' is null
           if (!type) {
               ^~~~~
   mm/zswap.c:775:2: note: Taking true branch
           if (!type) {
           ^
   mm/zswap.c:776:7: note: Assuming the condition is false
                   if (!zpool_has_pool(s)) {
                       ^~~~~~~~~~~~~~~~~~
   mm/zswap.c:776:3: note: Taking false branch
                   if (!zpool_has_pool(s)) {
                   ^
   mm/zswap.c:795:6: note: Assuming 'pool' is null
           if (pool) {
               ^~~~
   mm/zswap.c:795:2: note: Taking false branch
           if (pool) {
           ^
   mm/zswap.c:803:7: note: 'pool' is null
           if (!pool)
                ^~~~
   mm/zswap.c:803:2: note: Taking true branch
           if (!pool)
           ^
   mm/zswap.c:804:34: note: Passing null pointer value via 2nd parameter 'c=
ompressor'
                   pool =3D zswap_pool_create(type, compressor);
                                                  ^~~~~~~~~~
   mm/zswap.c:804:10: note: Calling 'zswap_pool_create'
                   pool =3D zswap_pool_create(type, compressor);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:592:6: note: Assuming 'zswap_has_pool' is true
           if (!zswap_has_pool) {
               ^~~~~~~~~~~~~~~
   mm/zswap.c:592:2: note: Taking false branch
           if (!zswap_has_pool) {
           ^
   mm/zswap.c:603:9: note: Calling 'kzalloc'
           pool =3D kzalloc(sizeof(*pool), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Calling 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:542:2: note: Taking false branch
           if (__builtin_constant_p(size)) {
           ^
   include/linux/slab.h:559:2: note: Returning pointer, which participates =
in a condition later
           return __kmalloc(size, flags);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:9: note: Returning from 'kmalloc'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:684:2: note: Returning pointer, which participates =
in a condition later
           return kmalloc(size, flags | __GFP_ZERO);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:603:9: note: Returning from 'kzalloc'
           pool =3D kzalloc(sizeof(*pool), GFP_KERNEL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:604:6: note: Assuming 'pool' is non-null
           if (!pool)
               ^~~~~
   mm/zswap.c:604:2: note: Taking false branch
           if (!pool)
           ^
   mm/zswap.c:611:6: note: Assuming field 'zpool' is non-null
           if (!pool->zpool) {
               ^~~~~~~~~~~~
   mm/zswap.c:611:2: note: Taking false branch
           if (!pool->zpool) {
           ^
   mm/zswap.c:615:2: note: Taking false branch
           pr_debug("using %s zpool\n", zpool_get_type(pool->zpool));
           ^
   include/linux/printk.h:430:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:139:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   mm/zswap.c:617:2: note: Null pointer passed as 2nd argument to string co=
py function
           strlcpy(pool->tfm_name, compressor, sizeof(pool->tfm_name));
           ^                       ~~~~~~~~~~
>> mm/zswap.c:991:4: warning: Null pointer passed as 1st argument to memory=
 copy function [clang-analyzer-unix.cstring.NullArg]
                           memcpy(tmp, src, entry->length);
                           ^      ~~~
   mm/zswap.c:938:12: note: 'tmp' initialized to a null pointer value
           u8 *src, *tmp =3D NULL;
                     ^~~
   mm/zswap.c:945:6: note: Assuming the condition is false
           if (!zpool_can_sleep_mapped(pool)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:945:2: note: Taking false branch
           if (!zpool_can_sleep_mapped(pool)) {
           ^
   mm/zswap.c:959:10: note: Calling 'zswap_entry_find_get'
           entry =3D zswap_entry_find_get(&tree->rbroot, offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:391:6: note: Assuming 'entry' is non-null, which participates=
 in a condition later
           if (entry)
               ^~~~~
   mm/zswap.c:391:2: note: Taking true branch
           if (entry)
           ^
   mm/zswap.c:394:2: note: Returning pointer (loaded from 'entry'), which p=
articipates in a condition later
           return entry;
           ^~~~~~~~~~~~
   mm/zswap.c:959:10: note: Returning from 'zswap_entry_find_get'
           entry =3D zswap_entry_find_get(&tree->rbroot, offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:960:7: note: 'entry' is non-null
           if (!entry) {
                ^~~~~
   mm/zswap.c:960:2: note: Taking false branch
           if (!entry) {
           ^
   mm/zswap.c:968:9: note: Assuming 'offset' is equal to field 'offset'
           BUG_ON(offset !=3D entry->offset);
                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   mm/zswap.c:968:9: note: 'offset' is equal to field 'offset'
           BUG_ON(offset !=3D entry->offset);
                  ^
   include/asm-generic/bug.h:63:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   mm/zswap.c:968:2: note: Taking false branch
           BUG_ON(offset !=3D entry->offset);
           ^
   include/asm-generic/bug.h:63:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   mm/zswap.c:968:2: note: Loop condition is false.  Exiting loop
           BUG_ON(offset !=3D entry->offset);
           ^
   include/asm-generic/bug.h:63:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   mm/zswap.c:971:10: note: Calling 'zswap_get_swap_cache_page'
           switch (zswap_get_swap_cache_page(swpentry, &page)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:908:6: note: Assuming 'page_was_allocated' is true
           if (page_was_allocated)
               ^~~~~~~~~~~~~~~~~~
   mm/zswap.c:908:2: note: Taking true branch
           if (page_was_allocated)
           ^
   mm/zswap.c:909:3: note: Returning zero, which participates in a conditio=
n later
                   return ZSWAP_SWAPCACHE_NEW;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:971:10: note: Returning from 'zswap_get_swap_cache_page'
           switch (zswap_get_swap_cache_page(swpentry, &page)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:971:2: note: Control jumps to 'case ZSWAP_SWAPCACHE_NEW:'  at=
 line 982
           switch (zswap_get_swap_cache_page(swpentry, &page)) {
           ^
   mm/zswap.c:984:15: note: Loop condition is false.  Exiting loop
                   acomp_ctx =3D raw_cpu_ptr(entry->pool->acomp_ctx);
                               ^
   include/linux/percpu-defs.h:264:26: note: expanded from macro 'raw_cpu_p=
tr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                   ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \

vim +991 mm/zswap.c

2b2811178e8555 Seth Jennings      2013-07-10   914  =

2b2811178e8555 Seth Jennings      2013-07-10   915  /*
2b2811178e8555 Seth Jennings      2013-07-10   916   * Attempts to free an =
entry by adding a page to the swap cache,
2b2811178e8555 Seth Jennings      2013-07-10   917   * decompressing the en=
try data into the page, and issuing a
2b2811178e8555 Seth Jennings      2013-07-10   918   * bio write to write t=
he page back to the swap device.
2b2811178e8555 Seth Jennings      2013-07-10   919   *
2b2811178e8555 Seth Jennings      2013-07-10   920   * This can be thought =
of as a "resumed writeback" of the page
2b2811178e8555 Seth Jennings      2013-07-10   921   * to the swap device. =
 We are basically resuming the same swap
2b2811178e8555 Seth Jennings      2013-07-10   922   * writeback path that =
was intercepted with the frontswap_store()
2b2811178e8555 Seth Jennings      2013-07-10   923   * in the first place. =
 After the page has been decompressed into
2b2811178e8555 Seth Jennings      2013-07-10   924   * the swap cache, the =
compressed version stored by zswap can be
2b2811178e8555 Seth Jennings      2013-07-10   925   * freed.
2b2811178e8555 Seth Jennings      2013-07-10   926   */
12d79d64bfd391 Dan Streetman      2014-08-06   927  static int zswap_writeb=
ack_entry(struct zpool *pool, unsigned long handle)
2b2811178e8555 Seth Jennings      2013-07-10   928  {
2b2811178e8555 Seth Jennings      2013-07-10   929  	struct zswap_header *z=
hdr;
2b2811178e8555 Seth Jennings      2013-07-10   930  	swp_entry_t swpentry;
2b2811178e8555 Seth Jennings      2013-07-10   931  	struct zswap_tree *tre=
e;
2b2811178e8555 Seth Jennings      2013-07-10   932  	pgoff_t offset;
2b2811178e8555 Seth Jennings      2013-07-10   933  	struct zswap_entry *en=
try;
2b2811178e8555 Seth Jennings      2013-07-10   934  	struct page *page;
1ec3b5fe6eec78 Barry Song         2020-12-14   935  	struct scatterlist inp=
ut, output;
1ec3b5fe6eec78 Barry Song         2020-12-14   936  	struct crypto_acomp_ct=
x *acomp_ctx;
1ec3b5fe6eec78 Barry Song         2020-12-14   937  =

fc6697a89f56d9 Tian Tao           2021-02-25   938  	u8 *src, *tmp =3D NULL;
2b2811178e8555 Seth Jennings      2013-07-10   939  	unsigned int dlen;
0ab0abcf511545 Weijie Yang        2013-11-12   940  	int ret;
2b2811178e8555 Seth Jennings      2013-07-10   941  	struct writeback_contr=
ol wbc =3D {
2b2811178e8555 Seth Jennings      2013-07-10   942  		.sync_mode =3D WB_SYN=
C_NONE,
2b2811178e8555 Seth Jennings      2013-07-10   943  	};
2b2811178e8555 Seth Jennings      2013-07-10   944  =

fc6697a89f56d9 Tian Tao           2021-02-25   945  	if (!zpool_can_sleep_m=
apped(pool)) {
fc6697a89f56d9 Tian Tao           2021-02-25   946  		tmp =3D kmalloc(PAGE_=
SIZE, GFP_ATOMIC);
fc6697a89f56d9 Tian Tao           2021-02-25   947  		if (!tmp)
fc6697a89f56d9 Tian Tao           2021-02-25   948  			return -ENOMEM;
fc6697a89f56d9 Tian Tao           2021-02-25   949  	}
fc6697a89f56d9 Tian Tao           2021-02-25   950  =

2b2811178e8555 Seth Jennings      2013-07-10   951  	/* extract swpentry fr=
om data */
12d79d64bfd391 Dan Streetman      2014-08-06   952  	zhdr =3D zpool_map_han=
dle(pool, handle, ZPOOL_MM_RO);
2b2811178e8555 Seth Jennings      2013-07-10   953  	swpentry =3D zhdr->swp=
entry; /* here */
2b2811178e8555 Seth Jennings      2013-07-10   954  	tree =3D zswap_trees[s=
wp_type(swpentry)];
2b2811178e8555 Seth Jennings      2013-07-10   955  	offset =3D swp_offset(=
swpentry);
2b2811178e8555 Seth Jennings      2013-07-10   956  =

2b2811178e8555 Seth Jennings      2013-07-10   957  	/* find and ref zswap =
entry */
2b2811178e8555 Seth Jennings      2013-07-10   958  	spin_lock(&tree->lock);
0ab0abcf511545 Weijie Yang        2013-11-12   959  	entry =3D zswap_entry_=
find_get(&tree->rbroot, offset);
2b2811178e8555 Seth Jennings      2013-07-10   960  	if (!entry) {
2b2811178e8555 Seth Jennings      2013-07-10   961  		/* entry was invalida=
ted */
2b2811178e8555 Seth Jennings      2013-07-10   962  		spin_unlock(&tree->lo=
ck);
068619e32ff622 Vitaly Wool        2019-09-23   963  		zpool_unmap_handle(po=
ol, handle);
fc6697a89f56d9 Tian Tao           2021-02-25   964  		kfree(tmp);
2b2811178e8555 Seth Jennings      2013-07-10   965  		return 0;
2b2811178e8555 Seth Jennings      2013-07-10   966  	}
2b2811178e8555 Seth Jennings      2013-07-10   967  	spin_unlock(&tree->loc=
k);
2b2811178e8555 Seth Jennings      2013-07-10   968  	BUG_ON(offset !=3D ent=
ry->offset);
2b2811178e8555 Seth Jennings      2013-07-10   969  =

2b2811178e8555 Seth Jennings      2013-07-10   970  	/* try to allocate swa=
p cache page */
2b2811178e8555 Seth Jennings      2013-07-10   971  	switch (zswap_get_swap=
_cache_page(swpentry, &page)) {
67d13fe846c57a Weijie Yang        2013-11-12   972  	case ZSWAP_SWAPCACHE_F=
AIL: /* no memory or invalidate happened */
2b2811178e8555 Seth Jennings      2013-07-10   973  		ret =3D -ENOMEM;
2b2811178e8555 Seth Jennings      2013-07-10   974  		goto fail;
2b2811178e8555 Seth Jennings      2013-07-10   975  =

67d13fe846c57a Weijie Yang        2013-11-12   976  	case ZSWAP_SWAPCACHE_E=
XIST:
2b2811178e8555 Seth Jennings      2013-07-10   977  		/* page is already in=
 the swap cache, ignore for now */
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01   978  		put_page(page);
2b2811178e8555 Seth Jennings      2013-07-10   979  		ret =3D -EEXIST;
2b2811178e8555 Seth Jennings      2013-07-10   980  		goto fail;
2b2811178e8555 Seth Jennings      2013-07-10   981  =

2b2811178e8555 Seth Jennings      2013-07-10   982  	case ZSWAP_SWAPCACHE_N=
EW: /* page is locked */
2b2811178e8555 Seth Jennings      2013-07-10   983  		/* decompress */
1ec3b5fe6eec78 Barry Song         2020-12-14   984  		acomp_ctx =3D raw_cpu=
_ptr(entry->pool->acomp_ctx);
1ec3b5fe6eec78 Barry Song         2020-12-14   985  =

2b2811178e8555 Seth Jennings      2013-07-10   986  		dlen =3D PAGE_SIZE;
068619e32ff622 Vitaly Wool        2019-09-23   987  		src =3D (u8 *)zhdr + =
sizeof(struct zswap_header);
1ec3b5fe6eec78 Barry Song         2020-12-14   988  =

fc6697a89f56d9 Tian Tao           2021-02-25   989  		if (!zpool_can_sleep_=
mapped(pool)) {
fc6697a89f56d9 Tian Tao           2021-02-25   990  =

fc6697a89f56d9 Tian Tao           2021-02-25  @991  			memcpy(tmp, src, ent=
ry->length);
fc6697a89f56d9 Tian Tao           2021-02-25   992  			src =3D tmp;
fc6697a89f56d9 Tian Tao           2021-02-25   993  =

fc6697a89f56d9 Tian Tao           2021-02-25   994  			zpool_unmap_handle(p=
ool, handle);
fc6697a89f56d9 Tian Tao           2021-02-25   995  		}
fc6697a89f56d9 Tian Tao           2021-02-25   996  =

1ec3b5fe6eec78 Barry Song         2020-12-14   997  		mutex_lock(acomp_ctx-=
>mutex);
1ec3b5fe6eec78 Barry Song         2020-12-14   998  		sg_init_one(&input, s=
rc, entry->length);
1ec3b5fe6eec78 Barry Song         2020-12-14   999  		sg_init_table(&output=
, 1);
1ec3b5fe6eec78 Barry Song         2020-12-14  1000  		sg_set_page(&output, =
page, PAGE_SIZE, 0);
1ec3b5fe6eec78 Barry Song         2020-12-14  1001  		acomp_request_set_par=
ams(acomp_ctx->req, &input, &output, entry->length, dlen);
1ec3b5fe6eec78 Barry Song         2020-12-14  1002  		ret =3D crypto_wait_r=
eq(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);
1ec3b5fe6eec78 Barry Song         2020-12-14  1003  		dlen =3D acomp_ctx->r=
eq->dlen;
1ec3b5fe6eec78 Barry Song         2020-12-14  1004  		mutex_unlock(acomp_ct=
x->mutex);
1ec3b5fe6eec78 Barry Song         2020-12-14  1005  =

2b2811178e8555 Seth Jennings      2013-07-10  1006  		BUG_ON(ret);
2b2811178e8555 Seth Jennings      2013-07-10  1007  		BUG_ON(dlen !=3D PAGE=
_SIZE);
2b2811178e8555 Seth Jennings      2013-07-10  1008  =

2b2811178e8555 Seth Jennings      2013-07-10  1009  		/* page is up to date=
 */
2b2811178e8555 Seth Jennings      2013-07-10  1010  		SetPageUptodate(page);
2b2811178e8555 Seth Jennings      2013-07-10  1011  	}
2b2811178e8555 Seth Jennings      2013-07-10  1012  =

b349acc76b7f65 Weijie Yang        2013-11-12  1013  	/* move it to the tail=
 of the inactive list after end_writeback */
b349acc76b7f65 Weijie Yang        2013-11-12  1014  	SetPageReclaim(page);
b349acc76b7f65 Weijie Yang        2013-11-12  1015  =

2b2811178e8555 Seth Jennings      2013-07-10  1016  	/* start writeback */
2b2811178e8555 Seth Jennings      2013-07-10  1017  	__swap_writepage(page,=
 &wbc, end_swap_bio_write);
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1018  	put_page(page);
2b2811178e8555 Seth Jennings      2013-07-10  1019  	zswap_written_back_pag=
es++;
2b2811178e8555 Seth Jennings      2013-07-10  1020  =

2b2811178e8555 Seth Jennings      2013-07-10  1021  	spin_lock(&tree->lock);
2b2811178e8555 Seth Jennings      2013-07-10  1022  	/* drop local referenc=
e */
0ab0abcf511545 Weijie Yang        2013-11-12  1023  	zswap_entry_put(tree, =
entry);
2b2811178e8555 Seth Jennings      2013-07-10  1024  =

2b2811178e8555 Seth Jennings      2013-07-10  1025  	/*
0ab0abcf511545 Weijie Yang        2013-11-12  1026  	* There are two possib=
le situations for entry here:
0ab0abcf511545 Weijie Yang        2013-11-12  1027  	* (1) refcount is 1(no=
rmal case),  entry is valid and on the tree
0ab0abcf511545 Weijie Yang        2013-11-12  1028  	* (2) refcount is 0, e=
ntry is freed and not on the tree
0ab0abcf511545 Weijie Yang        2013-11-12  1029  	*     because invalida=
te happened during writeback
0ab0abcf511545 Weijie Yang        2013-11-12  1030  	*  search the tree and=
 free the entry if find entry
2b2811178e8555 Seth Jennings      2013-07-10  1031  	*/
0ab0abcf511545 Weijie Yang        2013-11-12  1032  	if (entry =3D=3D zswap=
_rb_search(&tree->rbroot, offset))
0ab0abcf511545 Weijie Yang        2013-11-12  1033  		zswap_entry_put(tree,=
 entry);
2b2811178e8555 Seth Jennings      2013-07-10  1034  	spin_unlock(&tree->loc=
k);
2b2811178e8555 Seth Jennings      2013-07-10  1035  =

0ab0abcf511545 Weijie Yang        2013-11-12  1036  	goto end;
0ab0abcf511545 Weijie Yang        2013-11-12  1037  =

0ab0abcf511545 Weijie Yang        2013-11-12  1038  	/*
0ab0abcf511545 Weijie Yang        2013-11-12  1039  	* if we get here due t=
o ZSWAP_SWAPCACHE_EXIST
c0c641d77b9ab0 Randy Dunlap       2021-02-25  1040  	* a load may be happen=
ing concurrently.
c0c641d77b9ab0 Randy Dunlap       2021-02-25  1041  	* it is safe and okay =
to not free the entry.
0ab0abcf511545 Weijie Yang        2013-11-12  1042  	* if we free the entry=
 in the following put
c0c641d77b9ab0 Randy Dunlap       2021-02-25  1043  	* it is also okay to r=
eturn !0
0ab0abcf511545 Weijie Yang        2013-11-12  1044  	*/
2b2811178e8555 Seth Jennings      2013-07-10  1045  fail:
2b2811178e8555 Seth Jennings      2013-07-10  1046  	spin_lock(&tree->lock);
0ab0abcf511545 Weijie Yang        2013-11-12  1047  	zswap_entry_put(tree, =
entry);
2b2811178e8555 Seth Jennings      2013-07-10  1048  	spin_unlock(&tree->loc=
k);
0ab0abcf511545 Weijie Yang        2013-11-12  1049  =

0ab0abcf511545 Weijie Yang        2013-11-12  1050  end:
fc6697a89f56d9 Tian Tao           2021-02-25  1051  	if (zpool_can_sleep_ma=
pped(pool))
068619e32ff622 Vitaly Wool        2019-09-23  1052  		zpool_unmap_handle(po=
ol, handle);
fc6697a89f56d9 Tian Tao           2021-02-25  1053  	else
fc6697a89f56d9 Tian Tao           2021-02-25  1054  		kfree(tmp);
fc6697a89f56d9 Tian Tao           2021-02-25  1055  =

2b2811178e8555 Seth Jennings      2013-07-10  1056  	return ret;
2b2811178e8555 Seth Jennings      2013-07-10  1057  }
2b2811178e8555 Seth Jennings      2013-07-10  1058  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0165781244184488509==--

