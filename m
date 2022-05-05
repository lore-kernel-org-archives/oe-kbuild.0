Content-Type: multipart/mixed; boundary="===============6171753215549668822=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/fs-writeback.c:2467 __mark_inode_dirty() error: uninitialized symbol 'wb'.
Date: Thu, 05 May 2022 12:06:24 +0800
Message-ID: <202205051122.4JKB3mhj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6171753215549668822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jchao Sun <sunjunchao2870@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220505-0237=
56/Jchao-Sun/Add-assert-for-inode-i_io_list-in-inode_io_list_move_locked/20=
220503-180501
head:   af0b042e914fbaf7a7ac9d463c91b8566461c39f
commit: af0b042e914fbaf7a7ac9d463c91b8566461c39f writeback: Fix inode->i_io=
_list not be protected by inode->i_lock error
date:   9 hours ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20505/202205051122.4JKB3mhj-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/fs-writeback.c:2467 __mark_inode_dirty() error: uninitialized symbol 'wb=
'.

vim +/wb +2467 fs/fs-writeback.c

1efff914afac8a9 Theodore Ts'o         2015-03-17  2323  =

03ba3782e8dcc5b Jens Axboe            2009-09-09  2324  /**
35d14f278e530ec Eric Biggers          2021-01-12  2325   * __mark_inode_dir=
ty -	internal function to mark an inode dirty
0117d4272b1acd1 Mauro Carvalho Chehab 2017-05-12  2326   *
03ba3782e8dcc5b Jens Axboe            2009-09-09  2327   * @inode: inode to=
 mark
35d14f278e530ec Eric Biggers          2021-01-12  2328   * @flags: what kin=
d of dirty, e.g. I_DIRTY_SYNC.  This can be a combination of
35d14f278e530ec Eric Biggers          2021-01-12  2329   *	   multiple I_DI=
RTY_* flags, except that I_DIRTY_TIME can't be combined
35d14f278e530ec Eric Biggers          2021-01-12  2330   *	   with I_DIRTY_=
PAGES.
0117d4272b1acd1 Mauro Carvalho Chehab 2017-05-12  2331   *
35d14f278e530ec Eric Biggers          2021-01-12  2332   * Mark an inode as=
 dirty.  We notify the filesystem, then update the inode's
35d14f278e530ec Eric Biggers          2021-01-12  2333   * dirty flags.  Th=
en, if needed we add the inode to the appropriate dirty list.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2334   *
35d14f278e530ec Eric Biggers          2021-01-12  2335   * Most callers sho=
uld use mark_inode_dirty() or mark_inode_dirty_sync()
35d14f278e530ec Eric Biggers          2021-01-12  2336   * instead of calli=
ng this directly.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2337   *
35d14f278e530ec Eric Biggers          2021-01-12  2338   * CAREFUL!  We onl=
y add the inode to the dirty list if it is hashed or if it
35d14f278e530ec Eric Biggers          2021-01-12  2339   * refers to a bloc=
kdev.  Unhashed inodes will never be added to the dirty list
35d14f278e530ec Eric Biggers          2021-01-12  2340   * even if they are=
 later hashed, as they will have been marked dirty already.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2341   *
35d14f278e530ec Eric Biggers          2021-01-12  2342   * In short, ensure=
 you hash any inodes _before_ you start marking them dirty.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2343   *
03ba3782e8dcc5b Jens Axboe            2009-09-09  2344   * Note that for bl=
ockdevs, inode->dirtied_when represents the dirtying time of
03ba3782e8dcc5b Jens Axboe            2009-09-09  2345   * the block-specia=
l inode (/dev/hda1) itself.  And the ->dirtied_when field of
03ba3782e8dcc5b Jens Axboe            2009-09-09  2346   * the kernel-inter=
nal blockdev inode represents the dirtying time of the
03ba3782e8dcc5b Jens Axboe            2009-09-09  2347   * blockdev's pages=
.  This is why for I_DIRTY_PAGES we always use
03ba3782e8dcc5b Jens Axboe            2009-09-09  2348   * page->mapping->h=
ost, so the page-dirtying time is recorded in the internal
03ba3782e8dcc5b Jens Axboe            2009-09-09  2349   * blockdev inode.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2350   */
03ba3782e8dcc5b Jens Axboe            2009-09-09  2351  void __mark_inode_d=
irty(struct inode *inode, int flags)
03ba3782e8dcc5b Jens Axboe            2009-09-09  2352  {
03ba3782e8dcc5b Jens Axboe            2009-09-09  2353  	struct super_block=
 *sb =3D inode->i_sb;
35d14f278e530ec Eric Biggers          2021-01-12  2354  	int dirtytime =3D =
0;
af0b042e914fbaf Jchao Sun             2022-05-04  2355  	struct bdi_writeba=
ck *wb;
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2356  =

0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2357  	trace_writeback_ma=
rk_inode_dirty(inode, flags);
03ba3782e8dcc5b Jens Axboe            2009-09-09  2358  =

35d14f278e530ec Eric Biggers          2021-01-12  2359  	if (flags & I_DIRT=
Y_INODE) {
03ba3782e8dcc5b Jens Axboe            2009-09-09  2360  		/*
35d14f278e530ec Eric Biggers          2021-01-12  2361  		 * Notify the fil=
esystem about the inode being dirtied, so that
35d14f278e530ec Eric Biggers          2021-01-12  2362  		 * (if needed) it=
 can update on-disk fields and journal the
35d14f278e530ec Eric Biggers          2021-01-12  2363  		 * inode.  This i=
s only needed when the inode itself is being
35d14f278e530ec Eric Biggers          2021-01-12  2364  		 * dirtied now.  =
I.e. it's only needed for I_DIRTY_INODE, not
35d14f278e530ec Eric Biggers          2021-01-12  2365  		 * for just I_DIR=
TY_PAGES or I_DIRTY_TIME.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2366  		 */
9fb0a7da0c528d9 Tejun Heo             2013-01-11  2367  		trace_writeback_d=
irty_inode_start(inode, flags);
03ba3782e8dcc5b Jens Axboe            2009-09-09  2368  		if (sb->s_op->dir=
ty_inode)
a38ed483a72672e Eric Biggers          2021-01-12  2369  			sb->s_op->dirty_=
inode(inode, flags & I_DIRTY_INODE);
9fb0a7da0c528d9 Tejun Heo             2013-01-11  2370  		trace_writeback_d=
irty_inode(inode, flags);
e2728c5621fd9c6 Eric Biggers          2021-01-12  2371  =

35d14f278e530ec Eric Biggers          2021-01-12  2372  		/* I_DIRTY_INODE =
supersedes I_DIRTY_TIME. */
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2373  		flags &=3D ~I_DIR=
TY_TIME;
35d14f278e530ec Eric Biggers          2021-01-12  2374  	} else {
35d14f278e530ec Eric Biggers          2021-01-12  2375  		/*
35d14f278e530ec Eric Biggers          2021-01-12  2376  		 * Else it's eith=
er I_DIRTY_PAGES, I_DIRTY_TIME, or nothing.
35d14f278e530ec Eric Biggers          2021-01-12  2377  		 * (We don't supp=
ort setting both I_DIRTY_PAGES and I_DIRTY_TIME
35d14f278e530ec Eric Biggers          2021-01-12  2378  		 * in one call to=
 __mark_inode_dirty().)
35d14f278e530ec Eric Biggers          2021-01-12  2379  		 */
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2380  		dirtytime =3D fla=
gs & I_DIRTY_TIME;
35d14f278e530ec Eric Biggers          2021-01-12  2381  		WARN_ON_ONCE(dirt=
ytime && flags !=3D I_DIRTY_TIME);
35d14f278e530ec Eric Biggers          2021-01-12  2382  	}
03ba3782e8dcc5b Jens Axboe            2009-09-09  2383  =

03ba3782e8dcc5b Jens Axboe            2009-09-09  2384  	/*
9c6ac78eb3521c5 Tejun Heo             2014-10-24  2385  	 * Paired with smp=
_mb() in __writeback_single_inode() for the
9c6ac78eb3521c5 Tejun Heo             2014-10-24  2386  	 * following lockl=
ess i_state test.  See there for details.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2387  	 */
03ba3782e8dcc5b Jens Axboe            2009-09-09  2388  	smp_mb();
03ba3782e8dcc5b Jens Axboe            2009-09-09  2389  =

0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2390  	if (((inode->i_sta=
te & flags) =3D=3D flags) ||
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2391  	    (dirtytime && =
(inode->i_state & I_DIRTY_INODE)))
03ba3782e8dcc5b Jens Axboe            2009-09-09  2392  		return;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2393  =

250df6ed274d767 Dave Chinner          2011-03-22  2394  	spin_lock(&inode->=
i_lock);
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2395  	if (dirtytime && (=
inode->i_state & I_DIRTY_INODE))
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2396  		goto out_unlock_i=
node;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2397  	if ((inode->i_stat=
e & flags) !=3D flags) {
03ba3782e8dcc5b Jens Axboe            2009-09-09  2398  		const int was_dir=
ty =3D inode->i_state & I_DIRTY;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2399  =

52ebea749aaed19 Tejun Heo             2015-05-22  2400  		inode_attach_wb(i=
node, NULL);
52ebea749aaed19 Tejun Heo             2015-05-22  2401  =

35d14f278e530ec Eric Biggers          2021-01-12  2402  		/* I_DIRTY_INODE =
supersedes I_DIRTY_TIME. */
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2403  		if (flags & I_DIR=
TY_INODE)
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2404  			inode->i_state &=
=3D ~I_DIRTY_TIME;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2405  		inode->i_state |=
=3D flags;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2406  =

af0b042e914fbaf Jchao Sun             2022-05-04  2407  		wb =3D locked_ino=
de_to_wb_and_lock_list(inode);
af0b042e914fbaf Jchao Sun             2022-05-04  2408  		spin_lock(&inode-=
>i_lock);
af0b042e914fbaf Jchao Sun             2022-05-04  2409  =

03ba3782e8dcc5b Jens Axboe            2009-09-09  2410  		/*
5afced3bf28100d Jan Kara              2020-05-29  2411  		 * If the inode i=
s queued for writeback by flush worker, just
5afced3bf28100d Jan Kara              2020-05-29  2412  		 * update its dir=
ty state. Once the flush worker is done with
5afced3bf28100d Jan Kara              2020-05-29  2413  		 * the inode it w=
ill place it on the appropriate superblock
5afced3bf28100d Jan Kara              2020-05-29  2414  		 * list, based up=
on its state.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2415  		 */
5afced3bf28100d Jan Kara              2020-05-29  2416  		if (inode->i_stat=
e & I_SYNC_QUEUED)
af0b042e914fbaf Jchao Sun             2022-05-04  2417  			goto out_unlock;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2418  =

03ba3782e8dcc5b Jens Axboe            2009-09-09  2419  		/*
03ba3782e8dcc5b Jens Axboe            2009-09-09  2420  		 * Only add valid=
 (hashed) inodes to the superblock's
03ba3782e8dcc5b Jens Axboe            2009-09-09  2421  		 * dirty list.  A=
dd blockdev inodes as well.
03ba3782e8dcc5b Jens Axboe            2009-09-09  2422  		 */
03ba3782e8dcc5b Jens Axboe            2009-09-09  2423  		if (!S_ISBLK(inod=
e->i_mode)) {
1d3382cbf02986e Al Viro               2010-10-23  2424  			if (inode_unhash=
ed(inode))
af0b042e914fbaf Jchao Sun             2022-05-04  2425  				goto out_unlock;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2426  		}
a4ffdde6e56fdf8 Al Viro               2010-06-02  2427  		if (inode->i_stat=
e & I_FREEING)
af0b042e914fbaf Jchao Sun             2022-05-04  2428  			goto out_unlock;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2429  =

03ba3782e8dcc5b Jens Axboe            2009-09-09  2430  		/*
03ba3782e8dcc5b Jens Axboe            2009-09-09  2431  		 * If the inode w=
as already on b_dirty/b_io/b_more_io, don't
03ba3782e8dcc5b Jens Axboe            2009-09-09  2432  		 * reposition it =
(that would break b_dirty time-ordering).
03ba3782e8dcc5b Jens Axboe            2009-09-09  2433  		 */
03ba3782e8dcc5b Jens Axboe            2009-09-09  2434  		if (!was_dirty) {
d6c10f1fc8626dc Tejun Heo             2015-05-22  2435  			struct list_head=
 *dirty_list;
a66979abad090b2 Dave Chinner          2011-03-22  2436  			bool wakeup_bdi =
=3D false;
500b067c5e6ceea Jens Axboe            2009-09-09  2437  =

03ba3782e8dcc5b Jens Axboe            2009-09-09  2438  			inode->dirtied_w=
hen =3D jiffies;
a2f4870697a5bcf Theodore Ts'o         2015-03-17  2439  			if (dirtytime)
a2f4870697a5bcf Theodore Ts'o         2015-03-17  2440  				inode->dirtied_=
time_when =3D jiffies;
d6c10f1fc8626dc Tejun Heo             2015-05-22  2441  =

0e11f6443f522f8 Christoph Hellwig     2018-02-21  2442  			if (inode->i_sta=
te & I_DIRTY)
0747259d13febfc Tejun Heo             2015-05-22  2443  				dirty_list =3D =
&wb->b_dirty;
a2f4870697a5bcf Theodore Ts'o         2015-03-17  2444  			else
0747259d13febfc Tejun Heo             2015-05-22  2445  				dirty_list =3D =
&wb->b_dirty_time;
d6c10f1fc8626dc Tejun Heo             2015-05-22  2446  =

c7f5408493aeb01 Dave Chinner          2015-03-04  2447  			wakeup_bdi =3D i=
node_io_list_move_locked(inode, wb,
d6c10f1fc8626dc Tejun Heo             2015-05-22  2448  							       dirty=
_list);
d6c10f1fc8626dc Tejun Heo             2015-05-22  2449  =

0747259d13febfc Tejun Heo             2015-05-22  2450  			spin_unlock(&wb-=
>list_lock);
af0b042e914fbaf Jchao Sun             2022-05-04  2451  			spin_unlock(&ino=
de->i_lock);
0ae45f63d4ef8d8 Theodore Ts'o         2015-02-02  2452  			trace_writeback_=
dirty_inode_enqueue(inode);
a66979abad090b2 Dave Chinner          2011-03-22  2453  =

d6c10f1fc8626dc Tejun Heo             2015-05-22  2454  			/*
d6c10f1fc8626dc Tejun Heo             2015-05-22  2455  			 * If this is th=
e first dirty inode for this bdi,
d6c10f1fc8626dc Tejun Heo             2015-05-22  2456  			 * we have to wa=
ke-up the corresponding bdi thread
d6c10f1fc8626dc Tejun Heo             2015-05-22  2457  			 * to make sure =
background write-back happens
d6c10f1fc8626dc Tejun Heo             2015-05-22  2458  			 * later.
d6c10f1fc8626dc Tejun Heo             2015-05-22  2459  			 */
f56753ac2a90810 Christoph Hellwig     2020-09-24  2460  			if (wakeup_bdi &&
f56753ac2a90810 Christoph Hellwig     2020-09-24  2461  			    (wb->bdi->ca=
pabilities & BDI_CAP_WRITEBACK))
0747259d13febfc Tejun Heo             2015-05-22  2462  				wb_wakeup_delay=
ed(wb);
a66979abad090b2 Dave Chinner          2011-03-22  2463  			return;
03ba3782e8dcc5b Jens Axboe            2009-09-09  2464  		}
03ba3782e8dcc5b Jens Axboe            2009-09-09  2465  	}
af0b042e914fbaf Jchao Sun             2022-05-04  2466  out_unlock:
af0b042e914fbaf Jchao Sun             2022-05-04 @2467  	spin_unlock(&wb->l=
ist_lock);
250df6ed274d767 Dave Chinner          2011-03-22  2468  out_unlock_inode:
250df6ed274d767 Dave Chinner          2011-03-22  2469  	spin_unlock(&inode=
->i_lock);
03ba3782e8dcc5b Jens Axboe            2009-09-09  2470  }
03ba3782e8dcc5b Jens Axboe            2009-09-09  2471  EXPORT_SYMBOL(__mar=
k_inode_dirty);
03ba3782e8dcc5b Jens Axboe            2009-09-09  2472  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6171753215549668822==--

