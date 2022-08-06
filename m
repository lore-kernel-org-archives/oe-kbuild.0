Content-Type: multipart/mixed; boundary="===============2883155059776578417=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm.c:1638:27: warning: use of uninitialized value '*(int *)((char *)&ci + offsetof(struct clone_info, is_abnormal_io))' [CWE-457]
Date: Sat, 06 Aug 2022 21:27:56 +0800
Message-ID: <202208062129.vyBN7Cvo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2883155059776578417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
d/dm.c:1638:27: warning: use of uninitialized value '*(int *)((char *)&ci +=
 offsetof(struct clone_info, is_abnormal_io))' [CWE-457] [-Wanalyzer-use-of=
-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 4edadf6dcb54d2a86eeb424f27122dc0076d9267 dm: improve abnormal bio p=
rocessing
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20220801 (https://download.01.org/0day-ci/archi=
ve/20220806/202208062129.vyBN7Cvo-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4edadf6dcb54d2a86eeb424f27122dc0076d9267
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4edadf6dcb54d2a86eeb424f27122dc0076d9267
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
                     | 1455 |         while ((ti =3D dm_table_get_target(ci=
->map, target_nr++))) {
                     |      |                ~
                     |      |                |
                     |      |                (12) following 'true' branch (=
when 'ti' is non-NULL)...
                     | 1456 |                 int bios;
                     |      |                 ~~~
                     |      |                 |
                     |      |                 (13) ...to here
                     |......
                     | 1459 |                 bios =3D __send_duplicate_bio=
s(ci, ti, ti->num_flush_bios, NULL);
                     |      |                        ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                        |
                     |      |                        (14) calling '__send_d=
uplicate_bios' from '__send_empty_flush'
                     |
                     +--> '__send_duplicate_bios': events 15-22
                            |
                            | 1406 | static int __send_duplicate_bios(struc=
t clone_info *ci, struct dm_target *ti,
                            |      |            ^~~~~~~~~~~~~~~~~~~~~
                            |      |            |
                            |      |            (15) entry to '__send_dupli=
cate_bios'
                            |......
                            | 1409 |         struct bio_list blist =3D BIO_=
EMPTY_LIST;
                            |      |                         ~~~~~
                            |      |                         |
                            |      |                         (16) 'blist.he=
ad' is NULL
                            |      |                         (17) 'blist.ta=
il' is NULL
                            |......
                            | 1413 |         switch (num_bios) {
                            |      |         ~~~~~~
                            |      |         |
                            |      |         (18) following 'case 1:' branc=
h...
                            |......
                            | 1416 |         case 1:
                            |      |         ~~~~
                            |      |         |
                            |      |         (19) ...to here
                            | 1417 |                 if (len)
                            |      |                    ~
                            |      |                    |
                            |      |                    (20) following 'fal=
se' branch (when 'len' is NULL)...
                            | 1418 |                         setup_split_ac=
counting(ci, *len);
                            | 1419 |                 clone =3D alloc_tio(ci=
, ti, 0, len, GFP_NOIO);
                            |      |                 ~~~~~   ~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                            |      |                 |       |
                            |      |                 |       (22) calling '=
alloc_tio' from '__send_duplicate_bios'
                            |      |                 (21) ...to here
                            |
                            +--> 'alloc_tio': events 23-26
                                   |
                                   |  615 | static struct bio *alloc_tio(st=
ruct clone_info *ci, struct dm_target *ti,
                                   |      |                    ^~~~~~~~~
                                   |      |                    |
                                   |      |                    (23) entry t=
o 'alloc_tio'
                                   |......
                                   |  621 |         if (!ci->io->tio.io) {
                                   |      |            ~        =

                                   |      |            |
                                   |      |            (24) following 'fals=
e' branch...
                                   |......
                                   |  627 |                 clone =3D bio_a=
lloc_clone(ci->bio->bi_bdev, ci->bio,
                                   |      |                 ~~~~~
                                   |      |                 |
                                   |      |                 (25) ...to here
                                   |  628 |                                =
         gfp_mask, &ci->io->md->bs);
                                   |  629 |                 if (!clone)
                                   |      |                    ~
                                   |      |                    |
                                   |      |                    (26) followi=
ng 'true' branch (when 'clone' is NULL)...
                                   |
                                 'alloc_tio': event 27
                                   |
                                   |cc1:
                                   | (27): ...to here
                                   |
                            <------+
                            |
                          '__send_duplicate_bios': events 28-29
                            |
                            | 1419 |                 clone =3D alloc_tio(ci=
, ti, 0, len, GFP_NOIO);
                            |      |                         ^~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
                            |      |                         |
                            |      |                         (28) return of=
 NULL to '__send_duplicate_bios' from 'alloc_tio'
                            | 1420 |                 __map_bio(clone);
                            |      |                 ~~~~~~~~~~~~~~~~
                            |      |                 |
                            |      |                 (29) calling '__map_bi=
o' from '__send_duplicate_bios'
                            |
                            +--> '__map_bio': events 30-31
                                   |
                                   | 1290 | static void __map_bio(struct bi=
o *clone)
                                   |      |             ^~~~~~~~~
                                   |      |             |
                                   |      |             (30) entry to '__ma=
p_bio'
                                   |......
                                   | 1293 |         struct dm_target *ti =
=3D tio->ti;
                                   |      |                           ~~
                                   |      |                           |
                                   |      |                           (31) =
dereference of NULL 'clone'
                                   |
   drivers/md/dm.c: In function 'dm_split_and_process_bio':
>> drivers/md/dm.c:1638:27: warning: use of uninitialized value '*(int *)((=
char *)&ci + offsetof(struct clone_info, is_abnormal_io))' [CWE-457] [-Wana=
lyzer-use-of-uninitialized-value]
    1638 |         struct clone_info ci;
         |                           ^~
     'dm_submit_bio': events 1-2
       |
       | 1692 | static void dm_submit_bio(struct bio *bio)
       |      |             ^~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'dm_submit_bio'
       |......
       | 1701 |         if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md=
->flags)) ||
       |      |            ~ =

       |      |            |
       |      |            (2) following 'false' branch...
       |
     'dm_submit_bio': event 3
       |
       |include/linux/compiler.h:78:42:
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                          ^~~~~
       |      |                                          |
       |      |                                          (3) ...to here
   drivers/md/dm.c:1702:13: note: in expansion of macro 'unlikely'
       | 1702 |             unlikely(!map)) {
       |      |             ^~~~~~~~
       |
     'dm_submit_bio': events 4-6
       |
       | 1701 |         if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md=
->flags)) ||
       |......
       | 1712 |         dm_split_and_process_bio(md, map, bio);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~             =
           =

       |      |         |
       |      |         (5) ...to here
       |      |         (6) calling 'dm_split_and_process_bio' from 'dm_sub=
