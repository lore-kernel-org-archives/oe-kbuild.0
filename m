Content-Type: multipart/mixed; boundary="===============8011732818312199837=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 951/1176] drivers/md/dm.c:1685:21: warning: Uninitialized variables: io.magic, io.lock, io.start_time, io.data, io.node, io.map_task, io.stats_aux, io.flags, io.status, io.io_count, io.md, io.orig_bio, io.tio [uninitvar]
Date: Tue, 05 Apr 2022 10:05:54 +0800
Message-ID: <202204051036.uwchgLt6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8011732818312199837==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   696206280c5e5c028caf9fd259999cb72b1f6127
commit: e1c4ab4fd11b5a5c5c59216be5ada04f1fdc87e4 [951/1176] dm: move hot dm=
_io members to same cacheline as dm_target_io
:::::: branch date: 23 hours ago
:::::: commit date: 3 days ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/md/dm.c:1384:2: warning: Address of local auto-variable assigned=
 to a function parameter. [autoVariables]
    ci->bio =3D &flush_bio;
    ^
>> drivers/md/dm.c:1685:21: warning: Uninitialized variables: io.magic, io.=
lock, io.start_time, io.data, io.node, io.map_task, io.stats_aux, io.flags,=
 io.status, io.io_count, io.md, io.orig_bio, io.tio [uninitvar]
     if (dm_poll_dm_io(io, iob, flags)) {
                       ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1666:6: note: Assuming condition is false
    if (!(bio->bi_opf & REQ_DM_POLL_LIST))
        ^
   drivers/md/dm.c:1685:21: note: Uninitialized variables: io.magic, io.loc=
k, io.start_time, io.data, io.node, io.map_task, io.stats_aux, io.flags, io=
.status, io.io_count, io.md, io.orig_bio, io.tio
     if (dm_poll_dm_io(io, iob, flags)) {
                       ^

vim +1685 drivers/md/dm.c

b99fdcdc36369d Ming Lei 2022-03-04  1656  =

b99fdcdc36369d Ming Lei 2022-03-04  1657  static int dm_poll_bio(struct bio=
 *bio, struct io_comp_batch *iob,
b99fdcdc36369d Ming Lei 2022-03-04  1658  		       unsigned int flags)
b99fdcdc36369d Ming Lei 2022-03-04  1659  {
b99fdcdc36369d Ming Lei 2022-03-04  1660  	struct hlist_head *head =3D dm_g=
et_bio_hlist_head(bio);
b99fdcdc36369d Ming Lei 2022-03-04  1661  	struct hlist_head tmp =3D HLIST_=
HEAD_INIT;
b99fdcdc36369d Ming Lei 2022-03-04  1662  	struct hlist_node *next;
b99fdcdc36369d Ming Lei 2022-03-04  1663  	struct dm_io *io;
b99fdcdc36369d Ming Lei 2022-03-04  1664  =

b99fdcdc36369d Ming Lei 2022-03-04  1665  	/* Only poll normal bio which wa=
s marked as REQ_DM_POLL_LIST */
b99fdcdc36369d Ming Lei 2022-03-04  1666  	if (!(bio->bi_opf & REQ_DM_POLL_=
LIST))
b99fdcdc36369d Ming Lei 2022-03-04  1667  		return 0;
b99fdcdc36369d Ming Lei 2022-03-04  1668  =

b99fdcdc36369d Ming Lei 2022-03-04  1669  	WARN_ON_ONCE(hlist_empty(head));
b99fdcdc36369d Ming Lei 2022-03-04  1670  =

b99fdcdc36369d Ming Lei 2022-03-04  1671  	hlist_move_list(head, &tmp);
b99fdcdc36369d Ming Lei 2022-03-04  1672  =

b99fdcdc36369d Ming Lei 2022-03-04  1673  	/*
b99fdcdc36369d Ming Lei 2022-03-04  1674  	 * Restore .bi_private before po=
ssibly completing dm_io.
b99fdcdc36369d Ming Lei 2022-03-04  1675  	 *
b99fdcdc36369d Ming Lei 2022-03-04  1676  	 * bio_poll() is only possible o=
nce @bio has been completely
b99fdcdc36369d Ming Lei 2022-03-04  1677  	 * submitted via submit_bio_noac=
ct()'s depth-first submission.
b99fdcdc36369d Ming Lei 2022-03-04  1678  	 * So there is no dm_queue_poll_=
io() race associated with
b99fdcdc36369d Ming Lei 2022-03-04  1679  	 * clearing REQ_DM_POLL_LIST her=
e.
b99fdcdc36369d Ming Lei 2022-03-04  1680  	 */
b99fdcdc36369d Ming Lei 2022-03-04  1681  	bio->bi_opf &=3D ~REQ_DM_POLL_LI=
ST;
b99fdcdc36369d Ming Lei 2022-03-04  1682  	bio->bi_private =3D hlist_entry(=
tmp.first, struct dm_io, node)->data;
b99fdcdc36369d Ming Lei 2022-03-04  1683  =

b99fdcdc36369d Ming Lei 2022-03-04  1684  	hlist_for_each_entry_safe(io, ne=
xt, &tmp, node) {
b99fdcdc36369d Ming Lei 2022-03-04 @1685  		if (dm_poll_dm_io(io, iob, flag=
s)) {
b99fdcdc36369d Ming Lei 2022-03-04  1686  			hlist_del_init(&io->node);
b99fdcdc36369d Ming Lei 2022-03-04  1687  			/*
b99fdcdc36369d Ming Lei 2022-03-04  1688  			 * clone_endio() has already o=
ccurred, so passing
b99fdcdc36369d Ming Lei 2022-03-04  1689  			 * error as 0 here doesn't ove=
rride io->status
b99fdcdc36369d Ming Lei 2022-03-04  1690  			 */
b99fdcdc36369d Ming Lei 2022-03-04  1691  			dm_io_dec_pending(io, 0);
b99fdcdc36369d Ming Lei 2022-03-04  1692  		}
b99fdcdc36369d Ming Lei 2022-03-04  1693  	}
b99fdcdc36369d Ming Lei 2022-03-04  1694  =

b99fdcdc36369d Ming Lei 2022-03-04  1695  	/* Not done? */
b99fdcdc36369d Ming Lei 2022-03-04  1696  	if (!hlist_empty(&tmp)) {
b99fdcdc36369d Ming Lei 2022-03-04  1697  		bio->bi_opf |=3D REQ_DM_POLL_LI=
ST;
b99fdcdc36369d Ming Lei 2022-03-04  1698  		/* Reset bio->bi_private to dm_=
io list head */
b99fdcdc36369d Ming Lei 2022-03-04  1699  		hlist_move_list(&tmp, head);
b99fdcdc36369d Ming Lei 2022-03-04  1700  		return 0;
b99fdcdc36369d Ming Lei 2022-03-04  1701  	}
b99fdcdc36369d Ming Lei 2022-03-04  1702  	return 1;
b99fdcdc36369d Ming Lei 2022-03-04  1703  }
b99fdcdc36369d Ming Lei 2022-03-04  1704  =


:::::: The code at line 1685 was first introduced by commit
:::::: b99fdcdc36369d2a3a26bf44736d420eb629d8b7 dm: support bio polling

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Mike Snitzer <snitzer@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8011732818312199837==--

