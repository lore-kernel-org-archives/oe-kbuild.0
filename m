Content-Type: multipart/mixed; boundary="===============2881366056296912638=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-review:UPDATE-20200417-054402/Sahitya-Tummala/f2fs-prevent-meta-updates-while-checkpoint-is-in-progress/20200327-044221 1/1] fs/f2fs/checkpoint.c:1628:1-7: preceding lock on line 1557
Date: Mon, 20 Apr 2020 15:43:18 +0800
Message-ID: <202004201512.SIHDEu1o%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2881366056296912638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jaegeuk Kim <jaegeuk@kernel.org>
CC: 0day robot <lkp@intel.com>
CC: Sahitya Tummala <stummala@codeaurora.org>

tree:   https://github.com/0day-ci/linux/commits/UPDATE-20200417-054402/Sah=
itya-Tummala/f2fs-prevent-meta-updates-while-checkpoint-is-in-progress/2020=
0327-044221
head:   6f5d43888de06d19b134a1470fb0174889b8059c
commit: 6f5d43888de06d19b134a1470fb0174889b8059c [1/1] f2fs: prevent meta u=
pdates while checkpoint is in progress
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> fs/f2fs/checkpoint.c:1628:1-7: preceding lock on line 1557

# https://github.com/0day-ci/linux/commit/6f5d43888de06d19b134a1470fb017488=
9b8059c
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 6f5d43888de06d19b134a1470fb0174889b8059c
vim +1628 fs/f2fs/checkpoint.c

127e670abfa7fa Jaegeuk Kim      2012-11-02  1541  =

