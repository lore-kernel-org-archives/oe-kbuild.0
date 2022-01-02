Content-Type: multipart/mixed; boundary="===============0747198360556244980=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/zswap.c:991:4: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
Date: Sun, 02 Jan 2022 20:58:35 +0800
Message-ID: <202201022009.hLRIFwFU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0747198360556244980==
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
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: fc6697a89f56d9773b2fbff718d4cf2a6d63379d mm/zswap: add the flag can=
_sleep_mapped
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20211227 (https://download.01.org/0day-ci/ar=
chive/20220102/202201022009.hLRIFwFU-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726=
c64d3b6cca66f7c54d457d586aa3129f67)
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
=3Dx86_64 clang-analyzer =


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
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
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
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   mm/zswap.c:989:7: note: Assuming the condition is true
                   if (!zpool_can_sleep_mapped(pool)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:989:3: note: Taking true branch
                   if (!zpool_can_sleep_mapped(pool)) {
                   ^
   mm/zswap.c:991:4: note: Null pointer passed as 1st argument to memory co=
py function
                           memcpy(tmp, src, entry->length);
                           ^      ~~~
   mm/zswap.c:1296:3: warning: 1st function call argument is an uninitializ=
ed value [clang-analyzer-core.CallAndMessage]
                   memcpy(tmp, src, entry->length);
                   ^      ~~~
   mm/zswap.c:1257:18: note: 'tmp' declared without an initial value
           u8 *src, *dst, *tmp;
                           ^~~
   mm/zswap.c:1263:10: note: Calling 'zswap_entry_find_get'
           entry =3D zswap_entry_find_get(&tree->rbroot, offset);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:391:6: note: Assuming 'entry' is non-null, which participates=
 in a condition later
           if (entry)

vim +991 mm/zswap.c

2b2811178e85553 Seth Jennings      2013-07-10   914  =

2b2811178e85553 Seth Jennings      2013-07-10   915  /*
2b2811178e85553 Seth Jennings      2013-07-10   916   * Attempts to free an=
 entry by adding a page to the swap cache,
2b2811178e85553 Seth Jennings      2013-07-10   917   * decompressing the e=
ntry data into the page, and issuing a
2b2811178e85553 Seth Jennings      2013-07-10   918   * bio write to write =
the page back to the swap device.
2b2811178e85553 Seth Jennings      2013-07-10   919   *
2b2811178e85553 Seth Jennings      2013-07-10   920   * This can be thought=
 of as a "resumed writeback" of the page
2b2811178e85553 Seth Jennings      2013-07-10   921   * to the swap device.=
  We are basically resuming the same swap
2b2811178e85553 Seth Jennings      2013-07-10   922   * writeback path that=
 was intercepted with the frontswap_store()
2b2811178e85553 Seth Jennings      2013-07-10   923   * in the first place.=
  After the page has been decompressed into
2b2811178e85553 Seth Jennings      2013-07-10   924   * the swap cache, the=
 compressed version stored by zswap can be
2b2811178e85553 Seth Jennings      2013-07-10   925   * freed.
2b2811178e85553 Seth Jennings      2013-07-10   926   */
12d79d64bfd3913 Dan Streetman      2014-08-06   927  static int zswap_write=
back_entry(struct zpool *pool, unsigned long handle)
2b2811178e85553 Seth Jennings      2013-07-10   928  {
2b2811178e85553 Seth Jennings      2013-07-10   929  	struct zswap_header *=
zhdr;
2b2811178e85553 Seth Jennings      2013-07-10   930  	swp_entry_t swpentry;
2b2811178e85553 Seth Jennings      2013-07-10   931  	struct zswap_tree *tr=
ee;
2b2811178e85553 Seth Jennings      2013-07-10   932  	pgoff_t offset;
2b2811178e85553 Seth Jennings      2013-07-10   933  	struct zswap_entry *e=
ntry;
2b2811178e85553 Seth Jennings      2013-07-10   934  	struct page *page;
1ec3b5fe6eec782 Barry Song         2020-12-14   935  	struct scatterlist in=
put, output;
1ec3b5fe6eec782 Barry Song         2020-12-14   936  	struct crypto_acomp_c=
tx *acomp_ctx;
1ec3b5fe6eec782 Barry Song         2020-12-14   937  =

fc6697a89f56d97 Tian Tao           2021-02-25   938  	u8 *src, *tmp =3D NUL=
L;
2b2811178e85553 Seth Jennings      2013-07-10   939  	unsigned int dlen;
0ab0abcf511545d Weijie Yang        2013-11-12   940  	int ret;
2b2811178e85553 Seth Jennings      2013-07-10   941  	struct writeback_cont=
rol wbc =3D {
2b2811178e85553 Seth Jennings      2013-07-10   942  		.sync_mode =3D WB_SY=
NC_NONE,
2b2811178e85553 Seth Jennings      2013-07-10   943  	};
2b2811178e85553 Seth Jennings      2013-07-10   944  =

fc6697a89f56d97 Tian Tao           2021-02-25   945  	if (!zpool_can_sleep_=
mapped(pool)) {
fc6697a89f56d97 Tian Tao           2021-02-25   946  		tmp =3D kmalloc(PAGE=
_SIZE, GFP_ATOMIC);
fc6697a89f56d97 Tian Tao           2021-02-25   947  		if (!tmp)
fc6697a89f56d97 Tian Tao           2021-02-25   948  			return -ENOMEM;
fc6697a89f56d97 Tian Tao           2021-02-25   949  	}
fc6697a89f56d97 Tian Tao           2021-02-25   950  =

2b2811178e85553 Seth Jennings      2013-07-10   951  	/* extract swpentry f=
rom data */
12d79d64bfd3913 Dan Streetman      2014-08-06   952  	zhdr =3D zpool_map_ha=
ndle(pool, handle, ZPOOL_MM_RO);
2b2811178e85553 Seth Jennings      2013-07-10   953  	swpentry =3D zhdr->sw=
pentry; /* here */
2b2811178e85553 Seth Jennings      2013-07-10   954  	tree =3D zswap_trees[=
swp_type(swpentry)];
2b2811178e85553 Seth Jennings      2013-07-10   955  	offset =3D swp_offset=
(swpentry);
2b2811178e85553 Seth Jennings      2013-07-10   956  =

2b2811178e85553 Seth Jennings      2013-07-10   957  	/* find and ref zswap=
 entry */
2b2811178e85553 Seth Jennings      2013-07-10   958  	spin_lock(&tree->lock=
);
0ab0abcf511545d Weijie Yang        2013-11-12   959  	entry =3D zswap_entry=
_find_get(&tree->rbroot, offset);
2b2811178e85553 Seth Jennings      2013-07-10   960  	if (!entry) {
2b2811178e85553 Seth Jennings      2013-07-10   961  		/* entry was invalid=
ated */
2b2811178e85553 Seth Jennings      2013-07-10   962  		spin_unlock(&tree->l=
ock);
068619e32ff6229 Vitaly Wool        2019-09-23   963  		zpool_unmap_handle(p=
ool, handle);
fc6697a89f56d97 Tian Tao           2021-02-25   964  		kfree(tmp);
2b2811178e85553 Seth Jennings      2013-07-10   965  		return 0;
2b2811178e85553 Seth Jennings      2013-07-10   966  	}
2b2811178e85553 Seth Jennings      2013-07-10   967  	spin_unlock(&tree->lo=
ck);
2b2811178e85553 Seth Jennings      2013-07-10   968  	BUG_ON(offset !=3D en=
try->offset);
2b2811178e85553 Seth Jennings      2013-07-10   969  =

2b2811178e85553 Seth Jennings      2013-07-10   970  	/* try to allocate sw=
ap cache page */
2b2811178e85553 Seth Jennings      2013-07-10   971  	switch (zswap_get_swa=
p_cache_page(swpentry, &page)) {
67d13fe846c57a5 Weijie Yang        2013-11-12   972  	case ZSWAP_SWAPCACHE_=
FAIL: /* no memory or invalidate happened */
2b2811178e85553 Seth Jennings      2013-07-10   973  		ret =3D -ENOMEM;
2b2811178e85553 Seth Jennings      2013-07-10   974  		goto fail;
2b2811178e85553 Seth Jennings      2013-07-10   975  =

67d13fe846c57a5 Weijie Yang        2013-11-12   976  	case ZSWAP_SWAPCACHE_=
EXIST:
2b2811178e85553 Seth Jennings      2013-07-10   977  		/* page is already i=
n the swap cache, ignore for now */
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01   978  		put_page(page);
2b2811178e85553 Seth Jennings      2013-07-10   979  		ret =3D -EEXIST;
2b2811178e85553 Seth Jennings      2013-07-10   980  		goto fail;
2b2811178e85553 Seth Jennings      2013-07-10   981  =

2b2811178e85553 Seth Jennings      2013-07-10   982  	case ZSWAP_SWAPCACHE_=
NEW: /* page is locked */
2b2811178e85553 Seth Jennings      2013-07-10   983  		/* decompress */
1ec3b5fe6eec782 Barry Song         2020-12-14   984  		acomp_ctx =3D raw_cp=
u_ptr(entry->pool->acomp_ctx);
1ec3b5fe6eec782 Barry Song         2020-12-14   985  =

2b2811178e85553 Seth Jennings      2013-07-10   986  		dlen =3D PAGE_SIZE;
068619e32ff6229 Vitaly Wool        2019-09-23   987  		src =3D (u8 *)zhdr +=
 sizeof(struct zswap_header);
1ec3b5fe6eec782 Barry Song         2020-12-14   988  =

fc6697a89f56d97 Tian Tao           2021-02-25   989  		if (!zpool_can_sleep=
_mapped(pool)) {
fc6697a89f56d97 Tian Tao           2021-02-25   990  =

fc6697a89f56d97 Tian Tao           2021-02-25  @991  			memcpy(tmp, src, en=
try->length);
fc6697a89f56d97 Tian Tao           2021-02-25   992  			src =3D tmp;
fc6697a89f56d97 Tian Tao           2021-02-25   993  =

fc6697a89f56d97 Tian Tao           2021-02-25   994  			zpool_unmap_handle(=
pool, handle);
fc6697a89f56d97 Tian Tao           2021-02-25   995  		}
fc6697a89f56d97 Tian Tao           2021-02-25   996  =

1ec3b5fe6eec782 Barry Song         2020-12-14   997  		mutex_lock(acomp_ctx=
->mutex);
1ec3b5fe6eec782 Barry Song         2020-12-14   998  		sg_init_one(&input, =
src, entry->length);
1ec3b5fe6eec782 Barry Song         2020-12-14   999  		sg_init_table(&outpu=
t, 1);
1ec3b5fe6eec782 Barry Song         2020-12-14  1000  		sg_set_page(&output,=
 page, PAGE_SIZE, 0);
1ec3b5fe6eec782 Barry Song         2020-12-14  1001  		acomp_request_set_pa=
rams(acomp_ctx->req, &input, &output, entry->length, dlen);
1ec3b5fe6eec782 Barry Song         2020-12-14  1002  		ret =3D crypto_wait_=
req(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);
1ec3b5fe6eec782 Barry Song         2020-12-14  1003  		dlen =3D acomp_ctx->=
req->dlen;
1ec3b5fe6eec782 Barry Song         2020-12-14  1004  		mutex_unlock(acomp_c=
tx->mutex);
1ec3b5fe6eec782 Barry Song         2020-12-14  1005  =

2b2811178e85553 Seth Jennings      2013-07-10  1006  		BUG_ON(ret);
2b2811178e85553 Seth Jennings      2013-07-10  1007  		BUG_ON(dlen !=3D PAG=
E_SIZE);
2b2811178e85553 Seth Jennings      2013-07-10  1008  =

2b2811178e85553 Seth Jennings      2013-07-10  1009  		/* page is up to dat=
e */
2b2811178e85553 Seth Jennings      2013-07-10  1010  		SetPageUptodate(page=
);
2b2811178e85553 Seth Jennings      2013-07-10  1011  	}
2b2811178e85553 Seth Jennings      2013-07-10  1012  =

b349acc76b7f654 Weijie Yang        2013-11-12  1013  	/* move it to the tai=
l of the inactive list after end_writeback */
b349acc76b7f654 Weijie Yang        2013-11-12  1014  	SetPageReclaim(page);
b349acc76b7f654 Weijie Yang        2013-11-12  1015  =

2b2811178e85553 Seth Jennings      2013-07-10  1016  	/* start writeback */
2b2811178e85553 Seth Jennings      2013-07-10  1017  	__swap_writepage(page=
, &wbc, end_swap_bio_write);
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1018  	put_page(page);
2b2811178e85553 Seth Jennings      2013-07-10  1019  	zswap_written_back_pa=
ges++;
2b2811178e85553 Seth Jennings      2013-07-10  1020  =

2b2811178e85553 Seth Jennings      2013-07-10  1021  	spin_lock(&tree->lock=
);
2b2811178e85553 Seth Jennings      2013-07-10  1022  	/* drop local referen=
ce */
0ab0abcf511545d Weijie Yang        2013-11-12  1023  	zswap_entry_put(tree,=
 entry);
2b2811178e85553 Seth Jennings      2013-07-10  1024  =

2b2811178e85553 Seth Jennings      2013-07-10  1025  	/*
0ab0abcf511545d Weijie Yang        2013-11-12  1026  	* There are two possi=
ble situations for entry here:
0ab0abcf511545d Weijie Yang        2013-11-12  1027  	* (1) refcount is 1(n=
ormal case),  entry is valid and on the tree
0ab0abcf511545d Weijie Yang        2013-11-12  1028  	* (2) refcount is 0, =
entry is freed and not on the tree
0ab0abcf511545d Weijie Yang        2013-11-12  1029  	*     because invalid=
ate happened during writeback
0ab0abcf511545d Weijie Yang        2013-11-12  1030  	*  search the tree an=
d free the entry if find entry
2b2811178e85553 Seth Jennings      2013-07-10  1031  	*/
0ab0abcf511545d Weijie Yang        2013-11-12  1032  	if (entry =3D=3D zswa=
p_rb_search(&tree->rbroot, offset))
0ab0abcf511545d Weijie Yang        2013-11-12  1033  		zswap_entry_put(tree=
, entry);
2b2811178e85553 Seth Jennings      2013-07-10  1034  	spin_unlock(&tree->lo=
ck);
2b2811178e85553 Seth Jennings      2013-07-10  1035  =

0ab0abcf511545d Weijie Yang        2013-11-12  1036  	goto end;
0ab0abcf511545d Weijie Yang        2013-11-12  1037  =

0ab0abcf511545d Weijie Yang        2013-11-12  1038  	/*
0ab0abcf511545d Weijie Yang        2013-11-12  1039  	* if we get here due =
to ZSWAP_SWAPCACHE_EXIST
c0c641d77b9ab0d Randy Dunlap       2021-02-25  1040  	* a load may be happe=
ning concurrently.
c0c641d77b9ab0d Randy Dunlap       2021-02-25  1041  	* it is safe and okay=
 to not free the entry.
0ab0abcf511545d Weijie Yang        2013-11-12  1042  	* if we free the entr=
y in the following put
c0c641d77b9ab0d Randy Dunlap       2021-02-25  1043  	* it is also okay to =
return !0
0ab0abcf511545d Weijie Yang        2013-11-12  1044  	*/
2b2811178e85553 Seth Jennings      2013-07-10  1045  fail:
2b2811178e85553 Seth Jennings      2013-07-10  1046  	spin_lock(&tree->lock=
);
0ab0abcf511545d Weijie Yang        2013-11-12  1047  	zswap_entry_put(tree,=
 entry);
2b2811178e85553 Seth Jennings      2013-07-10  1048  	spin_unlock(&tree->lo=
ck);
0ab0abcf511545d Weijie Yang        2013-11-12  1049  =

0ab0abcf511545d Weijie Yang        2013-11-12  1050  end:
fc6697a89f56d97 Tian Tao           2021-02-25  1051  	if (zpool_can_sleep_m=
apped(pool))
068619e32ff6229 Vitaly Wool        2019-09-23  1052  		zpool_unmap_handle(p=
ool, handle);
fc6697a89f56d97 Tian Tao           2021-02-25  1053  	else
fc6697a89f56d97 Tian Tao           2021-02-25  1054  		kfree(tmp);
fc6697a89f56d97 Tian Tao           2021-02-25  1055  =

2b2811178e85553 Seth Jennings      2013-07-10  1056  	return ret;
2b2811178e85553 Seth Jennings      2013-07-10  1057  }
2b2811178e85553 Seth Jennings      2013-07-10  1058  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0747198360556244980==--

