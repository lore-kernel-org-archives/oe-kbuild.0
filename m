Content-Type: multipart/mixed; boundary="===============3391206403454080131=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/fs-writeback.c:2463 __mark_inode_dirty() warn: inconsistent returns '&inode->i_lock'.
Date: Thu, 05 May 2022 06:06:24 +0800
Message-ID: <202205050634.9xsNbMqS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3391206403454080131==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jchao Sun <sunjunchao2870@gmail.com>
CC: 0day robot <lkp@intel.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220504-1557=
17/Jchao-Sun/Add-assert-for-inode-i_io_list-in-inode_io_list_move_locked/20=
220503-180501
head:   3b06eceb315e6540fbea9600122a45ce6fa94106
commit: 3b06eceb315e6540fbea9600122a45ce6fa94106 writeback: Fix inode->i_io=
_list not be protected by inode->i_lock error
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
505/202205050634.9xsNbMqS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/fs-writeback.c:2463 __mark_inode_dirty() warn: inconsistent returns '&in=
ode->i_lock'.

vim +2463 fs/fs-writeback.c

1efff914afac8a Theodore Ts'o         2015-03-17  2321  =

03ba3782e8dcc5 Jens Axboe            2009-09-09  2322  /**
35d14f278e530e Eric Biggers          2021-01-12  2323   * __mark_inode_dirt=
y -	internal function to mark an inode dirty
0117d4272b1acd Mauro Carvalho Chehab 2017-05-12  2324   *
03ba3782e8dcc5 Jens Axboe            2009-09-09  2325   * @inode: inode to =
mark
35d14f278e530e Eric Biggers          2021-01-12  2326   * @flags: what kind=
 of dirty, e.g. I_DIRTY_SYNC.  This can be a combination of
35d14f278e530e Eric Biggers          2021-01-12  2327   *	   multiple I_DIR=
TY_* flags, except that I_DIRTY_TIME can't be combined
35d14f278e530e Eric Biggers          2021-01-12  2328   *	   with I_DIRTY_P=
AGES.
0117d4272b1acd Mauro Carvalho Chehab 2017-05-12  2329   *
35d14f278e530e Eric Biggers          2021-01-12  2330   * Mark an inode as =
dirty.  We notify the filesystem, then update the inode's
35d14f278e530e Eric Biggers          2021-01-12  2331   * dirty flags.  The=
n, if needed we add the inode to the appropriate dirty list.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2332   *
35d14f278e530e Eric Biggers          2021-01-12  2333   * Most callers shou=
ld use mark_inode_dirty() or mark_inode_dirty_sync()
35d14f278e530e Eric Biggers          2021-01-12  2334   * instead of callin=
g this directly.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2335   *
35d14f278e530e Eric Biggers          2021-01-12  2336   * CAREFUL!  We only=
 add the inode to the dirty list if it is hashed or if it
35d14f278e530e Eric Biggers          2021-01-12  2337   * refers to a block=
dev.  Unhashed inodes will never be added to the dirty list
35d14f278e530e Eric Biggers          2021-01-12  2338   * even if they are =
later hashed, as they will have been marked dirty already.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2339   *
35d14f278e530e Eric Biggers          2021-01-12  2340   * In short, ensure =
you hash any inodes _before_ you start marking them dirty.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2341   *
03ba3782e8dcc5 Jens Axboe            2009-09-09  2342   * Note that for blo=
ckdevs, inode->dirtied_when represents the dirtying time of
03ba3782e8dcc5 Jens Axboe            2009-09-09  2343   * the block-special=
 inode (/dev/hda1) itself.  And the ->dirtied_when field of
03ba3782e8dcc5 Jens Axboe            2009-09-09  2344   * the kernel-intern=
al blockdev inode represents the dirtying time of the
03ba3782e8dcc5 Jens Axboe            2009-09-09  2345   * blockdev's pages.=
  This is why for I_DIRTY_PAGES we always use
03ba3782e8dcc5 Jens Axboe            2009-09-09  2346   * page->mapping->ho=
st, so the page-dirtying time is recorded in the internal
03ba3782e8dcc5 Jens Axboe            2009-09-09  2347   * blockdev inode.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2348   */
03ba3782e8dcc5 Jens Axboe            2009-09-09  2349  void __mark_inode_di=
rty(struct inode *inode, int flags)
03ba3782e8dcc5 Jens Axboe            2009-09-09  2350  {
03ba3782e8dcc5 Jens Axboe            2009-09-09  2351  	struct super_block =
*sb =3D inode->i_sb;
35d14f278e530e Eric Biggers          2021-01-12  2352  	int dirtytime =3D 0;
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2353  =

0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2354  	trace_writeback_mar=
k_inode_dirty(inode, flags);
03ba3782e8dcc5 Jens Axboe            2009-09-09  2355  =

35d14f278e530e Eric Biggers          2021-01-12  2356  	if (flags & I_DIRTY=
_INODE) {
03ba3782e8dcc5 Jens Axboe            2009-09-09  2357  		/*
35d14f278e530e Eric Biggers          2021-01-12  2358  		 * Notify the file=
system about the inode being dirtied, so that
35d14f278e530e Eric Biggers          2021-01-12  2359  		 * (if needed) it =
can update on-disk fields and journal the
35d14f278e530e Eric Biggers          2021-01-12  2360  		 * inode.  This is=
 only needed when the inode itself is being
35d14f278e530e Eric Biggers          2021-01-12  2361  		 * dirtied now.  I=
.e. it's only needed for I_DIRTY_INODE, not
35d14f278e530e Eric Biggers          2021-01-12  2362  		 * for just I_DIRT=
Y_PAGES or I_DIRTY_TIME.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2363  		 */
9fb0a7da0c528d Tejun Heo             2013-01-11  2364  		trace_writeback_di=
rty_inode_start(inode, flags);
03ba3782e8dcc5 Jens Axboe            2009-09-09  2365  		if (sb->s_op->dirt=
y_inode)
a38ed483a72672 Eric Biggers          2021-01-12  2366  			sb->s_op->dirty_i=
node(inode, flags & I_DIRTY_INODE);
9fb0a7da0c528d Tejun Heo             2013-01-11  2367  		trace_writeback_di=
rty_inode(inode, flags);
e2728c5621fd9c Eric Biggers          2021-01-12  2368  =

35d14f278e530e Eric Biggers          2021-01-12  2369  		/* I_DIRTY_INODE s=
upersedes I_DIRTY_TIME. */
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2370  		flags &=3D ~I_DIRT=
Y_TIME;
35d14f278e530e Eric Biggers          2021-01-12  2371  	} else {
35d14f278e530e Eric Biggers          2021-01-12  2372  		/*
35d14f278e530e Eric Biggers          2021-01-12  2373  		 * Else it's eithe=
r I_DIRTY_PAGES, I_DIRTY_TIME, or nothing.
35d14f278e530e Eric Biggers          2021-01-12  2374  		 * (We don't suppo=
rt setting both I_DIRTY_PAGES and I_DIRTY_TIME
35d14f278e530e Eric Biggers          2021-01-12  2375  		 * in one call to =
__mark_inode_dirty().)
35d14f278e530e Eric Biggers          2021-01-12  2376  		 */
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2377  		dirtytime =3D flag=
s & I_DIRTY_TIME;
35d14f278e530e Eric Biggers          2021-01-12  2378  		WARN_ON_ONCE(dirty=
time && flags !=3D I_DIRTY_TIME);
35d14f278e530e Eric Biggers          2021-01-12  2379  	}
03ba3782e8dcc5 Jens Axboe            2009-09-09  2380  =

03ba3782e8dcc5 Jens Axboe            2009-09-09  2381  	/*
9c6ac78eb3521c Tejun Heo             2014-10-24  2382  	 * Paired with smp_=
mb() in __writeback_single_inode() for the
9c6ac78eb3521c Tejun Heo             2014-10-24  2383  	 * following lockle=
ss i_state test.  See there for details.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2384  	 */
03ba3782e8dcc5 Jens Axboe            2009-09-09  2385  	smp_mb();
03ba3782e8dcc5 Jens Axboe            2009-09-09  2386  =

0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2387  	if (((inode->i_stat=
e & flags) =3D=3D flags) ||
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2388  	    (dirtytime && (=
inode->i_state & I_DIRTY_INODE)))
03ba3782e8dcc5 Jens Axboe            2009-09-09  2389  		return;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2390  =

250df6ed274d76 Dave Chinner          2011-03-22  2391  	spin_lock(&inode->i=
_lock);
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2392  	if (dirtytime && (i=
node->i_state & I_DIRTY_INODE))
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2393  		goto out_unlock_in=
ode;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2394  	if ((inode->i_state=
 & flags) !=3D flags) {
03ba3782e8dcc5 Jens Axboe            2009-09-09  2395  		const int was_dirt=
y =3D inode->i_state & I_DIRTY;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2396  =

52ebea749aaed1 Tejun Heo             2015-05-22  2397  		inode_attach_wb(in=
ode, NULL);
52ebea749aaed1 Tejun Heo             2015-05-22  2398  =

35d14f278e530e Eric Biggers          2021-01-12  2399  		/* I_DIRTY_INODE s=
upersedes I_DIRTY_TIME. */
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2400  		if (flags & I_DIRT=
Y_INODE)
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2401  			inode->i_state &=
=3D ~I_DIRTY_TIME;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2402  		inode->i_state |=
=3D flags;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2403  =

03ba3782e8dcc5 Jens Axboe            2009-09-09  2404  		/*
5afced3bf28100 Jan Kara              2020-05-29  2405  		 * If the inode is=
 queued for writeback by flush worker, just
5afced3bf28100 Jan Kara              2020-05-29  2406  		 * update its dirt=
y state. Once the flush worker is done with
5afced3bf28100 Jan Kara              2020-05-29  2407  		 * the inode it wi=
ll place it on the appropriate superblock
5afced3bf28100 Jan Kara              2020-05-29  2408  		 * list, based upo=
n its state.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2409  		 */
5afced3bf28100 Jan Kara              2020-05-29  2410  		if (inode->i_state=
 & I_SYNC_QUEUED)
250df6ed274d76 Dave Chinner          2011-03-22  2411  			goto out_unlock_i=
node;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2412  =

03ba3782e8dcc5 Jens Axboe            2009-09-09  2413  		/*
03ba3782e8dcc5 Jens Axboe            2009-09-09  2414  		 * Only add valid =
(hashed) inodes to the superblock's
03ba3782e8dcc5 Jens Axboe            2009-09-09  2415  		 * dirty list.  Ad=
d blockdev inodes as well.
03ba3782e8dcc5 Jens Axboe            2009-09-09  2416  		 */
03ba3782e8dcc5 Jens Axboe            2009-09-09  2417  		if (!S_ISBLK(inode=
->i_mode)) {
1d3382cbf02986 Al Viro               2010-10-23  2418  			if (inode_unhashe=
d(inode))
250df6ed274d76 Dave Chinner          2011-03-22  2419  				goto out_unlock_=
inode;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2420  		}
a4ffdde6e56fdf Al Viro               2010-06-02  2421  		if (inode->i_state=
 & I_FREEING)
250df6ed274d76 Dave Chinner          2011-03-22  2422  			goto out_unlock_i=
node;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2423  =

03ba3782e8dcc5 Jens Axboe            2009-09-09  2424  		/*
03ba3782e8dcc5 Jens Axboe            2009-09-09  2425  		 * If the inode wa=
s already on b_dirty/b_io/b_more_io, don't
03ba3782e8dcc5 Jens Axboe            2009-09-09  2426  		 * reposition it (=
that would break b_dirty time-ordering).
03ba3782e8dcc5 Jens Axboe            2009-09-09  2427  		 */
03ba3782e8dcc5 Jens Axboe            2009-09-09  2428  		if (!was_dirty) {
87e1d789bf55b1 Tejun Heo             2015-05-28  2429  			struct bdi_writeb=
ack *wb;
d6c10f1fc8626d Tejun Heo             2015-05-22  2430  			struct list_head =
*dirty_list;
a66979abad090b Dave Chinner          2011-03-22  2431  			bool wakeup_bdi =
=3D false;
500b067c5e6cee Jens Axboe            2009-09-09  2432  =

87e1d789bf55b1 Tejun Heo             2015-05-28  2433  			wb =3D locked_ino=
de_to_wb_and_lock_list(inode);
253c34e9b10c30 Artem Bityutskiy      2010-07-25  2434  =

03ba3782e8dcc5 Jens Axboe            2009-09-09  2435  			inode->dirtied_wh=
en =3D jiffies;
a2f4870697a5bc Theodore Ts'o         2015-03-17  2436  			if (dirtytime)
a2f4870697a5bc Theodore Ts'o         2015-03-17  2437  				inode->dirtied_t=
ime_when =3D jiffies;
d6c10f1fc8626d Tejun Heo             2015-05-22  2438  =

0e11f6443f522f Christoph Hellwig     2018-02-21  2439  			if (inode->i_stat=
e & I_DIRTY)
0747259d13febf Tejun Heo             2015-05-22  2440  				dirty_list =3D &=
wb->b_dirty;
a2f4870697a5bc Theodore Ts'o         2015-03-17  2441  			else
0747259d13febf Tejun Heo             2015-05-22  2442  				dirty_list =3D &=
wb->b_dirty_time;
d6c10f1fc8626d Tejun Heo             2015-05-22  2443  =

c7f5408493aeb0 Dave Chinner          2015-03-04  2444  			wakeup_bdi =3D in=
ode_io_list_move_locked(inode, wb,
d6c10f1fc8626d Tejun Heo             2015-05-22  2445  							       dirty_=
list);
d6c10f1fc8626d Tejun Heo             2015-05-22  2446  =

0747259d13febf Tejun Heo             2015-05-22  2447  			spin_unlock(&wb->=
list_lock);
0ae45f63d4ef8d Theodore Ts'o         2015-02-02  2448  			trace_writeback_d=
irty_inode_enqueue(inode);
a66979abad090b Dave Chinner          2011-03-22  2449  =

d6c10f1fc8626d Tejun Heo             2015-05-22  2450  			/*
d6c10f1fc8626d Tejun Heo             2015-05-22  2451  			 * If this is the=
 first dirty inode for this bdi,
d6c10f1fc8626d Tejun Heo             2015-05-22  2452  			 * we have to wak=
e-up the corresponding bdi thread
d6c10f1fc8626d Tejun Heo             2015-05-22  2453  			 * to make sure b=
ackground write-back happens
d6c10f1fc8626d Tejun Heo             2015-05-22  2454  			 * later.
d6c10f1fc8626d Tejun Heo             2015-05-22  2455  			 */
f56753ac2a9081 Christoph Hellwig     2020-09-24  2456  			if (wakeup_bdi &&
f56753ac2a9081 Christoph Hellwig     2020-09-24  2457  			    (wb->bdi->cap=
abilities & BDI_CAP_WRITEBACK))
0747259d13febf Tejun Heo             2015-05-22  2458  				wb_wakeup_delaye=
d(wb);
a66979abad090b Dave Chinner          2011-03-22  2459  			return;
03ba3782e8dcc5 Jens Axboe            2009-09-09  2460  		}
03ba3782e8dcc5 Jens Axboe            2009-09-09  2461  	}
250df6ed274d76 Dave Chinner          2011-03-22  2462  out_unlock_inode:
250df6ed274d76 Dave Chinner          2011-03-22 @2463  	spin_unlock(&inode-=
>i_lock);
03ba3782e8dcc5 Jens Axboe            2009-09-09  2464  }
03ba3782e8dcc5 Jens Axboe            2009-09-09  2465  EXPORT_SYMBOL(__mark=
_inode_dirty);
03ba3782e8dcc5 Jens Axboe            2009-09-09  2466  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3391206403454080131==--