4d57b86dd86404 Chao Yu          2018-05-30  1542  int f2fs_write_checkpoint=
(struct f2fs_sb_info *sbi, struct cp_control *cpc)
127e670abfa7fa Jaegeuk Kim      2012-11-02  1543  {
127e670abfa7fa Jaegeuk Kim      2012-11-02  1544  	struct f2fs_checkpoint *=
ckpt =3D F2FS_CKPT(sbi);
127e670abfa7fa Jaegeuk Kim      2012-11-02  1545  	unsigned long long ckpt_=
ver;
c34f42e2cb2d27 Chao Yu          2015-12-23  1546  	int err =3D 0;
127e670abfa7fa Jaegeuk Kim      2012-11-02  1547  =

f5a131bb236d02 Chao Yu          2019-04-22  1548  	if (f2fs_readonly(sbi->s=
b) || f2fs_hw_is_readonly(sbi))
f5a131bb236d02 Chao Yu          2019-04-22  1549  		return -EROFS;
f5a131bb236d02 Chao Yu          2019-04-22  1550  =

4354994f097d06 Daniel Rosenberg 2018-08-20  1551  	if (unlikely(is_sbi_flag=
_set(sbi, SBI_CP_DISABLED))) {
4354994f097d06 Daniel Rosenberg 2018-08-20  1552  		if (cpc->reason !=3D CP=
_PAUSE)
4354994f097d06 Daniel Rosenberg 2018-08-20  1553  			return 0;
dcbb4c10e6d969 Joe Perches      2019-06-18  1554  		f2fs_warn(sbi, "Start c=
heckpoint disabled!");
4354994f097d06 Daniel Rosenberg 2018-08-20  1555  	}
6f5d43888de06d Jaegeuk Kim      2020-04-16  1556  	if (cpc->reason !=3D CP_=
RESIZE)
127e670abfa7fa Jaegeuk Kim      2012-11-02 @1557  		mutex_lock(&sbi->cp_mut=
ex);
8501017e50fb75 Jaegeuk Kim      2014-08-11  1558  =

caf0047e7e1e60 Chao Yu          2015-01-28  1559  	if (!is_sbi_flag_set(sbi=
, SBI_IS_DIRTY) &&
c473f1a9658b6c Chao Yu          2017-04-27  1560  		((cpc->reason & CP_FAST=
BOOT) || (cpc->reason & CP_SYNC) ||
c473f1a9658b6c Chao Yu          2017-04-27  1561  		((cpc->reason & CP_DISC=
ARD) && !sbi->discard_blks)))
8501017e50fb75 Jaegeuk Kim      2014-08-11  1562  		goto out;
c34f42e2cb2d27 Chao Yu          2015-12-23  1563  	if (unlikely(f2fs_cp_err=
or(sbi))) {
c34f42e2cb2d27 Chao Yu          2015-12-23  1564  		err =3D -EIO;
cf779cab14d50a Jaegeuk Kim      2014-08-11  1565  		goto out;
c34f42e2cb2d27 Chao Yu          2015-12-23  1566  	}
2bda542d59f970 Wanpeng Li       2015-02-27  1567  =

2bda542d59f970 Wanpeng Li       2015-02-27  1568  	trace_f2fs_write_checkpo=
int(sbi->sb, cpc->reason, "start block_ops");
2bda542d59f970 Wanpeng Li       2015-02-27  1569  =

c34f42e2cb2d27 Chao Yu          2015-12-23  1570  	err =3D block_operations=
(sbi);
c34f42e2cb2d27 Chao Yu          2015-12-23  1571  	if (err)
cf779cab14d50a Jaegeuk Kim      2014-08-11  1572  		goto out;
127e670abfa7fa Jaegeuk Kim      2012-11-02  1573  =

75ab4cb8301adb Jaegeuk Kim      2014-09-20  1574  	trace_f2fs_write_checkpo=
int(sbi->sb, cpc->reason, "finish block_ops");
2af4bd6ca556d6 Namjae Jeon      2013-04-23  1575  =

b9109b0e49b93b Jaegeuk Kim      2017-05-10  1576  	f2fs_flush_merged_writes=
(sbi);
127e670abfa7fa Jaegeuk Kim      2012-11-02  1577  =

58cce381fa4e8c Yunlei He        2016-08-18  1578  	/* this is the case of m=
ultiple fstrims without any changes */
c473f1a9658b6c Chao Yu          2017-04-27  1579  	if (cpc->reason & CP_DIS=
CARD) {
4d57b86dd86404 Chao Yu          2018-05-30  1580  		if (!f2fs_exist_trim_ca=
ndidates(sbi, cpc)) {
25290fa5591d81 Jaegeuk Kim      2016-12-29  1581  			unblock_operations(sbi=
);
25290fa5591d81 Jaegeuk Kim      2016-12-29  1582  			goto out;
25290fa5591d81 Jaegeuk Kim      2016-12-29  1583  		}
25290fa5591d81 Jaegeuk Kim      2016-12-29  1584  =

0333ad4e4f49e1 Jaegeuk Kim      2016-12-29  1585  		if (NM_I(sbi)->dirty_na=
t_cnt =3D=3D 0 &&
0333ad4e4f49e1 Jaegeuk Kim      2016-12-29  1586  				SIT_I(sbi)->dirty_sen=
tries =3D=3D 0 &&
0333ad4e4f49e1 Jaegeuk Kim      2016-12-29  1587  				prefree_segments(sbi)=
 =3D=3D 0) {
4d57b86dd86404 Chao Yu          2018-05-30  1588  			f2fs_flush_sit_entries=
(sbi, cpc);
4d57b86dd86404 Chao Yu          2018-05-30  1589  			f2fs_clear_prefree_seg=
ments(sbi, cpc);
58cce381fa4e8c Yunlei He        2016-08-18  1590  			unblock_operations(sbi=
);
58cce381fa4e8c Yunlei He        2016-08-18  1591  			goto out;
58cce381fa4e8c Yunlei He        2016-08-18  1592  		}
0333ad4e4f49e1 Jaegeuk Kim      2016-12-29  1593  	}
58cce381fa4e8c Yunlei He        2016-08-18  1594  =

127e670abfa7fa Jaegeuk Kim      2012-11-02  1595  	/*
127e670abfa7fa Jaegeuk Kim      2012-11-02  1596  	 * update checkpoint pac=
k index
127e670abfa7fa Jaegeuk Kim      2012-11-02  1597  	 * Increase the version =
number so that
127e670abfa7fa Jaegeuk Kim      2012-11-02  1598  	 * SIT entries and seg s=
ummaries are written at correct place
127e670abfa7fa Jaegeuk Kim      2012-11-02  1599  	 */
d71b5564c0da4f Jaegeuk Kim      2013-08-09  1600  	ckpt_ver =3D cur_cp_vers=
ion(ckpt);
127e670abfa7fa Jaegeuk Kim      2012-11-02  1601  	ckpt->checkpoint_ver =3D=
 cpu_to_le64(++ckpt_ver);
127e670abfa7fa Jaegeuk Kim      2012-11-02  1602  =

127e670abfa7fa Jaegeuk Kim      2012-11-02  1603  	/* write cached NAT/SIT =
entries to NAT/SIT area */
edc55aaf0d1712 Jaegeuk Kim      2018-09-17  1604  	err =3D f2fs_flush_nat_e=
ntries(sbi, cpc);
edc55aaf0d1712 Jaegeuk Kim      2018-09-17  1605  	if (err)
edc55aaf0d1712 Jaegeuk Kim      2018-09-17  1606  		goto stop;
edc55aaf0d1712 Jaegeuk Kim      2018-09-17  1607  =

4d57b86dd86404 Chao Yu          2018-05-30  1608  	f2fs_flush_sit_entries(s=
bi, cpc);
127e670abfa7fa Jaegeuk Kim      2012-11-02  1609  =

c34f42e2cb2d27 Chao Yu          2015-12-23  1610  	err =3D do_checkpoint(sb=
i, cpc);
4e6a8d9b224f88 Jaegeuk Kim      2016-12-29  1611  	if (err)
4d57b86dd86404 Chao Yu          2018-05-30  1612  		f2fs_release_discard_ad=
drs(sbi);
4e6a8d9b224f88 Jaegeuk Kim      2016-12-29  1613  	else
4d57b86dd86404 Chao Yu          2018-05-30  1614  		f2fs_clear_prefree_segm=
ents(sbi, cpc);
edc55aaf0d1712 Jaegeuk Kim      2018-09-17  1615  stop:
127e670abfa7fa Jaegeuk Kim      2012-11-02  1616  	unblock_operations(sbi);
942e0be6219cc8 Changman Lee     2014-02-13  1617  	stat_inc_cp_count(sbi->s=
tat_info);
10027551ccf545 Jaegeuk Kim      2015-04-09  1618  =

c473f1a9658b6c Chao Yu          2017-04-27  1619  	if (cpc->reason & CP_REC=
OVERY)
dcbb4c10e6d969 Joe Perches      2019-06-18  1620  		f2fs_notice(sbi, "check=
point: version =3D %llx", ckpt_ver);
60b99b486b568c Jaegeuk Kim      2015-10-05  1621  =

7a88ddb56077d0 Chao Yu          2020-02-27  1622  	/* update CP_TIME to tri=
gger checkpoint periodically */
6beceb5427aa87 Jaegeuk Kim      2016-01-08  1623  	f2fs_update_time(sbi, CP=
_TIME);
55d1cdb25a815b Jaegeuk Kim      2015-12-15  1624  	trace_f2fs_write_checkpo=
int(sbi->sb, cpc->reason, "finish checkpoint");
8501017e50fb75 Jaegeuk Kim      2014-08-11  1625  out:
6f5d43888de06d Jaegeuk Kim      2020-04-16  1626  	if (cpc->reason !=3D CP_=
RESIZE)
8501017e50fb75 Jaegeuk Kim      2014-08-11  1627  		mutex_unlock(&sbi->cp_m=
utex);
c34f42e2cb2d27 Chao Yu          2015-12-23 @1628  	return err;
127e670abfa7fa Jaegeuk Kim      2012-11-02  1629  }
127e670abfa7fa Jaegeuk Kim      2012-11-02  1630  =


:::::: The code at line 1628 was first introduced by commit
:::::: c34f42e2cb2d27650549306de5ff36839e9177d6 f2fs: report error of do_ch=
eckpoint

:::::: TO: Chao Yu <chao2.yu@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2881366056296912638==--

