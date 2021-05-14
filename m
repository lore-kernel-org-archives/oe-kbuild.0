Content-Type: multipart/mixed; boundary="===============6580798754151130779=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:ext/qu/subpage-prep-13 28/33] fs/btrfs/ordered-data.c:341:7: warning: Local variable entry_end shadows outer function [shadowFunction]
Date: Fri, 14 May 2021 09:41:15 +0800
Message-ID: <202105140910.gK1iRcWP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6580798754151130779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git ext/qu/subpage-prep-13
head:   a9bcab7677c4d06250bfaa69d9d865e2c65d8163
commit: cb0ac8e744fa75a5e09f3b91a246cf613058d7f1 [28/33] btrfs: refactor ho=
w we finish ordered extent io for endio functions
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
compiler: microblaze-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/btrfs/ordered-data.c:
>> fs/btrfs/ordered-data.c:341:7: warning: Local variable entry_end shadows=
 outer function [shadowFunction]
     u64 entry_end;
         ^
   fs/btrfs/ordered-data.c:22:12: note: Shadowed declaration
   static u64 entry_end(struct btrfs_ordered_extent *entry)
              ^
   fs/btrfs/ordered-data.c:341:7: note: Shadow variable
     u64 entry_end;
         ^

vim +341 fs/btrfs/ordered-data.c

dc17ff8f11d129 Chris Mason     2008-01-08  301  =

