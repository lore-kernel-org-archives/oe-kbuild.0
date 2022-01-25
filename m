Content-Type: multipart/mixed; boundary="===============4181614874274672866=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/ordered-data.c:342:7: warning: Local variable entry_end shadows outer function [shadowFunction]
Date: Wed, 26 Jan 2022 03:17:37 +0800
Message-ID: <202201260251.TJQQuSWb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4181614874274672866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Guenter Roeck <linux@roeck-us.net>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Guenter,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a08b41ab9e2e468647f78eb17c28e29b93006394
commit: a18b14d8886614b3c7d290c4cfc33389822b0535 riscv: Disable STACKPROTEC=
TOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
date:   6 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 6 months ago
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/ordered-data.c:
>> fs/btrfs/ordered-data.c:342:7: warning: Local variable entry_end shadows=
 outer function [shadowFunction]
     u64 entry_end;
         ^
   fs/btrfs/ordered-data.c:23:12: note: Shadowed declaration
   static u64 entry_end(struct btrfs_ordered_extent *entry)
              ^
   fs/btrfs/ordered-data.c:342:7: note: Shadow variable
     u64 entry_end;
         ^

vim +342 fs/btrfs/ordered-data.c

dc17ff8f11d129 Chris Mason     2008-01-08  302  =

