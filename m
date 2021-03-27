Content-Type: multipart/mixed; boundary="===============8461878042557219959=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/gfs2/rgrp.c:1772:53: warning: Possible null pointer dereference: minext [nullPointer]
Date: Sat, 27 Mar 2021 17:11:38 +0800
Message-ID: <202103271717.jIWEavJe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8461878042557219959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0f4498cef9f5cd18d7c6639a2a902ec1edc5be4e
commit: f38e998fbbb5da6a097ecd4b2700ba95eabab0c9 gfs2: Also reflect single-=
block allocations in rgd->rd_extfail_pt
date:   5 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 weeks ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/gfs2/rgrp.c:1772:53: warning: Possible null pointer dereference: mine=
xt [nullPointer]
     ret =3D gfs2_reservation_check_and_update(rbm, ip, *minext,
                                                       ^
   fs/gfs2/rgrp.c:1846:52: note: Calling function 'gfs2_rbm_find', 3rd argu=
ment 'NULL' value is 0
     error =3D gfs2_rbm_find(&rbm, GFS2_BLKST_UNLINKED, NULL, NULL,
                                                      ^
   fs/gfs2/rgrp.c:1772:53: note: Null pointer dereference
     ret =3D gfs2_reservation_check_and_update(rbm, ip, *minext,
                                                       ^

vim +1772 fs/gfs2/rgrp.c

5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1711  =

5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1712  /**
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1713   * gfs2_rbm_find - Loo=
k for blocks of a particular state
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1714   * @rbm: Value/result =
starting position and final position
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1715   * @state: The state w=
hich we want to find
f38e998fbbb5da Andreas Gruenbacher 2020-10-05  1716   * @minext: Pointer to=
 the requested extent length
5ce13431dd3365 Bob Peterson        2013-11-06  1717   *          This is up=
dated to be the actual reservation size.
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1718   * @ip: If set, check =
for reservations
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1719   * @nowrap: Stop looki=
ng at the end of the rgrp, rather than wrapping
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1720   *          around unt=
il we've reached the starting point.
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1721   *
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1722   * Side effects:
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1723   * - If looking for fr=
ee blocks, we set GBF_FULL on each bitmap which
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1724   *   has no free block=
s in it.
5ea5050cec9c02 Bob Peterson        2013-11-25  1725   * - If looking for fr=
ee blocks, we set rd_extfail_pt on each rgrp which
5ea5050cec9c02 Bob Peterson        2013-11-25  1726   *   has come up short=
 on a free block search.
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1727   *
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1728   * Returns: 0 on succe=
ss, -ENOSPC if there is no block of the requested state
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1729   */
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1730  =

5ce13431dd3365 Bob Peterson        2013-11-06  1731  static int gfs2_rbm_fi=
nd(struct gfs2_rbm *rbm, u8 state, u32 *minext,
8381e602275586 Bob Peterson        2016-05-02  1732  			 const struct gfs2_=
inode *ip, bool nowrap)
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1733  {
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1734  	bool scan_from_start =
=3D rbm->bii =3D=3D 0 && rbm->offset =3D=3D 0;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1735  	struct buffer_head *b=
h;
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1736  	int last_bii;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1737  	u32 offset;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1738  	u8 *buffer;
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1739  	bool wrapped =3D fals=
e;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1740  	int ret;
e579ed4f446e64 Bob Peterson        2013-09-17  1741  	struct gfs2_bitmap *b=
i;
5ce13431dd3365 Bob Peterson        2013-11-06  1742  	struct gfs2_extent ma=
xext =3D { .rbm.rgd =3D rbm->rgd, };
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1743  =

71921ef85928e9 Andreas Gruenbacher 2019-03-14  1744  	/*
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1745  	 * Determine the last=
 bitmap to search.  If we're not starting at the
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1746  	 * beginning of a bit=
map, we need to search that bitmap twice to scan
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1747  	 * the entire resourc=
e group.
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1748  	 */
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1749  	last_bii =3D rbm->bii=
 - (rbm->offset =3D=3D 0);
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1750  =

5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1751  	while(1) {
e579ed4f446e64 Bob Peterson        2013-09-17  1752  		bi =3D rbm_bi(rbm);
2fdc2fa21bc72e Andreas Gruenbacher 2020-10-06  1753  		if (test_bit(GBF_FUL=
L, &bi->bi_flags) &&
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1754  		    (state =3D=3D GF=
S2_BLKST_FREE))
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1755  			goto next_bitmap;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1756  =

e579ed4f446e64 Bob Peterson        2013-09-17  1757  		bh =3D bi->bi_bh;
e579ed4f446e64 Bob Peterson        2013-09-17  1758  		buffer =3D bh->b_dat=
a + bi->bi_offset;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1759  		WARN_ON(!buffer_upto=
date(bh));
e579ed4f446e64 Bob Peterson        2013-09-17  1760  		if (state !=3D GFS2_=
BLKST_UNLINKED && bi->bi_clone)
e579ed4f446e64 Bob Peterson        2013-09-17  1761  			buffer =3D bi->bi_c=
lone + bi->bi_offset;
281b4952d185a3 Andreas Gruenbacher 2018-09-26  1762  		offset =3D gfs2_bitf=
it(buffer, bi->bi_bytes, rbm->offset, state);
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1763  		if (offset =3D=3D BF=
ITNOENT) {
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1764  			if (state =3D=3D GF=
S2_BLKST_FREE && rbm->offset =3D=3D 0)
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1765  				set_bit(GBF_FULL, =
&bi->bi_flags);
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1766  			goto next_bitmap;
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1767  		}
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1768  		rbm->offset =3D offs=
et;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1769  		if (ip =3D=3D NULL)
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1770  			return 0;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1771  =

f38e998fbbb5da Andreas Gruenbacher 2020-10-05 @1772  		ret =3D gfs2_reserva=
tion_check_and_update(rbm, ip, *minext,
5ce13431dd3365 Bob Peterson        2013-11-06  1773  							&maxext);
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1774  		if (ret =3D=3D 0)
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1775  			return 0;
71921ef85928e9 Andreas Gruenbacher 2019-03-14  1776  		if (ret > 0)
8d8b752a0f5528 Bob Peterson        2012-08-07  1777  			goto next_iter;
5d50d5324612d2 Steven Whitehouse   2012-08-07  1778  		if (ret =3D=3D -E2BI=
G) {
e579ed4f446e64 Bob Peterson        2013-09-17  1779  			rbm->bii =3D 0;
5d50d5324612d2 Steven Whitehouse   2012-08-07  1780  			rbm->offset =3D 0;
5d50d5324612d2 Steven Whitehouse   2012-08-07  1781  			goto res_covered_en=
d_of_rgrp;
5d50d5324612d2 Steven Whitehouse   2012-08-07  1782  		}
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1783  		return ret;
5b924ae2dcb1cc Steven Whitehouse   2012-08-01  1784  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8461878042557219959==--

