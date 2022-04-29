Content-Type: multipart/mixed; boundary="===============0259651729451803575=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1142/7483] fs/gfs2/quota.c:457:26: warning: Uninitialized variables: iter.qd_hlist, iter.qd_list, iter.qd_id, iter.qd_sbd, iter.qd_lockref, iter.qd_lru, iter.qd_hash, iter.qd_flags, iter.qd_change, iter.qd_change_sync, iter.qd_slot, iter.qd_slot_count, iter.qd_bh, i...
Date: Fri, 29 Apr 2022 15:20:51 +0800
Message-ID: <202204291510.XcZmMqNC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0259651729451803575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bdc61aad77faf67187525028f1f355eff3849f22
commit: 21b19dccc8bf398eb990267d81f5ced3e69fd0a7 [1142/7483] gfs2: replace =
'found' with dedicated list iterator variable
:::::: branch date: 24 hours ago
:::::: commit date: 4 weeks ago
compiler: mips64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 21b19dccc8bf398eb990267d81f5ced3e69fd0a7
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   fs/gfs2/quota.c:1085:6: warning: Local variable 'do_sync' shadows outer =
function [shadowFunction]
    int do_sync =3D 1;
        ^
   fs/gfs2/quota.c:869:12: note: Shadowed declaration
   static int do_sync(unsigned int num_qd, struct gfs2_quota_data **qda)
              ^
   fs/gfs2/quota.c:1085:6: note: Shadow variable
    int do_sync =3D 1;
        ^
   fs/gfs2/util.h:183:23: warning: Parameter 'p' can be declared with const=
 [constParameter]
           unsigned int *p)
                         ^
   fs/gfs2/glock.h:330:68: warning: Parameter 'object' can be declared with=
 const [constParameter]
   static inline void glock_clear_object(struct gfs2_glock *gl, void *objec=
t)
                                                                      ^
   fs/gfs2/quota.c:427:10: warning: Parameter 'sync_gen' can be declared wi=
th const [constParameter]
       u64 *sync_gen)
            ^
   fs/gfs2/quota.c:250:11: warning: Uninitialized variable: qd->qd_sbd [uni=
nitvar]
     if (qd->qd_sbd !=3D sdp)
             ^
   fs/gfs2/quota.c:248:7: note: Assuming condition is false
     if (!qid_eq(qd->qd_id, qid))
         ^
   fs/gfs2/quota.c:250:11: note: Uninitialized variable: qd->qd_sbd
     if (qd->qd_sbd !=3D sdp)
             ^
>> fs/gfs2/quota.c:457:26: warning: Uninitialized variables: iter.qd_hlist,=
 iter.qd_list, iter.qd_id, iter.qd_sbd, iter.qd_lockref, iter.qd_lru, iter.=