163cf09c2a0ee5 Chris Mason     2010-11-28  303  /*
e65f152e434848 Qu Wenruo       2021-04-01  304   * Mark all ordered extents=
 io inside the specified range finished.
163cf09c2a0ee5 Chris Mason     2010-11-28  305   *
e65f152e434848 Qu Wenruo       2021-04-01  306   * @page:	 The invovled pag=
e for the opeartion.
e65f152e434848 Qu Wenruo       2021-04-01  307   *		 For uncompressed buffe=
red IO, the page status also needs to be
e65f152e434848 Qu Wenruo       2021-04-01  308   *		 updated to indicate wh=
ether the pending ordered io is finished.
e65f152e434848 Qu Wenruo       2021-04-01  309   *		 Can be NULL for direct=
 IO and compressed write.
e65f152e434848 Qu Wenruo       2021-04-01  310   *		 For these cases, calle=
rs are ensured they won't execute the
e65f152e434848 Qu Wenruo       2021-04-01  311   *		 endio function twice.
e65f152e434848 Qu Wenruo       2021-04-01  312   * @finish_func: The functi=
on to be executed when all the IO of an ordered
e65f152e434848 Qu Wenruo       2021-04-01  313   *		 extent are finished.
163cf09c2a0ee5 Chris Mason     2010-11-28  314   *
e65f152e434848 Qu Wenruo       2021-04-01  315   * This function is called =
for endio, thus the range must have ordered
e65f152e434848 Qu Wenruo       2021-04-01  316   * extent(s) coveri it.
163cf09c2a0ee5 Chris Mason     2010-11-28  317   */
e65f152e434848 Qu Wenruo       2021-04-01  318  void btrfs_mark_ordered_io_=
finished(struct btrfs_inode *inode,
e65f152e434848 Qu Wenruo       2021-04-01  319  				struct page *page, u64 =
file_offset,
e65f152e434848 Qu Wenruo       2021-04-01  320  				u64 num_bytes, btrfs_fu=
nc_t finish_func,
e65f152e434848 Qu Wenruo       2021-04-01  321  				bool uptodate)
163cf09c2a0ee5 Chris Mason     2010-11-28  322  {
7095821ee1f57d Nikolay Borisov 2020-06-03  323  	struct btrfs_ordered_inode=
_tree *tree =3D &inode->ordered_tree;
e65f152e434848 Qu Wenruo       2021-04-01  324  	struct btrfs_fs_info *fs_i=
nfo =3D inode->root->fs_info;
e65f152e434848 Qu Wenruo       2021-04-01  325  	struct btrfs_workqueue *wq;
163cf09c2a0ee5 Chris Mason     2010-11-28  326  	struct rb_node *node;
163cf09c2a0ee5 Chris Mason     2010-11-28  327  	struct btrfs_ordered_exten=
t *entry =3D NULL;
5fd02043553b02 Josef Bacik     2012-05-02  328  	unsigned long flags;
e65f152e434848 Qu Wenruo       2021-04-01  329  	u64 cur =3D file_offset;
e65f152e434848 Qu Wenruo       2021-04-01  330  =

e65f152e434848 Qu Wenruo       2021-04-01  331  	if (btrfs_is_free_space_in=
ode(inode))
e65f152e434848 Qu Wenruo       2021-04-01  332  		wq =3D fs_info->endio_fre=
espace_worker;
e65f152e434848 Qu Wenruo       2021-04-01  333  	else
e65f152e434848 Qu Wenruo       2021-04-01  334  		wq =3D fs_info->endio_wri=
te_workers;
e65f152e434848 Qu Wenruo       2021-04-01  335  =

e65f152e434848 Qu Wenruo       2021-04-01  336  	if (page)
e65f152e434848 Qu Wenruo       2021-04-01  337  		ASSERT(page->mapping && p=
age_offset(page) <=3D file_offset &&
e65f152e434848 Qu Wenruo       2021-04-01  338  		       file_offset + num_=
bytes <=3D page_offset(page) + PAGE_SIZE);
163cf09c2a0ee5 Chris Mason     2010-11-28  339  =

5fd02043553b02 Josef Bacik     2012-05-02  340  	spin_lock_irqsave(&tree->l=
ock, flags);
e65f152e434848 Qu Wenruo       2021-04-01  341  	while (cur < file_offset +=
 num_bytes) {
e65f152e434848 Qu Wenruo       2021-04-01 @342  		u64 entry_end;
e65f152e434848 Qu Wenruo       2021-04-01  343  		u64 end;
e65f152e434848 Qu Wenruo       2021-04-01  344  		u32 len;
e65f152e434848 Qu Wenruo       2021-04-01  345  =

e65f152e434848 Qu Wenruo       2021-04-01  346  		node =3D tree_search(tree=
, cur);
e65f152e434848 Qu Wenruo       2021-04-01  347  		/* No ordered extents@=
all */
58f74b2203d786 Qu Wenruo       2020-12-22  348  		if (!node)
e65f152e434848 Qu Wenruo       2021-04-01  349  			break;
163cf09c2a0ee5 Chris Mason     2010-11-28  350  =

163cf09c2a0ee5 Chris Mason     2010-11-28  351  		entry =3D rb_entry(node, =
struct btrfs_ordered_extent, rb_node);
e65f152e434848 Qu Wenruo       2021-04-01  352  		entry_end =3D entry->file=
_offset + entry->num_bytes;
e65f152e434848 Qu Wenruo       2021-04-01  353  		/*
e65f152e434848 Qu Wenruo       2021-04-01  354  		 * |<-- OE --->|  |
e65f152e434848 Qu Wenruo       2021-04-01  355  		 *		  cur
e65f152e434848 Qu Wenruo       2021-04-01  356  		 * Go to next OE.
e65f152e434848 Qu Wenruo       2021-04-01  357  		 */
e65f152e434848 Qu Wenruo       2021-04-01  358  		if (cur >=3D entry_end) {
e65f152e434848 Qu Wenruo       2021-04-01  359  			node =3D rb_next(node);
e65f152e434848 Qu Wenruo       2021-04-01  360  			/* No more ordered exten=
ts, exit */
e65f152e434848 Qu Wenruo       2021-04-01  361  			if (!node)
e65f152e434848 Qu Wenruo       2021-04-01  362  				break;
e65f152e434848 Qu Wenruo       2021-04-01  363  			entry =3D rb_entry(node,=
 struct btrfs_ordered_extent,
e65f152e434848 Qu Wenruo       2021-04-01  364  					 rb_node);
e65f152e434848 Qu Wenruo       2021-04-01  365  =

e65f152e434848 Qu Wenruo       2021-04-01  366  			/* Go to next ordered ex=
tent and continue */
e65f152e434848 Qu Wenruo       2021-04-01  367  			cur =3D entry->file_offs=
et;
e65f152e434848 Qu Wenruo       2021-04-01  368  			continue;
e65f152e434848 Qu Wenruo       2021-04-01  369  		}
e65f152e434848 Qu Wenruo       2021-04-01  370  		/*
e65f152e434848 Qu Wenruo       2021-04-01  371  		 * |	|<--- OE --->|
e65f152e434848 Qu Wenruo       2021-04-01  372  		 * cur
e65f152e434848 Qu Wenruo       2021-04-01  373  		 * Go to the start of OE.
e65f152e434848 Qu Wenruo       2021-04-01  374  		 */
e65f152e434848 Qu Wenruo       2021-04-01  375  		if (cur < entry->file_off=
set) {
e65f152e434848 Qu Wenruo       2021-04-01  376  			cur =3D entry->file_offs=
et;
e65f152e434848 Qu Wenruo       2021-04-01  377  			continue;
163cf09c2a0ee5 Chris Mason     2010-11-28  378  		}
e65f152e434848 Qu Wenruo       2021-04-01  379  =

e65f152e434848 Qu Wenruo       2021-04-01  380  		/*
e65f152e434848 Qu Wenruo       2021-04-01  381  		 * Now we are definitely =
inside one ordered extent.
e65f152e434848 Qu Wenruo       2021-04-01  382  		 *
e65f152e434848 Qu Wenruo       2021-04-01  383  		 * |<--- OE --->|
e65f152e434848 Qu Wenruo       2021-04-01  384  		 *	|
e65f152e434848 Qu Wenruo       2021-04-01  385  		 *	cur
e65f152e434848 Qu Wenruo       2021-04-01  386  		 */
e65f152e434848 Qu Wenruo       2021-04-01  387  		end =3D min(entry->file_o=
ffset + entry->num_bytes,
e65f152e434848 Qu Wenruo       2021-04-01  388  			  file_offset + num_byte=
s) - 1;
e65f152e434848 Qu Wenruo       2021-04-01  389  		ASSERT(end + 1 - cur < U3=
2_MAX);
e65f152e434848 Qu Wenruo       2021-04-01  390  		len =3D end + 1 - cur;
e65f152e434848 Qu Wenruo       2021-04-01  391  =

e65f152e434848 Qu Wenruo       2021-04-01  392  		if (page) {
e65f152e434848 Qu Wenruo       2021-04-01  393  			/*
f57ad93735fd66 Qu Wenruo       2021-04-07  394  			 * Ordered (Private2) bi=
t indicates whether we still
f57ad93735fd66 Qu Wenruo       2021-04-07  395  			 * have pending io unfin=
ished for the ordered extent.
e65f152e434848 Qu Wenruo       2021-04-01  396  			 *
e65f152e434848 Qu Wenruo       2021-04-01  397  			 * If there's no such bi=
t, we need to skip to next range.
e65f152e434848 Qu Wenruo       2021-04-01  398  			 */
b945a4637ec72a Qu Wenruo       2021-05-31  399  			if (!btrfs_page_test_ord=
ered(fs_info, page, cur, len)) {
e65f152e434848 Qu Wenruo       2021-04-01  400  				cur +=3D len;
e65f152e434848 Qu Wenruo       2021-04-01  401  				continue;
e65f152e434848 Qu Wenruo       2021-04-01  402  			}
b945a4637ec72a Qu Wenruo       2021-05-31  403  			btrfs_page_clear_ordered=
(fs_info, page, cur, len);
e65f152e434848 Qu Wenruo       2021-04-01  404  		}
e65f152e434848 Qu Wenruo       2021-04-01  405  =

e65f152e434848 Qu Wenruo       2021-04-01  406  		/* Now we're fine to upda=
te the accounting */
e65f152e434848 Qu Wenruo       2021-04-01  407  		if (unlikely(len > entry-=
>bytes_left)) {
e65f152e434848 Qu Wenruo       2021-04-01  408  			WARN_ON(1);
0b246afa62b0cf Jeff Mahoney    2016-06-22  409  			btrfs_crit(fs_info,
e65f152e434848 Qu Wenruo       2021-04-01  410  "bad ordered extent account=
ing, root=3D%llu ino=3D%llu OE offset=3D%llu OE len=3D%llu to_dec=3D%u left=
=3D%llu",
e65f152e434848 Qu Wenruo       2021-04-01  411  				   inode->root->root_ke=
y.objectid,
e65f152e434848 Qu Wenruo       2021-04-01  412  				   btrfs_ino(inode),
e65f152e434848 Qu Wenruo       2021-04-01  413  				   entry->file_offset,
e65f152e434848 Qu Wenruo       2021-04-01  414  				   entry->num_bytes,
e65f152e434848 Qu Wenruo       2021-04-01  415  				   len, entry->bytes_le=
ft);
e65f152e434848 Qu Wenruo       2021-04-01  416  			entry->bytes_left =3D 0;
e65f152e434848 Qu Wenruo       2021-04-01  417  		} else {
e65f152e434848 Qu Wenruo       2021-04-01  418  			entry->bytes_left -=3D l=
en;
163cf09c2a0ee5 Chris Mason     2010-11-28  419  		}
e65f152e434848 Qu Wenruo       2021-04-01  420  =

5fd02043553b02 Josef Bacik     2012-05-02  421  		if (!uptodate)
5fd02043553b02 Josef Bacik     2012-05-02  422  			set_bit(BTRFS_ORDERED_IO=
ERR, &entry->flags);
5fd02043553b02 Josef Bacik     2012-05-02  423  =

58f74b2203d786 Qu Wenruo       2020-12-22  424  		/*
e65f152e434848 Qu Wenruo       2021-04-01  425  		 * All the IO of the orde=
red extent is finished, we need to queue
e65f152e434848 Qu Wenruo       2021-04-01  426  		 * the finish_func to be =
executed.
58f74b2203d786 Qu Wenruo       2020-12-22  427  		 */
e65f152e434848 Qu Wenruo       2021-04-01  428  		if (entry->bytes_left =3D=
=3D 0) {
e65f152e434848 Qu Wenruo       2021-04-01  429  			set_bit(BTRFS_ORDERED_IO=
_DONE, &entry->flags);
e65f152e434848 Qu Wenruo       2021-04-01  430  			cond_wake_up(&entry->wai=
t);
e76edab7f059bc Elena Reshetova 2017-03-03  431  			refcount_inc(&entry->ref=
s);
e65f152e434848 Qu Wenruo       2021-04-01  432  			spin_unlock_irqrestore(&=
tree->lock, flags);
e65f152e434848 Qu Wenruo       2021-04-01  433  			btrfs_init_work(&entry->=
work, finish_func, NULL, NULL);
e65f152e434848 Qu Wenruo       2021-04-01  434  			btrfs_queue_work(wq, &en=
try->work);
e65f152e434848 Qu Wenruo       2021-04-01  435  			spin_lock_irqsave(&tree-=
>lock, flags);
e65f152e434848 Qu Wenruo       2021-04-01  436  		}
e65f152e434848 Qu Wenruo       2021-04-01  437  		cur +=3D len;
163cf09c2a0ee5 Chris Mason     2010-11-28  438  	}
5fd02043553b02 Josef Bacik     2012-05-02  439  	spin_unlock_irqrestore(&tr=
ee->lock, flags);
163cf09c2a0ee5 Chris Mason     2010-11-28  440  }
163cf09c2a0ee5 Chris Mason     2010-11-28  441  =


:::::: The code at line 342 was first introduced by commit
:::::: e65f152e43484807b4caf7300e70d882e4652566 btrfs: refactor how we fini=
sh ordered extent io for endio functions

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4181614874274672866==--

