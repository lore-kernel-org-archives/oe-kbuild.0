Content-Type: multipart/mixed; boundary="===============0989824079625031888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm.c:1695:21: warning: Uninitialized variables: io.magic, io.flags, io.io_count, io.md, io.orig_bio, io.status, io.lock, io.start_time, io.data, io.node, io.map_task, io.stats_aux, io.tio [uninitvar]
Date: Mon, 04 Apr 2022 00:20:26 +0800
Message-ID: <202204040035.yUkgOaoH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0989824079625031888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: 4d7bca13dd9a5033174b0735056c5658cb893e76 dm: consolidate spinlocks =
in dm_io struct
date:   13 days ago
:::::: branch date: 20 hours ago
:::::: commit date: 13 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   drivers/md/dm.c:1026:25: warning: Local variable 'md' shadows outer vari=
able [shadowVariable]
     struct mapped_device *md =3D io->md;
                           ^
   drivers/md/dm.c:981:24: note: Shadowed declaration
    struct mapped_device *md =3D tio->io->md;
                          ^
   drivers/md/dm.c:1026:25: note: Shadow variable
     struct mapped_device *md =3D io->md;
                           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/md/dm.c:1398:2: warning: Address of local auto-variable assigned=
 to a function parameter. [autoVariables]
    ci->bio =3D &flush_bio;
    ^
>> drivers/md/dm.c:1695:21: warning: Uninitialized variables: io.magic, io.=
flags, io.io_count, io.md, io.orig_bio, io.status, io.lock, io.start_time, =
io.data, io.node, io.map_task, io.stats_aux, io.tio [uninitvar]
     if (dm_poll_dm_io(io, iob, flags)) {
                       ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1676:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1695:21: note: Uninitialized variables: io.magic, io.fla=
gs, io.io_count, io.md, io.orig_bio, io.status, io.lock, io.start_time, io.=
data, io.node, io.map_task, io.stats_aux, io.tio
     if (dm_poll_dm_io(io, iob, flags)) {
                       ^

vim +1695 drivers/md/dm.c

b99fdcdc36369d Ming Lei 2022-03-04  1666  =

b99fdcdc36369d Ming Lei 2022-03-04  1667  static int dm_poll_bio(struct bio=
 *bio, struct io_comp_batch *iob,
b99fdcdc36369d Ming Lei 2022-03-04  1668  		       unsigned int flags)
b99fdcdc36369d Ming Lei 2022-03-04  1669  {
b99fdcdc36369d Ming Lei 2022-03-04  1670  	struct hlist_head *head =3D dm_g=
et_bio_hlist_head(bio);
b99fdcdc36369d Ming Lei 2022-03-04  1671  	struct hlist_head tmp =3D HLIST_=
HEAD_INIT;
b99fdcdc36369d Ming Lei 2022-03-04  1672  	struct hlist_node *next;
b99fdcdc36369d Ming Lei 2022-03-04  1673  	struct dm_io *io;
b99fdcdc36369d Ming Lei 2022-03-04  1674  =

b99fdcdc36369d Ming Lei 2022-03-04  1675  	/* Only poll normal bio which wa=
s marked as REQ_DM_POLL_LIST */
b99fdcdc36369d Ming Lei 2022-03-04  1676  	if (!(bio->bi_opf & REQ_DM_POLL_=
LIST))
b99fdcdc36369d Ming Lei 2022-03-04  1677  		return 0;
b99fdcdc36369d Ming Lei 2022-03-04  1678  =

b99fdcdc36369d Ming Lei 2022-03-04  1679  	WARN_ON_ONCE(hlist_empty(head));
b99fdcdc36369d Ming Lei 2022-03-04  1680  =

b99fdcdc36369d Ming Lei 2022-03-04  1681  	hlist_move_list(head, &tmp);
b99fdcdc36369d Ming Lei 2022-03-04  1682  =

b99fdcdc36369d Ming Lei 2022-03-04  1683  	/*
b99fdcdc36369d Ming Lei 2022-03-04  1684  	 * Restore .bi_private before po=
ssibly completing dm_io.
b99fdcdc36369d Ming Lei 2022-03-04  1685  	 *
b99fdcdc36369d Ming Lei 2022-03-04  1686  	 * bio_poll() is only possible o=
nce @bio has been completely
b99fdcdc36369d Ming Lei 2022-03-04  1687  	 * submitted via submit_bio_noac=
ct()'s depth-first submission.
b99fdcdc36369d Ming Lei 2022-03-04  1688  	 * So there is no dm_queue_poll_=
io() race associated with
b99fdcdc36369d Ming Lei 2022-03-04  1689  	 * clearing REQ_DM_POLL_LIST her=
e.
b99fdcdc36369d Ming Lei 2022-03-04  1690  	 */
b99fdcdc36369d Ming Lei 2022-03-04  1691  	bio->bi_opf &=3D ~REQ_DM_POLL_LI=
ST;
b99fdcdc36369d Ming Lei 2022-03-04  1692  	bio->bi_private =3D hlist_entry(=
tmp.first, struct dm_io, node)->data;
b99fdcdc36369d Ming Lei 2022-03-04  1693  =

b99fdcdc36369d Ming Lei 2022-03-04  1694  	hlist_for_each_entry_safe(io, ne=
xt, &tmp, node) {
b99fdcdc36369d Ming Lei 2022-03-04 @1695  		if (dm_poll_dm_io(io, iob, flag=
s)) {
b99fdcdc36369d Ming Lei 2022-03-04  1696  			hlist_del_init(&io->node);
b99fdcdc36369d Ming Lei 2022-03-04  1697  			/*
b99fdcdc36369d Ming Lei 2022-03-04  1698  			 * clone_endio() has already o=
ccurred, so passing
b99fdcdc36369d Ming Lei 2022-03-04  1699  			 * error as 0 here doesn't ove=
rride io->status
b99fdcdc36369d Ming Lei 2022-03-04  1700  			 */
b99fdcdc36369d Ming Lei 2022-03-04  1701  			dm_io_dec_pending(io, 0);
b99fdcdc36369d Ming Lei 2022-03-04  1702  		}
b99fdcdc36369d Ming Lei 2022-03-04  1703  	}
b99fdcdc36369d Ming Lei 2022-03-04  1704  =

b99fdcdc36369d Ming Lei 2022-03-04  1705  	/* Not done? */
b99fdcdc36369d Ming Lei 2022-03-04  1706  	if (!hlist_empty(&tmp)) {
b99fdcdc36369d Ming Lei 2022-03-04  1707  		bio->bi_opf |=3D REQ_DM_POLL_LI=
ST;
b99fdcdc36369d Ming Lei 2022-03-04  1708  		/* Reset bio->bi_private to dm_=
io list head */
b99fdcdc36369d Ming Lei 2022-03-04  1709  		hlist_move_list(&tmp, head);
b99fdcdc36369d Ming Lei 2022-03-04  1710  		return 0;
b99fdcdc36369d Ming Lei 2022-03-04  1711  	}
b99fdcdc36369d Ming Lei 2022-03-04  1712  	return 1;
b99fdcdc36369d Ming Lei 2022-03-04  1713  }
b99fdcdc36369d Ming Lei 2022-03-04  1714  =


:::::: The code at line 1695 was first introduced by commit
:::::: b99fdcdc36369d2a3a26bf44736d420eb629d8b7 dm: support bio polling

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0989824079625031888==--

