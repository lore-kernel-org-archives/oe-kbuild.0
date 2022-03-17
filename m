Content-Type: multipart/mixed; boundary="===============8193143902045364313=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11491/13209] fs/f2fs/file.c:2057 f2fs_ioc_start_atomic_write() warn: inconsistent returns '&inode->i_rwsem'.
Date: Thu, 17 Mar 2022 11:14:44 +0800
Message-ID: <202203171137.0LDg0sYz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8193143902045364313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Fengnan Chang <changfengnan@vivo.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
commit: a6f748c35eca6eedf2dda8b2a30abd640f1249dc [11491/13209] f2fs: fix co=
mpressed file start atomic write may cause data corruption
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago
config: parisc-randconfig-m031-20220317 (https://download.01.org/0day-ci/ar=
chive/20220317/202203171137.0LDg0sYz-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/f2fs/file.c:2057 f2fs_ioc_start_atomic_write() warn: inconsistent return=
s '&inode->i_rwsem'.

Old smatch warnings:
fs/f2fs/f2fs.h:2371 dec_valid_block_count() warn: should 'count << 3' be a =
64 bit type?
fs/f2fs/file.c:2942 f2fs_ioc_flush_device() warn: potential spectre issue '=
sbi->devs' [w] (local cap)
fs/f2fs/file.c:4665 f2fs_file_write_iter() warn: inconsistent returns '&ino=
de->i_rwsem'.

vim +2057 fs/f2fs/file.c

d49f3e890290bd1 Chao Yu         2015-01-23  1988  =

88b88a667971599 Jaegeuk Kim     2014-10-06  1989  static int f2fs_ioc_start=
_atomic_write(struct file *filp)
88b88a667971599 Jaegeuk Kim     2014-10-06  1990  {
88b88a667971599 Jaegeuk Kim     2014-10-06  1991  	struct inode *inode =3D =
file_inode(filp);
984fc4e76d63345 Chao Yu         2022-02-04  1992  	struct user_namespace *m=
nt_userns =3D file_mnt_user_ns(filp);
743b620cb0516f6 Jaegeuk Kim     2019-09-09  1993  	struct f2fs_inode_info *=
fi =3D F2FS_I(inode);
743b620cb0516f6 Jaegeuk Kim     2019-09-09  1994  	struct f2fs_sb_info *sbi=
 =3D F2FS_I_SB(inode);
f4c9c743acedc2f Chao Yu         2015-07-17  1995  	int ret;
88b88a667971599 Jaegeuk Kim     2014-10-06  1996  =

984fc4e76d63345 Chao Yu         2022-02-04  1997  	if (!inode_owner_or_capa=
ble(mnt_userns, inode))
88b88a667971599 Jaegeuk Kim     2014-10-06  1998  		return -EACCES;
88b88a667971599 Jaegeuk Kim     2014-10-06  1999  =

e811898c97f83ae Jaegeuk Kim     2017-03-17  2000  	if (!S_ISREG(inode->i_mo=
de))
e811898c97f83ae Jaegeuk Kim     2017-03-17  2001  		return -EINVAL;
e811898c97f83ae Jaegeuk Kim     2017-03-17  2002  =

038d06984f5c50a Chao Yu         2019-07-25  2003  	if (filp->f_flags & O_DI=
RECT)
038d06984f5c50a Chao Yu         2019-07-25  2004  		return -EINVAL;
038d06984f5c50a Chao Yu         2019-07-25  2005  =

7fb17fe44b70c85 Chao Yu         2016-05-09  2006  	ret =3D mnt_want_write_f=
ile(filp);
7fb17fe44b70c85 Chao Yu         2016-05-09  2007  	if (ret)
7fb17fe44b70c85 Chao Yu         2016-05-09  2008  		return ret;
7fb17fe44b70c85 Chao Yu         2016-05-09  2009  =

0fac558b9658479 Chao Yu         2016-05-09  2010  	inode_lock(inode);
0fac558b9658479 Chao Yu         2016-05-09  2011  =

a6f748c35eca6ee Fengnan Chang   2022-03-10  2012  	if (!f2fs_disable_compre=
ssed_file(inode))
a6f748c35eca6ee Fengnan Chang   2022-03-10  2013  		return -EINVAL;
4c8ff7095bef64f Chao Yu         2019-11-01  2014  =

455e3a5887ee7eb Jaegeuk Kim     2018-07-27  2015  	if (f2fs_is_atomic_file(=
inode)) {
455e3a5887ee7eb Jaegeuk Kim     2018-07-27  2016  		if (is_inode_flag_set(i=
node, FI_ATOMIC_REVOKE_REQUEST))
455e3a5887ee7eb Jaegeuk Kim     2018-07-27  2017  			ret =3D -EINVAL;
7fb17fe44b70c85 Chao Yu         2016-05-09  2018  		goto out;
455e3a5887ee7eb Jaegeuk Kim     2018-07-27  2019  	}
88b88a667971599 Jaegeuk Kim     2014-10-06  2020  =

f4c9c743acedc2f Chao Yu         2015-07-17  2021  	ret =3D f2fs_convert_inl=
ine_inode(inode);
f4c9c743acedc2f Chao Yu         2015-07-17  2022  	if (ret)
7fb17fe44b70c85 Chao Yu         2016-05-09  2023  		goto out;
88b88a667971599 Jaegeuk Kim     2014-10-06  2024  =

e4544b63a7ee49e Tim Murray      2022-01-07  2025  	f2fs_down_write(&F2FS_I(=
inode)->i_gc_rwsem[WRITE]);
6f8d4455060dfb0 Jaegeuk Kim     2018-07-25  2026  =

31867b23d7d1ee3 Jaegeuk Kim     2018-12-28  2027  	/*
31867b23d7d1ee3 Jaegeuk Kim     2018-12-28  2028  	 * Should wait end_io to=
 count F2FS_WB_CP_DATA correctly by
31867b23d7d1ee3 Jaegeuk Kim     2018-12-28  2029  	 * f2fs_is_atomic_file.
31867b23d7d1ee3 Jaegeuk Kim     2018-12-28  2030  	 */
31867b23d7d1ee3 Jaegeuk Kim     2018-12-28  2031  	if (get_dirty_pages(inod=
e))
dcbb4c10e6d9693 Joe Perches     2019-06-18  2032  		f2fs_warn(F2FS_I_SB(ino=
de), "Unexpected flush for atomic writes: ino=3D%lu, npages=3D%u",
c27753d675fccd3 Jaegeuk Kim     2016-04-12  2033  			  inode->i_ino, get_di=
rty_pages(inode));
c27753d675fccd3 Jaegeuk Kim     2016-04-12  2034  	ret =3D filemap_write_an=
d_wait_range(inode->i_mapping, 0, LLONG_MAX);
6f8d4455060dfb0 Jaegeuk Kim     2018-07-25  2035  	if (ret) {
e4544b63a7ee49e Tim Murray      2022-01-07  2036  		f2fs_up_write(&F2FS_I(i=
node)->i_gc_rwsem[WRITE]);
684ca7e55de1f3d Kinglong Mee    2017-03-18  2037  		goto out;
6f8d4455060dfb0 Jaegeuk Kim     2018-07-25  2038  	}
31867b23d7d1ee3 Jaegeuk Kim     2018-12-28  2039  =

743b620cb0516f6 Jaegeuk Kim     2019-09-09  2040  	spin_lock(&sbi->inode_lo=
ck[ATOMIC_FILE]);
743b620cb0516f6 Jaegeuk Kim     2019-09-09  2041  	if (list_empty(&fi->inme=
m_ilist))
743b620cb0516f6 Jaegeuk Kim     2019-09-09  2042  		list_add_tail(&fi->inme=
m_ilist, &sbi->inode_list[ATOMIC_FILE]);
677017d196ba2a4 Sahitya Tummala 2019-11-13  2043  	sbi->atomic_files++;
743b620cb0516f6 Jaegeuk Kim     2019-09-09  2044  	spin_unlock(&sbi->inode_=
lock[ATOMIC_FILE]);
743b620cb0516f6 Jaegeuk Kim     2019-09-09  2045  =

743b620cb0516f6 Jaegeuk Kim     2019-09-09  2046  	/* add inode in inmem_li=
st first and set atomic_file */
054afda9991786e Yunlei He       2018-04-18  2047  	set_inode_flag(inode, FI=
_ATOMIC_FILE);
2ef79ecb5e906d8 Chao Yu         2018-05-07  2048  	clear_inode_flag(inode, =
FI_ATOMIC_REVOKE_REQUEST);
e4544b63a7ee49e Tim Murray      2022-01-07  2049  	f2fs_up_write(&F2FS_I(in=
ode)->i_gc_rwsem[WRITE]);
684ca7e55de1f3d Kinglong Mee    2017-03-18  2050  =

6f8d4455060dfb0 Jaegeuk Kim     2018-07-25  2051  	f2fs_update_time(F2FS_I_=
SB(inode), REQ_TIME);
7a10f0177e117e9 Jaegeuk Kim     2017-07-24  2052  	F2FS_I(inode)->inmem_tas=
k =3D current;
26a28a0c1eb756b Jaegeuk Kim     2016-12-28  2053  	stat_update_max_atomic_w=
rite(inode);
684ca7e55de1f3d Kinglong Mee    2017-03-18  2054  out:
0fac558b9658479 Chao Yu         2016-05-09  2055  	inode_unlock(inode);
7fb17fe44b70c85 Chao Yu         2016-05-09  2056  	mnt_drop_write_file(filp=
);
c27753d675fccd3 Jaegeuk Kim     2016-04-12 @2057  	return ret;
88b88a667971599 Jaegeuk Kim     2014-10-06  2058  }
88b88a667971599 Jaegeuk Kim     2014-10-06  2059  =


:::::: The code at line 2057 was first introduced by commit
:::::: c27753d675fccd3b15a78621a2a66616507693d4 f2fs: flush dirty pages bef=
ore starting atomic writes

:::::: TO: Jaegeuk Kim <jaegeuk@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8193143902045364313==--