mit_bio'
       |
       +--> 'dm_split_and_process_bio': events 7-9
              |
              | 1635 | static void dm_split_and_process_bio(struct mapped_d=
evice *md,
              |      |             ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'dm_split_and_process_bio'
              |......
              | 1638 |         struct clone_info ci;
              |      |                           ~~
              |      |                           |
              |      |                           (8) region created on stac=
k here
              |      |                           (9) use of uninitialized v=
alue '*(int *)((char *)&ci + offsetof(struct clone_info, is_abnormal_io))' =
here
              |
   drivers/md/dm.c: In function 'dm_submit_bio':
   drivers/md/dm.c:1695:13: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1695 |         int srcu_idx;
         |             ^~~~~~~~
     'dm_submit_bio': event 1
       |
       | 1695 |         int srcu_idx;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/md/dm.c: In function 'dm_pr_reserve':
   drivers/md/dm.c:3117:16: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3117 |         int r, srcu_idx;
         |                ^~~~~~~~
     'dm_pr_reserve': event 1
       |
       | 3117 |         int r, srcu_idx;
       |      |                ^~~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/md/dm.c: In function 'dm_pr_release':
   drivers/md/dm.c:3137:16: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3137 |         int r, srcu_idx;
         |                ^~~~~~~~
     'dm_pr_release': event 1
       |
       | 3137 |         int r, srcu_idx;
       |      |                ^~~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/md/dm.c: In function 'dm_pr_preempt':
   drivers/md/dm.c:3158:16: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3158 |         int r, srcu_idx;
         |                ^~~~~~~~
     'dm_pr_preempt': event 1
       |
       | 3158 |         int r, srcu_idx;
       |      |                ^~~~~~~~
       |      |                |
       |      |                (1) use of uninitialized value '<unknown>' h=
ere
       |
   drivers/md/dm.c: In function 'dm_pr_clear':
   drivers/md/dm.c:3178:16: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    3178 |         int r, srcu_idx;
         |                ^~~~~~~~
     'dm_pr_clear': event 1
       |
       | 3178 |         int r, srcu_idx;
       |      |                ^~~~~~~~

vim +1638 drivers/md/dm.c

978e51ba38e00e Mike Snitzer      2017-12-09  1631  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  1632  /*
14fe594d679c9b Alasdair G Kergon 2013-03-01  1633   * Entry point to split =
a bio into clones and submit them to the targets.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1634   */
96c9865cb6dd06 Mike Snitzer      2022-02-17  1635  static void dm_split_and=
_process_bio(struct mapped_device *md,
83d5e5b0af907d Mikulas Patocka   2013-07-10  1636  				     struct dm_table=
 *map, struct bio *bio)
0ce65797a77ee7 Mike Snitzer      2015-02-26  1637  {
^1da177e4c3f41 Linus Torvalds    2005-04-16 @1638  	struct clone_info ci;
4857abf66434d9 Mike Snitzer      2022-03-25  1639  	struct dm_io *io;
84b98f4ce4d1d1 Mike Snitzer      2022-03-17  1640  	blk_status_t error =3D =
BLK_STS_OK;
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1641  	bool is_abnormal;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1642  =

4edadf6dcb54d2 Mike Snitzer      2022-04-17  1643  	is_abnormal =3D is_abno=
rmal_io(bio);
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1644  	if (unlikely(is_abnorma=
l)) {
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1645  		/*
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1646  		 * Use blk_queue_split=
() for abnormal IO (e.g. discard, etc)
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1647  		 * otherwise associate=
d queue_limits won't be imposed.
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1648  		 */
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1649  		blk_queue_split(&bio);
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1650  	}
4edadf6dcb54d2 Mike Snitzer      2022-04-17  1651  =

4edadf6dcb54d2 Mike Snitzer      2022-04-17  1652  	init_clone_info(&ci, md=
, map, bio, is_abnormal);
4857abf66434d9 Mike Snitzer      2022-03-25  1653  	io =3D ci.io;
0ce65797a77ee7 Mike Snitzer      2015-02-26  1654  =

1eff9d322a4442 Jens Axboe        2016-08-05  1655  	if (bio->bi_opf & REQ_P=
REFLUSH) {
332f2b1e7360dc Mike Snitzer      2022-03-10  1656  		__send_empty_flush(&ci=
);
e27363472f9bc9 Mike Snitzer      2022-03-09  1657  		/* dm_io_complete subm=
its any data associated with flush */
d41e077ab6ea3c Mike Snitzer      2022-02-17  1658  		goto out;
d41e077ab6ea3c Mike Snitzer      2022-02-17  1659  	}
a1e1cb72d96491 Mike Snitzer      2019-01-17  1660  =

96c9865cb6dd06 Mike Snitzer      2022-02-17  1661  	error =3D __split_and_p=
rocess_bio(&ci);
d41e077ab6ea3c Mike Snitzer      2022-02-17  1662  	if (error || !ci.sector=
_count)
d41e077ab6ea3c Mike Snitzer      2022-02-17  1663  		goto out;
18a25da84354c6 NeilBrown         2017-09-06  1664  	/*
d41e077ab6ea3c Mike Snitzer      2022-02-17  1665  	 * Remainder must be pa=
ssed to submit_bio_noacct() so it gets handled
d41e077ab6ea3c Mike Snitzer      2022-02-17  1666  	 * *after* bios already=
 submitted have been completely processed.
18a25da84354c6 NeilBrown         2017-09-06  1667  	 */
7dd76d1feec70a Ming Lei          2022-04-12  1668  	bio_trim(bio, io->secto=
rs, ci.sector_count);
7dd76d1feec70a Ming Lei          2022-04-12  1669  	trace_block_split(bio, =
bio->bi_iter.bi_sector);
7dd76d1feec70a Ming Lei          2022-04-12  1670  	bio_inc_remaining(bio);
3e08773c3841e9 Christoph Hellwig 2021-10-12  1671  	submit_bio_noacct(bio);
d41e077ab6ea3c Mike Snitzer      2022-02-17  1672  out:
b99fdcdc36369d Ming Lei          2022-03-04  1673  	/*
b99fdcdc36369d Ming Lei          2022-03-04  1674  	 * Drop the extra refer=
ence count for non-POLLED bio, and hold one
b99fdcdc36369d Ming Lei          2022-03-04  1675  	 * reference for POLLED=
 bio, which will be released in dm_poll_bio
b99fdcdc36369d Ming Lei          2022-03-04  1676  	 *
ec211631ae24b1 Ming Lei          2022-04-12  1677  	 * Add every dm_io inst=
ance into the dm_io list head which is stored
ec211631ae24b1 Ming Lei          2022-04-12  1678  	 * in bio->bi_private, =
so that dm_poll_bio can poll them all.
b99fdcdc36369d Ming Lei          2022-03-04  1679  	 */
0f14d60a023cc4 Ming Lei          2022-04-12  1680  	if (error || !ci.submit=
_as_polled) {
0f14d60a023cc4 Ming Lei          2022-04-12  1681  		/*
0f14d60a023cc4 Ming Lei          2022-04-12  1682  		 * In case of submissi=
on failure, the extra reference for
0f14d60a023cc4 Ming Lei          2022-04-12  1683  		 * submitting io isn't=
 consumed yet
0f14d60a023cc4 Ming Lei          2022-04-12  1684  		 */
0f14d60a023cc4 Ming Lei          2022-04-12  1685  		if (error)
0f14d60a023cc4 Ming Lei          2022-04-12  1686  			atomic_dec(&io->io_co=
unt);
0f14d60a023cc4 Ming Lei          2022-04-12  1687  		dm_io_dec_pending(io, =
error);
0f14d60a023cc4 Ming Lei          2022-04-12  1688  	} else
4857abf66434d9 Mike Snitzer      2022-03-25  1689  		dm_queue_poll_io(bio, =
io);
0ce65797a77ee7 Mike Snitzer      2015-02-26  1690  }
0ce65797a77ee7 Mike Snitzer      2015-02-26  1691  =


:::::: The code at line 1638 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2883155059776578417==--