163cf09c2a0ee5 Chris Mason     2010-11-28  302  /*
cb0ac8e744fa75 Qu Wenruo       2021-04-01  303   * Mark all ordered extents=
 io inside the specified range finished.
163cf09c2a0ee5 Chris Mason     2010-11-28  304   *
cb0ac8e744fa75 Qu Wenruo       2021-04-01  305   * @page:	 The invovled pag=
e for the opeartion.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  306   *		 For uncompressed buffe=
red IO, the page status also needs to be
cb0ac8e744fa75 Qu Wenruo       2021-04-01  307   *		 updated to indicate wh=
ether the pending ordered io is finished.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  308   *		 Can be NULL for direct=
 IO and compressed write.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  309   *		 For these cases, calle=
rs are ensured they won't execute the
cb0ac8e744fa75 Qu Wenruo       2021-04-01  310   *		 endio function twice.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  311   * @finish_func: The functi=
on to be executed when all the IO of an ordered
cb0ac8e744fa75 Qu Wenruo       2021-04-01  312   *		 extent are finished.
163cf09c2a0ee5 Chris Mason     2010-11-28  313   *
cb0ac8e744fa75 Qu Wenruo       2021-04-01  314   * This function is called =
for endio, thus the range must have ordered
cb0ac8e744fa75 Qu Wenruo       2021-04-01  315   * extent(s) coveri it.
163cf09c2a0ee5 Chris Mason     2010-11-28  316   */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  317  void btrfs_mark_ordered_io_=
finished(struct btrfs_inode *inode,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  318  				struct page *page, u64 =
file_offset,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  319  				u64 num_bytes, btrfs_fu=
nc_t finish_func,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  320  				bool uptodate)
163cf09c2a0ee5 Chris Mason     2010-11-28  321  {
7095821ee1f57d Nikolay Borisov 2020-06-03  322  	struct btrfs_ordered_inode=
_tree *tree =3D &inode->ordered_tree;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  323  	struct btrfs_fs_info *fs_i=
nfo =3D inode->root->fs_info;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  324  	struct btrfs_workqueue *wq;
163cf09c2a0ee5 Chris Mason     2010-11-28  325  	struct rb_node *node;
163cf09c2a0ee5 Chris Mason     2010-11-28  326  	struct btrfs_ordered_exten=
t *entry =3D NULL;
5fd02043553b02 Josef Bacik     2012-05-02  327  	unsigned long flags;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  328  	u64 cur =3D file_offset;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  329  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  330  	if (btrfs_is_free_space_in=
ode(inode))
cb0ac8e744fa75 Qu Wenruo       2021-04-01  331  		wq =3D fs_info->endio_fre=
espace_worker;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  332  	else
cb0ac8e744fa75 Qu Wenruo       2021-04-01  333  		wq =3D fs_info->endio_wri=
te_workers;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  334  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  335  	if (page)
cb0ac8e744fa75 Qu Wenruo       2021-04-01  336  		ASSERT(page->mapping && p=
age_offset(page) <=3D file_offset &&
cb0ac8e744fa75 Qu Wenruo       2021-04-01  337  		       file_offset + num_=
bytes <=3D page_offset(page) + PAGE_SIZE);
163cf09c2a0ee5 Chris Mason     2010-11-28  338  =

5fd02043553b02 Josef Bacik     2012-05-02  339  	spin_lock_irqsave(&tree->l=
ock, flags);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  340  	while (cur < file_offset +=
 num_bytes) {
cb0ac8e744fa75 Qu Wenruo       2021-04-01 @341  		u64 entry_end;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  342  		u64 end;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  343  		u32 len;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  344  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  345  		node =3D tree_search(tree=
, cur);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  346  		/* No ordered extents@=
all */
58f74b2203d786 Qu Wenruo       2020-12-22  347  		if (!node)
cb0ac8e744fa75 Qu Wenruo       2021-04-01  348  			break;
163cf09c2a0ee5 Chris Mason     2010-11-28  349  =

163cf09c2a0ee5 Chris Mason     2010-11-28  350  		entry =3D rb_entry(node, =
struct btrfs_ordered_extent, rb_node);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  351  		entry_end =3D entry->file=
_offset + entry->num_bytes;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  352  		/*
cb0ac8e744fa75 Qu Wenruo       2021-04-01  353  		 * |<-- OE --->|  |
cb0ac8e744fa75 Qu Wenruo       2021-04-01  354  		 *		  cur
cb0ac8e744fa75 Qu Wenruo       2021-04-01  355  		 * Go to next OE.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  356  		 */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  357  		if (cur >=3D entry_end) {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  358  			node =3D rb_next(node);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  359  			/* No more ordered exten=
ts, exit */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  360  			if (!node)
cb0ac8e744fa75 Qu Wenruo       2021-04-01  361  				break;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  362  			entry =3D rb_entry(node,=
 struct btrfs_ordered_extent,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  363  					 rb_node);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  364  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  365  			/* Go to next ordered ex=
tent and continue */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  366  			cur =3D entry->file_offs=
et;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  367  			continue;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  368  		}
cb0ac8e744fa75 Qu Wenruo       2021-04-01  369  		/*
cb0ac8e744fa75 Qu Wenruo       2021-04-01  370  		 * |	|<--- OE --->|
cb0ac8e744fa75 Qu Wenruo       2021-04-01  371  		 * cur
cb0ac8e744fa75 Qu Wenruo       2021-04-01  372  		 * Go to the start of OE.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  373  		 */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  374  		if (cur < entry->file_off=
set) {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  375  			cur =3D entry->file_offs=
et;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  376  			continue;
163cf09c2a0ee5 Chris Mason     2010-11-28  377  		}
cb0ac8e744fa75 Qu Wenruo       2021-04-01  378  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  379  		/*
cb0ac8e744fa75 Qu Wenruo       2021-04-01  380  		 * Now we are definitely =
inside one ordered extent.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  381  		 *
cb0ac8e744fa75 Qu Wenruo       2021-04-01  382  		 * |<--- OE --->|
cb0ac8e744fa75 Qu Wenruo       2021-04-01  383  		 *	|
cb0ac8e744fa75 Qu Wenruo       2021-04-01  384  		 *	cur
cb0ac8e744fa75 Qu Wenruo       2021-04-01  385  		 */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  386  		end =3D min(entry->file_o=
ffset + entry->num_bytes,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  387  			  file_offset + num_byte=
s) - 1;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  388  		ASSERT(end + 1 - cur < U3=
2_MAX);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  389  		len =3D end + 1 - cur;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  390  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  391  		if (page) {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  392  			/*
cb0ac8e744fa75 Qu Wenruo       2021-04-01  393  			 * Private2 bit indicate=
s whether we still have pending
cb0ac8e744fa75 Qu Wenruo       2021-04-01  394  			 * io unfinished for the=
 ordered extent.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  395  			 *
cb0ac8e744fa75 Qu Wenruo       2021-04-01  396  			 * If there's no such bi=
t, we need to skip to next range.
cb0ac8e744fa75 Qu Wenruo       2021-04-01  397  			 */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  398  			if (!PagePrivate2(page))=
 {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  399  				cur +=3D len;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  400  				continue;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  401  			}
cb0ac8e744fa75 Qu Wenruo       2021-04-01  402  			ClearPagePrivate2(page);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  403  		}
cb0ac8e744fa75 Qu Wenruo       2021-04-01  404  =

cb0ac8e744fa75 Qu Wenruo       2021-04-01  405  		/* Now we're fine to upda=
te the accounting */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  406  		if (unlikely(len > entry-=
>bytes_left)) {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  407  			WARN_ON(1);
0b246afa62b0cf Jeff Mahoney    2016-06-22  408  			btrfs_crit(fs_info,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  409  "bad ordered extent account=
ing, root=3D%llu ino=3D%llu OE offset=3D%llu OE len=3D%llu to_dec=3D%u left=
=3D%llu",
cb0ac8e744fa75 Qu Wenruo       2021-04-01  410  				   inode->root->root_ke=
y.objectid,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  411  				   btrfs_ino(inode),
cb0ac8e744fa75 Qu Wenruo       2021-04-01  412  				   entry->file_offset,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  413  				   entry->num_bytes,
cb0ac8e744fa75 Qu Wenruo       2021-04-01  414  				   len, entry->bytes_le=
ft);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  415  			entry->bytes_left =3D 0;
cb0ac8e744fa75 Qu Wenruo       2021-04-01  416  		} else {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  417  			entry->bytes_left -=3D l=
en;
163cf09c2a0ee5 Chris Mason     2010-11-28  418  		}
cb0ac8e744fa75 Qu Wenruo       2021-04-01  419  =

5fd02043553b02 Josef Bacik     2012-05-02  420  		if (!uptodate)
5fd02043553b02 Josef Bacik     2012-05-02  421  			set_bit(BTRFS_ORDERED_IO=
ERR, &entry->flags);
5fd02043553b02 Josef Bacik     2012-05-02  422  =

58f74b2203d786 Qu Wenruo       2020-12-22  423  		/*
cb0ac8e744fa75 Qu Wenruo       2021-04-01  424  		 * All the IO of the orde=
red extent is finished, we need to queue
cb0ac8e744fa75 Qu Wenruo       2021-04-01  425  		 * the finish_func to be =
executed.
58f74b2203d786 Qu Wenruo       2020-12-22  426  		 */
cb0ac8e744fa75 Qu Wenruo       2021-04-01  427  		if (entry->bytes_left =3D=
=3D 0) {
cb0ac8e744fa75 Qu Wenruo       2021-04-01  428  			set_bit(BTRFS_ORDERED_IO=
_DONE, &entry->flags);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  429  			/* set_bit implies a bar=
rier */
093258e6ebaf17 David Sterba    2018-02-26  430  			cond_wake_up_nomb(&entry=
->wait);
e76edab7f059bc Elena Reshetova 2017-03-03  431  			refcount_inc(&entry->ref=
s);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  432  			spin_unlock_irqrestore(&=
tree->lock, flags);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  433  			btrfs_init_work(&entry->=
work, finish_func, NULL, NULL);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  434  			btrfs_queue_work(wq, &en=
try->work);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  435  			spin_lock_irqsave(&tree-=
>lock, flags);
cb0ac8e744fa75 Qu Wenruo       2021-04-01  436  		}
cb0ac8e744fa75 Qu Wenruo       2021-04-01  437  		cur +=3D len;
163cf09c2a0ee5 Chris Mason     2010-11-28  438  	}
5fd02043553b02 Josef Bacik     2012-05-02  439  	spin_unlock_irqrestore(&tr=
ee->lock, flags);
163cf09c2a0ee5 Chris Mason     2010-11-28  440  }
163cf09c2a0ee5 Chris Mason     2010-11-28  441  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6580798754151130779==--

