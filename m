Content-Type: multipart/mixed; boundary="===============3390400808843250210=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:scrub-rtsummary 9/42] fs/quota/quota.c:510:22: warning: Variable 'dst->d_rt_spc_timer' is reassigned a value before the old one has been used.
Date: Tue, 08 Sep 2020 12:00:50 +0800
Message-ID: <202009081240.pKHBj5dq%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3390400808843250210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t scrub-rtsummary
head:   ab585d3204106857e452814ca32b8f24865f4b1e
commit: da2e2c9151f631bcfa3bc5d0a3a23653d0aa10e8 [9/42] quota: widen timest=
amps for the old (x)fs_disk_quota structure
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   fs/quota/quota.c:672:9: warning: Identical condition 'ret', second condi=
tion is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   fs/quota/quota.c:667:6: note: first condition
    if (ret)
        ^
   fs/quota/quota.c:672:9: note: second condition
    return ret;
           ^
   fs/quota/quota.c:700:9: warning: Identical condition 'ret', second condi=
tion is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   fs/quota/quota.c:694:6: note: first condition
    if (ret)
        ^
   fs/quota/quota.c:700:9: note: second condition
    return ret;
           ^
>> fs/quota/quota.c:510:22: warning: Variable 'dst->d_rt_spc_timer' is reas=
signed a value before the old one has been used. [redundantAssignment]
    dst->d_rt_spc_timer =3D copy_from_xfs_dqblk_ts(src, src->d_rtbtimer,
                        ^
   fs/quota/quota.c:509:22: note: Variable 'dst->d_rt_spc_timer' is reassig=
ned a value before the old one has been used.
    dst->d_rt_spc_timer =3D src->d_rtbtimer;
                        ^
   fs/quota/quota.c:510:22: note: Variable 'dst->d_rt_spc_timer' is reassig=
ned a value before the old one has been used.
    dst->d_rt_spc_timer =3D copy_from_xfs_dqblk_ts(src, src->d_rtbtimer,
                        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/comm=
it/?id=3Dda2e2c9151f631bcfa3bc5d0a3a23653d0aa10e8
git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/d=
jwong/xfs-linux.git
git fetch --no-tags djwong-xfs scrub-rtsummary
git checkout da2e2c9151f631bcfa3bc5d0a3a23653d0aa10e8
vim +510 fs/quota/quota.c

da2e2c9151f631 Darrick J. Wong 2020-09-04  491  =

14bf61ffe6ac54 Jan Kara        2014-10-09  492  static void copy_from_xfs_d=
qblk(struct qc_dqblk *dst, struct fs_disk_quota *src)
14bf61ffe6ac54 Jan Kara        2014-10-09  493  {
14bf61ffe6ac54 Jan Kara        2014-10-09  494  	dst->d_spc_hardlimit =3D q=
uota_bbtob(src->d_blk_hardlimit);
14bf61ffe6ac54 Jan Kara        2014-10-09  495  	dst->d_spc_softlimit =3D q=
uota_bbtob(src->d_blk_softlimit);
14bf61ffe6ac54 Jan Kara        2014-10-09  496  	dst->d_ino_hardlimit =3D s=
rc->d_ino_hardlimit;
14bf61ffe6ac54 Jan Kara        2014-10-09  497  	dst->d_ino_softlimit =3D s=
rc->d_ino_softlimit;
14bf61ffe6ac54 Jan Kara        2014-10-09  498  	dst->d_space =3D quota_bbt=
ob(src->d_bcount);
14bf61ffe6ac54 Jan Kara        2014-10-09  499  	dst->d_ino_count =3D src->=
d_icount;
da2e2c9151f631 Darrick J. Wong 2020-09-04  500  	dst->d_ino_timer =3D copy_=
from_xfs_dqblk_ts(src, src->d_itimer,
da2e2c9151f631 Darrick J. Wong 2020-09-04  501  						  src->d_itimer_hi);
da2e2c9151f631 Darrick J. Wong 2020-09-04  502  	dst->d_spc_timer =3D copy_=
from_xfs_dqblk_ts(src, src->d_btimer,
da2e2c9151f631 Darrick J. Wong 2020-09-04  503  						  src->d_btimer_hi);
14bf61ffe6ac54 Jan Kara        2014-10-09  504  	dst->d_ino_warns =3D src->=
d_iwarns;
14bf61ffe6ac54 Jan Kara        2014-10-09  505  	dst->d_spc_warns =3D src->=
d_bwarns;
14bf61ffe6ac54 Jan Kara        2014-10-09  506  	dst->d_rt_spc_hardlimit =
=3D quota_bbtob(src->d_rtb_hardlimit);
14bf61ffe6ac54 Jan Kara        2014-10-09  507  	dst->d_rt_spc_softlimit =
=3D quota_bbtob(src->d_rtb_softlimit);
14bf61ffe6ac54 Jan Kara        2014-10-09  508  	dst->d_rt_space =3D quota_=
bbtob(src->d_rtbcount);
14bf61ffe6ac54 Jan Kara        2014-10-09  509  	dst->d_rt_spc_timer =3D sr=
c->d_rtbtimer;
da2e2c9151f631 Darrick J. Wong 2020-09-04 @510  	dst->d_rt_spc_timer =3D co=
py_from_xfs_dqblk_ts(src, src->d_rtbtimer,
da2e2c9151f631 Darrick J. Wong 2020-09-04  511  						     src->d_rtbtimer_=
hi);
14bf61ffe6ac54 Jan Kara        2014-10-09  512  	dst->d_rt_spc_warns =3D sr=
c->d_rtbwarns;
14bf61ffe6ac54 Jan Kara        2014-10-09  513  	dst->d_fieldmask =3D 0;
14bf61ffe6ac54 Jan Kara        2014-10-09  514  	if (src->d_fieldmask & FS_=
DQ_ISOFT)
14bf61ffe6ac54 Jan Kara        2014-10-09  515  		dst->d_fieldmask |=3D QC_=
INO_SOFT;
14bf61ffe6ac54 Jan Kara        2014-10-09  516  	if (src->d_fieldmask & FS_=
DQ_IHARD)
14bf61ffe6ac54 Jan Kara        2014-10-09  517  		dst->d_fieldmask |=3D QC_=
INO_HARD;
14bf61ffe6ac54 Jan Kara        2014-10-09  518  	if (src->d_fieldmask & FS_=
DQ_BSOFT)
14bf61ffe6ac54 Jan Kara        2014-10-09  519  		dst->d_fieldmask |=3D QC_=
SPC_SOFT;
14bf61ffe6ac54 Jan Kara        2014-10-09  520  	if (src->d_fieldmask & FS_=
DQ_BHARD)
14bf61ffe6ac54 Jan Kara        2014-10-09  521  		dst->d_fieldmask |=3D QC_=
SPC_HARD;
14bf61ffe6ac54 Jan Kara        2014-10-09  522  	if (src->d_fieldmask & FS_=
DQ_RTBSOFT)
14bf61ffe6ac54 Jan Kara        2014-10-09  523  		dst->d_fieldmask |=3D QC_=
RT_SPC_SOFT;
14bf61ffe6ac54 Jan Kara        2014-10-09  524  	if (src->d_fieldmask & FS_=
DQ_RTBHARD)
14bf61ffe6ac54 Jan Kara        2014-10-09  525  		dst->d_fieldmask |=3D QC_=
RT_SPC_HARD;
14bf61ffe6ac54 Jan Kara        2014-10-09  526  	if (src->d_fieldmask & FS_=
DQ_BTIMER)
14bf61ffe6ac54 Jan Kara        2014-10-09  527  		dst->d_fieldmask |=3D QC_=
SPC_TIMER;
14bf61ffe6ac54 Jan Kara        2014-10-09  528  	if (src->d_fieldmask & FS_=
DQ_ITIMER)
14bf61ffe6ac54 Jan Kara        2014-10-09  529  		dst->d_fieldmask |=3D QC_=
INO_TIMER;
14bf61ffe6ac54 Jan Kara        2014-10-09  530  	if (src->d_fieldmask & FS_=
DQ_RTBTIMER)
14bf61ffe6ac54 Jan Kara        2014-10-09  531  		dst->d_fieldmask |=3D QC_=
RT_SPC_TIMER;
14bf61ffe6ac54 Jan Kara        2014-10-09  532  	if (src->d_fieldmask & FS_=
DQ_BWARNS)
14bf61ffe6ac54 Jan Kara        2014-10-09  533  		dst->d_fieldmask |=3D QC_=
SPC_WARNS;
14bf61ffe6ac54 Jan Kara        2014-10-09  534  	if (src->d_fieldmask & FS_=
DQ_IWARNS)
14bf61ffe6ac54 Jan Kara        2014-10-09  535  		dst->d_fieldmask |=3D QC_=
INO_WARNS;
14bf61ffe6ac54 Jan Kara        2014-10-09  536  	if (src->d_fieldmask & FS_=
DQ_RTBWARNS)
14bf61ffe6ac54 Jan Kara        2014-10-09  537  		dst->d_fieldmask |=3D QC_=
RT_SPC_WARNS;
14bf61ffe6ac54 Jan Kara        2014-10-09  538  	if (src->d_fieldmask & FS_=
DQ_BCOUNT)
14bf61ffe6ac54 Jan Kara        2014-10-09  539  		dst->d_fieldmask |=3D QC_=
SPACE;
14bf61ffe6ac54 Jan Kara        2014-10-09  540  	if (src->d_fieldmask & FS_=
DQ_ICOUNT)
14bf61ffe6ac54 Jan Kara        2014-10-09  541  		dst->d_fieldmask |=3D QC_=
INO_COUNT;
14bf61ffe6ac54 Jan Kara        2014-10-09  542  	if (src->d_fieldmask & FS_=
DQ_RTBCOUNT)
14bf61ffe6ac54 Jan Kara        2014-10-09  543  		dst->d_fieldmask |=3D QC_=
RT_SPACE;
14bf61ffe6ac54 Jan Kara        2014-10-09  544  }
14bf61ffe6ac54 Jan Kara        2014-10-09  545  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3390400808843250210==--

