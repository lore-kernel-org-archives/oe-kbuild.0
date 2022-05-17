Content-Type: multipart/mixed; boundary="===============3579122030933774132=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/notify/fanotify/fanotify_user.c:1674 do_fanotify_mark() error: we previously assumed 'inode' could be null (see line 1667)
Date: Tue, 17 May 2022 10:28:55 +0800
Message-ID: <202205171048.0o4aaBzu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3579122030933774132==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   42226c989789d8da4af1de0c31070c96726d990c
commit: ceaf69f8eadcafb323392be88e7a5248c415d423 fanotify: do not allow set=
ting dirent events in mask of non-dir
date:   8 days ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 days ago
config: xtensa-randconfig-m031-20220516 (https://download.01.org/0day-ci/ar=
chive/20220517/202205171048.0o4aaBzu-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/notify/fanotify/fanotify_user.c:1674 do_fanotify_mark() error: we previo=
usly assumed 'inode' could be null (see line 1667)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:88 current_thread_info() warn: incons=
istent indenting
fs/notify/fanotify/fanotify_user.c:422 copy_fid_info_to_user() error: we pr=
eviously assumed 'fh' could be null (see line 381)
fs/notify/fanotify/fanotify_user.c:1693 do_fanotify_mark() error: we previo=
usly assumed 'mnt' could be null (see line 1674)

vim +/inode +1674 fs/notify/fanotify/fanotify_user.c

0b3b094ac9a7bb1 Jan Kara                2019-05-15  1501  =

183caa3c8668e95 Dominik Brodowski       2018-03-17  1502  static int do_fan=
otify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
183caa3c8668e95 Dominik Brodowski       2018-03-17  1503  			    int dfd, c=
onst char  __user *pathname)
bbaa4168b2d2d8c Eric Paris              2009-12-17  1504  {
0ff21db9fcc3904 Eric Paris              2009-12-17  1505  	struct inode *in=
ode =3D NULL;
0ff21db9fcc3904 Eric Paris              2009-12-17  1506  	struct vfsmount =
*mnt =3D NULL;
2a3edf86040a7e1 Eric Paris              2009-12-17  1507  	struct fsnotify_=
group *group;
2903ff019b346ab Al Viro                 2012-08-28  1508  	struct fd f;
2a3edf86040a7e1 Eric Paris              2009-12-17  1509  	struct path path;
73072283a249c79 Amir Goldstein          2019-01-10  1510  	__kernel_fsid_t =
__fsid, *fsid =3D NULL;
bdd5a46fe30653c Amir Goldstein          2018-10-04  1511  	u32 valid_mask =
=3D FANOTIFY_EVENTS | FANOTIFY_EVENT_FLAGS;
23c9deeb3285d34 Amir Goldstein          2018-10-04  1512  	unsigned int mar=
k_type =3D flags & FANOTIFY_MARK_TYPE_BITS;
3ef866536645ce1 Amir Goldstein          2020-07-16  1513  	bool ignored =3D=
 flags & FAN_MARK_IGNORED_MASK;
d809daf1b6add51 Amir Goldstein          2020-07-16  1514  	unsigned int obj=
_type, fid_mode;
85af5d9258cc586 Amir Goldstein          2020-07-16  1515  	u32 umask =3D 0;
2903ff019b346ab Al Viro                 2012-08-28  1516  	int ret;
2a3edf86040a7e1 Eric Paris              2009-12-17  1517  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1518  	pr_debug("%s: fa=
notify_fd=3D%d flags=3D%x dfd=3D%d pathname=3D%p mask=3D%llx\n",
2a3edf86040a7e1 Eric Paris              2009-12-17  1519  		 __func__, fano=
tify_fd, flags, dfd, pathname, mask);
2a3edf86040a7e1 Eric Paris              2009-12-17  1520  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1521  	/* we only use t=
he lower 32 bits as of right now. */
22d483b99863202 Christian Brauner       2021-03-25  1522  	if (upper_32_bit=
s(mask))
2a3edf86040a7e1 Eric Paris              2009-12-17  1523  		return -EINVAL;
2a3edf86040a7e1 Eric Paris              2009-12-17  1524  =

23c9deeb3285d34 Amir Goldstein          2018-10-04  1525  	if (flags & ~FAN=
OTIFY_MARK_FLAGS)
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1526  		return -EINVAL;
d54f4fba889b205 Amir Goldstein          2018-09-01  1527  =

d54f4fba889b205 Amir Goldstein          2018-09-01  1528  	switch (mark_typ=
e) {
d54f4fba889b205 Amir Goldstein          2018-09-01  1529  	case FAN_MARK_IN=
ODE:
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1530  		obj_type =3D FS=
NOTIFY_OBJ_TYPE_INODE;
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1531  		break;
d54f4fba889b205 Amir Goldstein          2018-09-01  1532  	case FAN_MARK_MO=
UNT:
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1533  		obj_type =3D FS=
NOTIFY_OBJ_TYPE_VFSMOUNT;
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1534  		break;
d54f4fba889b205 Amir Goldstein          2018-09-01  1535  	case FAN_MARK_FI=
LESYSTEM:
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1536  		obj_type =3D FS=
NOTIFY_OBJ_TYPE_SB;
d54f4fba889b205 Amir Goldstein          2018-09-01  1537  		break;
d54f4fba889b205 Amir Goldstein          2018-09-01  1538  	default:
d54f4fba889b205 Amir Goldstein          2018-09-01  1539  		return -EINVAL;
d54f4fba889b205 Amir Goldstein          2018-09-01  1540  	}
d54f4fba889b205 Amir Goldstein          2018-09-01  1541  =

4d92604cc90aa18 Eric Paris              2009-12-17  1542  	switch (flags & =
(FAN_MARK_ADD | FAN_MARK_REMOVE | FAN_MARK_FLUSH)) {
df561f6688fef77 Gustavo A. R. Silva     2020-08-23  1543  	case FAN_MARK_AD=
D:
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1544  	case FAN_MARK_RE=
MOVE:
1734dee4e3a296c Lino Sanfilippo         2010-11-22  1545  		if (!mask)
1734dee4e3a296c Lino Sanfilippo         2010-11-22  1546  			return -EINVAL;
cc299a98eb13a98 Heinrich Schuchardt     2014-06-04  1547  		break;
4d92604cc90aa18 Eric Paris              2009-12-17  1548  	case FAN_MARK_FL=
USH:
23c9deeb3285d34 Amir Goldstein          2018-10-04  1549  		if (flags & ~(F=
ANOTIFY_MARK_TYPE_BITS | FAN_MARK_FLUSH))
cc299a98eb13a98 Heinrich Schuchardt     2014-06-04  1550  			return -EINVAL;
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1551  		break;
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1552  	default:
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1553  		return -EINVAL;
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1554  	}
8fcd65280abc469 Eric Paris              2010-10-28  1555  =

6685df31255493c Miklos Szeredi          2017-10-30  1556  	if (IS_ENABLED(C=
ONFIG_FANOTIFY_ACCESS_PERMISSIONS))
23c9deeb3285d34 Amir Goldstein          2018-10-04  1557  		valid_mask |=3D=
 FANOTIFY_PERM_EVENTS;
6685df31255493c Miklos Szeredi          2017-10-30  1558  =

6685df31255493c Miklos Szeredi          2017-10-30  1559  	if (mask & ~vali=
d_mask)
2a3edf86040a7e1 Eric Paris              2009-12-17  1560  		return -EINVAL;
2a3edf86040a7e1 Eric Paris              2009-12-17  1561  =

3ef866536645ce1 Amir Goldstein          2020-07-16  1562  	/* Event flags (=
ONDIR, ON_CHILD) are meaningless in ignored mask */
3ef866536645ce1 Amir Goldstein          2020-07-16  1563  	if (ignored)
3ef866536645ce1 Amir Goldstein          2020-07-16  1564  		mask &=3D ~FANO=
TIFY_EVENT_FLAGS;
3ef866536645ce1 Amir Goldstein          2020-07-16  1565  =

2903ff019b346ab Al Viro                 2012-08-28  1566  	f =3D fdget(fano=
tify_fd);
2903ff019b346ab Al Viro                 2012-08-28  1567  	if (unlikely(!f.=
file))
2a3edf86040a7e1 Eric Paris              2009-12-17  1568  		return -EBADF;
2a3edf86040a7e1 Eric Paris              2009-12-17  1569  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1570  	/* verify that t=
his is indeed an fanotify instance */
2a3edf86040a7e1 Eric Paris              2009-12-17  1571  	ret =3D -EINVAL;
2903ff019b346ab Al Viro                 2012-08-28  1572  	if (unlikely(f.f=
ile->f_op !=3D &fanotify_fops))
2a3edf86040a7e1 Eric Paris              2009-12-17  1573  		goto fput_and_o=
ut;
2903ff019b346ab Al Viro                 2012-08-28  1574  	group =3D f.file=
->private_data;
4231a23530a30e8 Eric Paris              2010-10-28  1575  =

7cea2a3c505e87a Amir Goldstein          2021-03-04  1576  	/*
a8b98c808eab3ec Amir Goldstein          2021-05-24  1577  	 * An unprivileg=
ed user is not allowed to setup mount nor filesystem
a8b98c808eab3ec Amir Goldstein          2021-05-24  1578  	 * marks.  This =
also includes setting up such marks by a group that
a8b98c808eab3ec Amir Goldstein          2021-05-24  1579  	 * was initializ=
ed by an unprivileged user.
7cea2a3c505e87a Amir Goldstein          2021-03-04  1580  	 */
7cea2a3c505e87a Amir Goldstein          2021-03-04  1581  	ret =3D -EPERM;
a8b98c808eab3ec Amir Goldstein          2021-05-24  1582  	if ((!capable(CA=
P_SYS_ADMIN) ||
a8b98c808eab3ec Amir Goldstein          2021-05-24  1583  	     FAN_GROUP_F=
LAG(group, FANOTIFY_UNPRIV)) &&
7cea2a3c505e87a Amir Goldstein          2021-03-04  1584  	    mark_type !=
=3D FAN_MARK_INODE)
7cea2a3c505e87a Amir Goldstein          2021-03-04  1585  		goto fput_and_o=
ut;
7cea2a3c505e87a Amir Goldstein          2021-03-04  1586  =

4231a23530a30e8 Eric Paris              2010-10-28  1587  	/*
4231a23530a30e8 Eric Paris              2010-10-28  1588  	 * group->priori=
ty =3D=3D FS_PRIO_0 =3D=3D FAN_CLASS_NOTIF.  These are not
4231a23530a30e8 Eric Paris              2010-10-28  1589  	 * allowed to se=
t permissions events.
4231a23530a30e8 Eric Paris              2010-10-28  1590  	 */
4231a23530a30e8 Eric Paris              2010-10-28  1591  	ret =3D -EINVAL;
23c9deeb3285d34 Amir Goldstein          2018-10-04  1592  	if (mask & FANOT=
IFY_PERM_EVENTS &&
4231a23530a30e8 Eric Paris              2010-10-28  1593  	    group->prior=
ity =3D=3D FS_PRIO_0)
4231a23530a30e8 Eric Paris              2010-10-28  1594  		goto fput_and_o=
ut;
2a3edf86040a7e1 Eric Paris              2009-12-17  1595  =

9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1596  	if (mask & FAN_F=
S_ERROR &&
9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1597  	    mark_type !=
=3D FAN_MARK_FILESYSTEM)
9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1598  		goto fput_and_o=
ut;
9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1599  =

235328d1fa4251c Amir Goldstein          2019-01-10  1600  	/*
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1601  	 * Events that d=
o not carry enough information to report
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1602  	 * event->fd req=
uire a group that supports reporting fid.  Those
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1603  	 * events are no=
t supported on a mount mark, because they do not
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1604  	 * carry enough =
information (i.e. path) to be filtered by mount
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1605  	 * point.
235328d1fa4251c Amir Goldstein          2019-01-10  1606  	 */
d809daf1b6add51 Amir Goldstein          2020-07-16  1607  	fid_mode =3D FAN=
_GROUP_FLAG(group, FANOTIFY_FID_BITS);
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1608  	if (mask & ~(FAN=
OTIFY_FD_EVENTS|FANOTIFY_EVENT_FLAGS) &&
d809daf1b6add51 Amir Goldstein          2020-07-16  1609  	    (!fid_mode |=
| mark_type =3D=3D FAN_MARK_MOUNT))
235328d1fa4251c Amir Goldstein          2019-01-10  1610  		goto fput_and_o=
ut;
235328d1fa4251c Amir Goldstein          2019-01-10  1611  =

8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1612  	/*
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1613  	 * FAN_RENAME us=
es special info type records to report the old and
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1614  	 * new parent+na=
me.  Reporting only old and new parent id is less
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1615  	 * useful and wa=
s not implemented.
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1616  	 */
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1617  	if (mask & FAN_R=
ENAME && !(fid_mode & FAN_REPORT_NAME))
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1618  		goto fput_and_o=
ut;
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1619  =

0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1620  	if (flags & FAN_=
MARK_FLUSH) {
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1621  		ret =3D 0;
d54f4fba889b205 Amir Goldstein          2018-09-01  1622  		if (mark_type =
=3D=3D FAN_MARK_MOUNT)
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1623  			fsnotify_clear=
_vfsmount_marks_by_group(group);
d54f4fba889b205 Amir Goldstein          2018-09-01  1624  		else if (mark_t=
ype =3D=3D FAN_MARK_FILESYSTEM)
d54f4fba889b205 Amir Goldstein          2018-09-01  1625  			fsnotify_clear=
_sb_marks_by_group(group);
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1626  		else
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1627  			fsnotify_clear=
_inode_marks_by_group(group);
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1628  		goto fput_and_o=
ut;
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1629  	}
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1630  =

ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1631  	ret =3D fanotify=
_find_path(dfd, pathname, &path, flags,
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1632  			(mask & ALL_FS=
NOTIFY_EVENTS), obj_type);
2a3edf86040a7e1 Eric Paris              2009-12-17  1633  	if (ret)
2a3edf86040a7e1 Eric Paris              2009-12-17  1634  		goto fput_and_o=
ut;
2a3edf86040a7e1 Eric Paris              2009-12-17  1635  =

0b3b094ac9a7bb1 Jan Kara                2019-05-15  1636  	if (flags & FAN_=
MARK_ADD) {
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1637  		ret =3D fanotif=
y_events_supported(&path, mask);
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1638  		if (ret)
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1639  			goto path_put_=
and_out;
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1640  	}
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1641  =

d809daf1b6add51 Amir Goldstein          2020-07-16  1642  	if (fid_mode) {
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1643  		ret =3D fanotif=
y_test_fsid(path.dentry, &__fsid);
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1644  		if (ret)
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1645  			goto path_put_=
and_out;
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1646  =

8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1647  		ret =3D fanotif=
y_test_fid(path.dentry);
a8b13aa20afb691 Amir Goldstein          2019-01-10  1648  		if (ret)
a8b13aa20afb691 Amir Goldstein          2019-01-10  1649  			goto path_put_=
and_out;
77115225acc67d9 Amir Goldstein          2019-01-10  1650  =

73072283a249c79 Amir Goldstein          2019-01-10  1651  		fsid =3D &__fsi=
d;
a8b13aa20afb691 Amir Goldstein          2019-01-10  1652  	}
a8b13aa20afb691 Amir Goldstein          2019-01-10  1653  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1654  	/* inode held in=
 place by reference to path; group by fget on fd */
d54f4fba889b205 Amir Goldstein          2018-09-01  1655  	if (mark_type =
=3D=3D FAN_MARK_INODE)
2a3edf86040a7e1 Eric Paris              2009-12-17  1656  		inode =3D path.=
dentry->d_inode;
0ff21db9fcc3904 Eric Paris              2009-12-17  1657  	else
0ff21db9fcc3904 Eric Paris              2009-12-17  1658  		mnt =3D path.mn=
t;
2a3edf86040a7e1 Eric Paris              2009-12-17  1659  =

ceaf69f8eadcafb Amir Goldstein          2022-05-07  1660  	/*
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1661  	 * FAN_RENAME is=
 not allowed on non-dir (for now).
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1662  	 * We shouldn't =
have allowed setting any dirent events in mask of
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1663  	 * non-dir, but =
because we always allowed it, error only if group
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1664  	 * was initializ=
ed with the new flag FAN_REPORT_TARGET_FID.
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1665  	 */
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1666  	ret =3D -ENOTDIR;
ceaf69f8eadcafb Amir Goldstein          2022-05-07 @1667  	if (inode && !S_=
ISDIR(inode->i_mode) &&
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1668  	    ((mask & FAN=
_RENAME) ||
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1669  	     ((mask & FA=
NOTIFY_DIRENT_EVENTS) &&
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1670  	      FAN_GROUP_=
FLAG(group, FAN_REPORT_TARGET_FID))))
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1671  		goto path_put_a=
nd_out;
ceaf69f8eadcafb Amir Goldstein          2022-05-07  1672  =

85af5d9258cc586 Amir Goldstein          2020-07-16  1673  	/* Mask out FAN_=
EVENT_ON_CHILD flag for sb/mount/non-dir marks */
85af5d9258cc586 Amir Goldstein          2020-07-16 @1674  	if (mnt || !S_IS=
DIR(inode->i_mode)) {
85af5d9258cc586 Amir Goldstein          2020-07-16  1675  		mask &=3D ~FAN_=
EVENT_ON_CHILD;
85af5d9258cc586 Amir Goldstein          2020-07-16  1676  		umask =3D FAN_E=
VENT_ON_CHILD;
5128063739d293b Amir Goldstein          2020-07-16  1677  		/*
5128063739d293b Amir Goldstein          2020-07-16  1678  		 * If group nee=
ds to report parent fid, register for getting
5128063739d293b Amir Goldstein          2020-07-16  1679  		 * events with =
parent/name info for non-directory.
5128063739d293b Amir Goldstein          2020-07-16  1680  		 */
5128063739d293b Amir Goldstein          2020-07-16  1681  		if ((fid_mode &=
 FAN_REPORT_DIR_FID) &&
5128063739d293b Amir Goldstein          2020-07-16  1682  		    (flags & FA=
N_MARK_ADD) && !ignored)
5128063739d293b Amir Goldstein          2020-07-16  1683  			mask |=3D FAN_=
EVENT_ON_CHILD;
85af5d9258cc586 Amir Goldstein          2020-07-16  1684  	}
85af5d9258cc586 Amir Goldstein          2020-07-16  1685  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1686  	/* create/update=
 an inode mark */
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1687  	switch (flags & =
(FAN_MARK_ADD | FAN_MARK_REMOVE)) {
c6223f464927cab Andreas Gruenbacher     2009-12-17  1688  	case FAN_MARK_AD=
D:
d54f4fba889b205 Amir Goldstein          2018-09-01  1689  		if (mark_type =
=3D=3D FAN_MARK_MOUNT)
77115225acc67d9 Amir Goldstein          2019-01-10  1690  			ret =3D fanoti=
fy_add_vfsmount_mark(group, mnt, mask,
77115225acc67d9 Amir Goldstein          2019-01-10  1691  							 flags, fs=
id);
d54f4fba889b205 Amir Goldstein          2018-09-01  1692  		else if (mark_t=
ype =3D=3D FAN_MARK_FILESYSTEM)
77115225acc67d9 Amir Goldstein          2019-01-10  1693  			ret =3D fanoti=
fy_add_sb_mark(group, mnt->mnt_sb, mask,
77115225acc67d9 Amir Goldstein          2019-01-10  1694  						   flags, f=
sid);
0ff21db9fcc3904 Eric Paris              2009-12-17  1695  		else
77115225acc67d9 Amir Goldstein          2019-01-10  1696  			ret =3D fanoti=
fy_add_inode_mark(group, inode, mask,
77115225acc67d9 Amir Goldstein          2019-01-10  1697  						      flags=
, fsid);
c6223f464927cab Andreas Gruenbacher     2009-12-17  1698  		break;
c6223f464927cab Andreas Gruenbacher     2009-12-17  1699  	case FAN_MARK_RE=
MOVE:
d54f4fba889b205 Amir Goldstein          2018-09-01  1700  		if (mark_type =
=3D=3D FAN_MARK_MOUNT)
77115225acc67d9 Amir Goldstein          2019-01-10  1701  			ret =3D fanoti=
fy_remove_vfsmount_mark(group, mnt, mask,
85af5d9258cc586 Amir Goldstein          2020-07-16  1702  							    flags,=
 umask);
d54f4fba889b205 Amir Goldstein          2018-09-01  1703  		else if (mark_t=
ype =3D=3D FAN_MARK_FILESYSTEM)
77115225acc67d9 Amir Goldstein          2019-01-10  1704  			ret =3D fanoti=
fy_remove_sb_mark(group, mnt->mnt_sb, mask,
85af5d9258cc586 Amir Goldstein          2020-07-16  1705  						      flags=
, umask);
f3640192c0a1775 Andreas Gruenbacher     2009-12-17  1706  		else
77115225acc67d9 Amir Goldstein          2019-01-10  1707  			ret =3D fanoti=
fy_remove_inode_mark(group, inode, mask,
85af5d9258cc586 Amir Goldstein          2020-07-16  1708  							 flags, um=
ask);
c6223f464927cab Andreas Gruenbacher     2009-12-17  1709  		break;
c6223f464927cab Andreas Gruenbacher     2009-12-17  1710  	default:
c6223f464927cab Andreas Gruenbacher     2009-12-17  1711  		ret =3D -EINVAL;
c6223f464927cab Andreas Gruenbacher     2009-12-17  1712  	}
2a3edf86040a7e1 Eric Paris              2009-12-17  1713  =

a8b13aa20afb691 Amir Goldstein          2019-01-10  1714  path_put_and_out:
2a3edf86040a7e1 Eric Paris              2009-12-17  1715  	path_put(&path);
2a3edf86040a7e1 Eric Paris              2009-12-17  1716  fput_and_out:
2903ff019b346ab Al Viro                 2012-08-28  1717  	fdput(f);
2a3edf86040a7e1 Eric Paris              2009-12-17  1718  	return ret;
2a3edf86040a7e1 Eric Paris              2009-12-17  1719  }
2a3edf86040a7e1 Eric Paris              2009-12-17  1720  =


:::::: The code at line 1674 was first introduced by commit
:::::: 85af5d9258cc5862167c578c63c65ac700a3fa19 fanotify: use FAN_EVENT_ON_=
CHILD as implicit flag on sb/mount/non-dir marks

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3579122030933774132==--