qd_hash, iter.qd_flags, iter.qd_change, iter.qd_change_sync, iter.qd_slot, =
iter.qd_slot_count, iter.qd_bh, iter.qd_bh_qc, iter.qd_bh_count, iter.qd_gl=
, iter.qd_qb, iter.qd_sync_gen, iter.qd_last_warn, iter.qd_rcu [uninitvar]
     if (qd_check_sync(sdp, iter, &sdp->sd_quota_sync_gen)) {
                            ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:451:15: note: Assuming condition is false
    if (sb_rdonly(sdp->sd_vfs))
                 ^
   fs/gfs2/quota.c:457:26: note: Uninitialized variables: iter.qd_hlist, it=
er.qd_list, iter.qd_id, iter.qd_sbd, iter.qd_lockref, iter.qd_lru, iter.qd_=
hash, iter.qd_flags, iter.qd_change, iter.qd_change_sync, iter.qd_slot, ite=
r.qd_slot_count, iter.qd_bh, iter.qd_bh_qc, iter.qd_bh_count, iter.qd_gl, i=
ter.qd_qb, iter.qd_sync_gen, iter.qd_last_warn, iter.qd_rcu
     if (qd_check_sync(sdp, iter, &sdp->sd_quota_sync_gen)) {
                            ^

vim +457 fs/gfs2/quota.c

1bf59bf6ded8411 Steven Whitehouse 2013-10-04  443  =

b3b94faa5fe5968 David Teigland    2006-01-16  444  static int qd_fish(struc=
t gfs2_sbd *sdp, struct gfs2_quota_data **qdp)
b3b94faa5fe5968 David Teigland    2006-01-16  445  {
21b19dccc8bf398 Jakob Koschel     2022-04-01  446  	struct gfs2_quota_data =
*qd =3D NULL, *iter;
b3b94faa5fe5968 David Teigland    2006-01-16  447  	int error;
b3b94faa5fe5968 David Teigland    2006-01-16  448  =

b3b94faa5fe5968 David Teigland    2006-01-16  449  	*qdp =3D NULL;
b3b94faa5fe5968 David Teigland    2006-01-16  450  =

bc98a42c1f7d0f8 David Howells     2017-07-17  451  	if (sb_rdonly(sdp->sd_v=
fs))
b3b94faa5fe5968 David Teigland    2006-01-16  452  		return 0;
b3b94faa5fe5968 David Teigland    2006-01-16  453  =

7d80823e1d83e35 Steven Whitehouse 2013-11-01  454  	spin_lock(&qd_lock);
b3b94faa5fe5968 David Teigland    2006-01-16  455  =

21b19dccc8bf398 Jakob Koschel     2022-04-01  456  	list_for_each_entry(ite=
r, &sdp->sd_quota_list, qd_list) {
21b19dccc8bf398 Jakob Koschel     2022-04-01 @457  		if (qd_check_sync(sdp,=
 iter, &sdp->sd_quota_sync_gen)) {
21b19dccc8bf398 Jakob Koschel     2022-04-01  458  			qd =3D iter;
b3b94faa5fe5968 David Teigland    2006-01-16  459  			break;
b3b94faa5fe5968 David Teigland    2006-01-16  460  		}
21b19dccc8bf398 Jakob Koschel     2022-04-01  461  	}
b3b94faa5fe5968 David Teigland    2006-01-16  462  =

7d80823e1d83e35 Steven Whitehouse 2013-11-01  463  	spin_unlock(&qd_lock);
b3b94faa5fe5968 David Teigland    2006-01-16  464  =

b3b94faa5fe5968 David Teigland    2006-01-16  465  	if (qd) {
b3b94faa5fe5968 David Teigland    2006-01-16  466  		gfs2_assert_warn(sdp, =
qd->qd_change_sync);
b3b94faa5fe5968 David Teigland    2006-01-16  467  		error =3D bh_get(qd);
b3b94faa5fe5968 David Teigland    2006-01-16  468  		if (error) {
b3b94faa5fe5968 David Teigland    2006-01-16  469  			clear_bit(QDF_LOCKED,=
 &qd->qd_flags);
b3b94faa5fe5968 David Teigland    2006-01-16  470  			slot_put(qd);
b3b94faa5fe5968 David Teigland    2006-01-16  471  			qd_put(qd);
b3b94faa5fe5968 David Teigland    2006-01-16  472  			return error;
b3b94faa5fe5968 David Teigland    2006-01-16  473  		}
b3b94faa5fe5968 David Teigland    2006-01-16  474  	}
b3b94faa5fe5968 David Teigland    2006-01-16  475  =

b3b94faa5fe5968 David Teigland    2006-01-16  476  	*qdp =3D qd;
b3b94faa5fe5968 David Teigland    2006-01-16  477  =

b3b94faa5fe5968 David Teigland    2006-01-16  478  	return 0;
b3b94faa5fe5968 David Teigland    2006-01-16  479  }
b3b94faa5fe5968 David Teigland    2006-01-16  480  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0259651729451803575==--

