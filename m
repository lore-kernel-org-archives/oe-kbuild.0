Content-Type: multipart/mixed; boundary="===============0483587702067726774=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/ordered-data.c:341:7: warning: Local variable entry_end shadows outer function [shadowFunction]
Date: Sun, 13 Feb 2022 02:16:44 +0800
Message-ID: <202202122139.98G3G77Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0483587702067726774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   83e396641110663d3c7bb25b9bc0c6a750359ecf
commit: e65f152e43484807b4caf7300e70d882e4652566 btrfs: refactor how we fin=
ish ordered extent io for endio functions
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
compiler: powerpc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> fs/btrfs/sysfs.c:1260:4: warning: %u in format string (no. 2) requires '=
unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_=
uint]
      snprintf(name, BTRFS_FEATURE_NAME_MAX, "%s:%u",
      ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/btrfs/sysfs.c:1260:4: warning: %u in format string (no. 2) requires '=
unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_=
uint]
      snprintf(name, BTRFS_FEATURE_NAME_MAX, "%s:%u",
      ^
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

dc17ff8f11d129d Chris Mason     2008-01-08  301  =

163cf09c2a0ee5c Chris Mason     2010-11-28  302  /*
e65f152e4348480 Qu Wenruo       2021-04-01  303   * Mark all ordered extent=
s io inside the specified range finished.
163cf09c2a0ee5c Chris Mason     2010-11-28  304   *
e65f152e4348480 Qu Wenruo       2021-04-01  305   * @page:	 The invovled pa=
ge for the opeartion.
e65f152e4348480 Qu Wenruo       2021-04-01  306   *		 For uncompressed buff=
ered IO, the page status also needs to be
e65f152e4348480 Qu Wenruo       2021-04-01  307   *		 updated to indicate w=
hether the pending ordered io is finished.
e65f152e4348480 Qu Wenruo       2021-04-01  308   *		 Can be NULL for direc=
t IO and compressed write.
e65f152e4348480 Qu Wenruo       2021-04-01  309   *		 For these cases, call=
ers are ensured they won't execute the
e65f152e4348480 Qu Wenruo       2021-04-01  310   *		 endio function twice.
e65f152e4348480 Qu Wenruo       2021-04-01  311   * @finish_func: The funct=
ion to be executed when all the IO of an ordered
e65f152e4348480 Qu Wenruo       2021-04-01  312   *		 extent are finished.
163cf09c2a0ee5c Chris Mason     2010-11-28  313   *
e65f152e4348480 Qu Wenruo       2021-04-01  314   * This function is called=
 for endio, thus the range must have ordered
e65f152e4348480 Qu Wenruo       2021-04-01  315   * extent(s) coveri it.
163cf09c2a0ee5c Chris Mason     2010-11-28  316   */
e65f152e4348480 Qu Wenruo       2021-04-01  317  void btrfs_mark_ordered_io=
_finished(struct btrfs_inode *inode,
e65f152e4348480 Qu Wenruo       2021-04-01  318  				struct page *page, u64=
 file_offset,
e65f152e4348480 Qu Wenruo       2021-04-01  319  				u64 num_bytes, btrfs_f=
unc_t finish_func,
e65f152e4348480 Qu Wenruo       2021-04-01  320  				bool uptodate)
163cf09c2a0ee5c Chris Mason     2010-11-28  321  {
7095821ee1f57d9 Nikolay Borisov 2020-06-03  322  	struct btrfs_ordered_inod=
e_tree *tree =3D &inode->ordered_tree;
e65f152e4348480 Qu Wenruo       2021-04-01  323  	struct btrfs_fs_info *fs_=
info =3D inode->root->fs_info;
e65f152e4348480 Qu Wenruo       2021-04-01  324  	struct btrfs_workqueue *w=
q;
163cf09c2a0ee5c Chris Mason     2010-11-28  325  	struct rb_node *node;
163cf09c2a0ee5c Chris Mason     2010-11-28  326  	struct btrfs_ordered_exte=
nt *entry =3D NULL;
5fd02043553b028 Josef Bacik     2012-05-02  327  	unsigned long flags;
e65f152e4348480 Qu Wenruo       2021-04-01  328  	u64 cur =3D file_offset;
e65f152e4348480 Qu Wenruo       2021-04-01  329  =

e65f152e4348480 Qu Wenruo       2021-04-01  330  	if (btrfs_is_free_space_i=
node(inode))
e65f152e4348480 Qu Wenruo       2021-04-01  331  		wq =3D fs_info->endio_fr=
eespace_worker;
e65f152e4348480 Qu Wenruo       2021-04-01  332  	else
e65f152e4348480 Qu Wenruo       2021-04-01  333  		wq =3D fs_info->endio_wr=
ite_workers;
e65f152e4348480 Qu Wenruo       2021-04-01  334  =

e65f152e4348480 Qu Wenruo       2021-04-01  335  	if (page)
e65f152e4348480 Qu Wenruo       2021-04-01  336  		ASSERT(page->mapping && =
page_offset(page) <=3D file_offset &&
e65f152e4348480 Qu Wenruo       2021-04-01  337  		       file_offset + num=
_bytes <=3D page_offset(page) + PAGE_SIZE);
163cf09c2a0ee5c Chris Mason     2010-11-28  338  =

5fd02043553b028 Josef Bacik     2012-05-02  339  	spin_lock_irqsave(&tree->=
lock, flags);
e65f152e4348480 Qu Wenruo       2021-04-01  340  	while (cur < file_offset =
+ num_bytes) {
e65f152e4348480 Qu Wenruo       2021-04-01 @341  		u64 entry_end;
e65f152e4348480 Qu Wenruo       2021-04-01  342  		u64 end;
e65f152e4348480 Qu Wenruo       2021-04-01  343  		u32 len;
e65f152e4348480 Qu Wenruo       2021-04-01  344  =

e65f152e4348480 Qu Wenruo       2021-04-01  345  		node =3D tree_search(tre=
e, cur);
e65f152e4348480 Qu Wenruo       2021-04-01  346  		/* No ordered extents at=
 all */
58f74b2203d786d Qu Wenruo       2020-12-22  347  		if (!node)
e65f152e4348480 Qu Wenruo       2021-04-01  348  			break;
163cf09c2a0ee5c Chris Mason     2010-11-28  349  =

163cf09c2a0ee5c Chris Mason     2010-11-28  350  		entry =3D rb_entry(node,=
 struct btrfs_ordered_extent, rb_node);
e65f152e4348480 Qu Wenruo       2021-04-01  351  		entry_end =3D entry->fil=
e_offset + entry->num_bytes;
e65f152e4348480 Qu Wenruo       2021-04-01  352  		/*
e65f152e4348480 Qu Wenruo       2021-04-01  353  		 * |<-- OE --->|  |
e65f152e4348480 Qu Wenruo       2021-04-01  354  		 *		  cur
e65f152e4348480 Qu Wenruo       2021-04-01  355  		 * Go to next OE.
e65f152e4348480 Qu Wenruo       2021-04-01  356  		 */
e65f152e4348480 Qu Wenruo       2021-04-01  357  		if (cur >=3D entry_end) {
e65f152e4348480 Qu Wenruo       2021-04-01  358  			node =3D rb_next(node);
e65f152e4348480 Qu Wenruo       2021-04-01  359  			/* No more ordered exte=
nts, exit */
e65f152e4348480 Qu Wenruo       2021-04-01  360  			if (!node)
e65f152e4348480 Qu Wenruo       2021-04-01  361  				break;
e65f152e4348480 Qu Wenruo       2021-04-01  362  			entry =3D rb_entry(node=
, struct btrfs_ordered_extent,
e65f152e4348480 Qu Wenruo       2021-04-01  363  					 rb_node);
e65f152e4348480 Qu Wenruo       2021-04-01  364  =

e65f152e4348480 Qu Wenruo       2021-04-01  365  			/* Go to next ordered e=
xtent and continue */
e65f152e4348480 Qu Wenruo       2021-04-01  366  			cur =3D entry->file_off=
set;
e65f152e4348480 Qu Wenruo       2021-04-01  367  			continue;
e65f152e4348480 Qu Wenruo       2021-04-01  368  		}
e65f152e4348480 Qu Wenruo       2021-04-01  369  		/*
e65f152e4348480 Qu Wenruo       2021-04-01  370  		 * |	|<--- OE --->|
e65f152e4348480 Qu Wenruo       2021-04-01  371  		 * cur
e65f152e4348480 Qu Wenruo       2021-04-01  372  		 * Go to the start of OE.
e65f152e4348480 Qu Wenruo       2021-04-01  373  		 */
e65f152e4348480 Qu Wenruo       2021-04-01  374  		if (cur < entry->file_of=
fset) {
e65f152e4348480 Qu Wenruo       2021-04-01  375  			cur =3D entry->file_off=
set;
e65f152e4348480 Qu Wenruo       2021-04-01  376  			continue;
163cf09c2a0ee5c Chris Mason     2010-11-28  377  		}
e65f152e4348480 Qu Wenruo       2021-04-01  378  =

e65f152e4348480 Qu Wenruo       2021-04-01  379  		/*
e65f152e4348480 Qu Wenruo       2021-04-01  380  		 * Now we are definitely=
 inside one ordered extent.
e65f152e4348480 Qu Wenruo       2021-04-01  381  		 *
e65f152e4348480 Qu Wenruo       2021-04-01  382  		 * |<--- OE --->|
e65f152e4348480 Qu Wenruo       2021-04-01  383  		 *	|
e65f152e4348480 Qu Wenruo       2021-04-01  384  		 *	cur
e65f152e4348480 Qu Wenruo       2021-04-01  385  		 */
e65f152e4348480 Qu Wenruo       2021-04-01  386  		end =3D min(entry->file_=
offset + entry->num_bytes,
e65f152e4348480 Qu Wenruo       2021-04-01  387  			  file_offset + num_byt=
es) - 1;
e65f152e4348480 Qu Wenruo       2021-04-01  388  		ASSERT(end + 1 - cur < U=
32_MAX);
e65f152e4348480 Qu Wenruo       2021-04-01  389  		len =3D end + 1 - cur;
e65f152e4348480 Qu Wenruo       2021-04-01  390  =

e65f152e4348480 Qu Wenruo       2021-04-01  391  		if (page) {
e65f152e4348480 Qu Wenruo       2021-04-01  392  			/*
e65f152e4348480 Qu Wenruo       2021-04-01  393  			 * Private2 bit indicat=
es whether we still have pending
e65f152e4348480 Qu Wenruo       2021-04-01  394  			 * io unfinished for th=
e ordered extent.
e65f152e4348480 Qu Wenruo       2021-04-01  395  			 *
e65f152e4348480 Qu Wenruo       2021-04-01  396  			 * If there's no such b=
it, we need to skip to next range.
e65f152e4348480 Qu Wenruo       2021-04-01  397  			 */
e65f152e4348480 Qu Wenruo       2021-04-01  398  			if (!PagePrivate2(page)=
) {
e65f152e4348480 Qu Wenruo       2021-04-01  399  				cur +=3D len;
e65f152e4348480 Qu Wenruo       2021-04-01  400  				continue;
e65f152e4348480 Qu Wenruo       2021-04-01  401  			}
e65f152e4348480 Qu Wenruo       2021-04-01  402  			ClearPagePrivate2(page);
e65f152e4348480 Qu Wenruo       2021-04-01  403  		}
e65f152e4348480 Qu Wenruo       2021-04-01  404  =

e65f152e4348480 Qu Wenruo       2021-04-01  405  		/* Now we're fine to upd=
ate the accounting */
e65f152e4348480 Qu Wenruo       2021-04-01  406  		if (unlikely(len > entry=
->bytes_left)) {
e65f152e4348480 Qu Wenruo       2021-04-01  407  			WARN_ON(1);
0b246afa62b0cf5 Jeff Mahoney    2016-06-22  408  			btrfs_crit(fs_info,
e65f152e4348480 Qu Wenruo       2021-04-01  409  "bad ordered extent accoun=
ting, root=3D%llu ino=3D%llu OE offset=3D%llu OE len=3D%llu to_dec=3D%u lef=
t=3D%llu",
e65f152e4348480 Qu Wenruo       2021-04-01  410  				   inode->root->root_k=
ey.objectid,
e65f152e4348480 Qu Wenruo       2021-04-01  411  				   btrfs_ino(inode),
e65f152e4348480 Qu Wenruo       2021-04-01  412  				   entry->file_offset,
e65f152e4348480 Qu Wenruo       2021-04-01  413  				   entry->num_bytes,
e65f152e4348480 Qu Wenruo       2021-04-01  414  				   len, entry->bytes_l=
eft);
e65f152e4348480 Qu Wenruo       2021-04-01  415  			entry->bytes_left =3D 0;
e65f152e4348480 Qu Wenruo       2021-04-01  416  		} else {
e65f152e4348480 Qu Wenruo       2021-04-01  417  			entry->bytes_left -=3D =
len;
163cf09c2a0ee5c Chris Mason     2010-11-28  418  		}
e65f152e4348480 Qu Wenruo       2021-04-01  419  =

5fd02043553b028 Josef Bacik     2012-05-02  420  		if (!uptodate)
5fd02043553b028 Josef Bacik     2012-05-02  421  			set_bit(BTRFS_ORDERED_I=
OERR, &entry->flags);
5fd02043553b028 Josef Bacik     2012-05-02  422  =

58f74b2203d786d Qu Wenruo       2020-12-22  423  		/*
e65f152e4348480 Qu Wenruo       2021-04-01  424  		 * All the IO of the ord=
ered extent is finished, we need to queue
e65f152e4348480 Qu Wenruo       2021-04-01  425  		 * the finish_func to be=
 executed.
58f74b2203d786d Qu Wenruo       2020-12-22  426  		 */
e65f152e4348480 Qu Wenruo       2021-04-01  427  		if (entry->bytes_left =
=3D=3D 0) {
e65f152e4348480 Qu Wenruo       2021-04-01  428  			set_bit(BTRFS_ORDERED_I=
O_DONE, &entry->flags);
e65f152e4348480 Qu Wenruo       2021-04-01  429  			cond_wake_up(&entry->wa=
it);
e76edab7f059bc1 Elena Reshetova 2017-03-03  430  			refcount_inc(&entry->re=
fs);
e65f152e4348480 Qu Wenruo       2021-04-01  431  			spin_unlock_irqrestore(=
&tree->lock, flags);
e65f152e4348480 Qu Wenruo       2021-04-01  432  			btrfs_init_work(&entry-=
>work, finish_func, NULL, NULL);
e65f152e4348480 Qu Wenruo       2021-04-01  433  			btrfs_queue_work(wq, &e=
ntry->work);
e65f152e4348480 Qu Wenruo       2021-04-01  434  			spin_lock_irqsave(&tree=
->lock, flags);
e65f152e4348480 Qu Wenruo       2021-04-01  435  		}
e65f152e4348480 Qu Wenruo       2021-04-01  436  		cur +=3D len;
163cf09c2a0ee5c Chris Mason     2010-11-28  437  	}
5fd02043553b028 Josef Bacik     2012-05-02  438  	spin_unlock_irqrestore(&t=
ree->lock, flags);
163cf09c2a0ee5c Chris Mason     2010-11-28  439  }
163cf09c2a0ee5c Chris Mason     2010-11-28  440  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0483587702067726774==--

