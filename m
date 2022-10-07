Content-Type: multipart/mixed; boundary="===============0681853179116116561=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [amir73il:fanotify_pre_content 7/7] fs/notify/fanotify/fanotify_user.c:1673 do_fanotify_mark() error: potentially dereferencing uninitialized 'group'.
Date: Fri, 07 Oct 2022 09:24:23 +0800
Message-ID: <202210070929.wOlcG3Iy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0681853179116116561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fanotify_pre_content
head:   c1839c81a48eedc33a1a5871291018c3927d81a1
commit: c1839c81a48eedc33a1a5871291018c3927d81a1 [7/7] fanotify: FAN_MARK_P=
ERSISTENT
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001-20221003
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/notify/fanotify/fanotify_user.c:1673 do_fanotify_mark() error: potential=
ly dereferencing uninitialized 'group'.

Old smatch warnings:
fs/notify/fanotify/fanotify_user.c:422 copy_fid_info_to_user() error: we pr=
eviously assumed 'fh' could be null (see line 381)
fs/notify/fanotify/fanotify_user.c:1830 do_fanotify_mark() error: we previo=
usly assumed 'mnt' could be null (see line 1803)

vim +/group +1673 fs/notify/fanotify/fanotify_user.c

0b3b094ac9a7bb1 Jan Kara                2019-05-15  1595  =

183caa3c8668e95 Dominik Brodowski       2018-03-17  1596  static int do_fan=
otify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
183caa3c8668e95 Dominik Brodowski       2018-03-17  1597  			    int dfd, c=
onst char  __user *pathname)
bbaa4168b2d2d8c Eric Paris              2009-12-17  1598  {
0ff21db9fcc3904 Eric Paris              2009-12-17  1599  	struct inode *in=
ode =3D NULL;
0ff21db9fcc3904 Eric Paris              2009-12-17  1600  	struct vfsmount =
*mnt =3D NULL;
2a3edf86040a7e1 Eric Paris              2009-12-17  1601  	struct fsnotify_=
group *group;
2903ff019b346ab Al Viro                 2012-08-28  1602  	struct fd f;
2a3edf86040a7e1 Eric Paris              2009-12-17  1603  	struct path path;
73072283a249c79 Amir Goldstein          2019-01-10  1604  	__kernel_fsid_t =
__fsid, *fsid =3D NULL;
bdd5a46fe30653c Amir Goldstein          2018-10-04  1605  	u32 valid_mask =
=3D FANOTIFY_EVENTS | FANOTIFY_EVENT_FLAGS;
23c9deeb3285d34 Amir Goldstein          2018-10-04  1606  	unsigned int mar=
k_type =3D flags & FANOTIFY_MARK_TYPE_BITS;
8afd7215aa97f88 Amir Goldstein          2022-06-29  1607  	unsigned int mar=
k_cmd =3D flags & FANOTIFY_MARK_CMD_BITS;
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1608  	unsigned int ign=
ore =3D flags & FANOTIFY_MARK_IGNORE_BITS;
d809daf1b6add51 Amir Goldstein          2020-07-16  1609  	unsigned int obj=
_type, fid_mode;
85af5d9258cc586 Amir Goldstein          2020-07-16  1610  	u32 umask =3D 0;
2903ff019b346ab Al Viro                 2012-08-28  1611  	int ret;
2a3edf86040a7e1 Eric Paris              2009-12-17  1612  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1613  	pr_debug("%s: fa=
notify_fd=3D%d flags=3D%x dfd=3D%d pathname=3D%p mask=3D%llx\n",
2a3edf86040a7e1 Eric Paris              2009-12-17  1614  		 __func__, fano=
tify_fd, flags, dfd, pathname, mask);
2a3edf86040a7e1 Eric Paris              2009-12-17  1615  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1616  	/* we only use t=
he lower 32 bits as of right now. */
22d483b99863202 Christian Brauner       2021-03-25  1617  	if (upper_32_bit=
s(mask))
2a3edf86040a7e1 Eric Paris              2009-12-17  1618  		return -EINVAL;
2a3edf86040a7e1 Eric Paris              2009-12-17  1619  =

23c9deeb3285d34 Amir Goldstein          2018-10-04  1620  	if (flags & ~FAN=
OTIFY_MARK_FLAGS)
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1621  		return -EINVAL;
d54f4fba889b205 Amir Goldstein          2018-09-01  1622  =

d54f4fba889b205 Amir Goldstein          2018-09-01  1623  	switch (mark_typ=
e) {
d54f4fba889b205 Amir Goldstein          2018-09-01  1624  	case FAN_MARK_IN=
ODE:
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1625  		obj_type =3D FS=
NOTIFY_OBJ_TYPE_INODE;
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1626  		break;
d54f4fba889b205 Amir Goldstein          2018-09-01  1627  	case FAN_MARK_MO=
UNT:
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1628  		obj_type =3D FS=
NOTIFY_OBJ_TYPE_VFSMOUNT;
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1629  		break;
d54f4fba889b205 Amir Goldstein          2018-09-01  1630  	case FAN_MARK_FI=
LESYSTEM:
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1631  		obj_type =3D FS=
NOTIFY_OBJ_TYPE_SB;
d54f4fba889b205 Amir Goldstein          2018-09-01  1632  		break;
d54f4fba889b205 Amir Goldstein          2018-09-01  1633  	default:
d54f4fba889b205 Amir Goldstein          2018-09-01  1634  		return -EINVAL;
d54f4fba889b205 Amir Goldstein          2018-09-01  1635  	}
d54f4fba889b205 Amir Goldstein          2018-09-01  1636  =

8afd7215aa97f88 Amir Goldstein          2022-06-29  1637  	switch (mark_cmd=
) {
df561f6688fef77 Gustavo A. R. Silva     2020-08-23  1638  	case FAN_MARK_AD=
D:
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1639  	case FAN_MARK_RE=
MOVE:
1734dee4e3a296c Lino Sanfilippo         2010-11-22  1640  		if (!mask)
1734dee4e3a296c Lino Sanfilippo         2010-11-22  1641  			return -EINVAL;
cc299a98eb13a98 Heinrich Schuchardt     2014-06-04  1642  		break;
4d92604cc90aa18 Eric Paris              2009-12-17  1643  	case FAN_MARK_FL=
USH:
23c9deeb3285d34 Amir Goldstein          2018-10-04  1644  		if (flags & ~(F=
ANOTIFY_MARK_TYPE_BITS | FAN_MARK_FLUSH))
cc299a98eb13a98 Heinrich Schuchardt     2014-06-04  1645  			return -EINVAL;
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1646  		break;
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1647  	default:
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1648  		return -EINVAL;
88380fe66e0ac22 Andreas Gruenbacher     2009-12-17  1649  	}
8fcd65280abc469 Eric Paris              2010-10-28  1650  =

6685df31255493c Miklos Szeredi          2017-10-30  1651  	if (IS_ENABLED(C=
ONFIG_FANOTIFY_ACCESS_PERMISSIONS))
23c9deeb3285d34 Amir Goldstein          2018-10-04  1652  		valid_mask |=3D=
 FANOTIFY_PERM_EVENTS;
6685df31255493c Miklos Szeredi          2017-10-30  1653  =

6685df31255493c Miklos Szeredi          2017-10-30  1654  	if (mask & ~vali=
d_mask)
2a3edf86040a7e1 Eric Paris              2009-12-17  1655  		return -EINVAL;
2a3edf86040a7e1 Eric Paris              2009-12-17  1656  =

e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1657  =

e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1658  	/* We don't allo=
w FAN_MARK_IGNORE & FAN_MARK_IGNORED_MASK together */
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1659  	if (ignore =3D=
=3D (FAN_MARK_IGNORE | FAN_MARK_IGNORED_MASK))
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1660  		return -EINVAL;
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1661  =

c1839c81a48eedc Amir Goldstein          2022-10-06  1662  	/*
c1839c81a48eedc Amir Goldstein          2022-10-06  1663  	 * FAN_MARK_PERS=
ISTENT is only allowed for FAN_MARK_IGNORE that survives
c1839c81a48eedc Amir Goldstein          2022-10-06  1664  	 * a modify even=
t on an inode mark.
c1839c81a48eedc Amir Goldstein          2022-10-06  1665  	 * It is only al=
lowed with groups that support FAN_XATTR_IGNORE_MASK.
c1839c81a48eedc Amir Goldstein          2022-10-06  1666  	 * There is no o=
ption to FAN_MARK_FLUSH all persistent masks.
c1839c81a48eedc Amir Goldstein          2022-10-06  1667  	 */
c1839c81a48eedc Amir Goldstein          2022-10-06  1668  	if (flags & FAN_=
MARK_PERSISTENT &&
c1839c81a48eedc Amir Goldstein          2022-10-06  1669  	    (mark_type !=
=3D FAN_MARK_INODE ||
c1839c81a48eedc Amir Goldstein          2022-10-06  1670  	     ignore !=3D=
 FAN_MARK_IGNORE ||
c1839c81a48eedc Amir Goldstein          2022-10-06  1671  	    !(flags & FA=
N_MARK_IGNORED_SURV_MODIFY) ||
c1839c81a48eedc Amir Goldstein          2022-10-06  1672  	     mark_cmd =
=3D=3D FAN_MARK_FLUSH ||
c1839c81a48eedc Amir Goldstein          2022-10-06 @1673  	     !(group->fl=
ags & FSNOTIFY_GROUP_CHECK_XATTR)))
c1839c81a48eedc Amir Goldstein          2022-10-06  1674  		return -EINVAL;
c1839c81a48eedc Amir Goldstein          2022-10-06  1675  =

31a371e419c885e Amir Goldstein          2022-06-29  1676  	/*
31a371e419c885e Amir Goldstein          2022-06-29  1677  	 * Event flags (=
FAN_ONDIR, FAN_EVENT_ON_CHILD) have no effect with
31a371e419c885e Amir Goldstein          2022-06-29  1678  	 * FAN_MARK_IGNO=
RED_MASK.
31a371e419c885e Amir Goldstein          2022-06-29  1679  	 */
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1680  	if (ignore =3D=
=3D FAN_MARK_IGNORED_MASK) {
3ef866536645ce1 Amir Goldstein          2020-07-16  1681  		mask &=3D ~FANO=
TIFY_EVENT_FLAGS;
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1682  		umask =3D FANOT=
IFY_EVENT_FLAGS;
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1683  	}
3ef866536645ce1 Amir Goldstein          2020-07-16  1684  =

2903ff019b346ab Al Viro                 2012-08-28  1685  	f =3D fdget(fano=
tify_fd);
2903ff019b346ab Al Viro                 2012-08-28  1686  	if (unlikely(!f.=
file))
2a3edf86040a7e1 Eric Paris              2009-12-17  1687  		return -EBADF;
2a3edf86040a7e1 Eric Paris              2009-12-17  1688  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1689  	/* verify that t=
his is indeed an fanotify instance */
2a3edf86040a7e1 Eric Paris              2009-12-17  1690  	ret =3D -EINVAL;
2903ff019b346ab Al Viro                 2012-08-28  1691  	if (unlikely(f.f=
ile->f_op !=3D &fanotify_fops))
2a3edf86040a7e1 Eric Paris              2009-12-17  1692  		goto fput_and_o=
ut;
2903ff019b346ab Al Viro                 2012-08-28  1693  	group =3D f.file=
->private_data;
4231a23530a30e8 Eric Paris              2010-10-28  1694  =

7cea2a3c505e87a Amir Goldstein          2021-03-04  1695  	/*
a8b98c808eab3ec Amir Goldstein          2021-05-24  1696  	 * An unprivileg=
ed user is not allowed to setup mount nor filesystem
a8b98c808eab3ec Amir Goldstein          2021-05-24  1697  	 * marks.  This =
also includes setting up such marks by a group that
a8b98c808eab3ec Amir Goldstein          2021-05-24  1698  	 * was initializ=
ed by an unprivileged user.
7cea2a3c505e87a Amir Goldstein          2021-03-04  1699  	 */
7cea2a3c505e87a Amir Goldstein          2021-03-04  1700  	ret =3D -EPERM;
a8b98c808eab3ec Amir Goldstein          2021-05-24  1701  	if ((!capable(CA=
P_SYS_ADMIN) ||
a8b98c808eab3ec Amir Goldstein          2021-05-24  1702  	     FAN_GROUP_F=
LAG(group, FANOTIFY_UNPRIV)) &&
7cea2a3c505e87a Amir Goldstein          2021-03-04  1703  	    mark_type !=
=3D FAN_MARK_INODE)
7cea2a3c505e87a Amir Goldstein          2021-03-04  1704  		goto fput_and_o=
ut;
7cea2a3c505e87a Amir Goldstein          2021-03-04  1705  =

4231a23530a30e8 Eric Paris              2010-10-28  1706  	/*
4231a23530a30e8 Eric Paris              2010-10-28  1707  	 * group->priori=
ty =3D=3D FS_PRIO_0 =3D=3D FAN_CLASS_NOTIF.  These are not
4231a23530a30e8 Eric Paris              2010-10-28  1708  	 * allowed to se=
t permissions events.
4231a23530a30e8 Eric Paris              2010-10-28  1709  	 */
4231a23530a30e8 Eric Paris              2010-10-28  1710  	ret =3D -EINVAL;
23c9deeb3285d34 Amir Goldstein          2018-10-04  1711  	if (mask & FANOT=
IFY_PERM_EVENTS &&
4231a23530a30e8 Eric Paris              2010-10-28  1712  	    group->prior=
ity =3D=3D FS_PRIO_0)
4231a23530a30e8 Eric Paris              2010-10-28  1713  		goto fput_and_o=
ut;
2a3edf86040a7e1 Eric Paris              2009-12-17  1714  =

88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1715  	/*
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1716  	 * FAN_XATTR_IGN=
ORE_MASK groups are not allowed to set anything but
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1717  	 * permissions e=
vents.
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1718  	 */
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1719  	if (group->flags=
 & FSNOTIFY_GROUP_CHECK_XATTR &&
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1720  	    !(mask & FAN=
OTIFY_PERM_EVENTS))
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1721  		goto fput_and_o=
ut;
88ae5e06ae08ca1 Amir Goldstein          2022-10-06  1722  =

9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1723  	if (mask & FAN_F=
S_ERROR &&
9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1724  	    mark_type !=
=3D FAN_MARK_FILESYSTEM)
9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1725  		goto fput_and_o=
ut;
9709bd548f11a09 Gabriel Krisman Bertazi 2021-10-25  1726  =

7d5e005d982527e Amir Goldstein          2022-04-22  1727  	/*
7d5e005d982527e Amir Goldstein          2022-04-22  1728  	 * Evictable is =
only relevant for inode marks, because only inode object
7d5e005d982527e Amir Goldstein          2022-04-22  1729  	 * can be evicte=
d on memory pressure.
7d5e005d982527e Amir Goldstein          2022-04-22  1730  	 */
7d5e005d982527e Amir Goldstein          2022-04-22  1731  	if (flags & FAN_=
MARK_EVICTABLE &&
7d5e005d982527e Amir Goldstein          2022-04-22  1732  	     mark_type !=
=3D FAN_MARK_INODE)
7d5e005d982527e Amir Goldstein          2022-04-22  1733  		goto fput_and_o=
ut;
7d5e005d982527e Amir Goldstein          2022-04-22  1734  =

235328d1fa4251c Amir Goldstein          2019-01-10  1735  	/*
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1736  	 * Events that d=
o not carry enough information to report
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1737  	 * event->fd req=
uire a group that supports reporting fid.  Those
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1738  	 * events are no=
t supported on a mount mark, because they do not
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1739  	 * carry enough =
information (i.e. path) to be filtered by mount
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1740  	 * point.
235328d1fa4251c Amir Goldstein          2019-01-10  1741  	 */
d809daf1b6add51 Amir Goldstein          2020-07-16  1742  	fid_mode =3D FAN=
_GROUP_FLAG(group, FANOTIFY_FID_BITS);
4fe595cf1c80e7a Gabriel Krisman Bertazi 2021-10-25  1743  	if (mask & ~(FAN=
OTIFY_FD_EVENTS|FANOTIFY_EVENT_FLAGS) &&
d809daf1b6add51 Amir Goldstein          2020-07-16  1744  	    (!fid_mode |=
| mark_type =3D=3D FAN_MARK_MOUNT))
235328d1fa4251c Amir Goldstein          2019-01-10  1745  		goto fput_and_o=
ut;
235328d1fa4251c Amir Goldstein          2019-01-10  1746  =

8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1747  	/*
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1748  	 * FAN_RENAME us=
es special info type records to report the old and
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1749  	 * new parent+na=
me.  Reporting only old and new parent id is less
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1750  	 * useful and wa=
s not implemented.
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1751  	 */
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1752  	if (mask & FAN_R=
ENAME && !(fid_mode & FAN_REPORT_NAME))
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1753  		goto fput_and_o=
ut;
8cc3b1ccd930fe6 Amir Goldstein          2021-11-29  1754  =

8afd7215aa97f88 Amir Goldstein          2022-06-29  1755  	if (mark_cmd =3D=
=3D FAN_MARK_FLUSH) {
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1756  		ret =3D 0;
d54f4fba889b205 Amir Goldstein          2018-09-01  1757  		if (mark_type =
=3D=3D FAN_MARK_MOUNT)
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1758  			fsnotify_clear=
_vfsmount_marks_by_group(group);
d54f4fba889b205 Amir Goldstein          2018-09-01  1759  		else if (mark_t=
ype =3D=3D FAN_MARK_FILESYSTEM)
d54f4fba889b205 Amir Goldstein          2018-09-01  1760  			fsnotify_clear=
_sb_marks_by_group(group);
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1761  		else
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1762  			fsnotify_clear=
_inode_marks_by_group(group);
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1763  		goto fput_and_o=
ut;
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1764  	}
0a8dd2db579f7a0 Heinrich Schuchardt     2014-06-04  1765  =

ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1766  	ret =3D fanotify=
_find_path(dfd, pathname, &path, flags,
ac5656d8a4cdd93 Aaron Goidel            2019-08-12  1767  			(mask & ALL_FS=
NOTIFY_EVENTS), obj_type);
2a3edf86040a7e1 Eric Paris              2009-12-17  1768  	if (ret)
2a3edf86040a7e1 Eric Paris              2009-12-17  1769  		goto fput_and_o=
ut;
2a3edf86040a7e1 Eric Paris              2009-12-17  1770  =

8afd7215aa97f88 Amir Goldstein          2022-06-29  1771  	if (mark_cmd =3D=
=3D FAN_MARK_ADD) {
8698e3bab4dd796 Amir Goldstein          2022-06-27  1772  		ret =3D fanotif=
y_events_supported(group, &path, mask, flags);
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1773  		if (ret)
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1774  			goto path_put_=
and_out;
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1775  	}
0b3b094ac9a7bb1 Jan Kara                2019-05-15  1776  =

d809daf1b6add51 Amir Goldstein          2020-07-16  1777  	if (fid_mode) {
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1778  		ret =3D fanotif=
y_test_fsid(path.dentry, &__fsid);
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1779  		if (ret)
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1780  			goto path_put_=
and_out;
8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1781  =

8299212cbdb01a5 Gabriel Krisman Bertazi 2021-10-25  1782  		ret =3D fanotif=
y_test_fid(path.dentry);
a8b13aa20afb691 Amir Goldstein          2019-01-10  1783  		if (ret)
a8b13aa20afb691 Amir Goldstein          2019-01-10  1784  			goto path_put_=
and_out;
77115225acc67d9 Amir Goldstein          2019-01-10  1785  =

73072283a249c79 Amir Goldstein          2019-01-10  1786  		fsid =3D &__fsi=
d;
a8b13aa20afb691 Amir Goldstein          2019-01-10  1787  	}
a8b13aa20afb691 Amir Goldstein          2019-01-10  1788  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1789  	/* inode held in=
 place by reference to path; group by fget on fd */
d54f4fba889b205 Amir Goldstein          2018-09-01  1790  	if (mark_type =
=3D=3D FAN_MARK_INODE)
2a3edf86040a7e1 Eric Paris              2009-12-17  1791  		inode =3D path.=
dentry->d_inode;
0ff21db9fcc3904 Eric Paris              2009-12-17  1792  	else
0ff21db9fcc3904 Eric Paris              2009-12-17  1793  		mnt =3D path.mn=
t;
2a3edf86040a7e1 Eric Paris              2009-12-17  1794  =

e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1795  	ret =3D mnt ? -E=
INVAL : -EISDIR;
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1796  	/* FAN_MARK_IGNO=
RE requires SURV_MODIFY for sb/mount/dir marks */
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1797  	if (mark_cmd =3D=
=3D FAN_MARK_ADD && ignore =3D=3D FAN_MARK_IGNORE &&
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1798  	    (mnt || S_IS=
DIR(inode->i_mode)) &&
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1799  	    !(flags & FA=
N_MARK_IGNORED_SURV_MODIFY))
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1800  		goto path_put_a=
nd_out;
e252f2ed1c8c6c3 Amir Goldstein          2022-06-29  1801  =

85af5d9258cc586 Amir Goldstein          2020-07-16  1802  	/* Mask out FAN_=
EVENT_ON_CHILD flag for sb/mount/non-dir marks */
85af5d9258cc586 Amir Goldstein          2020-07-16  1803  	if (mnt || !S_IS=
DIR(inode->i_mode)) {
85af5d9258cc586 Amir Goldstein          2020-07-16  1804  		mask &=3D ~FAN_=
EVENT_ON_CHILD;
85af5d9258cc586 Amir Goldstein          2020-07-16  1805  		umask =3D FAN_E=
VENT_ON_CHILD;
5128063739d293b Amir Goldstein          2020-07-16  1806  		/*
5128063739d293b Amir Goldstein          2020-07-16  1807  		 * If group nee=
ds to report parent fid, register for getting
5128063739d293b Amir Goldstein          2020-07-16  1808  		 * events with =
parent/name info for non-directory.
5128063739d293b Amir Goldstein          2020-07-16  1809  		 */
5128063739d293b Amir Goldstein          2020-07-16  1810  		if ((fid_mode &=
 FAN_REPORT_DIR_FID) &&
31a371e419c885e Amir Goldstein          2022-06-29  1811  		    (flags & FA=
N_MARK_ADD) && !ignore)
5128063739d293b Amir Goldstein          2020-07-16  1812  			mask |=3D FAN_=
EVENT_ON_CHILD;
85af5d9258cc586 Amir Goldstein          2020-07-16  1813  	}
85af5d9258cc586 Amir Goldstein          2020-07-16  1814  =

1918a9c35f18d20 Amir Goldstein          2022-09-30  1815  	/* Initialize pe=
rsistent xattr inode masks */
1918a9c35f18d20 Amir Goldstein          2022-09-30  1816  	if (mask & FANOT=
IFY_PERM_EVENTS &&
1918a9c35f18d20 Amir Goldstein          2022-09-30  1817  	    !(READ_ONCE(=
inode->i_fsnotify_mask) & FS_XATTR_CACHED)) {
1918a9c35f18d20 Amir Goldstein          2022-09-30  1818  		ret =3D fsnotif=
y_init_xattr_masks(path.dentry);
1918a9c35f18d20 Amir Goldstein          2022-09-30  1819  		if (ret)
1918a9c35f18d20 Amir Goldstein          2022-09-30  1820  			goto path_put_=
and_out;
1918a9c35f18d20 Amir Goldstein          2022-09-30  1821  	}
1918a9c35f18d20 Amir Goldstein          2022-09-30  1822  =

2a3edf86040a7e1 Eric Paris              2009-12-17  1823  	/* create/update=
 an inode mark */
8afd7215aa97f88 Amir Goldstein          2022-06-29  1824  	switch (mark_cmd=
) {
c6223f464927cab Andreas Gruenbacher     2009-12-17  1825  	case FAN_MARK_AD=
D:
d54f4fba889b205 Amir Goldstein          2018-09-01  1826  		if (mark_type =
=3D=3D FAN_MARK_MOUNT)
77115225acc67d9 Amir Goldstein          2019-01-10  1827  			ret =3D fanoti=
fy_add_vfsmount_mark(group, mnt, mask,
77115225acc67d9 Amir Goldstein          2019-01-10  1828  							 flags, fs=
id);
d54f4fba889b205 Amir Goldstein          2018-09-01  1829  		else if (mark_t=
ype =3D=3D FAN_MARK_FILESYSTEM)
77115225acc67d9 Amir Goldstein          2019-01-10  1830  			ret =3D fanoti=
fy_add_sb_mark(group, mnt->mnt_sb, mask,
77115225acc67d9 Amir Goldstein          2019-01-10  1831  						   flags, f=
sid);
0ff21db9fcc3904 Eric Paris              2009-12-17  1832  		else
77115225acc67d9 Amir Goldstein          2019-01-10  1833  			ret =3D fanoti=
fy_add_inode_mark(group, inode, mask,
77115225acc67d9 Amir Goldstein          2019-01-10  1834  						      flags=
, fsid);
c6223f464927cab Andreas Gruenbacher     2009-12-17  1835  		break;
c6223f464927cab Andreas Gruenbacher     2009-12-17  1836  	case FAN_MARK_RE=
MOVE:
d54f4fba889b205 Amir Goldstein          2018-09-01  1837  		if (mark_type =
=3D=3D FAN_MARK_MOUNT)
77115225acc67d9 Amir Goldstein          2019-01-10  1838  			ret =3D fanoti=
fy_remove_vfsmount_mark(group, mnt, mask,
85af5d9258cc586 Amir Goldstein          2020-07-16  1839  							    flags,=
 umask);
d54f4fba889b205 Amir Goldstein          2018-09-01  1840  		else if (mark_t=
ype =3D=3D FAN_MARK_FILESYSTEM)
77115225acc67d9 Amir Goldstein          2019-01-10  1841  			ret =3D fanoti=
fy_remove_sb_mark(group, mnt->mnt_sb, mask,
85af5d9258cc586 Amir Goldstein          2020-07-16  1842  						      flags=
, umask);
f3640192c0a1775 Andreas Gruenbacher     2009-12-17  1843  		else
77115225acc67d9 Amir Goldstein          2019-01-10  1844  			ret =3D fanoti=
fy_remove_inode_mark(group, inode, mask,
85af5d9258cc586 Amir Goldstein          2020-07-16  1845  							 flags, um=
ask);
c6223f464927cab Andreas Gruenbacher     2009-12-17  1846  		break;
c6223f464927cab Andreas Gruenbacher     2009-12-17  1847  	default:
c6223f464927cab Andreas Gruenbacher     2009-12-17  1848  		ret =3D -EINVAL;
c6223f464927cab Andreas Gruenbacher     2009-12-17  1849  	}
2a3edf86040a7e1 Eric Paris              2009-12-17  1850  =

a8b13aa20afb691 Amir Goldstein          2019-01-10  1851  path_put_and_out:
2a3edf86040a7e1 Eric Paris              2009-12-17  1852  	path_put(&path);
2a3edf86040a7e1 Eric Paris              2009-12-17  1853  fput_and_out:
2903ff019b346ab Al Viro                 2012-08-28  1854  	fdput(f);
2a3edf86040a7e1 Eric Paris              2009-12-17  1855  	return ret;
2a3edf86040a7e1 Eric Paris              2009-12-17  1856  }
2a3edf86040a7e1 Eric Paris              2009-12-17  1857  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp

--===============0681853179116116561==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.ksh"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3g4
Nl82NCA2LjAuMCBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJTSU9OX1RFWFQ9
ImdjYy0xMSAoRGViaWFuIDExLjMuMC01KSAxMS4zLjAiCkNPTkZJR19DQ19JU19HQ0M9eQpDT05G
SUdfR0NDX1ZFUlNJT049MTEwMzAwCkNPTkZJR19DTEFOR19WRVJTSU9OPTAKQ09ORklHX0FTX0lT
X0dOVT15CkNPTkZJR19BU19WRVJTSU9OPTIzODkwCkNPTkZJR19MRF9JU19CRkQ9eQpDT05GSUdf
TERfVkVSU0lPTj0yMzg5MApDT05GSUdfTExEX1ZFUlNJT049MApDT05GSUdfQ0NfQ0FOX0xJTks9
eQpDT05GSUdfQ0NfQ0FOX0xJTktfU1RBVElDPXkKQ09ORklHX0NDX0hBU19BU01fR09UT19PVVRQ
VVQ9eQpDT05GSUdfQ0NfSEFTX0FTTV9JTkxJTkU9eQpDT05GSUdfQ0NfSEFTX05PX1BST0ZJTEVf
Rk5fQVRUUj15CkNPTkZJR19QQUhPTEVfVkVSU0lPTj0xMjMKQ09ORklHX0lSUV9XT1JLPXkKQ09O
RklHX0JVSUxEVElNRV9UQUJMRV9TT1JUPXkKQ09ORklHX1RIUkVBRF9JTkZPX0lOX1RBU0s9eQoK
IwojIEdlbmVyYWwgc2V0dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlUPTMyCiMgQ09ORklH
X0NPTVBJTEVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dFUlJPUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VBUElfSEVBREVSX1RFU1QgaXMgbm90IHNldApDT05GSUdfTE9DQUxWRVJTSU9OPSIiCkNP
TkZJR19MT0NBTFZFUlNJT05fQVVUTz15CkNPTkZJR19CVUlMRF9TQUxUPSIiCkNPTkZJR19IQVZF
X0tFUk5FTF9HWklQPXkKQ09ORklHX0hBVkVfS0VSTkVMX0JaSVAyPXkKQ09ORklHX0hBVkVfS0VS
TkVMX0xaTUE9eQpDT05GSUdfSEFWRV9LRVJORUxfWFo9eQpDT05GSUdfSEFWRV9LRVJORUxfTFpP
PXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaND15CkNPTkZJR19IQVZFX0tFUk5FTF9aU1REPXkKIyBD
T05GSUdfS0VSTkVMX0daSVAgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfQlpJUDIgaXMgbm90
IHNldAojIENPTkZJR19LRVJORUxfTFpNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9YWiBp
cyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9MWk8gaXMgbm90IHNldAojIENPTkZJR19LRVJORUxf
TFo0IGlzIG5vdCBzZXQKQ09ORklHX0tFUk5FTF9aU1REPXkKQ09ORklHX0RFRkFVTFRfSU5JVD0i
IgpDT05GSUdfREVGQVVMVF9IT1NUTkFNRT0iKG5vbmUpIgojIENPTkZJR19TWVNWSVBDIGlzIG5v
dCBzZXQKQ09ORklHX1BPU0lYX01RVUVVRT15CkNPTkZJR19QT1NJWF9NUVVFVUVfU1lTQ1RMPXkK
Q09ORklHX1dBVENIX1FVRVVFPXkKQ09ORklHX0NST1NTX01FTU9SWV9BVFRBQ0g9eQojIENPTkZJ
R19VU0VMSUIgaXMgbm90IHNldApDT05GSUdfQVVESVQ9eQpDT05GSUdfSEFWRV9BUkNIX0FVRElU
U1lTQ0FMTD15CkNPTkZJR19BVURJVFNZU0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05G
SUdfR0VORVJJQ19JUlFfUFJPQkU9eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19H
RU5FUklDX0lSUV9FRkZFQ1RJVkVfQUZGX01BU0s9eQpDT05GSUdfR0VORVJJQ19QRU5ESU5HX0lS
UT15CkNPTkZJR19HRU5FUklDX0lSUV9NSUdSQVRJT049eQpDT05GSUdfSEFSRElSUVNfU1dfUkVT
RU5EPXkKQ09ORklHX0dFTkVSSUNfSVJRX0NISVA9eQpDT05GSUdfSVJRX0RPTUFJTj15CkNPTkZJ
R19JUlFfU0lNPXkKQ09ORklHX0lSUV9ET01BSU5fSElFUkFSQ0hZPXkKQ09ORklHX0lSUV9NU0lf
SU9NTVU9eQpDT05GSUdfR0VORVJJQ19JUlFfTUFUUklYX0FMTE9DQVRPUj15CkNPTkZJR19HRU5F
UklDX0lSUV9SRVNFUlZBVElPTl9NT0RFPXkKQ09ORklHX0lSUV9GT1JDRURfVEhSRUFESU5HPXkK
Q09ORklHX1NQQVJTRV9JUlE9eQojIENPTkZJR19HRU5FUklDX0lSUV9ERUJVR0ZTIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgSVJRIHN1YnN5c3RlbQoKQ09ORklHX0NMT0NLU09VUkNFX1dBVENIRE9HPXkK
Q09ORklHX0FSQ0hfQ0xPQ0tTT1VSQ0VfSU5JVD15CkNPTkZJR19DTE9DS1NPVVJDRV9WQUxJREFU
RV9MQVNUX0NZQ0xFPXkKQ09ORklHX0dFTkVSSUNfVElNRV9WU1lTQ0FMTD15CkNPTkZJR19HRU5F
UklDX0NMT0NLRVZFTlRTPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFNfQlJPQURDQVNUPXkK
Q09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFNfTUlOX0FESlVTVD15CkNPTkZJR19HRU5FUklDX0NN
T1NfVVBEQVRFPXkKQ09ORklHX0hBVkVfUE9TSVhfQ1BVX1RJTUVSU19UQVNLX1dPUks9eQpDT05G
SUdfQ09OVEVYVF9UUkFDS0lORz15CkNPTkZJR19DT05URVhUX1RSQUNLSU5HX0lETEU9eQoKIwoj
IFRpbWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0haX0NP
TU1PTj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9fSFpfSURM
RSBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9GVUxMPXkKQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkdf
VVNFUj15CkNPTkZJR19DT05URVhUX1RSQUNLSU5HX1VTRVJfRk9SQ0U9eQojIENPTkZJR19OT19I
WiBpcyBub3Qgc2V0CkNPTkZJR19ISUdIX1JFU19USU1FUlM9eQpDT05GSUdfQ0xPQ0tTT1VSQ0Vf
V0FUQ0hET0dfTUFYX1NLRVdfVVM9MTAwCiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0ZW0KCkNPTkZJ
R19CUEY9eQpDT05GSUdfSEFWRV9FQlBGX0pJVD15CkNPTkZJR19BUkNIX1dBTlRfREVGQVVMVF9C
UEZfSklUPXkKCiMKIyBCUEYgc3Vic3lzdGVtCiMKIyBDT05GSUdfQlBGX1NZU0NBTEwgaXMgbm90
IHNldApDT05GSUdfQlBGX0pJVD15CkNPTkZJR19CUEZfSklUX0RFRkFVTFRfT049eQojIGVuZCBv
ZiBCUEYgc3Vic3lzdGVtCgpDT05GSUdfUFJFRU1QVF9WT0xVTlRBUllfQlVJTEQ9eQojIENPTkZJ
R19QUkVFTVBUX05PTkUgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9WT0xVTlRBUlk9eQojIENP
TkZJR19QUkVFTVBUIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFRfQ09VTlQ9eQojIENPTkZJR19Q
UkVFTVBUX0RZTkFNSUMgaXMgbm90IHNldAojIENPTkZJR19TQ0hFRF9DT1JFIGlzIG5vdCBzZXQK
CiMKIyBDUFUvVGFzayB0aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCiMKQ09ORklHX1ZJUlRfQ1BV
X0FDQ09VTlRJTkc9eQpDT05GSUdfVklSVF9DUFVfQUNDT1VOVElOR19HRU49eQojIENPTkZJR19J
UlFfVElNRV9BQ0NPVU5USU5HIGlzIG5vdCBzZXQKQ09ORklHX0JTRF9QUk9DRVNTX0FDQ1Q9eQpD
T05GSUdfQlNEX1BST0NFU1NfQUNDVF9WMz15CkNPTkZJR19UQVNLU1RBVFM9eQpDT05GSUdfVEFT
S19ERUxBWV9BQ0NUPXkKQ09ORklHX1RBU0tfWEFDQ1Q9eQpDT05GSUdfVEFTS19JT19BQ0NPVU5U
SU5HPXkKIyBDT05GSUdfUFNJIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ1BVL1Rhc2sgdGltZSBhbmQg
c3RhdHMgYWNjb3VudGluZwoKQ09ORklHX0NQVV9JU09MQVRJT049eQoKIwojIFJDVSBTdWJzeXN0
ZW0KIwpDT05GSUdfVFJFRV9SQ1U9eQojIENPTkZJR19SQ1VfRVhQRVJUIGlzIG5vdCBzZXQKQ09O
RklHX1NSQ1U9eQpDT05GSUdfVFJFRV9TUkNVPXkKQ09ORklHX1RBU0tTX1JDVV9HRU5FUklDPXkK
Q09ORklHX1RBU0tTX1JVREVfUkNVPXkKQ09ORklHX1JDVV9TVEFMTF9DT01NT049eQpDT05GSUdf
UkNVX05FRURfU0VHQ0JMSVNUPXkKQ09ORklHX1JDVV9OT0NCX0NQVT15CkNPTkZJR19SQ1VfTk9D
Ql9DUFVfREVGQVVMVF9BTEw9eQojIGVuZCBvZiBSQ1UgU3Vic3lzdGVtCgpDT05GSUdfSUtDT05G
SUc9eQpDT05GSUdfSUtDT05GSUdfUFJPQz15CkNPTkZJR19JS0hFQURFUlM9bQpDT05GSUdfTE9H
X0JVRl9TSElGVD0yMApDT05GSUdfTE9HX0NQVV9NQVhfQlVGX1NISUZUPTEyCkNPTkZJR19QUklO
VEtfU0FGRV9MT0dfQlVGX1NISUZUPTEzCiMgQ09ORklHX1BSSU5US19JTkRFWCBpcyBub3Qgc2V0
CkNPTkZJR19IQVZFX1VOU1RBQkxFX1NDSEVEX0NMT0NLPXkKCiMKIyBTY2hlZHVsZXIgZmVhdHVy
ZXMKIwojIENPTkZJR19VQ0xBTVBfVEFTSyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNjaGVkdWxlciBm
ZWF0dXJlcwoKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTlVNQV9CQUxBTkNJTkc9eQpDT05GSUdfQVJD
SF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIPXkKQ09ORklHX0NDX0hBU19JTlQxMjg9eQpD
T05GSUdfQ0NfSU1QTElDSVRfRkFMTFRIUk9VR0g9Ii1XaW1wbGljaXQtZmFsbHRocm91Z2g9NSIK
Q09ORklHX0dDQzEyX05PX0FSUkFZX0JPVU5EUz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0lOVDEy
OD15CiMgQ09ORklHX05VTUFfQkFMQU5DSU5HIGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUFM9eQpD
T05GSUdfUEFHRV9DT1VOVEVSPXkKIyBDT05GSUdfQ0dST1VQX0ZBVk9SX0RZTk1PRFMgaXMgbm90
IHNldAojIENPTkZJR19NRU1DRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9TQ0hFRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9QSURTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX1JE
TUEgaXMgbm90IHNldApDT05GSUdfQ0dST1VQX0ZSRUVaRVI9eQpDT05GSUdfQ0dST1VQX0hVR0VU
TEI9eQojIENPTkZJR19DUFVTRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0dST1VQX0RFVklDRSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NHUk9VUF9DUFVBQ0NUIGlzIG5vdCBzZXQKQ09ORklHX0NHUk9V
UF9QRVJGPXkKIyBDT05GSUdfQ0dST1VQX01JU0MgaXMgbm90IHNldAojIENPTkZJR19DR1JPVVBf
REVCVUcgaXMgbm90IHNldApDT05GSUdfU09DS19DR1JPVVBfREFUQT15CkNPTkZJR19OQU1FU1BB
Q0VTPXkKQ09ORklHX1VUU19OUz15CkNPTkZJR19USU1FX05TPXkKIyBDT05GSUdfSVBDX05TIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNFUl9OUyBpcyBub3Qgc2V0CkNPTkZJR19QSURfTlM9eQpDT05G
SUdfTkVUX05TPXkKIyBDT05GSUdfQ0hFQ0tQT0lOVF9SRVNUT1JFIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NIRURfQVVUT0dST1VQIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lTRlNfREVQUkVDQVRFRCBp
cyBub3Qgc2V0CkNPTkZJR19SRUxBWT15CkNPTkZJR19CTEtfREVWX0lOSVRSRD15CkNPTkZJR19J
TklUUkFNRlNfU09VUkNFPSIiCkNPTkZJR19SRF9HWklQPXkKQ09ORklHX1JEX0JaSVAyPXkKQ09O
RklHX1JEX0xaTUE9eQpDT05GSUdfUkRfWFo9eQpDT05GSUdfUkRfTFpPPXkKQ09ORklHX1JEX0xa
ND15CkNPTkZJR19SRF9aU1REPXkKQ09ORklHX0JPT1RfQ09ORklHPXkKQ09ORklHX0JPT1RfQ09O
RklHX0VNQkVEPXkKQ09ORklHX0JPT1RfQ09ORklHX0VNQkVEX0ZJTEU9IiIKQ09ORklHX0lOSVRS
QU1GU19QUkVTRVJWRV9NVElNRT15CiMgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9QRVJGT1JNQU5D
RSBpcyBub3Qgc2V0CkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRT15CkNPTkZJR19MRF9PUlBI
QU5fV0FSTj15CkNPTkZJR19TWVNDVEw9eQpDT05GSUdfSEFWRV9VSUQxNj15CkNPTkZJR19TWVND
VExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0hBVkVfUENTUEtSX1BMQVRGT1JNPXkKQ09ORklH
X0VYUEVSVD15CkNPTkZJR19VSUQxNj15CkNPTkZJR19NVUxUSVVTRVI9eQpDT05GSUdfU0dFVE1B
U0tfU1lTQ0FMTD15CiMgQ09ORklHX1NZU0ZTX1NZU0NBTEwgaXMgbm90IHNldApDT05GSUdfRkhB
TkRMRT15CiMgQ09ORklHX1BPU0lYX1RJTUVSUyBpcyBub3Qgc2V0CkNPTkZJR19QUklOVEs9eQpD
T05GSUdfQlVHPXkKIyBDT05GSUdfRUxGX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19QQ1NQS1Jf
UExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfQkFTRV9GVUxMPXkKQ09ORklHX0ZVVEVYPXkKQ09O
RklHX0ZVVEVYX1BJPXkKQ09ORklHX0VQT0xMPXkKQ09ORklHX1NJR05BTEZEPXkKQ09ORklHX1RJ
TUVSRkQ9eQpDT05GSUdfRVZFTlRGRD15CkNPTkZJR19TSE1FTT15CiMgQ09ORklHX0FJTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lPX1VSSU5HIGlzIG5vdCBzZXQKQ09ORklHX0FEVklTRV9TWVNDQUxM
Uz15CkNPTkZJR19NRU1CQVJSSUVSPXkKQ09ORklHX0tBTExTWU1TPXkKQ09ORklHX0tBTExTWU1T
X0FMTD15CkNPTkZJR19LQUxMU1lNU19BQlNPTFVURV9QRVJDUFU9eQpDT05GSUdfS0FMTFNZTVNf
QkFTRV9SRUxBVElWRT15CkNPTkZJR19BUkNIX0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNP
TkZJR19LQ01QPXkKIyBDT05GSUdfUlNFUSBpcyBub3Qgc2V0CkNPTkZJR19FTUJFRERFRD15CkNP
TkZJR19IQVZFX1BFUkZfRVZFTlRTPXkKQ09ORklHX0dVRVNUX1BFUkZfRVZFTlRTPXkKQ09ORklH
X1BFUkZfVVNFX1ZNQUxMT0M9eQojIENPTkZJR19QQzEwNCBpcyBub3Qgc2V0CgojCiMgS2VybmVs
IFBlcmZvcm1hbmNlIEV2ZW50cyBBbmQgQ291bnRlcnMKIwpDT05GSUdfUEVSRl9FVkVOVFM9eQpD
T05GSUdfREVCVUdfUEVSRl9VU0VfVk1BTExPQz15CiMgZW5kIG9mIEtlcm5lbCBQZXJmb3JtYW5j
ZSBFdmVudHMgQW5kIENvdW50ZXJzCgpDT05GSUdfU1lTVEVNX0RBVEFfVkVSSUZJQ0FUSU9OPXkK
IyBDT05GSUdfUFJPRklMSU5HIGlzIG5vdCBzZXQKQ09ORklHX1RSQUNFUE9JTlRTPXkKIyBlbmQg
b2YgR2VuZXJhbCBzZXR1cAoKQ09ORklHXzY0QklUPXkKQ09ORklHX1g4Nl82ND15CkNPTkZJR19Y
ODY9eQpDT05GSUdfSU5TVFJVQ1RJT05fREVDT0RFUj15CkNPTkZJR19PVVRQVVRfRk9STUFUPSJl
bGY2NC14ODYtNjQiCkNPTkZJR19MT0NLREVQX1NVUFBPUlQ9eQpDT05GSUdfU1RBQ0tUUkFDRV9T
VVBQT1JUPXkKQ09ORklHX01NVT15CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUlOPTI4CkNP
TkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUFYPTMyCkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBB
VF9CSVRTX01JTj04CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTX01BWD0xNgpDT05G
SUdfR0VORVJJQ19JU0FfRE1BPXkKQ09ORklHX0dFTkVSSUNfQlVHPXkKQ09ORklHX0dFTkVSSUNf
QlVHX1JFTEFUSVZFX1BPSU5URVJTPXkKQ09ORklHX0FSQ0hfTUFZX0hBVkVfUENfRkRDPXkKQ09O
RklHX0dFTkVSSUNfQ0FMSUJSQVRFX0RFTEFZPXkKQ09ORklHX0FSQ0hfSEFTX0NQVV9SRUxBWD15
CkNPTkZJR19BUkNIX0hJQkVSTkFUSU9OX1BPU1NJQkxFPXkKQ09ORklHX0FSQ0hfTlJfR1BJTz0x
MDI0CkNPTkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9eQpDT05GSUdfQVVESVRfQVJDSD15CkNP
TkZJR19YODZfNjRfU01QPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19G
SVhfRUFSTFlDT05fTUVNPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTQKQ09ORklHX0NDX0hBU19T
QU5FX1NUQUNLUFJPVEVDVE9SPXkKCiMKIyBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMKIwpD
T05GSUdfU01QPXkKQ09ORklHX1g4Nl9GRUFUVVJFX05BTUVTPXkKIyBDT05GSUdfWDg2X1gyQVBJ
QyBpcyBub3Qgc2V0CkNPTkZJR19YODZfTVBQQVJTRT15CiMgQ09ORklHX0dPTERGSVNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfWDg2X0NQVV9SRVNDVFJMIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0VY
VEVOREVEX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0lOVEVMX0xQU1MgaXMgbm90
IHNldAojIENPTkZJR19YODZfQU1EX1BMQVRGT1JNX0RFVklDRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lPU0ZfTUJJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfT01JVF9GUkFNRV9QT0lOVEVSIGlz
IG5vdCBzZXQKQ09ORklHX0hZUEVSVklTT1JfR1VFU1Q9eQpDT05GSUdfUEFSQVZJUlQ9eQojIENP
TkZJR19QQVJBVklSVF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBUkFWSVJUX1NQSU5MT0NL
UyBpcyBub3Qgc2V0CkNPTkZJR19YODZfSFZfQ0FMTEJBQ0tfVkVDVE9SPXkKIyBDT05GSUdfWEVO
IGlzIG5vdCBzZXQKQ09ORklHX0tWTV9HVUVTVD15CkNPTkZJR19BUkNIX0NQVUlETEVfSEFMVFBP
TEw9eQojIENPTkZJR19QVkggaXMgbm90IHNldAojIENPTkZJR19QQVJBVklSVF9USU1FX0FDQ09V
TlRJTkcgaXMgbm90IHNldApDT05GSUdfUEFSQVZJUlRfQ0xPQ0s9eQojIENPTkZJR19KQUlMSE9V
U0VfR1VFU1QgaXMgbm90IHNldAojIENPTkZJR19BQ1JOX0dVRVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUs4IGlzIG5vdCBzZXQKIyBDT05GSUdfTVBTQyBpcyBub3Qgc2V0CiMgQ09ORklHX01DT1JF
MiBpcyBub3Qgc2V0CiMgQ09ORklHX01BVE9NIGlzIG5vdCBzZXQKQ09ORklHX0dFTkVSSUNfQ1BV
PXkKQ09ORklHX1g4Nl9JTlRFUk5PREVfQ0FDSEVfU0hJRlQ9NgpDT05GSUdfWDg2X0wxX0NBQ0hF
X1NISUZUPTYKQ09ORklHX1g4Nl9UU0M9eQpDT05GSUdfWDg2X0NNUFhDSEc2ND15CkNPTkZJR19Y
ODZfQ01PVj15CkNPTkZJR19YODZfTUlOSU1VTV9DUFVfRkFNSUxZPTY0CkNPTkZJR19YODZfREVC
VUdDVExNU1I9eQpDT05GSUdfSUEzMl9GRUFUX0NUTD15CkNPTkZJR19YODZfVk1YX0ZFQVRVUkVf
TkFNRVM9eQpDT05GSUdfUFJPQ0VTU09SX1NFTEVDVD15CkNPTkZJR19DUFVfU1VQX0lOVEVMPXkK
IyBDT05GSUdfQ1BVX1NVUF9BTUQgaXMgbm90IHNldAojIENPTkZJR19DUFVfU1VQX0hZR09OIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1BVX1NVUF9DRU5UQVVSIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BV
X1NVUF9aSEFPWElOIGlzIG5vdCBzZXQKQ09ORklHX0hQRVRfVElNRVI9eQojIENPTkZJR19ETUkg
aXMgbm90IHNldApDT05GSUdfQk9PVF9WRVNBX1NVUFBPUlQ9eQpDT05GSUdfTUFYU01QPXkKQ09O
RklHX05SX0NQVVNfUkFOR0VfQkVHSU49ODE5MgpDT05GSUdfTlJfQ1BVU19SQU5HRV9FTkQ9ODE5
MgpDT05GSUdfTlJfQ1BVU19ERUZBVUxUPTgxOTIKQ09ORklHX05SX0NQVVM9ODE5MgpDT05GSUdf
U0NIRURfQ0xVU1RFUj15CkNPTkZJR19TQ0hFRF9TTVQ9eQojIENPTkZJR19TQ0hFRF9NQyBpcyBu
b3Qgc2V0CkNPTkZJR19YODZfTE9DQUxfQVBJQz15CkNPTkZJR19YODZfSU9fQVBJQz15CiMgQ09O
RklHX1g4Nl9SRVJPVVRFX0ZPUl9CUk9LRU5fQk9PVF9JUlFTIGlzIG5vdCBzZXQKIyBDT05GSUdf
WDg2X01DRSBpcyBub3Qgc2V0CgojCiMgUGVyZm9ybWFuY2UgbW9uaXRvcmluZwojCkNPTkZJR19Q
RVJGX0VWRU5UU19JTlRFTF9VTkNPUkU9eQpDT05GSUdfUEVSRl9FVkVOVFNfSU5URUxfUkFQTD15
CkNPTkZJR19QRVJGX0VWRU5UU19JTlRFTF9DU1RBVEU9eQojIGVuZCBvZiBQZXJmb3JtYW5jZSBt
b25pdG9yaW5nCgpDT05GSUdfWDg2X1ZTWVNDQUxMX0VNVUxBVElPTj15CiMgQ09ORklHX1g4Nl9J
T1BMX0lPUEVSTSBpcyBub3Qgc2V0CiMgQ09ORklHX01JQ1JPQ09ERSBpcyBub3Qgc2V0CkNPTkZJ
R19YODZfTVNSPXkKQ09ORklHX1g4Nl9DUFVJRD15CiMgQ09ORklHX1g4Nl81TEVWRUwgaXMgbm90
IHNldApDT05GSUdfWDg2X0RJUkVDVF9HQlBBR0VTPXkKIyBDT05GSUdfWDg2X0NQQV9TVEFUSVNU
SUNTIGlzIG5vdCBzZXQKQ09ORklHX05VTUE9eQojIENPTkZJR19BTURfTlVNQSBpcyBub3Qgc2V0
CkNPTkZJR19YODZfNjRfQUNQSV9OVU1BPXkKIyBDT05GSUdfTlVNQV9FTVUgaXMgbm90IHNldApD
T05GSUdfTk9ERVNfU0hJRlQ9MTAKQ09ORklHX0FSQ0hfU1BBUlNFTUVNX0VOQUJMRT15CkNPTkZJ
R19BUkNIX1NQQVJTRU1FTV9ERUZBVUxUPXkKQ09ORklHX0FSQ0hfTUVNT1JZX1BST0JFPXkKQ09O
RklHX0lMTEVHQUxfUE9JTlRFUl9WQUxVRT0weGRlYWQwMDAwMDAwMDAwMDAKQ09ORklHX1g4Nl9D
SEVDS19CSU9TX0NPUlJVUFRJT049eQojIENPTkZJR19YODZfQk9PVFBBUkFNX01FTU9SWV9DT1JS
VVBUSU9OX0NIRUNLIGlzIG5vdCBzZXQKQ09ORklHX01UUlI9eQojIENPTkZJR19NVFJSX1NBTklU
SVpFUiBpcyBub3Qgc2V0CkNPTkZJR19YODZfUEFUPXkKQ09ORklHX0FSQ0hfVVNFU19QR19VTkNB
Q0hFRD15CiMgQ09ORklHX1g4Nl9VTUlQIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19JQlQ9eQoj
IENPTkZJR19YODZfS0VSTkVMX0lCVCBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9JTlRFTF9NRU1P
UllfUFJPVEVDVElPTl9LRVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0lOVEVMX1RTWF9NT0RF
X09GRiBpcyBub3Qgc2V0CkNPTkZJR19YODZfSU5URUxfVFNYX01PREVfT049eQojIENPTkZJR19Y
ODZfSU5URUxfVFNYX01PREVfQVVUTyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9TR1ggaXMgbm90
IHNldAojIENPTkZJR19FRkkgaXMgbm90IHNldAojIENPTkZJR19IWl8xMDAgaXMgbm90IHNldApD
T05GSUdfSFpfMjUwPXkKIyBDT05GSUdfSFpfMzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMTAw
MCBpcyBub3Qgc2V0CkNPTkZJR19IWj0yNTAKQ09ORklHX1NDSEVEX0hSVElDSz15CiMgQ09ORklH
X0tFWEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VYRUNfRklMRSBpcyBub3Qgc2V0CkNPTkZJR19D
UkFTSF9EVU1QPXkKQ09ORklHX1BIWVNJQ0FMX1NUQVJUPTB4MTAwMDAwMApDT05GSUdfUkVMT0NB
VEFCTEU9eQojIENPTkZJR19SQU5ET01JWkVfQkFTRSBpcyBub3Qgc2V0CkNPTkZJR19QSFlTSUNB
TF9BTElHTj0weDIwMDAwMApDT05GSUdfSE9UUExVR19DUFU9eQojIENPTkZJR19CT09UUEFSQU1f
SE9UUExVR19DUFUwIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSE9UUExVR19DUFUwIGlzIG5v
dCBzZXQKQ09ORklHX0NPTVBBVF9WRFNPPXkKQ09ORklHX0xFR0FDWV9WU1lTQ0FMTF9YT05MWT15
CiMgQ09ORklHX0xFR0FDWV9WU1lTQ0FMTF9OT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01ETElO
RV9CT09MIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9ESUZZX0xEVF9TWVNDQUxMIGlzIG5vdCBzZXQK
Q09ORklHX1NUUklDVF9TSUdBTFRTVEFDS19TSVpFPXkKQ09ORklHX0hBVkVfTElWRVBBVENIPXkK
Q09ORklHX0xJVkVQQVRDSD15CiMgZW5kIG9mIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwoK
Q09ORklHX0NDX0hBU19TTFM9eQpDT05GSUdfQ0NfSEFTX1JFVFVSTl9USFVOSz15CkNPTkZJR19T
UEVDVUxBVElPTl9NSVRJR0FUSU9OUz15CkNPTkZJR19QQUdFX1RBQkxFX0lTT0xBVElPTj15CiMg
Q09ORklHX1JFVFBPTElORSBpcyBub3Qgc2V0CkNPTkZJR19DUFVfSUJSU19FTlRSWT15CiMgQ09O
RklHX1NMUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19BRERfUEFHRVM9eQpDT05GSUdfQVJD
SF9NSFBfTUVNTUFQX09OX01FTU9SWV9FTkFCTEU9eQoKIwojIFBvd2VyIG1hbmFnZW1lbnQgYW5k
IEFDUEkgb3B0aW9ucwojCkNPTkZJR19TVVNQRU5EPXkKQ09ORklHX1NVU1BFTkRfRlJFRVpFUj15
CkNPTkZJR19TVVNQRU5EX1NLSVBfU1lOQz15CkNPTkZJR19QTV9TTEVFUD15CkNPTkZJR19QTV9T
TEVFUF9TTVA9eQpDT05GSUdfUE1fQVVUT1NMRUVQPXkKIyBDT05GSUdfUE1fVVNFUlNQQUNFX0FV
VE9TTEVFUCBpcyBub3Qgc2V0CkNPTkZJR19QTV9XQUtFTE9DS1M9eQpDT05GSUdfUE1fV0FLRUxP
Q0tTX0xJTUlUPTEwMAojIENPTkZJR19QTV9XQUtFTE9DS1NfR0MgaXMgbm90IHNldApDT05GSUdf
UE09eQpDT05GSUdfUE1fREVCVUc9eQpDT05GSUdfUE1fQURWQU5DRURfREVCVUc9eQojIENPTkZJ
R19QTV9URVNUX1NVU1BFTkQgaXMgbm90IHNldApDT05GSUdfUE1fU0xFRVBfREVCVUc9eQpDT05G
SUdfRFBNX1dBVENIRE9HPXkKQ09ORklHX0RQTV9XQVRDSERPR19USU1FT1VUPTEyMAojIENPTkZJ
R19QTV9UUkFDRV9SVEMgaXMgbm90IHNldApDT05GSUdfUE1fQ0xLPXkKIyBDT05GSUdfV1FfUE9X
RVJfRUZGSUNJRU5UX0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJR19FTkVSR1lfTU9ERUwgaXMg
bm90IHNldApDT05GSUdfQVJDSF9TVVBQT1JUU19BQ1BJPXkKQ09ORklHX0FDUEk9eQpDT05GSUdf
QUNQSV9MRUdBQ1lfVEFCTEVTX0xPT0tVUD15CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfQUNQSV9Q
REM9eQpDT05GSUdfQUNQSV9TWVNURU1fUE9XRVJfU1RBVEVTX1NVUFBPUlQ9eQojIENPTkZJR19B
Q1BJX0RFQlVHR0VSIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfU1BDUl9UQUJMRT15CiMgQ09ORklH
X0FDUElfRlBEVCBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0xQSVQ9eQpDT05GSUdfQUNQSV9TTEVF
UD15CkNPTkZJR19BQ1BJX1JFVl9PVkVSUklERV9QT1NTSUJMRT15CiMgQ09ORklHX0FDUElfRUNf
REVCVUdGUyBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0FDPXkKQ09ORklHX0FDUElfQkFUVEVSWT15
CkNPTkZJR19BQ1BJX0JVVFRPTj15CiMgQ09ORklHX0FDUElfVklERU8gaXMgbm90IHNldApDT05G
SUdfQUNQSV9GQU49eQojIENPTkZJR19BQ1BJX1RBRCBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElf
RE9DSyBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0NQVV9GUkVRX1BTUz15CkNPTkZJR19BQ1BJX1BS
T0NFU1NPUl9DU1RBVEU9eQpDT05GSUdfQUNQSV9QUk9DRVNTT1JfSURMRT15CkNPTkZJR19BQ1BJ
X1BST0NFU1NPUj15CiMgQ09ORklHX0FDUElfSVBNSSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0hP
VFBMVUdfQ1BVPXkKIyBDT05GSUdfQUNQSV9QUk9DRVNTT1JfQUdHUkVHQVRPUiBpcyBub3Qgc2V0
CkNPTkZJR19BQ1BJX1RIRVJNQUw9eQpDT05GSUdfQVJDSF9IQVNfQUNQSV9UQUJMRV9VUEdSQURF
PXkKQ09ORklHX0FDUElfVEFCTEVfVVBHUkFERT15CiMgQ09ORklHX0FDUElfREVCVUcgaXMgbm90
IHNldAojIENPTkZJR19BQ1BJX1BDSV9TTE9UIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfQ09OVEFJ
TkVSPXkKIyBDT05GSUdfQUNQSV9IT1RQTFVHX01FTU9SWSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJ
X0hPVFBMVUdfSU9BUElDPXkKIyBDT05GSUdfQUNQSV9TQlMgaXMgbm90IHNldAojIENPTkZJR19B
Q1BJX0hFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfQ1VTVE9NX01FVEhPRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0FDUElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZIGlzIG5vdCBzZXQKQ09ORklHX0FD
UElfTlVNQT15CiMgQ09ORklHX0FDUElfSE1BVCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FDUElf
QVBFST15CkNPTkZJR19IQVZFX0FDUElfQVBFSV9OTUk9eQojIENPTkZJR19BQ1BJX0FQRUkgaXMg
bm90IHNldAojIENPTkZJR19BQ1BJX0RQVEYgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX0NPTkZJ
R0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9QRlJVVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BN
SUNfT1BSRUdJT04gaXMgbm90IHNldApDT05GSUdfQUNQSV9WSU9UPXkKQ09ORklHX1g4Nl9QTV9U
SU1FUj15CgojCiMgQ1BVIEZyZXF1ZW5jeSBzY2FsaW5nCiMKQ09ORklHX0NQVV9GUkVRPXkKQ09O
RklHX0NQVV9GUkVRX0dPVl9BVFRSX1NFVD15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQ09NTU9OPXkK
Q09ORklHX0NQVV9GUkVRX1NUQVQ9eQojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QRVJG
T1JNQU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FW
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1VTRVJTUEFDRSBpcyBu
b3Qgc2V0CkNPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9TQ0hFRFVUSUw9eQpDT05GSUdfQ1BV
X0ZSRVFfR09WX1BFUkZPUk1BTkNFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9QT1dFUlNBVkU9bQoj
IENPTkZJR19DUFVfRlJFUV9HT1ZfVVNFUlNQQUNFIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVR
X0dPVl9PTkRFTUFORD15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQ09OU0VSVkFUSVZFPW0KQ09ORklH
X0NQVV9GUkVRX0dPVl9TQ0hFRFVUSUw9eQoKIwojIENQVSBmcmVxdWVuY3kgc2NhbGluZyBkcml2
ZXJzCiMKQ09ORklHX0NQVUZSRVFfRFQ9bQpDT05GSUdfQ1BVRlJFUV9EVF9QTEFUREVWPXkKQ09O
RklHX1g4Nl9JTlRFTF9QU1RBVEU9eQojIENPTkZJR19YODZfUENDX0NQVUZSRVEgaXMgbm90IHNl
dAojIENPTkZJR19YODZfQU1EX1BTVEFURSBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9BQ1BJX0NQ
VUZSRVEgaXMgbm90IHNldAojIENPTkZJR19YODZfU1BFRURTVEVQX0NFTlRSSU5PIGlzIG5vdCBz
ZXQKIyBDT05GSUdfWDg2X1A0X0NMT0NLTU9EIGlzIG5vdCBzZXQKCiMKIyBzaGFyZWQgb3B0aW9u
cwojCiMgZW5kIG9mIENQVSBGcmVxdWVuY3kgc2NhbGluZwoKIwojIENQVSBJZGxlCiMKQ09ORklH
X0NQVV9JRExFPXkKQ09ORklHX0NQVV9JRExFX0dPVl9MQURERVI9eQojIENPTkZJR19DUFVfSURM
RV9HT1ZfTUVOVSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9JRExFX0dPVl9URU8gaXMgbm90IHNl
dAojIENPTkZJR19DUFVfSURMRV9HT1ZfSEFMVFBPTEwgaXMgbm90IHNldApDT05GSUdfSEFMVFBP
TExfQ1BVSURMRT15CiMgZW5kIG9mIENQVSBJZGxlCgojIENPTkZJR19JTlRFTF9JRExFIGlzIG5v
dCBzZXQKIyBlbmQgb2YgUG93ZXIgbWFuYWdlbWVudCBhbmQgQUNQSSBvcHRpb25zCgojCiMgQnVz
IG9wdGlvbnMgKFBDSSBldGMuKQojCkNPTkZJR19QQ0lfRElSRUNUPXkKQ09ORklHX1BDSV9NTUNP
TkZJRz15CkNPTkZJR19NTUNPTkZfRkFNMTBIPXkKIyBDT05GSUdfUENJX0NOQjIwTEVfUVVJUksg
aXMgbm90IHNldAojIENPTkZJR19JU0FfQlVTIGlzIG5vdCBzZXQKQ09ORklHX0lTQV9ETUFfQVBJ
PXkKIyBlbmQgb2YgQnVzIG9wdGlvbnMgKFBDSSBldGMuKQoKIwojIEJpbmFyeSBFbXVsYXRpb25z
CiMKQ09ORklHX0lBMzJfRU1VTEFUSU9OPXkKQ09ORklHX1g4Nl9YMzJfQUJJPXkKQ09ORklHX0NP
TVBBVF8zMj15CkNPTkZJR19DT01QQVQ9eQpDT05GSUdfQ09NUEFUX0ZPUl9VNjRfQUxJR05NRU5U
PXkKIyBlbmQgb2YgQmluYXJ5IEVtdWxhdGlvbnMKCkNPTkZJR19IQVZFX0tWTT15CkNPTkZJR19I
QVZFX0tWTV9QRk5DQUNIRT15CkNPTkZJR19IQVZFX0tWTV9JUlFDSElQPXkKQ09ORklHX0hBVkVf
S1ZNX0lSUUZEPXkKQ09ORklHX0hBVkVfS1ZNX0lSUV9ST1VUSU5HPXkKQ09ORklHX0hBVkVfS1ZN
X0RJUlRZX1JJTkc9eQpDT05GSUdfSEFWRV9LVk1fRVZFTlRGRD15CkNPTkZJR19LVk1fTU1JTz15
CkNPTkZJR19LVk1fQVNZTkNfUEY9eQpDT05GSUdfSEFWRV9LVk1fTVNJPXkKQ09ORklHX0hBVkVf
S1ZNX0NQVV9SRUxBWF9JTlRFUkNFUFQ9eQpDT05GSUdfS1ZNX1ZGSU89eQpDT05GSUdfS1ZNX0dF
TkVSSUNfRElSVFlMT0dfUkVBRF9QUk9URUNUPXkKQ09ORklHX0tWTV9DT01QQVQ9eQpDT05GSUdf
SEFWRV9LVk1fSVJRX0JZUEFTUz15CkNPTkZJR19IQVZFX0tWTV9OT19QT0xMPXkKQ09ORklHX0tW
TV9YRkVSX1RPX0dVRVNUX1dPUks9eQpDT05GSUdfSEFWRV9LVk1fUE1fTk9USUZJRVI9eQpDT05G
SUdfVklSVFVBTElaQVRJT049eQpDT05GSUdfS1ZNPXkKIyBDT05GSUdfS1ZNX1dFUlJPUiBpcyBu
b3Qgc2V0CkNPTkZJR19LVk1fSU5URUw9bQojIENPTkZJR19LVk1fQU1EIGlzIG5vdCBzZXQKQ09O
RklHX0tWTV9YRU49eQpDT05GSUdfQVNfQVZYNTEyPXkKQ09ORklHX0FTX1NIQTFfTkk9eQpDT05G
SUdfQVNfU0hBMjU2X05JPXkKQ09ORklHX0FTX1RQQVVTRT15CgojCiMgR2VuZXJhbCBhcmNoaXRl
Y3R1cmUtZGVwZW5kZW50IG9wdGlvbnMKIwpDT05GSUdfSE9UUExVR19TTVQ9eQpDT05GSUdfR0VO
RVJJQ19FTlRSWT15CiMgQ09ORklHX0tQUk9CRVMgaXMgbm90IHNldApDT05GSUdfSlVNUF9MQUJF
TD15CiMgQ09ORklHX1NUQVRJQ19LRVlTX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RB
VElDX0NBTExfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfSEFWRV9FRkZJQ0lFTlRfVU5BTElH
TkVEX0FDQ0VTUz15CkNPTkZJR19BUkNIX1VTRV9CVUlMVElOX0JTV0FQPXkKQ09ORklHX1VTRVJf
UkVUVVJOX05PVElGSUVSPXkKQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9UPXkKQ09ORklHX0hBVkVf
S1BST0JFUz15CkNPTkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdfSEFWRV9PUFRQUk9CRVM9
eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19BUkNIX0NPUlJFQ1RfU1RB
Q0tUUkFDRV9PTl9LUkVUUFJPQkU9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJPUl9JTkpFQ1RJ
T049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVD15CkNP
TkZJR19UUkFDRV9JUlFGTEFHU19OTUlfU1VQUE9SVD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBQ0VI
T09LPXkKQ09ORklHX0hBVkVfRE1BX0NPTlRJR1VPVVM9eQpDT05GSUdfR0VORVJJQ19TTVBfSURM
RV9USFJFQUQ9eQpDT05GSUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9eQpDT05GSUdfQVJDSF9I
QVNfU0VUX01FTU9SWT15CkNPTkZJR19BUkNIX0hBU19TRVRfRElSRUNUX01BUD15CkNPTkZJR19I
QVZFX0FSQ0hfVEhSRUFEX1NUUlVDVF9XSElURUxJU1Q9eQpDT05GSUdfQVJDSF9XQU5UU19EWU5B
TUlDX1RBU0tfU1RSVUNUPXkKQ09ORklHX0FSQ0hfV0FOVFNfTk9fSU5TVFI9eQpDT05GSUdfSEFW
RV9BU01fTU9EVkVSU0lPTlM9eQpDT05GSUdfSEFWRV9SRUdTX0FORF9TVEFDS19BQ0NFU1NfQVBJ
PXkKQ09ORklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX1JVU1Q9eQpDT05GSUdfSEFWRV9GVU5D
VElPTl9BUkdfQUNDRVNTX0FQST15CkNPTkZJR19IQVZFX0hXX0JSRUFLUE9JTlQ9eQpDT05GSUdf
SEFWRV9NSVhFRF9CUkVBS1BPSU5UU19SRUdTPXkKQ09ORklHX0hBVkVfVVNFUl9SRVRVUk5fTk9U
SUZJRVI9eQpDT05GSUdfSEFWRV9QRVJGX0VWRU5UU19OTUk9eQpDT05GSUdfSEFWRV9IQVJETE9D
S1VQX0RFVEVDVE9SX1BFUkY9eQpDT05GSUdfSEFWRV9QRVJGX1JFR1M9eQpDT05GSUdfSEFWRV9Q
RVJGX1VTRVJfU1RBQ0tfRFVNUD15CkNPTkZJR19IQVZFX0FSQ0hfSlVNUF9MQUJFTD15CkNPTkZJ
R19IQVZFX0FSQ0hfSlVNUF9MQUJFTF9SRUxBVElWRT15CkNPTkZJR19NTVVfR0FUSEVSX1RBQkxF
X0ZSRUU9eQpDT05GSUdfTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FU
SEVSX01FUkdFX1ZNQVM9eQpDT05GSUdfQVJDSF9IQVZFX05NSV9TQUZFX0NNUFhDSEc9eQpDT05G
SUdfSEFWRV9DTVBYQ0hHX0xPQ0FMPXkKQ09ORklHX0hBVkVfQ01QWENIR19ET1VCTEU9eQpDT05G
SUdfQVJDSF9XQU5UX0NPTVBBVF9JUENfUEFSU0VfVkVSU0lPTj15CkNPTkZJR19BUkNIX1dBTlRf
T0xEX0NPTVBBVF9JUEM9eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NPTVA9eQpDT05GSUdfSEFWRV9B
UkNIX1NFQ0NPTVBfRklMVEVSPXkKQ09ORklHX1NFQ0NPTVA9eQpDT05GSUdfU0VDQ09NUF9GSUxU
RVI9eQojIENPTkZJR19TRUNDT01QX0NBQ0hFX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVf
QVJDSF9TVEFDS0xFQUs9eQpDT05GSUdfSEFWRV9TVEFDS1BST1RFQ1RPUj15CkNPTkZJR19TVEFD
S1BST1RFQ1RPUj15CiMgQ09ORklHX1NUQUNLUFJPVEVDVE9SX1NUUk9ORyBpcyBub3Qgc2V0CkNP
TkZJR19BUkNIX1NVUFBPUlRTX0xUT19DTEFORz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0xUT19D
TEFOR19USElOPXkKQ09ORklHX0xUT19OT05FPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQ0ZJX0NM
QU5HPXkKQ09ORklHX0hBVkVfQVJDSF9XSVRISU5fU1RBQ0tfRlJBTUVTPXkKQ09ORklHX0hBVkVf
Q09OVEVYVF9UUkFDS0lOR19VU0VSPXkKQ09ORklHX0hBVkVfQ09OVEVYVF9UUkFDS0lOR19VU0VS
X09GRlNUQUNLPXkKQ09ORklHX0hBVkVfVklSVF9DUFVfQUNDT1VOVElOR19HRU49eQpDT05GSUdf
SEFWRV9JUlFfVElNRV9BQ0NPVU5USU5HPXkKQ09ORklHX0hBVkVfTU9WRV9QVUQ9eQpDT05GSUdf
SEFWRV9NT1ZFX1BNRD15CkNPTkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0U9eQpD
T05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRD15CkNPTkZJR19IQVZFX0FS
Q0hfSFVHRV9WTUFQPXkKQ09ORklHX0hBVkVfQVJDSF9IVUdFX1ZNQUxMT0M9eQpDT05GSUdfQVJD
SF9XQU5UX0hVR0VfUE1EX1NIQVJFPXkKQ09ORklHX0hBVkVfQVJDSF9TT0ZUX0RJUlRZPXkKQ09O
RklHX0hBVkVfTU9EX0FSQ0hfU1BFQ0lGSUM9eQpDT05GSUdfTU9EVUxFU19VU0VfRUxGX1JFTEE9
eQpDT05GSUdfSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0s9eQpDT05GSUdfSEFWRV9TT0ZUSVJR
X09OX09XTl9TVEFDSz15CkNPTkZJR19TT0ZUSVJRX09OX09XTl9TVEFDSz15CkNPTkZJR19BUkNI
X0hBU19FTEZfUkFORE9NSVpFPXkKQ09ORklHX0hBVkVfQVJDSF9NTUFQX1JORF9CSVRTPXkKQ09O
RklHX0hBVkVfRVhJVF9USFJFQUQ9eQpDT05GSUdfQVJDSF9NTUFQX1JORF9CSVRTPTI4CkNPTkZJ
R19IQVZFX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFM9eQpDT05GSUdfQVJDSF9NTUFQX1JORF9D
T01QQVRfQklUUz04CkNPTkZJR19IQVZFX0FSQ0hfQ09NUEFUX01NQVBfQkFTRVM9eQpDT05GSUdf
UEFHRV9TSVpFX0xFU1NfVEhBTl82NEtCPXkKQ09ORklHX1BBR0VfU0laRV9MRVNTX1RIQU5fMjU2
S0I9eQpDT05GSUdfSEFWRV9PQkpUT09MPXkKQ09ORklHX0hBVkVfSlVNUF9MQUJFTF9IQUNLPXkK
Q09ORklHX0hBVkVfTk9JTlNUUl9IQUNLPXkKQ09ORklHX0hBVkVfTk9JTlNUUl9WQUxJREFUSU9O
PXkKQ09ORklHX0hBVkVfVUFDQ0VTU19WQUxJREFUSU9OPXkKQ09ORklHX0hBVkVfU1RBQ0tfVkFM
SURBVElPTj15CkNPTkZJR19IQVZFX1JFTElBQkxFX1NUQUNLVFJBQ0U9eQpDT05GSUdfSVNBX0JV
U19BUEk9eQpDT05GSUdfT0xEX1NJR1NVU1BFTkQzPXkKQ09ORklHX0NPTVBBVF9PTERfU0lHQUNU
SU9OPXkKQ09ORklHX0NPTVBBVF8zMkJJVF9USU1FPXkKQ09ORklHX0hBVkVfQVJDSF9WTUFQX1NU
QUNLPXkKIyBDT05GSUdfVk1BUF9TVEFDSyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfUkFO
RE9NSVpFX0tTVEFDS19PRkZTRVQ9eQojIENPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVCBp
cyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWD15CkNPTkZJR19TVFJJ
Q1RfS0VSTkVMX1JXWD15CkNPTkZJR19BUkNIX0hBU19TVFJJQ1RfTU9EVUxFX1JXWD15CkNPTkZJ
R19TVFJJQ1RfTU9EVUxFX1JXWD15CkNPTkZJR19IQVZFX0FSQ0hfUFJFTDMyX1JFTE9DQVRJT05T
PXkKIyBDT05GSUdfTE9DS19FVkVOVF9DT1VOVFMgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNf
TUVNX0VOQ1JZUFQ9eQpDT05GSUdfSEFWRV9TVEFUSUNfQ0FMTD15CkNPTkZJR19IQVZFX1NUQVRJ
Q19DQUxMX0lOTElORT15CkNPTkZJR19IQVZFX1BSRUVNUFRfRFlOQU1JQz15CkNPTkZJR19IQVZF
X1BSRUVNUFRfRFlOQU1JQ19DQUxMPXkKQ09ORklHX0FSQ0hfV0FOVF9MRF9PUlBIQU5fV0FSTj15
CkNPTkZJR19BUkNIX1NVUFBPUlRTX0RFQlVHX1BBR0VBTExPQz15CkNPTkZJR19BUkNIX1NVUFBP
UlRTX1BBR0VfVEFCTEVfQ0hFQ0s9eQpDT05GSUdfQVJDSF9IQVNfRUxGQ09SRV9DT01QQVQ9eQpD
T05GSUdfQVJDSF9IQVNfUEFSQU5PSURfTDFEX0ZMVVNIPXkKQ09ORklHX0RZTkFNSUNfU0lHRlJB
TUU9eQoKIwojIEdDT1YtYmFzZWQga2VybmVsIHByb2ZpbGluZwojCiMgQ09ORklHX0dDT1ZfS0VS
TkVMIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEw9eQojIGVuZCBv
ZiBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKCkNPTkZJR19IQVZFX0dDQ19QTFVHSU5TPXkK
IyBDT05GSUdfR0NDX1BMVUdJTlMgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmFsIGFyY2hpdGVj
dHVyZS1kZXBlbmRlbnQgb3B0aW9ucwoKQ09ORklHX1JUX01VVEVYRVM9eQpDT05GSUdfQkFTRV9T
TUFMTD0wCkNPTkZJR19NT0RVTEVfU0lHX0ZPUk1BVD15CkNPTkZJR19NT0RVTEVTPXkKIyBDT05G
SUdfTU9EVUxFX0ZPUkNFX0xPQUQgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1VOTE9BRD15CiMg
Q09ORklHX01PRFVMRV9GT1JDRV9VTkxPQUQgaXMgbm90IHNldApDT05GSUdfTU9EVUxFX1VOTE9B
RF9UQUlOVF9UUkFDS0lORz15CiMgQ09ORklHX01PRFZFUlNJT05TIGlzIG5vdCBzZXQKIyBDT05G
SUdfTU9EVUxFX1NSQ1ZFUlNJT05fQUxMIGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9TSUc9eQpD
T05GSUdfTU9EVUxFX1NJR19GT1JDRT15CkNPTkZJR19NT0RVTEVfU0lHX0FMTD15CiMgQ09ORklH
X01PRFVMRV9TSUdfU0hBMSBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUdfU0hBMjI0IGlz
IG5vdCBzZXQKQ09ORklHX01PRFVMRV9TSUdfU0hBMjU2PXkKIyBDT05GSUdfTU9EVUxFX1NJR19T
SEEzODQgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU0lHX1NIQTUxMiBpcyBub3Qgc2V0CkNP
TkZJR19NT0RVTEVfU0lHX0hBU0g9InNoYTI1NiIKQ09ORklHX01PRFVMRV9DT01QUkVTU19OT05F
PXkKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX0daSVAgaXMgbm90IHNldAojIENPTkZJR19NT0RV
TEVfQ09NUFJFU1NfWFogaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWlNURCBp
cyBub3Qgc2V0CkNPTkZJR19NT0RVTEVfQUxMT1dfTUlTU0lOR19OQU1FU1BBQ0VfSU1QT1JUUz15
CkNPTkZJR19NT0RQUk9CRV9QQVRIPSIvc2Jpbi9tb2Rwcm9iZSIKIyBDT05GSUdfVFJJTV9VTlVT
RURfS1NZTVMgaXMgbm90IHNldApDT05GSUdfTU9EVUxFU19UUkVFX0xPT0tVUD15CiMgQ09ORklH
X0JMT0NLIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFRfTk9USUZJRVJTPXkKQ09ORklHX0FTTjE9
eQpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19BVE9N
SUNfUk1XPXkKQ09ORklHX01VVEVYX1NQSU5fT05fT1dORVI9eQpDT05GSUdfUldTRU1fU1BJTl9P
Tl9PV05FUj15CkNPTkZJR19MT0NLX1NQSU5fT05fT1dORVI9eQpDT05GSUdfQVJDSF9VU0VfUVVF
VUVEX1NQSU5MT0NLUz15CkNPTkZJR19RVUVVRURfU1BJTkxPQ0tTPXkKQ09ORklHX0FSQ0hfVVNF
X1FVRVVFRF9SV0xPQ0tTPXkKQ09ORklHX1FVRVVFRF9SV0xPQ0tTPXkKQ09ORklHX0FSQ0hfSEFT
X05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNFPXkKQ09ORklHX0FSQ0hfSEFTX1NZTkNfQ09S
RV9CRUZPUkVfVVNFUk1PREU9eQpDT05GSUdfQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKQ09O
RklHX0ZSRUVaRVI9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZN
VF9FTEY9eQpDT05GSUdfQ09NUEFUX0JJTkZNVF9FTEY9eQpDT05GSUdfRUxGQ09SRT15CkNPTkZJ
R19CSU5GTVRfU0NSSVBUPXkKQ09ORklHX0JJTkZNVF9NSVNDPW0KQ09ORklHX0NPUkVEVU1QPXkK
IyBlbmQgb2YgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1vcnkgTWFuYWdlbWVudCBv
cHRpb25zCiMKCiMKIyBTTEFCIGFsbG9jYXRvciBvcHRpb25zCiMKIyBDT05GSUdfU0xBQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NMVUIgaXMgbm90IHNldApDT05GSUdfU0xPQj15CiMgZW5kIG9mIFNM
QUIgYWxsb2NhdG9yIG9wdGlvbnMKCkNPTkZJR19TSFVGRkxFX1BBR0VfQUxMT0NBVE9SPXkKIyBD
T05GSUdfQ09NUEFUX0JSSyBpcyBub3Qgc2V0CkNPTkZJR19TUEFSU0VNRU09eQpDT05GSUdfU1BB
UlNFTUVNX0VYVFJFTUU9eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVBfRU5BQkxFPXkKQ09ORklH
X1NQQVJTRU1FTV9WTUVNTUFQPXkKQ09ORklHX0hBVkVfRkFTVF9HVVA9eQpDT05GSUdfTlVNQV9L
RUVQX01FTUlORk89eQpDT05GSUdfTUVNT1JZX0lTT0xBVElPTj15CkNPTkZJR19FWENMVVNJVkVf
U1lTVEVNX1JBTT15CkNPTkZJR19IQVZFX0JPT1RNRU1fSU5GT19OT0RFPXkKQ09ORklHX0FSQ0hf
RU5BQkxFX01FTU9SWV9IT1RQTFVHPXkKQ09ORklHX0FSQ0hfRU5BQkxFX01FTU9SWV9IT1RSRU1P
VkU9eQpDT05GSUdfTUVNT1JZX0hPVFBMVUc9eQojIENPTkZJR19NRU1PUllfSE9UUExVR19ERUZB
VUxUX09OTElORSBpcyBub3Qgc2V0CkNPTkZJR19NRU1PUllfSE9UUkVNT1ZFPXkKQ09ORklHX01I
UF9NRU1NQVBfT05fTUVNT1JZPXkKQ09ORklHX1NQTElUX1BUTE9DS19DUFVTPTQKQ09ORklHX0FS
Q0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0s9eQpDT05GSUdfTUVNT1JZX0JBTExPT049eQojIENP
TkZJR19CQUxMT09OX0NPTVBBQ1RJT04gaXMgbm90IHNldApDT05GSUdfQ09NUEFDVElPTj15CkNP
TkZJR19QQUdFX1JFUE9SVElORz15CkNPTkZJR19NSUdSQVRJT049eQpDT05GSUdfQVJDSF9FTkFC
TEVfSFVHRVBBR0VfTUlHUkFUSU9OPXkKQ09ORklHX0NPTlRJR19BTExPQz15CkNPTkZJR19QSFlT
X0FERFJfVF82NEJJVD15CkNPTkZJR19NTVVfTk9USUZJRVI9eQojIENPTkZJR19LU00gaXMgbm90
IHNldApDT05GSUdfREVGQVVMVF9NTUFQX01JTl9BRERSPTQwOTYKQ09ORklHX0FSQ0hfV0FOVF9H
RU5FUkFMX0hVR0VUTEI9eQpDT05GSUdfQVJDSF9XQU5UU19USFBfU1dBUD15CiMgQ09ORklHX1RS
QU5TUEFSRU5UX0hVR0VQQUdFIGlzIG5vdCBzZXQKQ09ORklHX05FRURfUEVSX0NQVV9FTUJFRF9G
SVJTVF9DSFVOSz15CkNPTkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSz15CkNPTkZJ
R19VU0VfUEVSQ1BVX05VTUFfTk9ERV9JRD15CkNPTkZJR19IQVZFX1NFVFVQX1BFUl9DUFVfQVJF
QT15CkNPTkZJR19DTUE9eQojIENPTkZJR19DTUFfREVCVUcgaXMgbm90IHNldApDT05GSUdfQ01B
X0RFQlVHRlM9eQojIENPTkZJR19DTUFfU1lTRlMgaXMgbm90IHNldApDT05GSUdfQ01BX0FSRUFT
PTE5CkNPTkZJR19HRU5FUklDX0VBUkxZX0lPUkVNQVA9eQojIENPTkZJR19ERUZFUlJFRF9TVFJV
Q1RfUEFHRV9JTklUIGlzIG5vdCBzZXQKQ09ORklHX1BBR0VfSURMRV9GTEFHPXkKIyBDT05GSUdf
SURMRV9QQUdFX1RSQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0NBQ0hFX0xJTkVf
U0laRT15CkNPTkZJR19BUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVI9eQpDT05GSUdfQVJD
SF9IQVNfUFRFX0RFVk1BUD15CkNPTkZJR19BUkNIX0hBU19aT05FX0RNQV9TRVQ9eQojIENPTkZJ
R19aT05FX0RNQSBpcyBub3Qgc2V0CkNPTkZJR19aT05FX0RNQTMyPXkKIyBDT05GSUdfWk9ORV9E
RVZJQ0UgaXMgbm90IHNldAojIENPTkZJR19WTV9FVkVOVF9DT1VOVEVSUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BFUkNQVV9TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dVUF9URVNUIGlzIG5vdCBz
ZXQKQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMPXkKIyBDT05GSUdfQU5PTl9WTUFfTkFNRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTRVJGQVVMVEZEIGlzIG5vdCBzZXQKCiMKIyBEYXRhIEFjY2Vz
cyBNb25pdG9yaW5nCiMKQ09ORklHX0RBTU9OPXkKQ09ORklHX0RBTU9OX1ZBRERSPXkKIyBDT05G
SUdfREFNT05fUEFERFIgaXMgbm90IHNldApDT05GSUdfREFNT05fU1lTRlM9eQojIGVuZCBvZiBE
YXRhIEFjY2VzcyBNb25pdG9yaW5nCiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMK
CkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUX0lOR1JFU1M9eQpDT05GSUdfTkVUX0VHUkVTUz15CkNP
TkZJR19TS0JfRVhURU5TSU9OUz15CgojCiMgTmV0d29ya2luZyBvcHRpb25zCiMKQ09ORklHX1BB
Q0tFVD15CkNPTkZJR19QQUNLRVRfRElBRz15CkNPTkZJR19VTklYPXkKQ09ORklHX1VOSVhfU0NN
PXkKQ09ORklHX0FGX1VOSVhfT09CPXkKQ09ORklHX1VOSVhfRElBRz1tCiMgQ09ORklHX1RMUyBp
cyBub3Qgc2V0CiMgQ09ORklHX1hGUk1fVVNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9LRVkg
aXMgbm90IHNldApDT05GSUdfSU5FVD15CiMgQ09ORklHX0lQX01VTFRJQ0FTVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQX0FEVkFOQ0VEX1JPVVRFUiBpcyBub3Qgc2V0CkNPTkZJR19JUF9QTlA9eQpD
T05GSUdfSVBfUE5QX0RIQ1A9eQojIENPTkZJR19JUF9QTlBfQk9PVFAgaXMgbm90IHNldAojIENP
TkZJR19JUF9QTlBfUkFSUCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JUElQIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0lQR1JFX0RFTVVYIGlzIG5vdCBzZXQKQ09ORklHX05FVF9JUF9UVU5ORUw9
eQojIENPTkZJR19TWU5fQ09PS0lFUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9JUFZUSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9GT1UgaXMgbm90IHNldAojIENPTkZJR19ORVRfRk9VX0lQX1RV
Tk5FTFMgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0FIIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5F
VF9FU1AgaXMgbm90IHNldAojIENPTkZJR19JTkVUX0lQQ09NUCBpcyBub3Qgc2V0CkNPTkZJR19J
TkVUX1RVTk5FTD15CkNPTkZJR19JTkVUX0RJQUc9eQpDT05GSUdfSU5FVF9UQ1BfRElBRz15CiMg
Q09ORklHX0lORVRfVURQX0RJQUcgaXMgbm90IHNldAojIENPTkZJR19JTkVUX1JBV19ESUFHIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5FVF9ESUFHX0RFU1RST1kgaXMgbm90IHNldAojIENPTkZJR19U
Q1BfQ09OR19BRFZBTkNFRCBpcyBub3Qgc2V0CkNPTkZJR19UQ1BfQ09OR19DVUJJQz15CkNPTkZJ
R19ERUZBVUxUX1RDUF9DT05HPSJjdWJpYyIKIyBDT05GSUdfVENQX01ENVNJRyBpcyBub3Qgc2V0
CkNPTkZJR19JUFY2PXkKIyBDT05GSUdfSVBWNl9ST1VURVJfUFJFRiBpcyBub3Qgc2V0CiMgQ09O
RklHX0lQVjZfT1BUSU1JU1RJQ19EQUQgaXMgbm90IHNldAojIENPTkZJR19JTkVUNl9BSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lORVQ2X0VTUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0lQQ09N
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfTUlQNiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZf
SUxBIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9WVEkgaXMgbm90IHNldApDT05GSUdfSVBWNl9T
SVQ9eQojIENPTkZJR19JUFY2X1NJVF82UkQgaXMgbm90IHNldApDT05GSUdfSVBWNl9ORElTQ19O
T0RFVFlQRT15CiMgQ09ORklHX0lQVjZfVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9N
VUxUSVBMRV9UQUJMRVMgaXMgbm90IHNldAojIENPTkZJR19JUFY2X01ST1VURSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQVjZfU0VHNl9MV1RVTk5FTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0VH
Nl9ITUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9SUExfTFdUVU5ORUwgaXMgbm90IHNldAoj
IENPTkZJR19JUFY2X0lPQU02X0xXVFVOTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUTEFCRUwg
aXMgbm90IHNldApDT05GSUdfTVBUQ1A9eQpDT05GSUdfSU5FVF9NUFRDUF9ESUFHPXkKQ09ORklH
X01QVENQX0lQVjY9eQojIENPTkZJR19ORVRXT1JLX1NFQ01BUksgaXMgbm90IHNldApDT05GSUdf
TkVUX1BUUF9DTEFTU0lGWT15CkNPTkZJR19ORVRXT1JLX1BIWV9USU1FU1RBTVBJTkc9eQpDT05G
SUdfTkVURklMVEVSPXkKIyBDT05GSUdfTkVURklMVEVSX0FEVkFOQ0VEIGlzIG5vdCBzZXQKCiMK
IyBDb3JlIE5ldGZpbHRlciBDb25maWd1cmF0aW9uCiMKQ09ORklHX05FVEZJTFRFUl9JTkdSRVNT
PXkKQ09ORklHX05FVEZJTFRFUl9FR1JFU1M9eQpDT05GSUdfTkVURklMVEVSX05FVExJTks9bQpD
T05GSUdfTkVURklMVEVSX05FVExJTktfTE9HPW0KQ09ORklHX05GX0NPTk5UUkFDSz1tCkNPTkZJ
R19ORl9MT0dfU1lTTE9HPW0KIyBDT05GSUdfTkZfQ09OTlRSQUNLX1BST0NGUyBpcyBub3Qgc2V0
CiMgQ09ORklHX05GX0NPTk5UUkFDS19MQUJFTFMgaXMgbm90IHNldApDT05GSUdfTkZfQ09OTlRS
QUNLX0ZUUD1tCkNPTkZJR19ORl9DT05OVFJBQ0tfSVJDPW0KIyBDT05GSUdfTkZfQ09OTlRSQUNL
X05FVEJJT1NfTlMgaXMgbm90IHNldApDT05GSUdfTkZfQ09OTlRSQUNLX1NJUD1tCkNPTkZJR19O
Rl9DVF9ORVRMSU5LPW0KIyBDT05GSUdfTkVURklMVEVSX05FVExJTktfR0xVRV9DVCBpcyBub3Qg
c2V0CkNPTkZJR19ORl9OQVQ9bQpDT05GSUdfTkZfTkFUX0ZUUD1tCkNPTkZJR19ORl9OQVRfSVJD
PW0KQ09ORklHX05GX05BVF9TSVA9bQpDT05GSUdfTkZfTkFUX01BU1FVRVJBREU9eQojIENPTkZJ
R19ORl9UQUJMRVMgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUQUJMRVM9bQpDT05GSUdf
TkVURklMVEVSX1hUQUJMRVNfQ09NUEFUPXkKCiMKIyBYdGFibGVzIGNvbWJpbmVkIG1vZHVsZXMK
IwpDT05GSUdfTkVURklMVEVSX1hUX01BUks9bQoKIwojIFh0YWJsZXMgdGFyZ2V0cwojCkNPTkZJ
R19ORVRGSUxURVJfWFRfVEFSR0VUX0xPRz1tCkNPTkZJR19ORVRGSUxURVJfWFRfTkFUPW0KIyBD
T05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9ORVRNQVAgaXMgbm90IHNldApDT05GSUdfTkVURklM
VEVSX1hUX1RBUkdFVF9ORkxPRz1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfUkVESVJF
Q1QgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9NQVNRVUVSQURFPW0KQ09O
RklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNTPW0KCiMKIyBYdGFibGVzIG1hdGNoZXMKIwpD
T05GSUdfTkVURklMVEVSX1hUX01BVENIX0FERFJUWVBFPW0KQ09ORklHX05FVEZJTFRFUl9YVF9N
QVRDSF9DT05OVFJBQ0s9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NUQVRFPW0KIyBlbmQg
b2YgQ29yZSBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoKIyBDT05GSUdfSVBfU0VUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVBfVlMgaXMgbm90IHNldAoKIwojIElQOiBOZXRmaWx0ZXIgQ29uZmlndXJh
dGlvbgojCkNPTkZJR19ORl9ERUZSQUdfSVBWND1tCiMgQ09ORklHX05GX1NPQ0tFVF9JUFY0IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkZfVFBST1hZX0lQVjQgaXMgbm90IHNldAojIENPTkZJR19ORl9E
VVBfSVBWNCBpcyBub3Qgc2V0CkNPTkZJR19ORl9MT0dfQVJQPW0KQ09ORklHX05GX0xPR19JUFY0
PW0KQ09ORklHX05GX1JFSkVDVF9JUFY0PW0KQ09ORklHX0lQX05GX0lQVEFCTEVTPW0KQ09ORklH
X0lQX05GX0ZJTFRFUj1tCkNPTkZJR19JUF9ORl9UQVJHRVRfUkVKRUNUPW0KQ09ORklHX0lQX05G
X05BVD1tCiMgQ09ORklHX0lQX05GX1RBUkdFVF9NQVNRVUVSQURFIGlzIG5vdCBzZXQKQ09ORklH
X0lQX05GX01BTkdMRT1tCiMgQ09ORklHX0lQX05GX1JBVyBpcyBub3Qgc2V0CiMgZW5kIG9mIElQ
OiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoKIwojIElQdjY6IE5ldGZpbHRlciBDb25maWd1cmF0
aW9uCiMKIyBDT05GSUdfTkZfU09DS0VUX0lQVjYgaXMgbm90IHNldAojIENPTkZJR19ORl9UUFJP
WFlfSVBWNiBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0RVUF9JUFY2IGlzIG5vdCBzZXQKQ09ORklH
X05GX1JFSkVDVF9JUFY2PW0KQ09ORklHX05GX0xPR19JUFY2PW0KQ09ORklHX0lQNl9ORl9JUFRB
QkxFUz1tCkNPTkZJR19JUDZfTkZfTUFUQ0hfSVBWNkhFQURFUj1tCkNPTkZJR19JUDZfTkZfRklM
VEVSPW0KQ09ORklHX0lQNl9ORl9UQVJHRVRfUkVKRUNUPW0KQ09ORklHX0lQNl9ORl9NQU5HTEU9
bQojIENPTkZJR19JUDZfTkZfUkFXIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVB2NjogTmV0ZmlsdGVy
IENvbmZpZ3VyYXRpb24KCkNPTkZJR19ORl9ERUZSQUdfSVBWNj1tCiMgQ09ORklHX05GX0NPTk5U
UkFDS19CUklER0UgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfTkZfRUJUQUJMRVMgaXMgbm90
IHNldAojIENPTkZJR19CUEZJTFRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX0RDQ1AgaXMgbm90
IHNldAojIENPTkZJR19JUF9TQ1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRTIGlzIG5vdCBzZXQK
IyBDT05GSUdfVElQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0wyVFAgaXMgbm90IHNldApDT05GSUdfU1RQPXkKQ09ORklHX0JSSURHRT15CkNPTkZJR19CUklE
R0VfSUdNUF9TTk9PUElORz15CkNPTkZJR19CUklER0VfTVJQPXkKQ09ORklHX0JSSURHRV9DRk09
eQojIENPTkZJR19ORVRfRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfVkxBTl84MDIxUSBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFQ05FVCBpcyBub3Qgc2V0CkNPTkZJR19MTEM9eQpDT05GSUdfTExDMj1t
CiMgQ09ORklHX0FUQUxLIGlzIG5vdCBzZXQKQ09ORklHX1gyNT1tCiMgQ09ORklHX0xBUEIgaXMg
bm90IHNldAojIENPTkZJR19QSE9ORVQgaXMgbm90IHNldAojIENPTkZJR182TE9XUEFOIGlzIG5v
dCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIRUQ9eQoK
IwojIFF1ZXVlaW5nL1NjaGVkdWxpbmcKIwojIENPTkZJR19ORVRfU0NIX0NCUSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9TQ0hfSFRCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9IRlNDIGlz
IG5vdCBzZXQKQ09ORklHX05FVF9TQ0hfUFJJTz15CkNPTkZJR19ORVRfU0NIX01VTFRJUT15CkNP
TkZJR19ORVRfU0NIX1JFRD1tCkNPTkZJR19ORVRfU0NIX1NGQj15CiMgQ09ORklHX05FVF9TQ0hf
U0ZRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9URVFMIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1NDSF9UQkYgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0NCUyBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfU0NIX0VURj1tCkNPTkZJR19ORVRfU0NIX1RBUFJJTz1tCiMgQ09ORklHX05FVF9T
Q0hfR1JFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRFNNQVJLIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9TQ0hfTkVURU09eQojIENPTkZJR19ORVRfU0NIX0RSUiBpcyBub3Qgc2V0CkNPTkZJ
R19ORVRfU0NIX01RUFJJTz1tCkNPTkZJR19ORVRfU0NIX1NLQlBSSU89bQpDT05GSUdfTkVUX1ND
SF9DSE9LRT1tCkNPTkZJR19ORVRfU0NIX1FGUT1tCkNPTkZJR19ORVRfU0NIX0NPREVMPW0KIyBD
T05GSUdfTkVUX1NDSF9GUV9DT0RFTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfQ0FLRSBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0ZRPXkKQ09ORklHX05FVF9TQ0hfSEhGPW0KQ09ORklH
X05FVF9TQ0hfUElFPXkKQ09ORklHX05FVF9TQ0hfRlFfUElFPW0KQ09ORklHX05FVF9TQ0hfUExV
Rz1tCkNPTkZJR19ORVRfU0NIX0VUUz15CiMgQ09ORklHX05FVF9TQ0hfREVGQVVMVCBpcyBub3Qg
c2V0CgojCiMgQ2xhc3NpZmljYXRpb24KIwpDT05GSUdfTkVUX0NMUz15CiMgQ09ORklHX05FVF9D
TFNfQkFTSUMgaXMgbm90IHNldApDT05GSUdfTkVUX0NMU19UQ0lOREVYPXkKIyBDT05GSUdfTkVU
X0NMU19ST1VURTQgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZXIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0NMU19VMzIgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX1JTVlAgaXMgbm90
IHNldApDT05GSUdfTkVUX0NMU19SU1ZQNj15CkNPTkZJR19ORVRfQ0xTX0ZMT1c9eQpDT05GSUdf
TkVUX0NMU19DR1JPVVA9eQpDT05GSUdfTkVUX0NMU19CUEY9bQojIENPTkZJR19ORVRfQ0xTX0ZM
T1dFUiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQ0xTX01BVENIQUxMPXkKIyBDT05GSUdfTkVUX0VN
QVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfQUNUIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9TQ0hfRklGTz15CiMgQ09ORklHX0RDQiBpcyBub3Qgc2V0CkNPTkZJR19ETlNfUkVTT0xWRVI9
bQpDT05GSUdfQkFUTUFOX0FEVj15CiMgQ09ORklHX0JBVE1BTl9BRFZfQkFUTUFOX1YgaXMgbm90
IHNldApDT05GSUdfQkFUTUFOX0FEVl9CTEE9eQpDT05GSUdfQkFUTUFOX0FEVl9EQVQ9eQojIENP
TkZJR19CQVRNQU5fQURWX05DIGlzIG5vdCBzZXQKQ09ORklHX0JBVE1BTl9BRFZfTUNBU1Q9eQpD
T05GSUdfQkFUTUFOX0FEVl9ERUJVRz15CiMgQ09ORklHX0JBVE1BTl9BRFZfVFJBQ0lORyBpcyBu
b3Qgc2V0CiMgQ09ORklHX09QRU5WU1dJVENIIGlzIG5vdCBzZXQKIyBDT05GSUdfVlNPQ0tFVFMg
aXMgbm90IHNldApDT05GSUdfTkVUTElOS19ESUFHPW0KQ09ORklHX01QTFM9eQpDT05GSUdfTkVU
X01QTFNfR1NPPXkKIyBDT05GSUdfTVBMU19ST1VUSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X05TSCBpcyBub3Qgc2V0CkNPTkZJR19IU1I9bQojIENPTkZJR19ORVRfU1dJVENIREVWIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX0wzX01BU1RFUl9ERVYgaXMgbm90IHNldApDT05GSUdfUVJUUj1t
CiMgQ09ORklHX1FSVFJfU01EIGlzIG5vdCBzZXQKQ09ORklHX1FSVFJfVFVOPW0KIyBDT05GSUdf
TkVUX05DU0kgaXMgbm90IHNldApDT05GSUdfUENQVV9ERVZfUkVGQ05UPXkKQ09ORklHX1JQUz15
CkNPTkZJR19SRlNfQUNDRUw9eQpDT05GSUdfU09DS19SWF9RVUVVRV9NQVBQSU5HPXkKQ09ORklH
X1hQUz15CkNPTkZJR19DR1JPVVBfTkVUX1BSSU89eQpDT05GSUdfQ0dST1VQX05FVF9DTEFTU0lE
PXkKQ09ORklHX05FVF9SWF9CVVNZX1BPTEw9eQpDT05GSUdfQlFMPXkKQ09ORklHX05FVF9GTE9X
X0xJTUlUPXkKCiMKIyBOZXR3b3JrIHRlc3RpbmcKIwojIENPTkZJR19ORVRfUEtUR0VOIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX0RST1BfTU9OSVRPUiBpcyBub3Qgc2V0CiMgZW5kIG9mIE5ldHdv
cmsgdGVzdGluZwojIGVuZCBvZiBOZXR3b3JraW5nIG9wdGlvbnMKCiMgQ09ORklHX0hBTVJBRElP
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQlQgaXMgbm90IHNl
dAojIENPTkZJR19BRl9SWFJQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGX0tDTSBpcyBub3Qgc2V0
CkNPTkZJR19NQ1RQPXkKIyBDT05GSUdfV0lSRUxFU1MgaXMgbm90IHNldApDT05GSUdfUkZLSUxM
PW0KQ09ORklHX1JGS0lMTF9MRURTPXkKIyBDT05GSUdfUkZLSUxMX0lOUFVUIGlzIG5vdCBzZXQK
Q09ORklHX1JGS0lMTF9HUElPPW0KQ09ORklHX05FVF85UD15CiMgQ09ORklHX05FVF85UF9GRCBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfOVBfVklSVElPPXkKIyBDT05GSUdfTkVUXzlQX0RFQlVHIGlz
IG5vdCBzZXQKQ09ORklHX0NBSUY9bQpDT05GSUdfQ0FJRl9ERUJVRz15CiMgQ09ORklHX0NBSUZf
TkVUREVWIGlzIG5vdCBzZXQKQ09ORklHX0NBSUZfVVNCPW0KIyBDT05GSUdfQ0VQSF9MSUIgaXMg
bm90IHNldApDT05GSUdfTkZDPW0KIyBDT05GSUdfTkZDX0RJR0lUQUwgaXMgbm90IHNldAojIENP
TkZJR19ORkNfTkNJIGlzIG5vdCBzZXQKQ09ORklHX05GQ19IQ0k9bQpDT05GSUdfTkZDX1NIRExD
PXkKCiMKIyBOZWFyIEZpZWxkIENvbW11bmljYXRpb24gKE5GQykgZGV2aWNlcwojCkNPTkZJR19O
RkNfUE41NDQ9bQpDT05GSUdfTkZDX1BONTQ0X0kyQz1tCkNPTkZJR19ORkNfUE41MzM9bQpDT05G
SUdfTkZDX1BONTMzX1VTQj1tCiMgQ09ORklHX05GQ19QTjUzM19JMkMgaXMgbm90IHNldApDT05G
SUdfTkZDX1BONTMyX1VBUlQ9bQojIENPTkZJR19ORkNfTUlDUk9SRUFEX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX05GQ19TVDIxTkZDQV9JMkMgaXMgbm90IHNldAojIGVuZCBvZiBOZWFyIEZpZWxk
IENvbW11bmljYXRpb24gKE5GQykgZGV2aWNlcwoKIyBDT05GSUdfUFNBTVBMRSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9JRkUgaXMgbm90IHNldAojIENPTkZJR19MV1RVTk5FTCBpcyBub3Qgc2V0
CkNPTkZJR19EU1RfQ0FDSEU9eQpDT05GSUdfR1JPX0NFTExTPXkKQ09ORklHX05FVF9TRUxGVEVT
VFM9eQpDT05GSUdfTkVUX0RFVkxJTks9eQpDT05GSUdfRkFJTE9WRVI9eQojIENPTkZJR19FVEhU
T09MX05FVExJTksgaXMgbm90IHNldAoKIwojIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0hBVkVf
RUlTQT15CiMgQ09ORklHX0VJU0EgaXMgbm90IHNldApDT05GSUdfSEFWRV9QQ0k9eQpDT05GSUdf
UENJPXkKQ09ORklHX1BDSV9ET01BSU5TPXkKIyBDT05GSUdfUENJRVBPUlRCVVMgaXMgbm90IHNl
dApDT05GSUdfUENJRUFTUE09eQpDT05GSUdfUENJRUFTUE1fREVGQVVMVD15CiMgQ09ORklHX1BD
SUVBU1BNX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSX1NVUEVS
U0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVBU1BNX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQK
IyBDT05GSUdfUENJRV9QVE0gaXMgbm90IHNldAojIENPTkZJR19QQ0lfTVNJIGlzIG5vdCBzZXQK
Q09ORklHX1BDSV9RVUlSS1M9eQojIENPTkZJR19QQ0lfREVCVUcgaXMgbm90IHNldAojIENPTkZJ
R19QQ0lfU1RVQiBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfTE9DS0xFU1NfQ09ORklHPXkKIyBDT05G
SUdfUENJX0lPViBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9QUkkgaXMgbm90IHNldAojIENPTkZJ
R19QQ0lfUEFTSUQgaXMgbm90IHNldApDT05GSUdfUENJX0xBQkVMPXkKIyBDT05GSUdfUENJRV9C
VVNfVFVORV9PRkYgaXMgbm90IHNldApDT05GSUdfUENJRV9CVVNfREVGQVVMVD15CiMgQ09ORklH
X1BDSUVfQlVTX1NBRkUgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX0JVU19QRVJGT1JNQU5DRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BDSUVfQlVTX1BFRVIyUEVFUiBpcyBub3Qgc2V0CkNPTkZJR19W
R0FfQVJCPXkKQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9MTYKIyBDT05GSUdfSE9UUExVR19QQ0kg
aXMgbm90IHNldAoKIwojIFBDSSBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19QQ0lfRlRQ
Q0kxMDAgaXMgbm90IHNldAojIENPTkZJR19QQ0lfSE9TVF9HRU5FUklDIGlzIG5vdCBzZXQKCiMK
IyBEZXNpZ25XYXJlIFBDSSBDb3JlIFN1cHBvcnQKIwojIGVuZCBvZiBEZXNpZ25XYXJlIFBDSSBD
b3JlIFN1cHBvcnQKCiMKIyBNb2JpdmVpbCBQQ0llIENvcmUgU3VwcG9ydAojCiMgZW5kIG9mIE1v
Yml2ZWlsIFBDSWUgQ29yZSBTdXBwb3J0CgojCiMgQ2FkZW5jZSBQQ0llIGNvbnRyb2xsZXJzIHN1
cHBvcnQKIwojIENPTkZJR19QQ0lFX0NBREVOQ0VfUExBVF9IT1NUIGlzIG5vdCBzZXQKIyBDT05G
SUdfUENJX0o3MjFFX0hPU1QgaXMgbm90IHNldAojIGVuZCBvZiBDYWRlbmNlIFBDSWUgY29udHJv
bGxlcnMgc3VwcG9ydAojIGVuZCBvZiBQQ0kgY29udHJvbGxlciBkcml2ZXJzCgojCiMgUENJIEVu
ZHBvaW50CiMKIyBDT05GSUdfUENJX0VORFBPSU5UIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIEVu
ZHBvaW50CgojCiMgUENJIHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19QQ0lf
U1dfU1dJVENIVEVDIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIHN3aXRjaCBjb250cm9sbGVyIGRy
aXZlcnMKCiMgQ09ORklHX0NYTF9CVVMgaXMgbm90IHNldAojIENPTkZJR19QQ0NBUkQgaXMgbm90
IHNldAojIENPTkZJR19SQVBJRElPIGlzIG5vdCBzZXQKCiMKIyBHZW5lcmljIERyaXZlciBPcHRp
b25zCiMKQ09ORklHX0FVWElMSUFSWV9CVVM9eQojIENPTkZJR19VRVZFTlRfSEVMUEVSIGlzIG5v
dCBzZXQKQ09ORklHX0RFVlRNUEZTPXkKIyBDT05GSUdfREVWVE1QRlNfTU9VTlQgaXMgbm90IHNl
dAojIENPTkZJR19ERVZUTVBGU19TQUZFIGlzIG5vdCBzZXQKQ09ORklHX1NUQU5EQUxPTkU9eQpD
T05GSUdfUFJFVkVOVF9GSVJNV0FSRV9CVUlMRD15CgojCiMgRmlybXdhcmUgbG9hZGVyCiMKQ09O
RklHX0ZXX0xPQURFUj15CkNPTkZJR19GV19MT0FERVJfUEFHRURfQlVGPXkKQ09ORklHX0ZXX0xP
QURFUl9TWVNGUz15CkNPTkZJR19FWFRSQV9GSVJNV0FSRT0iIgpDT05GSUdfRldfTE9BREVSX1VT
RVJfSEVMUEVSPXkKQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUl9GQUxMQkFDSz15CkNPTkZJ
R19GV19MT0FERVJfQ09NUFJFU1M9eQpDT05GSUdfRldfTE9BREVSX0NPTVBSRVNTX1haPXkKQ09O
RklHX0ZXX0xPQURFUl9DT01QUkVTU19aU1REPXkKIyBDT05GSUdfRldfQ0FDSEUgaXMgbm90IHNl
dAojIENPTkZJR19GV19VUExPQUQgaXMgbm90IHNldAojIGVuZCBvZiBGaXJtd2FyZSBsb2FkZXIK
CkNPTkZJR19XQU5UX0RFVl9DT1JFRFVNUD15CiMgQ09ORklHX0FMTE9XX0RFVl9DT1JFRFVNUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0RSSVZFUiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19E
RVZSRVM9eQojIENPTkZJR19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMgbm90IHNldAojIENP
TkZJR19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0NQ
VV9BVVRPUFJPQkU9eQpDT05GSUdfR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTPXkKQ09ORklH
X1JFR01BUD15CkNPTkZJR19SRUdNQVBfSTJDPXkKQ09ORklHX1JFR01BUF9TUE1JPW0KQ09ORklH
X1JFR01BUF9XMT1tCkNPTkZJR19SRUdNQVBfTU1JTz15CkNPTkZJR19SRUdNQVBfSVJRPXkKQ09O
RklHX1JFR01BUF9TQ0NCPXkKQ09ORklHX0RNQV9TSEFSRURfQlVGRkVSPXkKIyBDT05GSUdfRE1B
X0ZFTkNFX1RSQUNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJpYyBEcml2ZXIgT3B0aW9ucwoK
IwojIEJ1cyBkZXZpY2VzCiMKIyBDT05GSUdfTUhJX0JVUyBpcyBub3Qgc2V0CkNPTkZJR19NSElf
QlVTX0VQPXkKIyBlbmQgb2YgQnVzIGRldmljZXMKCkNPTkZJR19DT05ORUNUT1I9eQojIENPTkZJ
R19QUk9DX0VWRU5UUyBpcyBub3Qgc2V0CgojCiMgRmlybXdhcmUgRHJpdmVycwojCgojCiMgQVJN
IFN5c3RlbSBDb250cm9sIGFuZCBNYW5hZ2VtZW50IEludGVyZmFjZSBQcm90b2NvbAojCiMgZW5k
IG9mIEFSTSBTeXN0ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wK
CiMgQ09ORklHX0VERCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZJUk1XQVJFX01FTU1BUCBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZXX0NGR19TWVNGUyBpcyBub3Qgc2V0CkNPTkZJR19TWVNGQj15CkNPTkZJ
R19TWVNGQl9TSU1QTEVGQj15CiMgQ09ORklHX0dPT0dMRV9GSVJNV0FSRSBpcyBub3Qgc2V0Cgoj
CiMgVGVncmEgZmlybXdhcmUgZHJpdmVyCiMKIyBlbmQgb2YgVGVncmEgZmlybXdhcmUgZHJpdmVy
CiMgZW5kIG9mIEZpcm13YXJlIERyaXZlcnMKCkNPTkZJR19HTlNTPXkKQ09ORklHX0dOU1NfU0VS
SUFMPW0KQ09ORklHX0dOU1NfTVRLX1NFUklBTD1tCiMgQ09ORklHX0dOU1NfU0lSRl9TRVJJQUwg
aXMgbm90IHNldAojIENPTkZJR19HTlNTX1VCWF9TRVJJQUwgaXMgbm90IHNldApDT05GSUdfR05T
U19VU0I9bQpDT05GSUdfTVREPXkKIyBDT05GSUdfTVREX1RFU1RTIGlzIG5vdCBzZXQKCiMKIyBQ
YXJ0aXRpb24gcGFyc2VycwojCkNPTkZJR19NVERfQVI3X1BBUlRTPW0KQ09ORklHX01URF9DTURM
SU5FX1BBUlRTPW0KIyBDT05GSUdfTVREX09GX1BBUlRTIGlzIG5vdCBzZXQKQ09ORklHX01URF9S
RURCT09UX1BBUlRTPW0KQ09ORklHX01URF9SRURCT09UX0RJUkVDVE9SWV9CTE9DSz0tMQpDT05G
SUdfTVREX1JFREJPT1RfUEFSVFNfVU5BTExPQ0FURUQ9eQojIENPTkZJR19NVERfUkVEQk9PVF9Q
QVJUU19SRUFET05MWSBpcyBub3Qgc2V0CiMgZW5kIG9mIFBhcnRpdGlvbiBwYXJzZXJzCgojCiMg
VXNlciBNb2R1bGVzIEFuZCBUcmFuc2xhdGlvbiBMYXllcnMKIwpDT05GSUdfTVREX09PUFM9bQoj
IENPTkZJR19NVERfUEFSVElUSU9ORURfTUFTVEVSIGlzIG5vdCBzZXQKCiMKIyBSQU0vUk9NL0Zs
YXNoIGNoaXAgZHJpdmVycwojCkNPTkZJR19NVERfQ0ZJPXkKIyBDT05GSUdfTVREX0pFREVDUFJP
QkUgaXMgbm90IHNldApDT05GSUdfTVREX0dFTl9QUk9CRT15CiMgQ09ORklHX01URF9DRklfQURW
X09QVElPTlMgaXMgbm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzE9eQpDT05GSUdf
TVREX01BUF9CQU5LX1dJRFRIXzI9eQpDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzQ9eQpDT05G
SUdfTVREX0NGSV9JMT15CkNPTkZJR19NVERfQ0ZJX0kyPXkKQ09ORklHX01URF9DRklfSU5URUxF
WFQ9bQpDT05GSUdfTVREX0NGSV9BTURTVEQ9bQojIENPTkZJR19NVERfQ0ZJX1NUQUEgaXMgbm90
IHNldApDT05GSUdfTVREX0NGSV9VVElMPXkKQ09ORklHX01URF9SQU09bQojIENPTkZJR19NVERf
Uk9NIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0FCU0VOVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJB
TS9ST00vRmxhc2ggY2hpcCBkcml2ZXJzCgojCiMgTWFwcGluZyBkcml2ZXJzIGZvciBjaGlwIGFj
Y2VzcwojCkNPTkZJR19NVERfQ09NUExFWF9NQVBQSU5HUz15CkNPTkZJR19NVERfUEhZU01BUD1t
CkNPTkZJR19NVERfUEhZU01BUF9DT01QQVQ9eQpDT05GSUdfTVREX1BIWVNNQVBfU1RBUlQ9MHg4
MDAwMDAwCkNPTkZJR19NVERfUEhZU01BUF9MRU49MApDT05GSUdfTVREX1BIWVNNQVBfQkFOS1dJ
RFRIPTIKIyBDT05GSUdfTVREX1BIWVNNQVBfT0YgaXMgbm90IHNldApDT05GSUdfTVREX1BIWVNN
QVBfR1BJT19BRERSPXkKIyBDT05GSUdfTVREX1NCQ19HWFggaXMgbm90IHNldAojIENPTkZJR19N
VERfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX0lOVEVMX1ZSX05PUiBpcyBub3Qgc2V0CiMg
Q09ORklHX01URF9QTEFUUkFNIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWFwcGluZyBkcml2ZXJzIGZv
ciBjaGlwIGFjY2VzcwoKIwojIFNlbGYtY29udGFpbmVkIE1URCBkZXZpY2UgZHJpdmVycwojCiMg
Q09ORklHX01URF9QTUM1NTEgaXMgbm90IHNldApDT05GSUdfTVREX1NMUkFNPXkKQ09ORklHX01U
RF9QSFJBTT15CiMgQ09ORklHX01URF9NVERSQU0gaXMgbm90IHNldAoKIwojIERpc2stT24tQ2hp
cCBEZXZpY2UgRHJpdmVycwojCiMgQ09ORklHX01URF9ET0NHMyBpcyBub3Qgc2V0CiMgZW5kIG9m
IFNlbGYtY29udGFpbmVkIE1URCBkZXZpY2UgZHJpdmVycwoKIwojIE5BTkQKIwpDT05GSUdfTVRE
X05BTkRfQ09SRT15CiMgQ09ORklHX01URF9PTkVOQU5EIGlzIG5vdCBzZXQKIyBDT05GSUdfTVRE
X1JBV19OQU5EIGlzIG5vdCBzZXQKCiMKIyBFQ0MgZW5naW5lIHN1cHBvcnQKIwpDT05GSUdfTVRE
X05BTkRfRUNDPXkKQ09ORklHX01URF9OQU5EX0VDQ19TV19IQU1NSU5HPXkKQ09ORklHX01URF9O
QU5EX0VDQ19TV19IQU1NSU5HX1NNQz15CkNPTkZJR19NVERfTkFORF9FQ0NfU1dfQkNIPXkKIyBD
T05GSUdfTVREX05BTkRfRUNDX01YSUMgaXMgbm90IHNldAojIGVuZCBvZiBFQ0MgZW5naW5lIHN1
cHBvcnQKIyBlbmQgb2YgTkFORAoKIwojIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVy
cwojCkNPTkZJR19NVERfTFBERFI9bQpDT05GSUdfTVREX1FJTkZPX1BST0JFPW0KIyBlbmQgb2Yg
TFBERFIgJiBMUEREUjIgUENNIG1lbW9yeSBkcml2ZXJzCgpDT05GSUdfTVREX1VCST15CkNPTkZJ
R19NVERfVUJJX1dMX1RIUkVTSE9MRD00MDk2CkNPTkZJR19NVERfVUJJX0JFQl9MSU1JVD0yMApD
T05GSUdfTVREX1VCSV9GQVNUTUFQPXkKIyBDT05GSUdfTVREX1VCSV9HTFVFQkkgaXMgbm90IHNl
dApDT05GSUdfTVREX0hZUEVSQlVTPW0KQ09ORklHX09GPXkKIyBDT05GSUdfT0ZfVU5JVFRFU1Qg
aXMgbm90IHNldApDT05GSUdfT0ZfS09CSj15CkNPTkZJR19PRl9EWU5BTUlDPXkKQ09ORklHX09G
X0FERFJFU1M9eQpDT05GSUdfT0ZfSVJRPXkKIyBDT05GSUdfT0ZfT1ZFUkxBWSBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVD15CkNPTkZJR19QQVJQT1JUPXkKIyBD
T05GSUdfUEFSUE9SVF9QQyBpcyBub3Qgc2V0CkNPTkZJR19QQVJQT1JUX0FYODg3OTY9eQojIENP
TkZJR19QQVJQT1JUXzEyODQgaXMgbm90IHNldApDT05GSUdfUEFSUE9SVF9OT1RfUEM9eQpDT05G
SUdfUE5QPXkKQ09ORklHX1BOUF9ERUJVR19NRVNTQUdFUz15CgojCiMgUHJvdG9jb2xzCiMKQ09O
RklHX1BOUEFDUEk9eQoKIwojIE5WTUUgU3VwcG9ydAojCiMgZW5kIG9mIE5WTUUgU3VwcG9ydAoK
IwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19TRU5TT1JTX0xJUzNMVjAyRD1tCkNPTkZJR19BRDUy
NVhfRFBPVD1tCiMgQ09ORklHX0FENTI1WF9EUE9UX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RV
TU1ZX0lSUSBpcyBub3Qgc2V0CiMgQ09ORklHX0lCTV9BU00gaXMgbm90IHNldAojIENPTkZJR19Q
SEFOVE9NIGlzIG5vdCBzZXQKIyBDT05GSUdfVElGTV9DT1JFIGlzIG5vdCBzZXQKQ09ORklHX0lD
UzkzMlM0MDE9eQpDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTPXkKQ09ORklHX0hJNjQyMVY2MDBf
SVJRPW0KIyBDT05GSUdfSFBfSUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMg
bm90IHNldApDT05GSUdfSVNMMjkwMDM9eQpDT05GSUdfSVNMMjkwMjA9bQojIENPTkZJR19TRU5T
T1JTX1RTTDI1NTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0JIMTc3MCBpcyBub3Qgc2V0
CkNPTkZJR19TRU5TT1JTX0FQRFM5OTBYPXkKQ09ORklHX0hNQzYzNTI9eQpDT05GSUdfRFMxNjgy
PW0KQ09ORklHX1NSQU09eQojIENPTkZJR19EV19YREFUQV9QQ0lFIGlzIG5vdCBzZXQKIyBDT05G
SUdfUENJX0VORFBPSU5UX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfU0RGRUMgaXMg
bm90IHNldApDT05GSUdfTUlTQ19SVFNYPW0KIyBDT05GSUdfSElTSV9ISUtFWV9VU0IgaXMgbm90
IHNldAojIENPTkZJR19WQ1BVX1NUQUxMX0RFVEVDVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfQzJQ
T1JUIGlzIG5vdCBzZXQKCiMKIyBFRVBST00gc3VwcG9ydAojCkNPTkZJR19FRVBST01fQVQyND15
CkNPTkZJR19FRVBST01fTEVHQUNZPXkKQ09ORklHX0VFUFJPTV9NQVg2ODc1PW0KQ09ORklHX0VF
UFJPTV85M0NYNj15CiMgQ09ORklHX0VFUFJPTV9JRFRfODlIUEVTWCBpcyBub3Qgc2V0CkNPTkZJ
R19FRVBST01fRUUxMDA0PW0KIyBlbmQgb2YgRUVQUk9NIHN1cHBvcnQKCiMgQ09ORklHX0NCNzEw
X0NPUkUgaXMgbm90IHNldAoKIwojIFRleGFzIEluc3RydW1lbnRzIHNoYXJlZCB0cmFuc3BvcnQg
bGluZSBkaXNjaXBsaW5lCiMKQ09ORklHX1RJX1NUPXkKIyBlbmQgb2YgVGV4YXMgSW5zdHJ1bWVu
dHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKCkNPTkZJR19TRU5TT1JTX0xJUzNf
STJDPW0KQ09ORklHX0FMVEVSQV9TVEFQTD15CiMgQ09ORklHX0lOVEVMX01FSSBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOVEVMX01FSV9NRSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX01FSV9UWEUg
aXMgbm90IHNldAojIENPTkZJR19WTVdBUkVfVk1DSSBpcyBub3Qgc2V0CiMgQ09ORklHX0dFTldR
RSBpcyBub3Qgc2V0CkNPTkZJR19FQ0hPPXkKIyBDT05GSUdfTUlTQ19BTENPUl9QQ0kgaXMgbm90
IHNldAojIENPTkZJR19NSVNDX1JUU1hfUENJIGlzIG5vdCBzZXQKQ09ORklHX01JU0NfUlRTWF9V
U0I9bQojIENPTkZJR19IQUJBTkFfQUkgaXMgbm90IHNldAojIENPTkZJR19VQUNDRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BWUEFOSUMgaXMgbm90IHNldAojIGVuZCBvZiBNaXNjIGRldmljZXMKCiMK
IyBTQ1NJIGRldmljZSBzdXBwb3J0CiMKQ09ORklHX1NDU0lfTU9EPXkKIyBlbmQgb2YgU0NTSSBk
ZXZpY2Ugc3VwcG9ydAoKIyBDT05GSUdfRlVTSU9OIGlzIG5vdCBzZXQKCiMKIyBJRUVFIDEzOTQg
KEZpcmVXaXJlKSBzdXBwb3J0CiMKIyBDT05GSUdfRklSRVdJUkUgaXMgbm90IHNldAojIENPTkZJ
R19GSVJFV0lSRV9OT1NZIGlzIG5vdCBzZXQKIyBlbmQgb2YgSUVFRSAxMzk0IChGaXJlV2lyZSkg
c3VwcG9ydAoKQ09ORklHX01BQ0lOVE9TSF9EUklWRVJTPXkKIyBDT05GSUdfTUFDX0VNVU1PVVNF
QlROIGlzIG5vdCBzZXQKQ09ORklHX05FVERFVklDRVM9eQpDT05GSUdfTUlJPXkKIyBDT05GSUdf
TkVUX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19BUkNORVQgaXMgbm90IHNldApDT05GSUdfQ0FJ
Rl9EUklWRVJTPXkKQ09ORklHX0NBSUZfVFRZPW0KQ09ORklHX0NBSUZfVklSVElPPW0KQ09ORklH
X0VUSEVSTkVUPXkKQ09ORklHX05FVF9WRU5ET1JfM0NPTT15CiMgQ09ORklHX1ZPUlRFWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RZUEhPT04gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BREFQ
VEVDPXkKIyBDT05GSUdfQURBUFRFQ19TVEFSRklSRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVO
RE9SX0FHRVJFPXkKIyBDT05GSUdfRVQxMzFYIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1Jf
QUxBQ1JJVEVDSD15CiMgQ09ORklHX1NMSUNPU1MgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9BTFRFT049eQojIENPTkZJR19BQ0VOSUMgaXMgbm90IHNldApDT05GSUdfQUxURVJBX1RTRT15
CiMgQ09ORklHX05FVF9WRU5ET1JfQU1BWk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9BTUQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FRVUFOVElBIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9BUkMgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BU0lY
PXkKQ09ORklHX05FVF9WRU5ET1JfQVRIRVJPUz15CiMgQ09ORklHX0FUTDIgaXMgbm90IHNldAoj
IENPTkZJR19BVEwxIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRMMUUgaXMgbm90IHNldAojIENPTkZJ
R19BVEwxQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FMWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NYX0VD
QVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0JST0FEQ09NIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9DQURFTkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9D
QVZJVU0gaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DSEVMU0lPPXkKIyBDT05GSUdfQ0hF
TFNJT19UMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9fVDMgaXMgbm90IHNldAojIENPTkZJ
R19DSEVMU0lPX1Q0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hFTFNJT19UNFZGIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfQ0lTQ089eQojIENPTkZJR19FTklDIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1ZFTkRPUl9DT1JUSU5BIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfREFWSUNP
TT15CiMgQ09ORklHX0RORVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ERUM9eQojIENP
TkZJR19ORVRfVFVMSVAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ETElOSz15CiMgQ09O
RklHX0RMMksgaXMgbm90IHNldAojIENPTkZJR19TVU5EQU5DRSBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX0VNVUxFWD15CiMgQ09ORklHX0JFMk5FVCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfRU5HTEVERVIgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0VaQ0hJUCBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0ZVTkdJQkxFPXkKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9HT09HTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0hVQVdFSSBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9WRU5ET1JfSTgyNVhYIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1Jf
SU5URUw9eQojIENPTkZJR19FMTAwIGlzIG5vdCBzZXQKQ09ORklHX0UxMDAwPXkKIyBDT05GSUdf
RTEwMDBFIGlzIG5vdCBzZXQKIyBDT05GSUdfSUdCIGlzIG5vdCBzZXQKIyBDT05GSUdfSUdCVkYg
aXMgbm90IHNldAojIENPTkZJR19JWEdCIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhHQkUgaXMgbm90
IHNldAojIENPTkZJR19JNDBFIGlzIG5vdCBzZXQKIyBDT05GSUdfSUdDIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfV0FOR1hVTj15CiMgQ09ORklHX1RYR0JFIGlzIG5vdCBzZXQKIyBDT05G
SUdfSk1FIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9MSVRFWCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfVkVORE9SX01BUlZFTEw9eQpDT05GSUdfTVZNRElPPXkKIyBDT05GSUdfU0tHRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NLWTIgaXMgbm90IHNldAojIENPTkZJR19PQ1RFT05fRVAgaXMg
bm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9NRUxMQU5PWD15CiMgQ09ORklHX01MWDRfRU4gaXMg
bm90IHNldAojIENPTkZJR19NTFg1X0NPUkUgaXMgbm90IHNldApDT05GSUdfTUxYU1dfQ09SRT15
CkNPTkZJR19NTFhTV19DT1JFX1RIRVJNQUw9eQpDT05GSUdfTUxYU1dfUENJPW0KQ09ORklHX01M
WFNXX0kyQz1tCiMgQ09ORklHX01MWFNXX01JTklNQUwgaXMgbm90IHNldApDT05GSUdfTUxYRlc9
eQpDT05GSUdfTkVUX1ZFTkRPUl9NSUNSRUw9eQojIENPTkZJR19LUzg4NTFfTUxMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfS1NaODg0WF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01J
Q1JPQ0hJUCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01JQ1JPU0VNST15CkNPTkZJR19O
RVRfVkVORE9SX01JQ1JPU09GVD15CkNPTkZJR19ORVRfVkVORE9SX01ZUkk9eQojIENPTkZJR19N
WVJJMTBHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZFQUxOWCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfTkkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX05BVFNFTUkgaXMgbm90
IHNldApDT05GSUdfTkVUX1ZFTkRPUl9ORVRFUklPTj15CiMgQ09ORklHX1MySU8gaXMgbm90IHNl
dApDT05GSUdfTkVUX1ZFTkRPUl9ORVRST05PTUU9eQpDT05GSUdfTkVUX1ZFTkRPUl9OVklESUE9
eQojIENPTkZJR19GT1JDRURFVEggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9PS0k9eQpD
T05GSUdfRVRIT0M9eQpDT05GSUdfTkVUX1ZFTkRPUl9QQUNLRVRfRU5HSU5FUz15CiMgQ09ORklH
X0hBTUFDSEkgaXMgbm90IHNldAojIENPTkZJR19ZRUxMT1dGSU4gaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9QRU5TQU5ETz15CiMgQ09ORklHX0lPTklDIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfUUxPR0lDPXkKIyBDT05GSUdfUUxBM1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1FM
Q05JQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVFhFTl9OSUMgaXMgbm90IHNldAojIENPTkZJR19R
RUQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9CUk9DQURFPXkKIyBDT05GSUdfQk5BIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9RVUFMQ09NTSBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX1JEQz15CiMgQ09ORklHX1I2MDQwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9SRUFMVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9SRU5FU0FTIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9ST0NLRVIgaXMgbm90IHNldApDT05GSUdfTkVUX1ZF
TkRPUl9TQU1TVU5HPXkKIyBDT05GSUdfU1hHQkVfRVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU0lMQU49eQojIENPTkZJ
R19TQzkyMDMxIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU0lTPXkKIyBDT05GSUdfU0lT
OTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0lTMTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9TT0xBUkZMQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TTVNDIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05FWFQgaXMgbm90IHNldApDT05GSUdfTkVU
X1ZFTkRPUl9TVE1JQ1JPPXkKIyBDT05GSUdfU1RNTUFDX0VUSCBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX1NVTj15CiMgQ09ORklHX0hBUFBZTUVBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NV
TkdFTSBpcyBub3Qgc2V0CiMgQ09ORklHX0NBU1NJTkkgaXMgbm90IHNldAojIENPTkZJR19OSVUg
aXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1NZTk9QU1lTIGlzIG5vdCBzZXQKQ09ORklH
X05FVF9WRU5ET1JfVEVIVVRJPXkKIyBDT05GSUdfVEVIVVRJIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9WRU5ET1JfVEk9eQojIENPTkZJR19USV9DUFNXX1BIWV9TRUwgaXMgbm90IHNldAojIENPTkZJ
R19UTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9WRVJURVhDT00gaXMgbm90IHNl
dAojIENPTkZJR19ORVRfVkVORE9SX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
V0laTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9YSUxJTlggaXMgbm90IHNldAoj
IENPTkZJR19GRERJIGlzIG5vdCBzZXQKIyBDT05GSUdfSElQUEkgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfU0IxMDAwIGlzIG5vdCBzZXQKQ09ORklHX1BIWUxJQj15CkNPTkZJR19TV1BIWT15CkNP
TkZJR19MRURfVFJJR0dFUl9QSFk9eQpDT05GSUdfRklYRURfUEhZPXkKCiMKIyBNSUkgUEhZIGRl
dmljZSBkcml2ZXJzCiMKIyBDT05GSUdfQU1EX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19BRElOX1BI
WT15CkNPTkZJR19BRElOMTEwMF9QSFk9bQojIENPTkZJR19BUVVBTlRJQV9QSFkgaXMgbm90IHNl
dApDT05GSUdfQVg4ODc5NkJfUEhZPW0KQ09ORklHX0JST0FEQ09NX1BIWT15CkNPTkZJR19CQ001
NDE0MF9QSFk9eQojIENPTkZJR19CQ003WFhYX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19CQ004NDg4
MV9QSFk9bQpDT05GSUdfQkNNODdYWF9QSFk9bQpDT05GSUdfQkNNX05FVF9QSFlMSUI9eQpDT05G
SUdfQkNNX05FVF9QSFlQVFA9eQpDT05GSUdfQ0lDQURBX1BIWT1tCkNPTkZJR19DT1JUSU5BX1BI
WT1tCkNPTkZJR19EQVZJQ09NX1BIWT1tCiMgQ09ORklHX0lDUExVU19QSFkgaXMgbm90IHNldApD
T05GSUdfTFhUX1BIWT1tCkNPTkZJR19JTlRFTF9YV0FZX1BIWT15CkNPTkZJR19MU0lfRVQxMDEx
Q19QSFk9eQpDT05GSUdfTUFSVkVMTF9QSFk9eQojIENPTkZJR19NQVJWRUxMXzEwR19QSFkgaXMg
bm90IHNldAojIENPTkZJR19NQVJWRUxMXzg4WDIyMjJfUEhZIGlzIG5vdCBzZXQKQ09ORklHX01B
WExJTkVBUl9HUEhZPXkKQ09ORklHX01FRElBVEVLX0dFX1BIWT1tCkNPTkZJR19NSUNSRUxfUEhZ
PW0KQ09ORklHX01JQ1JPQ0hJUF9QSFk9bQpDT05GSUdfTUlDUk9DSElQX1QxX1BIWT1tCkNPTkZJ
R19NSUNST1NFTUlfUEhZPW0KQ09ORklHX01PVE9SQ09NTV9QSFk9eQojIENPTkZJR19OQVRJT05B
TF9QSFkgaXMgbm90IHNldApDT05GSUdfTlhQX0M0NV9USkExMVhYX1BIWT1tCkNPTkZJR19BVDgw
M1hfUEhZPXkKQ09ORklHX1FTRU1JX1BIWT15CiMgQ09ORklHX1JFQUxURUtfUEhZIGlzIG5vdCBz
ZXQKQ09ORklHX1JFTkVTQVNfUEhZPW0KQ09ORklHX1JPQ0tDSElQX1BIWT1tCkNPTkZJR19TTVND
X1BIWT1tCkNPTkZJR19TVEUxMFhQPW0KQ09ORklHX1RFUkFORVRJQ1NfUEhZPXkKIyBDT05GSUdf
RFA4MzgyMl9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzVEM4MTFfUEhZIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFA4Mzg0OF9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODY3X1BIWSBpcyBu
b3Qgc2V0CkNPTkZJR19EUDgzODY5X1BIWT1tCkNPTkZJR19EUDgzVEQ1MTBfUEhZPXkKQ09ORklH
X1ZJVEVTU0VfUEhZPW0KIyBDT05GSUdfWElMSU5YX0dNSUkyUkdNSUkgaXMgbm90IHNldAoKIwoj
IE1DVFAgRGV2aWNlIERyaXZlcnMKIwojIENPTkZJR19NQ1RQX1NFUklBTCBpcyBub3Qgc2V0CiMg
Q09ORklHX01DVFBfVFJBTlNQT1JUX0kyQyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1DVFAgRGV2aWNl
IERyaXZlcnMKCkNPTkZJR19NRElPX0RFVklDRT15CkNPTkZJR19NRElPX0JVUz15CkNPTkZJR19G
V05PREVfTURJTz15CkNPTkZJR19PRl9NRElPPXkKQ09ORklHX0FDUElfTURJTz15CkNPTkZJR19N
RElPX0RFVlJFUz15CiMgQ09ORklHX01ESU9fQklUQkFORyBpcyBub3Qgc2V0CiMgQ09ORklHX01E
SU9fQkNNX1VOSU1BQyBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0NBVklVTT15CkNPTkZJR19NRElP
X0hJU0lfRkVNQUM9eQpDT05GSUdfTURJT19NVlVTQj1tCiMgQ09ORklHX01ESU9fTVNDQ19NSUlN
IGlzIG5vdCBzZXQKQ09ORklHX01ESU9fT0NURU9OPXkKQ09ORklHX01ESU9fSVBRNDAxOT1tCiMg
Q09ORklHX01ESU9fSVBRODA2NCBpcyBub3Qgc2V0CiMgQ09ORklHX01ESU9fVEhVTkRFUiBpcyBu
b3Qgc2V0CgojCiMgTURJTyBNdWx0aXBsZXhlcnMKIwpDT05GSUdfTURJT19CVVNfTVVYPXkKQ09O
RklHX01ESU9fQlVTX01VWF9HUElPPXkKQ09ORklHX01ESU9fQlVTX01VWF9NVUxUSVBMRVhFUj1t
CiMgQ09ORklHX01ESU9fQlVTX01VWF9NTUlPUkVHIGlzIG5vdCBzZXQKCiMKIyBQQ1MgZGV2aWNl
IGRyaXZlcnMKIwojIGVuZCBvZiBQQ1MgZGV2aWNlIGRyaXZlcnMKCiMgQ09ORklHX1BMSVAgaXMg
bm90IHNldAojIENPTkZJR19QUFAgaXMgbm90IHNldAojIENPTkZJR19TTElQIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9ORVRfRFJJVkVSUz1tCkNPTkZJR19VU0JfQ0FUQz1tCkNPTkZJR19VU0JfS0FX
RVRIPW0KIyBDT05GSUdfVVNCX1BFR0FTVVMgaXMgbm90IHNldApDT05GSUdfVVNCX1JUTDgxNTA9
bQpDT05GSUdfVVNCX1JUTDgxNTI9bQpDT05GSUdfVVNCX0xBTjc4WFg9bQpDT05GSUdfVVNCX1VT
Qk5FVD1tCkNPTkZJR19VU0JfTkVUX0FYODgxN1g9bQpDT05GSUdfVVNCX05FVF9BWDg4MTc5XzE3
OEE9bQpDT05GSUdfVVNCX05FVF9DRENFVEhFUj1tCkNPTkZJR19VU0JfTkVUX0NEQ19FRU09bQpD
T05GSUdfVVNCX05FVF9DRENfTkNNPW0KIyBDT05GSUdfVVNCX05FVF9IVUFXRUlfQ0RDX05DTSBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX0NEQ19NQklNPW0KQ09ORklHX1VTQl9ORVRfRE05NjAx
PW0KIyBDT05GSUdfVVNCX05FVF9TUjk3MDAgaXMgbm90IHNldApDT05GSUdfVVNCX05FVF9TUjk4
MDA9bQojIENPTkZJR19VU0JfTkVUX1NNU0M3NVhYIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ORVRf
U01TQzk1WFg9bQpDT05GSUdfVVNCX05FVF9HTDYyMEE9bQpDT05GSUdfVVNCX05FVF9ORVQxMDgw
PW0KQ09ORklHX1VTQl9ORVRfUExVU0I9bQojIENPTkZJR19VU0JfTkVUX01DUzc4MzAgaXMgbm90
IHNldApDT05GSUdfVVNCX05FVF9STkRJU19IT1NUPW0KQ09ORklHX1VTQl9ORVRfQ0RDX1NVQlNF
VF9FTkFCTEU9bQpDT05GSUdfVVNCX05FVF9DRENfU1VCU0VUPW0KQ09ORklHX1VTQl9BTElfTTU2
MzI9eQpDT05GSUdfVVNCX0FOMjcyMD15CkNPTkZJR19VU0JfQkVMS0lOPXkKIyBDT05GSUdfVVNC
X0FSTUxJTlVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VQU09OMjg4OCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9LQzIxOTAgaXMgbm90IHNldAojIENPTkZJR19VU0JfTkVUX1pBVVJVUyBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfTkVUX0NYODIzMTBfRVRIPW0KQ09ORklHX1VTQl9ORVRfS0FMTUlB
PW0KQ09ORklHX1VTQl9ORVRfUU1JX1dXQU49bQpDT05GSUdfVVNCX0hTTz1tCiMgQ09ORklHX1VT
Ql9ORVRfSU5UNTFYMSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JUEhFVEggaXMgbm90IHNldAoj
IENPTkZJR19VU0JfU0lFUlJBX05FVCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfVkw2MDA9bQpDT05G
SUdfVVNCX05FVF9DSDkyMDA9bQojIENPTkZJR19VU0JfTkVUX0FRQzExMSBpcyBub3Qgc2V0CkNP
TkZJR19VU0JfUlRMODE1M19FQ009bQojIENPTkZJR19XTEFOIGlzIG5vdCBzZXQKIyBDT05GSUdf
V0FOIGlzIG5vdCBzZXQKCiMKIyBXaXJlbGVzcyBXQU4KIwojIENPTkZJR19XV0FOIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgV2lyZWxlc3MgV0FOCgojIENPTkZJR19WTVhORVQzIGlzIG5vdCBzZXQKIyBD
T05GSUdfRlVKSVRTVV9FUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVERFVlNJTSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfRkFJTE9WRVI9eQojIENPTkZJR19JU0ROIGlzIG5vdCBzZXQKCiMKIyBJbnB1
dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBVVD15CkNPTkZJR19JTlBVVF9MRURTPXkKQ09O
RklHX0lOUFVUX0ZGX01FTUxFU1M9eQpDT05GSUdfSU5QVVRfU1BBUlNFS01BUD15CkNPTkZJR19J
TlBVVF9NQVRSSVhLTUFQPXkKQ09ORklHX0lOUFVUX1ZJVkFMRElGTUFQPXkKCiMKIyBVc2VybGFu
ZCBpbnRlcmZhY2VzCiMKQ09ORklHX0lOUFVUX01PVVNFREVWPXkKQ09ORklHX0lOUFVUX01PVVNF
REVWX1BTQVVYPXkKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9YPTEwMjQKQ09ORklHX0lO
UFVUX01PVVNFREVWX1NDUkVFTl9ZPTc2OAojIENPTkZJR19JTlBVVF9KT1lERVYgaXMgbm90IHNl
dApDT05GSUdfSU5QVVRfRVZERVY9bQojIENPTkZJR19JTlBVVF9FVkJVRyBpcyBub3Qgc2V0Cgoj
CiMgSW5wdXQgRGV2aWNlIERyaXZlcnMKIwpDT05GSUdfSU5QVVRfS0VZQk9BUkQ9eQojIENPTkZJ
R19LRVlCT0FSRF9BRFA1NTg4IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQURQNTU4OSBp
cyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9BVEtCRD15CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA3MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFWUJPQVJEX1FUMjE2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0RMSU5LX0RJUjY4
NSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xLS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0dQSU9fUE9MTEVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVENBNjQxNiBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX1RDQTg0MTggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9NQVRSSVggaXMgbm90
IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMjMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9MTTgzMzMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9NQVg3MzU5IGlzIG5vdCBzZXQK
IyBDT05GSUdfS0VZQk9BUkRfTUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTVBSMTIx
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTkVXVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfT1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU0FNU1VORyBp
cyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1NUT1dBV0FZIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfU1VOS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfSVFTNjJYIGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfT01BUDQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9UQzM1ODlYIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVE0yX1RPVUNIS0VZIGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfWFRLQkQgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9DQVAxMVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQkNNIGlzIG5vdCBzZXQKIyBD
T05GSUdfS0VZQk9BUkRfTVRLX1BNSUMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9DWVBS
RVNTX1NGIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFPXkKQ09ORklHX01PVVNFX1BTMj1t
CkNPTkZJR19NT1VTRV9QUzJfQUxQUz15CkNPTkZJR19NT1VTRV9QUzJfQllEPXkKIyBDT05GSUdf
TU9VU0VfUFMyX0xPR0lQUzJQUCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9TWU5BUFRJ
Q1MgaXMgbm90IHNldApDT05GSUdfTU9VU0VfUFMyX1NZTkFQVElDU19TTUJVUz15CkNPTkZJR19N
T1VTRV9QUzJfQ1lQUkVTUz15CkNPTkZJR19NT1VTRV9QUzJfVFJBQ0tQT0lOVD15CkNPTkZJR19N
T1VTRV9QUzJfRUxBTlRFQ0g9eQpDT05GSUdfTU9VU0VfUFMyX0VMQU5URUNIX1NNQlVTPXkKIyBD
T05GSUdfTU9VU0VfUFMyX1NFTlRFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfUFMyX1RP
VUNIS0lUIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX1BTMl9GT0NBTFRFQ0g9eQojIENPTkZJR19N
T1VTRV9QUzJfVk1NT1VTRSBpcyBub3Qgc2V0CkNPTkZJR19NT1VTRV9QUzJfU01CVVM9eQpDT05G
SUdfTU9VU0VfU0VSSUFMPXkKIyBDT05GSUdfTU9VU0VfQVBQTEVUT1VDSCBpcyBub3Qgc2V0CiMg
Q09ORklHX01PVVNFX0JDTTU5NzQgaXMgbm90IHNldApDT05GSUdfTU9VU0VfQ1lBUEE9bQpDT05G
SUdfTU9VU0VfRUxBTl9JMkM9bQpDT05GSUdfTU9VU0VfRUxBTl9JMkNfSTJDPXkKIyBDT05GSUdf
TU9VU0VfRUxBTl9JMkNfU01CVVMgaXMgbm90IHNldApDT05GSUdfTU9VU0VfVlNYWFhBQT15CiMg
Q09ORklHX01PVVNFX0dQSU8gaXMgbm90IHNldApDT05GSUdfTU9VU0VfU1lOQVBUSUNTX0kyQz15
CkNPTkZJR19NT1VTRV9TWU5BUFRJQ1NfVVNCPW0KQ09ORklHX0lOUFVUX0pPWVNUSUNLPXkKQ09O
RklHX0pPWVNUSUNLX0FOQUxPRz1tCkNPTkZJR19KT1lTVElDS19BM0Q9bQpDT05GSUdfSk9ZU1RJ
Q0tfQURJPW0KQ09ORklHX0pPWVNUSUNLX0NPQlJBPXkKQ09ORklHX0pPWVNUSUNLX0dGMks9bQpD
T05GSUdfSk9ZU1RJQ0tfR1JJUD15CkNPTkZJR19KT1lTVElDS19HUklQX01QPXkKQ09ORklHX0pP
WVNUSUNLX0dVSUxMRU1PVD1tCiMgQ09ORklHX0pPWVNUSUNLX0lOVEVSQUNUIGlzIG5vdCBzZXQK
Q09ORklHX0pPWVNUSUNLX1NJREVXSU5ERVI9bQpDT05GSUdfSk9ZU1RJQ0tfVE1EQz15CkNPTkZJ
R19KT1lTVElDS19JRk9SQ0U9eQojIENPTkZJR19KT1lTVElDS19JRk9SQ0VfVVNCIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSk9ZU1RJQ0tfSUZPUkNFXzIzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNU
SUNLX1dBUlJJT1IgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfTUFHRUxMQU49bQpDT05GSUdf
Sk9ZU1RJQ0tfU1BBQ0VPUkI9eQojIENPTkZJR19KT1lTVElDS19TUEFDRUJBTEwgaXMgbm90IHNl
dApDT05GSUdfSk9ZU1RJQ0tfU1RJTkdFUj1tCiMgQ09ORklHX0pPWVNUSUNLX1RXSURKT1kgaXMg
bm90IHNldApDT05GSUdfSk9ZU1RJQ0tfWkhFTkhVQT1tCkNPTkZJR19KT1lTVElDS19EQjk9eQoj
IENPTkZJR19KT1lTVElDS19HQU1FQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfVFVS
Qk9HUkFGWCBpcyBub3Qgc2V0CkNPTkZJR19KT1lTVElDS19BUzUwMTE9bQojIENPTkZJR19KT1lT
VElDS19KT1lEVU1QIGlzIG5vdCBzZXQKQ09ORklHX0pPWVNUSUNLX1hQQUQ9bQpDT05GSUdfSk9Z
U1RJQ0tfWFBBRF9GRj15CkNPTkZJR19KT1lTVElDS19YUEFEX0xFRFM9eQpDT05GSUdfSk9ZU1RJ
Q0tfV0FMS0VSQTA3MDE9eQpDT05GSUdfSk9ZU1RJQ0tfUFhSQz15CiMgQ09ORklHX0pPWVNUSUNL
X1FXSUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfRlNJQTZCIGlzIG5vdCBzZXQKIyBD
T05GSUdfSk9ZU1RJQ0tfU0VOU0VIQVQgaXMgbm90IHNldApDT05GSUdfSU5QVVRfVEFCTEVUPXkK
Q09ORklHX1RBQkxFVF9VU0JfQUNFQ0FEPW0KQ09ORklHX1RBQkxFVF9VU0JfQUlQVEVLPXkKQ09O
RklHX1RBQkxFVF9VU0JfSEFOV0FORz15CkNPTkZJR19UQUJMRVRfVVNCX0tCVEFCPW0KQ09ORklH
X1RBQkxFVF9VU0JfUEVHQVNVUz1tCiMgQ09ORklHX1RBQkxFVF9TRVJJQUxfV0FDT000IGlzIG5v
dCBzZXQKQ09ORklHX0lOUFVUX1RPVUNIU0NSRUVOPXkKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQUQ3
ODc5IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQVIxMDIxX0kyQyBpcyBub3Qgc2V0
CkNPTkZJR19UT1VDSFNDUkVFTl9BVE1FTF9NWFQ9bQojIENPTkZJR19UT1VDSFNDUkVFTl9BVE1F
TF9NWFRfVDM3IGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0FVT19QSVhDSVI9eQojIENP
TkZJR19UT1VDSFNDUkVFTl9CVTIxMDEzIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0JV
MjEwMjk9bQojIENPTkZJR19UT1VDSFNDUkVFTl9DSElQT05FX0lDTjgzMTggaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9DSElQT05FX0lDTjg1MDUgaXMgbm90IHNldApDT05GSUdfVE9V
Q0hTQ1JFRU5fQ1k4Q1RNQTE0MD15CkNPTkZJR19UT1VDSFNDUkVFTl9DWThDVE1HMTEwPXkKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fQ1lUVFNQX0NPUkUgaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JF
RU5fQ1lUVFNQNF9DT1JFPW0KQ09ORklHX1RPVUNIU0NSRUVOX0NZVFRTUDRfSTJDPW0KQ09ORklH
X1RPVUNIU0NSRUVOX0RBOTA1Mj15CiMgQ09ORklHX1RPVUNIU0NSRUVOX0RZTkFQUk8gaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9IQU1QU0hJUkUgaXMgbm90IHNldApDT05GSUdfVE9V
Q0hTQ1JFRU5fRUVUST1tCkNPTkZJR19UT1VDSFNDUkVFTl9FR0FMQVg9bQpDT05GSUdfVE9VQ0hT
Q1JFRU5fRUdBTEFYX1NFUklBTD1tCkNPTkZJR19UT1VDSFNDUkVFTl9FWEMzMDAwPW0KIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fRlVKSVRTVSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0dP
T0RJWCBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9ISURFRVA9bQojIENPTkZJR19UT1VD
SFNDUkVFTl9IWUNPTl9IWTQ2WFggaXMgbm90IHNldApDT05GSUdfVE9VQ0hTQ1JFRU5fSUxJMjEw
WD15CkNPTkZJR19UT1VDSFNDUkVFTl9JTElURUs9bQpDT05GSUdfVE9VQ0hTQ1JFRU5fUzZTWTc2
MT1tCkNPTkZJR19UT1VDSFNDUkVFTl9HVU5aRT1tCiMgQ09ORklHX1RPVUNIU0NSRUVOX0VLVEYy
MTI3IGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0VMQU49bQojIENPTkZJR19UT1VDSFND
UkVFTl9FTE8gaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9XQUNPTV9XODAwMSBpcyBu
b3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9XQUNPTV9JMkM9eQojIENPTkZJR19UT1VDSFNDUkVF
Tl9NQVgxMTgwMSBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9NQ1M1MDAwPXkKQ09ORklH
X1RPVUNIU0NSRUVOX01NUzExND1tCkNPTkZJR19UT1VDSFNDUkVFTl9NRUxGQVNfTUlQND1tCkNP
TkZJR19UT1VDSFNDUkVFTl9NU0cyNjM4PXkKQ09ORklHX1RPVUNIU0NSRUVOX01UT1VDSD15CkNP
TkZJR19UT1VDSFNDUkVFTl9JTUFHSVM9eQojIENPTkZJR19UT1VDSFNDUkVFTl9JTVg2VUxfVFND
IGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX0lORVhJTz15CkNPTkZJR19UT1VDSFNDUkVF
Tl9NSzcxMj1tCiMgQ09ORklHX1RPVUNIU0NSRUVOX1BFTk1PVU5UIGlzIG5vdCBzZXQKIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fRURUX0ZUNVgwNiBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9U
T1VDSFJJR0hUPW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVE9VQ0hXSU4gaXMgbm90IHNldApDT05G
SUdfVE9VQ0hTQ1JFRU5fUElYQ0lSPXkKQ09ORklHX1RPVUNIU0NSRUVOX1dEVDg3WFhfSTJDPXkK
IyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0NPTVBPU0lURSBpcyBub3Qgc2V0CkNPTkZJR19UT1VD
SFNDUkVFTl9NQzEzNzgzPXkKQ09ORklHX1RPVUNIU0NSRUVOX1RPVUNISVQyMTM9bQpDT05GSUdf
VE9VQ0hTQ1JFRU5fVFNDX1NFUklPPXkKQ09ORklHX1RPVUNIU0NSRUVOX1RTQzIwMFhfQ09SRT1t
CkNPTkZJR19UT1VDSFNDUkVFTl9UU0MyMDA0PW0KQ09ORklHX1RPVUNIU0NSRUVOX1RTQzIwMDc9
bQpDT05GSUdfVE9VQ0hTQ1JFRU5fUk1fVFM9eQpDT05GSUdfVE9VQ0hTQ1JFRU5fU0lMRUFEPXkK
Q09ORklHX1RPVUNIU0NSRUVOX1NJU19JMkM9bQojIENPTkZJR19UT1VDSFNDUkVFTl9TVDEyMzIg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9TVE1GVFMgaXMgbm90IHNldApDT05GSUdf
VE9VQ0hTQ1JFRU5fU1VSNDA9eQpDT05GSUdfVE9VQ0hTQ1JFRU5fU1g4NjU0PXkKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9aRVQ2
MjIzIGlzIG5vdCBzZXQKQ09ORklHX1RPVUNIU0NSRUVOX1pGT1JDRT15CiMgQ09ORklHX1RPVUNI
U0NSRUVOX1JPSE1fQlUyMTAyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lRUzVY
WCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pJTklUSVggaXMgbm90IHNldApDT05G
SUdfSU5QVVRfTUlTQz15CkNPTkZJR19JTlBVVF84OFBNODBYX09OS0VZPW0KQ09ORklHX0lOUFVU
X0FENzE0WD1tCkNPTkZJR19JTlBVVF9BRDcxNFhfSTJDPW0KQ09ORklHX0lOUFVUX0FUQzI2MFhf
T05LRVk9bQojIENPTkZJR19JTlBVVF9BVE1FTF9DQVBUT1VDSCBpcyBub3Qgc2V0CkNPTkZJR19J
TlBVVF9CTUExNTA9bQpDT05GSUdfSU5QVVRfRTNYMF9CVVRUT049eQpDT05GSUdfSU5QVVRfTUFY
Nzc2NTBfT05LRVk9eQojIENPTkZJR19JTlBVVF9NQzEzNzgzX1BXUkJVVFRPTiBpcyBub3Qgc2V0
CkNPTkZJR19JTlBVVF9NTUE4NDUwPXkKQ09ORklHX0lOUFVUX0FQQU5FTD1tCkNPTkZJR19JTlBV
VF9HUElPX0JFRVBFUj15CiMgQ09ORklHX0lOUFVUX0dQSU9fREVDT0RFUiBpcyBub3Qgc2V0CkNP
TkZJR19JTlBVVF9HUElPX1ZJQlJBPXkKIyBDT05GSUdfSU5QVVRfQVRMQVNfQlROUyBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9BVElfUkVNT1RFMj15CkNPTkZJR19JTlBVVF9LRVlTUEFOX1JFTU9U
RT1tCkNPTkZJR19JTlBVVF9LWFRKOT1tCkNPTkZJR19JTlBVVF9QT1dFUk1BVEU9bQojIENPTkZJ
R19JTlBVVF9ZRUFMSU5LIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX0NNMTA5PW0KQ09ORklHX0lO
UFVUX1JFR1VMQVRPUl9IQVBUSUM9bQpDT05GSUdfSU5QVVRfUkVUVV9QV1JCVVRUT049bQpDT05G
SUdfSU5QVVRfVFBTNjUyMThfUFdSQlVUVE9OPXkKQ09ORklHX0lOUFVUX0FYUDIwWF9QRUs9bQpD
T05GSUdfSU5QVVRfVUlOUFVUPXkKQ09ORklHX0lOUFVUX1BBTE1BU19QV1JCVVRUT049eQpDT05G
SUdfSU5QVVRfUENGNTA2MzNfUE1VPW0KQ09ORklHX0lOUFVUX1BDRjg1NzQ9eQpDT05GSUdfSU5Q
VVRfUFdNX0JFRVBFUj15CkNPTkZJR19JTlBVVF9QV01fVklCUkE9bQpDT05GSUdfSU5QVVRfUks4
MDVfUFdSS0VZPXkKIyBDT05GSUdfSU5QVVRfR1BJT19ST1RBUllfRU5DT0RFUiBpcyBub3Qgc2V0
CkNPTkZJR19JTlBVVF9EQTcyODBfSEFQVElDUz15CkNPTkZJR19JTlBVVF9EQTkwNTJfT05LRVk9
bQpDT05GSUdfSU5QVVRfREE5MDYzX09OS0VZPXkKQ09ORklHX0lOUFVUX0FEWEwzNFg9bQojIENP
TkZJR19JTlBVVF9BRFhMMzRYX0kyQyBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9JTVNfUENVPXkK
Q09ORklHX0lOUFVUX0lRUzI2OUE9eQpDT05GSUdfSU5QVVRfSVFTNjI2QT1tCkNPTkZJR19JTlBV
VF9JUVM3MjIyPXkKQ09ORklHX0lOUFVUX0NNQTMwMDA9eQpDT05GSUdfSU5QVVRfQ01BMzAwMF9J
MkM9eQpDT05GSUdfSU5QVVRfSURFQVBBRF9TTElERUJBUj1tCkNPTkZJR19JTlBVVF9EUlYyNjBY
X0hBUFRJQ1M9bQpDT05GSUdfSU5QVVRfRFJWMjY2NV9IQVBUSUNTPXkKQ09ORklHX0lOUFVUX0RS
VjI2NjdfSEFQVElDUz1tCkNPTkZJR19JTlBVVF9SQVZFX1NQX1BXUkJVVFRPTj15CkNPTkZJR19J
TlBVVF9TVFBNSUMxX09OS0VZPW0KQ09ORklHX1JNSTRfQ09SRT1tCkNPTkZJR19STUk0X0kyQz1t
CiMgQ09ORklHX1JNSTRfU01CIGlzIG5vdCBzZXQKQ09ORklHX1JNSTRfRjAzPXkKQ09ORklHX1JN
STRfRjAzX1NFUklPPW0KQ09ORklHX1JNSTRfMkRfU0VOU09SPXkKQ09ORklHX1JNSTRfRjExPXkK
Q09ORklHX1JNSTRfRjEyPXkKQ09ORklHX1JNSTRfRjMwPXkKQ09ORklHX1JNSTRfRjM0PXkKIyBD
T05GSUdfUk1JNF9GM0EgaXMgbm90IHNldAojIENPTkZJR19STUk0X0Y1NCBpcyBub3Qgc2V0CkNP
TkZJR19STUk0X0Y1NT15CgojCiMgSGFyZHdhcmUgSS9PIHBvcnRzCiMKQ09ORklHX1NFUklPPXkK
Q09ORklHX0FSQ0hfTUlHSFRfSEFWRV9QQ19TRVJJTz15CkNPTkZJR19TRVJJT19JODA0Mj15CkNP
TkZJR19TRVJJT19TRVJQT1JUPXkKQ09ORklHX1NFUklPX0NUODJDNzEwPW0KQ09ORklHX1NFUklP
X1BBUktCRD15CiMgQ09ORklHX1NFUklPX1BDSVBTMiBpcyBub3Qgc2V0CkNPTkZJR19TRVJJT19M
SUJQUzI9eQojIENPTkZJR19TRVJJT19SQVcgaXMgbm90IHNldApDT05GSUdfU0VSSU9fQUxURVJB
X1BTMj1tCiMgQ09ORklHX1NFUklPX1BTMk1VTFQgaXMgbm90IHNldApDT05GSUdfU0VSSU9fQVJD
X1BTMj15CiMgQ09ORklHX1NFUklPX0FQQlBTMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX0dQ
SU9fUFMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNFUklPIGlzIG5vdCBzZXQKQ09ORklHX0dBTUVQ
T1JUPXkKQ09ORklHX0dBTUVQT1JUX05TNTU4PXkKQ09ORklHX0dBTUVQT1JUX0w0PXkKIyBDT05G
SUdfR0FNRVBPUlRfRU1VMTBLMSBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUX0ZNODAxIGlz
IG5vdCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmlj
ZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKIyBDT05GSUdf
VlQgaXMgbm90IHNldApDT05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0xESVNDX0FVVE9MT0FEIGlzIG5vdCBzZXQKCiMKIyBTZXJpYWwg
ZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049eQpDT05GSUdfU0VSSUFMXzgyNTA9eQpD
T05GSUdfU0VSSUFMXzgyNTBfREVQUkVDQVRFRF9PUFRJT05TPXkKQ09ORklHX1NFUklBTF84MjUw
X1BOUD15CiMgQ09ORklHX1NFUklBTF84MjUwXzE2NTUwQV9WQVJJQU5UUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFUklBTF84MjUwX0ZJTlRFSyBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9D
T05TT0xFPXkKQ09ORklHX1NFUklBTF84MjUwX1BDST15CkNPTkZJR19TRVJJQUxfODI1MF9FWEFS
PXkKQ09ORklHX1NFUklBTF84MjUwX05SX1VBUlRTPTQKQ09ORklHX1NFUklBTF84MjUwX1JVTlRJ
TUVfVUFSVFM9NApDT05GSUdfU0VSSUFMXzgyNTBfRVhURU5ERUQ9eQpDT05GSUdfU0VSSUFMXzgy
NTBfTUFOWV9QT1JUUz15CkNPTkZJR19TRVJJQUxfODI1MF9TSEFSRV9JUlE9eQojIENPTkZJR19T
RVJJQUxfODI1MF9ERVRFQ1RfSVJRIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfUlNB
IGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0RXTElCPXkKIyBDT05GSUdfU0VSSUFMXzgy
NTBfRFcgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9SVDI4OFggaXMgbm90IHNldApD
T05GSUdfU0VSSUFMXzgyNTBfTFBTUz15CkNPTkZJR19TRVJJQUxfODI1MF9NSUQ9eQpDT05GSUdf
U0VSSUFMXzgyNTBfUEVSSUNPTT15CiMgQ09ORklHX1NFUklBTF9PRl9QTEFURk9STSBpcyBub3Qg
c2V0CgojCiMgTm9uLTgyNTAgc2VyaWFsIHBvcnQgc3VwcG9ydAojCkNPTkZJR19TRVJJQUxfVUFS
VExJVEU9eQpDT05GSUdfU0VSSUFMX1VBUlRMSVRFX0NPTlNPTEU9eQpDT05GSUdfU0VSSUFMX1VB
UlRMSVRFX05SX1VBUlRTPTEKQ09ORklHX1NFUklBTF9DT1JFPXkKQ09ORklHX1NFUklBTF9DT1JF
X0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfSlNNIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9T
SUZJVkU9eQojIENPTkZJR19TRVJJQUxfU0lGSVZFX0NPTlNPTEUgaXMgbm90IHNldApDT05GSUdf
U0VSSUFMX0xBTlRJUT15CiMgQ09ORklHX1NFUklBTF9MQU5USVFfQ09OU09MRSBpcyBub3Qgc2V0
CkNPTkZJR19TRVJJQUxfU0NDTlhQPXkKQ09ORklHX1NFUklBTF9TQ0NOWFBfQ09OU09MRT15CkNP
TkZJR19TRVJJQUxfU0MxNklTN1hYX0NPUkU9eQpDT05GSUdfU0VSSUFMX1NDMTZJUzdYWD15CkNP
TkZJR19TRVJJQUxfU0MxNklTN1hYX0kyQz15CkNPTkZJR19TRVJJQUxfQUxURVJBX0pUQUdVQVJU
PXkKIyBDT05GSUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFSVF9DT05TT0xFIGlzIG5vdCBzZXQKQ09O
RklHX1NFUklBTF9BTFRFUkFfVUFSVD1tCkNPTkZJR19TRVJJQUxfQUxURVJBX1VBUlRfTUFYUE9S
VFM9NApDT05GSUdfU0VSSUFMX0FMVEVSQV9VQVJUX0JBVURSQVRFPTExNTIwMApDT05GSUdfU0VS
SUFMX1hJTElOWF9QU19VQVJUPXkKQ09ORklHX1NFUklBTF9YSUxJTlhfUFNfVUFSVF9DT05TT0xF
PXkKIyBDT05GSUdfU0VSSUFMX0FSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9SUDIgaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQ9bQpDT05GSUdfU0VSSUFMX0ZTTF9MSU5G
TEVYVUFSVD15CiMgQ09ORklHX1NFUklBTF9GU0xfTElORkxFWFVBUlRfQ09OU09MRSBpcyBub3Qg
c2V0CkNPTkZJR19TRVJJQUxfQ09ORVhBTlRfRElHSUNPTE9SPW0KIyBDT05GSUdfU0VSSUFMX1NQ
UkQgaXMgbm90IHNldApDT05GSUdfU0VSSUFMX0xJVEVVQVJUPW0KQ09ORklHX1NFUklBTF9MSVRF
VUFSVF9NQVhfUE9SVFM9MQojIGVuZCBvZiBTZXJpYWwgZHJpdmVycwoKQ09ORklHX1NFUklBTF9N
Q1RSTF9HUElPPXkKIyBDT05GSUdfU0VSSUFMX05PTlNUQU5EQVJEIGlzIG5vdCBzZXQKQ09ORklH
X05fR1NNPW0KIyBDT05GSUdfTk9aT01JIGlzIG5vdCBzZXQKQ09ORklHX05VTExfVFRZPW0KQ09O
RklHX1JQTVNHX1RUWT1tCkNPTkZJR19TRVJJQUxfREVWX0JVUz15CiMgQ09ORklHX1NFUklBTF9E
RVZfQ1RSTF9UVFlQT1JUIGlzIG5vdCBzZXQKQ09ORklHX1RUWV9QUklOVEs9eQpDT05GSUdfVFRZ
X1BSSU5US19MRVZFTD02CiMgQ09ORklHX1BSSU5URVIgaXMgbm90IHNldApDT05GSUdfUFBERVY9
bQojIENPTkZJR19WSVJUSU9fQ09OU09MRSBpcyBub3Qgc2V0CkNPTkZJR19JUE1JX0hBTkRMRVI9
bQpDT05GSUdfSVBNSV9QTEFUX0RBVEE9eQojIENPTkZJR19JUE1JX1BBTklDX0VWRU5UIGlzIG5v
dCBzZXQKQ09ORklHX0lQTUlfREVWSUNFX0lOVEVSRkFDRT1tCkNPTkZJR19JUE1JX1NJPW0KIyBD
T05GSUdfSVBNSV9TU0lGIGlzIG5vdCBzZXQKQ09ORklHX0lQTUlfSVBNQj1tCiMgQ09ORklHX0lQ
TUlfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19JUE1JX1BPV0VST0ZGIGlzIG5vdCBzZXQK
Q09ORklHX0lQTUJfREVWSUNFX0lOVEVSRkFDRT1tCkNPTkZJR19IV19SQU5ET009eQpDT05GSUdf
SFdfUkFORE9NX1RJTUVSSU9NRU09bQpDT05GSUdfSFdfUkFORE9NX0lOVEVMPXkKIyBDT05GSUdf
SFdfUkFORE9NX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hXX1JBTkRPTV9CQTQzMSBpcyBub3Qg
c2V0CkNPTkZJR19IV19SQU5ET01fVklBPW0KQ09ORklHX0hXX1JBTkRPTV9WSVJUSU89bQojIENP
TkZJR19IV19SQU5ET01fQ0NUUk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX1hJUEhF
UkEgaXMgbm90IHNldAojIENPTkZJR19BUFBMSUNPTSBpcyBub3Qgc2V0CkNPTkZJR19NV0FWRT15
CkNPTkZJR19ERVZNRU09eQpDT05GSUdfTlZSQU09bQpDT05GSUdfREVWUE9SVD15CiMgQ09ORklH
X0hQRVQgaXMgbm90IHNldApDT05GSUdfSEFOR0NIRUNLX1RJTUVSPXkKQ09ORklHX1RDR19UUE09
eQojIENPTkZJR19IV19SQU5ET01fVFBNIGlzIG5vdCBzZXQKQ09ORklHX1RDR19USVNfQ09SRT15
CkNPTkZJR19UQ0dfVElTPXkKIyBDT05GSUdfVENHX1RJU19JMkMgaXMgbm90IHNldApDT05GSUdf
VENHX1RJU19JMkNfQ1I1MD1tCkNPTkZJR19UQ0dfVElTX0kyQ19BVE1FTD15CkNPTkZJR19UQ0df
VElTX0kyQ19JTkZJTkVPTj1tCkNPTkZJR19UQ0dfVElTX0kyQ19OVVZPVE9OPW0KQ09ORklHX1RD
R19OU0M9bQpDT05GSUdfVENHX0FUTUVMPXkKIyBDT05GSUdfVENHX0lORklORU9OIGlzIG5vdCBz
ZXQKQ09ORklHX1RDR19DUkI9eQpDT05GSUdfVENHX1ZUUE1fUFJPWFk9bQojIENPTkZJR19UQ0df
VElTX1NUMzNaUDI0X0kyQyBpcyBub3Qgc2V0CkNPTkZJR19URUxDTE9DSz15CkNPTkZJR19YSUxM
WUJVU19DTEFTUz15CkNPTkZJR19YSUxMWUJVUz1tCkNPTkZJR19YSUxMWUJVU19PRj1tCkNPTkZJ
R19YSUxMWVVTQj15CiMgQ09ORklHX1JBTkRPTV9UUlVTVF9DUFUgaXMgbm90IHNldApDT05GSUdf
UkFORE9NX1RSVVNUX0JPT1RMT0FERVI9eQojIGVuZCBvZiBDaGFyYWN0ZXIgZGV2aWNlcwoKIwoj
IEkyQyBzdXBwb3J0CiMKQ09ORklHX0kyQz15CkNPTkZJR19BQ1BJX0kyQ19PUFJFR0lPTj15CkNP
TkZJR19JMkNfQk9BUkRJTkZPPXkKQ09ORklHX0kyQ19DT01QQVQ9eQojIENPTkZJR19JMkNfQ0hB
UkRFViBpcyBub3Qgc2V0CkNPTkZJR19JMkNfTVVYPXkKCiMKIyBNdWx0aXBsZXhlciBJMkMgQ2hp
cCBzdXBwb3J0CiMKIyBDT05GSUdfSTJDX0FSQl9HUElPX0NIQUxMRU5HRSBpcyBub3Qgc2V0CkNP
TkZJR19JMkNfTVVYX0dQSU89eQojIENPTkZJR19JMkNfTVVYX0dQTVVYIGlzIG5vdCBzZXQKQ09O
RklHX0kyQ19NVVhfTFRDNDMwNj15CkNPTkZJR19JMkNfTVVYX1BDQTk1NDE9eQpDT05GSUdfSTJD
X01VWF9QQ0E5NTR4PXkKQ09ORklHX0kyQ19NVVhfUElOQ1RSTD1tCiMgQ09ORklHX0kyQ19NVVhf
UkVHIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19ERU1VWF9QSU5DVFJMPXkKQ09ORklHX0kyQ19NVVhf
TUxYQ1BMRD15CiMgZW5kIG9mIE11bHRpcGxleGVyIEkyQyBDaGlwIHN1cHBvcnQKCiMgQ09ORklH
X0kyQ19IRUxQRVJfQVVUTyBpcyBub3Qgc2V0CkNPTkZJR19JMkNfU01CVVM9eQoKIwojIEkyQyBB
bGdvcml0aG1zCiMKQ09ORklHX0kyQ19BTEdPQklUPXkKQ09ORklHX0kyQ19BTEdPUENGPW0KIyBD
T05GSUdfSTJDX0FMR09QQ0EgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgQWxnb3JpdGhtcwoKIwoj
IEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAojCgojCiMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVy
IGRyaXZlcnMKIwojIENPTkZJR19JMkNfQUxJMTUzNSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19B
TEkxNTYzIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FMSTE1WDMgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfQU1ENzU2IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FNRDgxMTEgaXMgbm90IHNldAoj
IENPTkZJR19JMkNfQU1EX01QMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19JODAxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSTJDX0lTQ0ggaXMgbm90IHNldAojIENPTkZJR19JMkNfSVNNVCBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19QSUlYNCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ORk9SQ0UyIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX05WSURJQV9HUFUgaXMgbm90IHNldAojIENPTkZJR19JMkNf
U0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM2MzAgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfU0lTOTZYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZJQSBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19WSUFQUk8gaXMgbm90IHNldAoKIwojIEFDUEkgZHJpdmVycwojCiMgQ09ORklHX0ky
Q19TQ01JIGlzIG5vdCBzZXQKCiMKIyBJMkMgc3lzdGVtIGJ1cyBkcml2ZXJzIChtb3N0bHkgZW1i
ZWRkZWQgLyBzeXN0ZW0tb24tY2hpcCkKIwpDT05GSUdfSTJDX0NCVVNfR1BJTz15CkNPTkZJR19J
MkNfREVTSUdOV0FSRV9DT1JFPXkKQ09ORklHX0kyQ19ERVNJR05XQVJFX1NMQVZFPXkKQ09ORklH
X0kyQ19ERVNJR05XQVJFX1BMQVRGT1JNPXkKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfQU1EUFNQ
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFU0lHTldBUkVfUENJIGlzIG5vdCBzZXQKQ09ORklH
X0kyQ19FTUVWMj1tCkNPTkZJR19JMkNfR1BJTz1tCkNPTkZJR19JMkNfR1BJT19GQVVMVF9JTkpF
Q1RPUj15CkNPTkZJR19JMkNfT0NPUkVTPXkKIyBDT05GSUdfSTJDX1BDQV9QTEFURk9STSBpcyBu
b3Qgc2V0CkNPTkZJR19JMkNfUkszWD15CkNPTkZJR19JMkNfU0lNVEVDPXkKQ09ORklHX0kyQ19Y
SUxJTlg9bQoKIwojIEV4dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwpDT05GSUdf
STJDX0RJT0xBTl9VMkM9eQpDT05GSUdfSTJDX0NQMjYxNT15CkNPTkZJR19JMkNfUEFSUE9SVD15
CkNPTkZJR19JMkNfUk9CT1RGVVpaX09TSUY9eQpDT05GSUdfSTJDX1RBT1NfRVZNPXkKQ09ORklH
X0kyQ19USU5ZX1VTQj15CgojCiMgT3RoZXIgSTJDL1NNQnVzIGJ1cyBkcml2ZXJzCiMKQ09ORklH
X0kyQ19NTFhDUExEPXkKQ09ORklHX0kyQ19GU0k9eQojIENPTkZJR19JMkNfVklSVElPIGlzIG5v
dCBzZXQKIyBlbmQgb2YgSTJDIEhhcmR3YXJlIEJ1cyBzdXBwb3J0CgojIENPTkZJR19JMkNfU1RV
QiBpcyBub3Qgc2V0CkNPTkZJR19JMkNfU0xBVkU9eQpDT05GSUdfSTJDX1NMQVZFX0VFUFJPTT1t
CkNPTkZJR19JMkNfU0xBVkVfVEVTVFVOSVQ9bQojIENPTkZJR19JMkNfREVCVUdfQ09SRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19BTEdPIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RF
QlVHX0JVUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBzdXBwb3J0CgojIENPTkZJR19JM0MgaXMg
bm90IHNldAojIENPTkZJR19TUEkgaXMgbm90IHNldApDT05GSUdfU1BNST1tCkNPTkZJR19TUE1J
X0hJU0kzNjcwPW0KQ09ORklHX0hTST15CkNPTkZJR19IU0lfQk9BUkRJTkZPPXkKCiMKIyBIU0kg
Y29udHJvbGxlcnMKIwoKIwojIEhTSSBjbGllbnRzCiMKQ09ORklHX0hTSV9DSEFSPXkKIyBDT05G
SUdfUFBTIGlzIG5vdCBzZXQKCiMKIyBQVFAgY2xvY2sgc3VwcG9ydAojCkNPTkZJR19QVFBfMTU4
OF9DTE9DS19PUFRJT05BTD15CiMgZW5kIG9mIFBUUCBjbG9jayBzdXBwb3J0CgpDT05GSUdfUElO
Q1RSTD15CkNPTkZJR19HRU5FUklDX1BJTkNUUkxfR1JPVVBTPXkKQ09ORklHX1BJTk1VWD15CkNP
TkZJR19HRU5FUklDX1BJTk1VWF9GVU5DVElPTlM9eQpDT05GSUdfUElOQ09ORj15CkNPTkZJR19H
RU5FUklDX1BJTkNPTkY9eQojIENPTkZJR19ERUJVR19QSU5DVFJMIGlzIG5vdCBzZXQKIyBDT05G
SUdfUElOQ1RSTF9BTUQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0FTMzcyMiBpcyBub3Qg
c2V0CkNPTkZJR19QSU5DVFJMX0FYUDIwOT1tCiMgQ09ORklHX1BJTkNUUkxfREE5MDYyIGlzIG5v
dCBzZXQKIyBDT05GSUdfUElOQ1RSTF9FUVVJTElCUklVTSBpcyBub3Qgc2V0CkNPTkZJR19QSU5D
VFJMX01DUDIzUzA4X0kyQz15CkNPTkZJR19QSU5DVFJMX01DUDIzUzA4PXkKIyBDT05GSUdfUElO
Q1RSTF9NSUNST0NISVBfU0dQSU8gaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX09DRUxPVCBp
cyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX1BBTE1BUz1tCkNPTkZJR19QSU5DVFJMX1JLODA1PXkK
Q09ORklHX1BJTkNUUkxfU0lOR0xFPW0KIyBDT05GSUdfUElOQ1RSTF9TVE1GWCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BJTkNUUkxfU1gxNTBYIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfTE9DSE5B
R0FSPXkKCiMKIyBJbnRlbCBwaW5jdHJsIGRyaXZlcnMKIwojIENPTkZJR19QSU5DVFJMX0JBWVRS
QUlMIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9DSEVSUllWSUVXIGlzIG5vdCBzZXQKIyBD
T05GSUdfUElOQ1RSTF9MWU5YUE9JTlQgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0FMREVS
TEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQlJPWFRPTiBpcyBub3Qgc2V0CiMgQ09O
RklHX1BJTkNUUkxfQ0FOTk9OTEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfQ0VEQVJG
T1JLIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9ERU5WRVJUT04gaXMgbm90IHNldAojIENP
TkZJR19QSU5DVFJMX0VMS0hBUlRMQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9FTU1J
VFNCVVJHIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9HRU1JTklMQUtFIGlzIG5vdCBzZXQK
IyBDT05GSUdfUElOQ1RSTF9JQ0VMQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9KQVNQ
RVJMQUtFIGlzIG5vdCBzZXQKIyBDT05GSUdfUElOQ1RSTF9MQUtFRklFTEQgaXMgbm90IHNldAoj
IENPTkZJR19QSU5DVFJMX0xFV0lTQlVSRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTUVU
RU9STEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1VOUklTRVBPSU5UIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUElOQ1RSTF9USUdFUkxBS0UgaXMgbm90IHNldAojIGVuZCBvZiBJbnRlbCBw
aW5jdHJsIGRyaXZlcnMKCiMKIyBSZW5lc2FzIHBpbmN0cmwgZHJpdmVycwojCiMgZW5kIG9mIFJl
bmVzYXMgcGluY3RybCBkcml2ZXJzCgpDT05GSUdfR1BJT0xJQj15CkNPTkZJR19HUElPTElCX0ZB
U1RQQVRIX0xJTUlUPTUxMgpDT05GSUdfT0ZfR1BJTz15CkNPTkZJR19HUElPX0FDUEk9eQpDT05G
SUdfR1BJT0xJQl9JUlFDSElQPXkKQ09ORklHX0RFQlVHX0dQSU89eQpDT05GSUdfR1BJT19TWVNG
Uz15CkNPTkZJR19HUElPX0NERVY9eQojIENPTkZJR19HUElPX0NERVZfVjEgaXMgbm90IHNldApD
T05GSUdfR1BJT19HRU5FUklDPXkKQ09ORklHX0dQSU9fTUFYNzMwWD1tCgojCiMgTWVtb3J5IG1h
cHBlZCBHUElPIGRyaXZlcnMKIwpDT05GSUdfR1BJT183NFhYX01NSU89bQpDT05GSUdfR1BJT19B
TFRFUkE9bQojIENPTkZJR19HUElPX0FNRFBUIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fQ0FERU5D
RT15CkNPTkZJR19HUElPX0RXQVBCPW0KIyBDT05GSUdfR1BJT19FWEFSIGlzIG5vdCBzZXQKIyBD
T05GSUdfR1BJT19GVEdQSU8wMTAgaXMgbm90IHNldAojIENPTkZJR19HUElPX0dFTkVSSUNfUExB
VEZPUk0gaXMgbm90IHNldApDT05GSUdfR1BJT19HUkdQSU89bQojIENPTkZJR19HUElPX0hMV0Qg
aXMgbm90IHNldApDT05GSUdfR1BJT19MT0dJQ1ZDPXkKQ09ORklHX0dQSU9fTUI4NlM3WD1tCiMg
Q09ORklHX0dQSU9fU0lGSVZFIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fU1lTQ09OPXkKIyBDT05G
SUdfR1BJT19WWDg1NSBpcyBub3Qgc2V0CkNPTkZJR19HUElPX1hJTElOWD1tCiMgQ09ORklHX0dQ
SU9fQU1EX0ZDSCBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2ZXJz
CgojCiMgUG9ydC1tYXBwZWQgSS9PIEdQSU8gZHJpdmVycwojCkNPTkZJR19HUElPX0Y3MTg4WD15
CkNPTkZJR19HUElPX0lUODc9bQpDT05GSUdfR1BJT19TQ0gzMTFYPW0KIyBDT05GSUdfR1BJT19X
SU5CT05EIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fV1MxNkM0OD1tCiMgZW5kIG9mIFBvcnQtbWFw
cGVkIEkvTyBHUElPIGRyaXZlcnMKCiMKIyBJMkMgR1BJTyBleHBhbmRlcnMKIwojIENPTkZJR19H
UElPX0FEUDU1ODggaXMgbm90IHNldAojIENPTkZJR19HUElPX0FETlAgaXMgbm90IHNldAojIENP
TkZJR19HUElPX0dXX1BMRCBpcyBub3Qgc2V0CkNPTkZJR19HUElPX01BWDczMDA9bQpDT05GSUdf
R1BJT19NQVg3MzJYPW0KQ09ORklHX0dQSU9fUENBOTUzWD1tCiMgQ09ORklHX0dQSU9fUENBOTUz
WF9JUlEgaXMgbm90IHNldAojIENPTkZJR19HUElPX1BDQTk1NzAgaXMgbm90IHNldApDT05GSUdf
R1BJT19QQ0Y4NTdYPXkKIyBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9m
IEkyQyBHUElPIGV4cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQ
SU9fQVJJWk9OQSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQkQ3MTgxNSBpcyBub3Qgc2V0CkNP
TkZJR19HUElPX0JENzE4Mjg9bQojIENPTkZJR19HUElPX0JEOTU3MU1XViBpcyBub3Qgc2V0CiMg
Q09ORklHX0dQSU9fREE5MDUyIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9fTFAzOTQzPW0KIyBDT05G
SUdfR1BJT19MUDg3M1ggaXMgbm90IHNldAojIENPTkZJR19HUElPX0xQODc1NjUgaXMgbm90IHNl
dApDT05GSUdfR1BJT19NQVg3NzY1MD15CiMgQ09ORklHX0dQSU9fUEFMTUFTIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19UQzM1ODlYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19UUFM2NTA4NiBp
cyBub3Qgc2V0CkNPTkZJR19HUElPX1RQUzY1MjE4PW0KQ09ORklHX0dQSU9fVFBTNjU5MTI9eQpD
T05GSUdfR1BJT19UUU1YODY9eQpDT05GSUdfR1BJT19XTTgzNTA9eQojIGVuZCBvZiBNRkQgR1BJ
TyBleHBhbmRlcnMKCiMKIyBQQ0kgR1BJTyBleHBhbmRlcnMKIwojIENPTkZJR19HUElPX0FNRDgx
MTEgaXMgbm90IHNldAojIENPTkZJR19HUElPX0JUOFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJ
T19NTF9JT0ggaXMgbm90IHNldAojIENPTkZJR19HUElPX1BDSV9JRElPXzE2IGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19QQ0lFX0lESU9fMjQgaXMgbm90IHNldAojIENPTkZJR19HUElPX1JEQzMy
MVggaXMgbm90IHNldAojIENPTkZJR19HUElPX1NPREFWSUxMRSBpcyBub3Qgc2V0CiMgZW5kIG9m
IFBDSSBHUElPIGV4cGFuZGVycwoKIwojIFVTQiBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIFVT
QiBHUElPIGV4cGFuZGVycwoKIwojIFZpcnR1YWwgR1BJTyBkcml2ZXJzCiMKQ09ORklHX0dQSU9f
QUdHUkVHQVRPUj1tCiMgQ09ORklHX0dQSU9fTU9DS1VQIGlzIG5vdCBzZXQKQ09ORklHX0dQSU9f
VklSVElPPXkKQ09ORklHX0dQSU9fU0lNPW0KIyBlbmQgb2YgVmlydHVhbCBHUElPIGRyaXZlcnMK
CkNPTkZJR19XMT1tCiMgQ09ORklHX1cxX0NPTiBpcyBub3Qgc2V0CgojCiMgMS13aXJlIEJ1cyBN
YXN0ZXJzCiMKIyBDT05GSUdfVzFfTUFTVEVSX01BVFJPWCBpcyBub3Qgc2V0CkNPTkZJR19XMV9N
QVNURVJfRFMyNDkwPW0KQ09ORklHX1cxX01BU1RFUl9EUzI0ODI9bQojIENPTkZJR19XMV9NQVNU
RVJfRFMxV00gaXMgbm90IHNldApDT05GSUdfVzFfTUFTVEVSX0dQSU89bQojIENPTkZJR19XMV9N
QVNURVJfU0dJIGlzIG5vdCBzZXQKIyBlbmQgb2YgMS13aXJlIEJ1cyBNYXN0ZXJzCgojCiMgMS13
aXJlIFNsYXZlcwojCkNPTkZJR19XMV9TTEFWRV9USEVSTT1tCkNPTkZJR19XMV9TTEFWRV9TTUVN
PW0KQ09ORklHX1cxX1NMQVZFX0RTMjQwNT1tCiMgQ09ORklHX1cxX1NMQVZFX0RTMjQwOCBpcyBu
b3Qgc2V0CkNPTkZJR19XMV9TTEFWRV9EUzI0MTM9bQpDT05GSUdfVzFfU0xBVkVfRFMyNDA2PW0K
Q09ORklHX1cxX1NMQVZFX0RTMjQyMz1tCiMgQ09ORklHX1cxX1NMQVZFX0RTMjgwNSBpcyBub3Qg
c2V0CiMgQ09ORklHX1cxX1NMQVZFX0RTMjQzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1cxX1NMQVZF
X0RTMjQzMSBpcyBub3Qgc2V0CkNPTkZJR19XMV9TTEFWRV9EUzI0MzM9bQpDT05GSUdfVzFfU0xB
VkVfRFMyNDMzX0NSQz15CkNPTkZJR19XMV9TTEFWRV9EUzI0Mzg9bQpDT05GSUdfVzFfU0xBVkVf
RFMyNTBYPW0KQ09ORklHX1cxX1NMQVZFX0RTMjc4MD1tCiMgQ09ORklHX1cxX1NMQVZFX0RTMjc4
MSBpcyBub3Qgc2V0CkNPTkZJR19XMV9TTEFWRV9EUzI4RTA0PW0KQ09ORklHX1cxX1NMQVZFX0RT
MjhFMTc9bQojIGVuZCBvZiAxLXdpcmUgU2xhdmVzCgpDT05GSUdfUE9XRVJfUkVTRVQ9eQojIENP
TkZJR19QT1dFUl9SRVNFVF9BUzM3MjIgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVF9B
VEMyNjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfUE9XRVJfUkVTRVRfR1BJTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BPV0VSX1JFU0VUX0dQSU9fUkVTVEFSVCBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9S
RVNFVF9MVEMyOTUyPXkKQ09ORklHX1BPV0VSX1JFU0VUX01UNjMyMz15CkNPTkZJR19QT1dFUl9S
RVNFVF9SRUdVTEFUT1I9eQojIENPTkZJR19QT1dFUl9SRVNFVF9SRVNUQVJUIGlzIG5vdCBzZXQK
IyBDT05GSUdfUE9XRVJfUkVTRVRfVFBTNjUwODYgaXMgbm90IHNldApDT05GSUdfUE9XRVJfUkVT
RVRfU1lTQ09OPXkKQ09ORklHX1BPV0VSX1JFU0VUX1NZU0NPTl9QT1dFUk9GRj15CkNPTkZJR19S
RUJPT1RfTU9ERT15CkNPTkZJR19TWVNDT05fUkVCT09UX01PREU9eQpDT05GSUdfTlZNRU1fUkVC
T09UX01PREU9bQpDT05GSUdfUE9XRVJfU1VQUExZPXkKIyBDT05GSUdfUE9XRVJfU1VQUExZX0RF
QlVHIGlzIG5vdCBzZXQKQ09ORklHX1BEQV9QT1dFUj1tCiMgQ09ORklHX0lQNVhYWF9QT1dFUiBp
cyBub3Qgc2V0CkNPTkZJR19XTTgzNTBfUE9XRVI9eQojIENPTkZJR19URVNUX1BPV0VSIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9BRFA1MDYxIGlzIG5vdCBzZXQKQ09ORklHX0JBVFRFUllf
QUNUODk0NUE9bQojIENPTkZJR19CQVRURVJZX0NXMjAxNSBpcyBub3Qgc2V0CkNPTkZJR19CQVRU
RVJZX0RTMjc2MD1tCkNPTkZJR19CQVRURVJZX0RTMjc4MD1tCiMgQ09ORklHX0JBVFRFUllfRFMy
NzgxIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODIgaXMgbm90IHNldApDT05GSUdf
QkFUVEVSWV9TQU1TVU5HX1NEST15CkNPTkZJR19CQVRURVJZX1NCUz15CiMgQ09ORklHX0NIQVJH
RVJfU0JTIGlzIG5vdCBzZXQKQ09ORklHX01BTkFHRVJfU0JTPXkKQ09ORklHX0JBVFRFUllfQlEy
N1hYWD1tCkNPTkZJR19CQVRURVJZX0JRMjdYWFhfSTJDPW0KQ09ORklHX0JBVFRFUllfQlEyN1hY
WF9IRFE9bQojIENPTkZJR19CQVRURVJZX0JRMjdYWFhfRFRfVVBEQVRFU19OVk0gaXMgbm90IHNl
dAojIENPTkZJR19CQVRURVJZX0RBOTA1MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfREE5
MTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MCBpcyBub3Qgc2V0CkNPTkZJ
R19CQVRURVJZX01BWDE3MDQyPXkKQ09ORklHX0JBVFRFUllfTUFYMTcyMVg9bQpDT05GSUdfQ0hB
UkdFUl9QQ0Y1MDYzMz1tCiMgQ09ORklHX0NIQVJHRVJfSVNQMTcwNCBpcyBub3Qgc2V0CkNPTkZJ
R19DSEFSR0VSX01BWDg5MDM9bQpDT05GSUdfQ0hBUkdFUl9MUDg3Mjc9bQojIENPTkZJR19DSEFS
R0VSX0dQSU8gaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9NQU5BR0VSPW0KQ09ORklHX0NIQVJH
RVJfTFQzNjUxPXkKIyBDT05GSUdfQ0hBUkdFUl9MVEM0MTYyTCBpcyBub3Qgc2V0CkNPTkZJR19D
SEFSR0VSX01BWDE0NTc3PW0KIyBDT05GSUdfQ0hBUkdFUl9ERVRFQ1RPUl9NQVgxNDY1NiBpcyBu
b3Qgc2V0CkNPTkZJR19DSEFSR0VSX01BWDc3NjUwPW0KIyBDT05GSUdfQ0hBUkdFUl9NQVg3Nzk3
NiBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX01BWDg5OTg9bQpDT05GSUdfQ0hBUkdFUl9NVDYz
NjA9bQojIENPTkZJR19DSEFSR0VSX0JRMjQxNVggaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9C
UTI0MTkwPXkKQ09ORklHX0NIQVJHRVJfQlEyNDI1Nz15CiMgQ09ORklHX0NIQVJHRVJfQlEyNDcz
NSBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX0JRMjUxNVg9eQpDT05GSUdfQ0hBUkdFUl9CUTI1
ODkwPXkKQ09ORklHX0NIQVJHRVJfQlEyNTk4MD15CiMgQ09ORklHX0NIQVJHRVJfQlEyNTZYWCBp
cyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX1NNQjM0Nz15CkNPTkZJR19DSEFSR0VSX1RQUzY1MjE3
PW0KQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MT15CiMgQ09ORklHX0JBVFRFUllfR09MREZJ
U0ggaXMgbm90IHNldApDT05GSUdfQkFUVEVSWV9SVDUwMzM9eQpDT05GSUdfQ0hBUkdFUl9SVDk0
NTU9eQojIENPTkZJR19DSEFSR0VSX1VDUzEwMDIgaXMgbm90IHNldApDT05GSUdfQ0hBUkdFUl9C
RDk5OTU0PXkKIyBDT05GSUdfQkFUVEVSWV9VRzMxMDUgaXMgbm90IHNldAojIENPTkZJR19IV01P
TiBpcyBub3Qgc2V0CkNPTkZJR19USEVSTUFMPXkKQ09ORklHX1RIRVJNQUxfTkVUTElOSz15CiMg
Q09ORklHX1RIRVJNQUxfU1RBVElTVElDUyBpcyBub3Qgc2V0CkNPTkZJR19USEVSTUFMX0VNRVJH
RU5DWV9QT1dFUk9GRl9ERUxBWV9NUz0wCiMgQ09ORklHX1RIRVJNQUxfT0YgaXMgbm90IHNldApD
T05GSUdfVEhFUk1BTF9XUklUQUJMRV9UUklQUz15CkNPTkZJR19USEVSTUFMX0RFRkFVTFRfR09W
X1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfRkFJUl9TSEFSRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfVVNFUl9TUEFDRSBpcyBub3Qgc2V0
CiMgQ09ORklHX1RIRVJNQUxfR09WX0ZBSVJfU0hBUkUgaXMgbm90IHNldApDT05GSUdfVEhFUk1B
TF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05GSUdfVEhFUk1BTF9HT1ZfQkFOR19CQU5HIGlzIG5vdCBz
ZXQKQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BBQ0U9eQojIENPTkZJR19ERVZGUkVRX1RIRVJN
QUwgaXMgbm90IHNldApDT05GSUdfVEhFUk1BTF9FTVVMQVRJT049eQpDT05GSUdfVEhFUk1BTF9N
TUlPPW0KQ09ORklHX0RBOTA2Ml9USEVSTUFMPW0KCiMKIyBJbnRlbCB0aGVybWFsIGRyaXZlcnMK
IwpDT05GSUdfSU5URUxfUE9XRVJDTEFNUD15CkNPTkZJR19YODZfVEhFUk1BTF9WRUNUT1I9eQpD
T05GSUdfWDg2X1BLR19URU1QX1RIRVJNQUw9bQojIENPTkZJR19JTlRFTF9TT0NfRFRTX1RIRVJN
QUwgaXMgbm90IHNldAoKIwojIEFDUEkgSU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKIwojIENPTkZJ
R19JTlQzNDBYX1RIRVJNQUwgaXMgbm90IHNldAojIGVuZCBvZiBBQ1BJIElOVDM0MFggdGhlcm1h
bCBkcml2ZXJzCgojIENPTkZJR19JTlRFTF9QQ0hfVEhFUk1BTCBpcyBub3Qgc2V0CkNPTkZJR19J
TlRFTF9UQ0NfQ09PTElORz15CiMgQ09ORklHX0lOVEVMX01FTkxPVyBpcyBub3Qgc2V0CkNPTkZJ
R19JTlRFTF9IRklfVEhFUk1BTD15CiMgZW5kIG9mIEludGVsIHRoZXJtYWwgZHJpdmVycwoKIyBD
T05GSUdfVElfU09DX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19XQVRDSERPRyBpcyBub3Qg
c2V0CkNPTkZJR19TU0JfUE9TU0lCTEU9eQpDT05GSUdfU1NCPW0KQ09ORklHX1NTQl9TUFJPTT15
CkNPTkZJR19TU0JfUENJSE9TVF9QT1NTSUJMRT15CkNPTkZJR19TU0JfUENJSE9TVD15CkNPTkZJ
R19TU0JfU0RJT0hPU1RfUE9TU0lCTEU9eQpDT05GSUdfU1NCX1NESU9IT1NUPXkKQ09ORklHX1NT
Ql9EUklWRVJfUENJQ09SRV9QT1NTSUJMRT15CiMgQ09ORklHX1NTQl9EUklWRVJfUENJQ09SRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NTQl9EUklWRVJfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19CQ01B
X1BPU1NJQkxFPXkKQ09ORklHX0JDTUE9eQpDT05GSUdfQkNNQV9IT1NUX1BDSV9QT1NTSUJMRT15
CkNPTkZJR19CQ01BX0hPU1RfUENJPXkKIyBDT05GSUdfQkNNQV9IT1NUX1NPQyBpcyBub3Qgc2V0
CkNPTkZJR19CQ01BX0RSSVZFUl9QQ0k9eQojIENPTkZJR19CQ01BX0RSSVZFUl9HTUFDX0NNTiBp
cyBub3Qgc2V0CkNPTkZJR19CQ01BX0RSSVZFUl9HUElPPXkKQ09ORklHX0JDTUFfREVCVUc9eQoK
IwojIE11bHRpZnVuY3Rpb24gZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdfTUZEX0NPUkU9eQpDT05G
SUdfTUZEX0FDVDg5NDVBPXkKIyBDT05GSUdfTUZEX0FTMzcxMSBpcyBub3Qgc2V0CkNPTkZJR19N
RkRfQVMzNzIyPW0KIyBDT05GSUdfUE1JQ19BRFA1NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X0FBVDI4NzBfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfQVRNRUxfRkxFWENPTT1tCiMgQ09O
RklHX01GRF9BVE1FTF9ITENEQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CQ001OTBYWCBpcyBu
b3Qgc2V0CkNPTkZJR19NRkRfQkQ5NTcxTVdWPW0KQ09ORklHX01GRF9BWFAyMFg9bQpDT05GSUdf
TUZEX0FYUDIwWF9JMkM9bQojIENPTkZJR19NRkRfTUFERVJBIGlzIG5vdCBzZXQKIyBDT05GSUdf
UE1JQ19EQTkwM1ggaXMgbm90IHNldApDT05GSUdfUE1JQ19EQTkwNTI9eQpDT05GSUdfTUZEX0RB
OTA1Ml9JMkM9eQojIENPTkZJR19NRkRfREE5MDU1IGlzIG5vdCBzZXQKQ09ORklHX01GRF9EQTkw
NjI9eQpDT05GSUdfTUZEX0RBOTA2Mz15CkNPTkZJR19NRkRfREE5MTUwPW0KIyBDT05GSUdfTUZE
X0RMTjIgaXMgbm90IHNldApDT05GSUdfTUZEX0dBVEVXT1JLU19HU0M9eQpDT05GSUdfTUZEX01D
MTNYWFg9eQpDT05GSUdfTUZEX01DMTNYWFhfSTJDPXkKIyBDT05GSUdfTUZEX01QMjYyOSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9ISTY0MjFfUE1JQyBpcyBub3Qgc2V0CkNPTkZJR19NRkRfSEk2
NDIxX1NQTUk9bQpDT05GSUdfSFRDX1BBU0lDMz1tCkNPTkZJR19IVENfSTJDUExEPXkKIyBDT05G
SUdfTUZEX0lOVEVMX1FVQVJLX0kyQ19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX0lDSCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xQQ19TQ0ggaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9TT0Nf
UE1JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NPQ19QTUlDX0NIVFdDIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5URUxfU09DX1BNSUNfQ0hURENfVEkgaXMgbm90IHNldAojIENPTkZJR19NRkRf
SU5URUxfTFBTU19BQ1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX0xQU1NfUENJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX1BNQ19CWFQgaXMgbm90IHNldApDT05GSUdfTUZE
X0lRUzYyWD1tCiMgQ09ORklHX01GRF9KQU5aX0NNT0RJTyBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9LRU1QTEQgaXMgbm90IHNldApDT05GSUdfTUZEXzg4UE04MDA9eQojIENPTkZJR19NRkRfODhQ
TTgwNSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODYwWCBpcyBub3Qgc2V0CkNPTkZJR19N
RkRfTUFYMTQ1Nzc9bQojIENPTkZJR19NRkRfTUFYNzc2MjAgaXMgbm90IHNldApDT05GSUdfTUZE
X01BWDc3NjUwPXkKQ09ORklHX01GRF9NQVg3NzY4Nj1tCiMgQ09ORklHX01GRF9NQVg3NzY5MyBp
cyBub3Qgc2V0CkNPTkZJR19NRkRfTUFYNzc3MTQ9eQojIENPTkZJR19NRkRfTUFYNzc4NDMgaXMg
bm90IHNldAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4
OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5OTcgaXMgbm90IHNldApDT05GSUdfTUZE
X01BWDg5OTg9eQpDT05GSUdfTUZEX01UNjM2MD1tCkNPTkZJR19NRkRfTVQ2Mzk3PXkKIyBDT05G
SUdfTUZEX01FTkYyMUJNQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9WSVBFUkJPQVJEIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX05UWEVDIGlzIG5vdCBzZXQKQ09ORklHX01GRF9SRVRVPXkKQ09O
RklHX01GRF9QQ0Y1MDYzMz1tCkNPTkZJR19QQ0Y1MDYzM19BREM9bQpDT05GSUdfUENGNTA2MzNf
R1BJTz1tCiMgQ09ORklHX01GRF9SREMzMjFYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1JUNDgz
MSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfUlQ1MDMzPW0KIyBDT05GSUdfTUZEX1JDNVQ1ODMgaXMg
bm90IHNldApDT05GSUdfTUZEX1JLODA4PXkKQ09ORklHX01GRF9STjVUNjE4PW0KQ09ORklHX01G
RF9TRUNfQ09SRT1tCkNPTkZJR19NRkRfU0k0NzZYX0NPUkU9eQpDT05GSUdfTUZEX1NJTVBMRV9N
RkRfSTJDPW0KQ09ORklHX01GRF9TTTUwMT1tCiMgQ09ORklHX01GRF9TTTUwMV9HUElPIGlzIG5v
dCBzZXQKQ09ORklHX01GRF9TS1k4MTQ1Mj1tCiMgQ09ORklHX01GRF9TVE1QRSBpcyBub3Qgc2V0
CkNPTkZJR19NRkRfU1lTQ09OPXkKIyBDT05GSUdfTUZEX1RJX0FNMzM1WF9UU0NBREMgaXMgbm90
IHNldApDT05GSUdfTUZEX0xQMzk0Mz15CkNPTkZJR19NRkRfTFA4Nzg4PXkKQ09ORklHX01GRF9U
SV9MTVU9eQpDT05GSUdfTUZEX1BBTE1BUz15CkNPTkZJR19UUFM2MTA1WD15CiMgQ09ORklHX1RQ
UzY1MDEwIGlzIG5vdCBzZXQKQ09ORklHX1RQUzY1MDdYPXkKQ09ORklHX01GRF9UUFM2NTA4Nj1t
CiMgQ09ORklHX01GRF9UUFM2NTA5MCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfVFBTNjUyMTc9bQpD
T05GSUdfTUZEX1RJX0xQODczWD1tCkNPTkZJR19NRkRfVElfTFA4NzU2NT15CkNPTkZJR19NRkRf
VFBTNjUyMTg9eQojIENPTkZJR19NRkRfVFBTNjU4NlggaXMgbm90IHNldAojIENPTkZJR19NRkRf
VFBTNjU5MTAgaXMgbm90IHNldApDT05GSUdfTUZEX1RQUzY1OTEyPXkKQ09ORklHX01GRF9UUFM2
NTkxMl9JMkM9eQojIENPTkZJR19UV0w0MDMwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UV0w2
MDQwX0NPUkUgaXMgbm90IHNldApDT05GSUdfTUZEX1dMMTI3M19DT1JFPXkKQ09ORklHX01GRF9M
TTM1MzM9bQpDT05GSUdfTUZEX1RDMzU4OVg9eQpDT05GSUdfTUZEX1RRTVg4Nj15CiMgQ09ORklH
X01GRF9WWDg1NSBpcyBub3Qgc2V0CkNPTkZJR19NRkRfTE9DSE5BR0FSPXkKQ09ORklHX01GRF9B
UklaT05BPW0KQ09ORklHX01GRF9BUklaT05BX0kyQz1tCiMgQ09ORklHX01GRF9DUzQ3TDI0IGlz
IG5vdCBzZXQKQ09ORklHX01GRF9XTTUxMDI9eQpDT05GSUdfTUZEX1dNNTExMD15CkNPTkZJR19N
RkRfV004OTk3PXkKIyBDT05GSUdfTUZEX1dNODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9X
TTg0MDAgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004MzFYX0kyQyBpcyBub3Qgc2V0CkNPTkZJ
R19NRkRfV004MzUwPXkKQ09ORklHX01GRF9XTTgzNTBfSTJDPXkKIyBDT05GSUdfTUZEX1dNODk5
NCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfUk9ITV9CRDcxOFhYPXkKQ09ORklHX01GRF9ST0hNX0JE
NzE4Mjg9bQpDT05GSUdfTUZEX1JPSE1fQkQ5NTdYTVVGPW0KQ09ORklHX01GRF9TVFBNSUMxPW0K
Q09ORklHX01GRF9TVE1GWD15CiMgQ09ORklHX01GRF9XQ0Q5MzRYIGlzIG5vdCBzZXQKQ09ORklH
X01GRF9BVEMyNjBYPW0KQ09ORklHX01GRF9BVEMyNjBYX0kyQz1tCkNPTkZJR19NRkRfUUNPTV9Q
TTgwMDg9bQpDT05GSUdfUkFWRV9TUF9DT1JFPXkKQ09ORklHX01GRF9SU01VX0kyQz1tCiMgZW5k
IG9mIE11bHRpZnVuY3Rpb24gZGV2aWNlIGRyaXZlcnMKCkNPTkZJR19SRUdVTEFUT1I9eQojIENP
TkZJR19SRUdVTEFUT1JfREVCVUcgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0ZJWEVEX1ZP
TFRBR0U9eQpDT05GSUdfUkVHVUxBVE9SX1ZJUlRVQUxfQ09OU1VNRVI9eQpDT05GSUdfUkVHVUxB
VE9SX1VTRVJTUEFDRV9DT05TVU1FUj1tCkNPTkZJR19SRUdVTEFUT1JfODhQRzg2WD1tCkNPTkZJ
R19SRUdVTEFUT1JfODhQTTgwMD15CiMgQ09ORklHX1JFR1VMQVRPUl9BQ1Q4ODY1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkVHVUxBVE9SX0FDVDg5NDVBIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRP
Ul9BRDUzOTg9eQpDT05GSUdfUkVHVUxBVE9SX0FTMzcyMj1tCkNPTkZJR19SRUdVTEFUT1JfQVRD
MjYwWD1tCkNPTkZJR19SRUdVTEFUT1JfQVhQMjBYPW0KQ09ORklHX1JFR1VMQVRPUl9CRDcxODE1
PW0KQ09ORklHX1JFR1VMQVRPUl9CRDcxODI4PW0KIyBDT05GSUdfUkVHVUxBVE9SX0JENzE4WFgg
aXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0JEOTU3MU1XVj1tCkNPTkZJR19SRUdVTEFUT1Jf
QkQ5NTdYTVVGPW0KIyBDT05GSUdfUkVHVUxBVE9SX0RBOTA1MiBpcyBub3Qgc2V0CiMgQ09ORklH
X1JFR1VMQVRPUl9EQTkwNjIgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0RBOTA2Mz1tCiMg
Q09ORklHX1JFR1VMQVRPUl9EQTkxMjEgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX0RBOTIx
MD15CkNPTkZJR19SRUdVTEFUT1JfREE5MjExPXkKQ09ORklHX1JFR1VMQVRPUl9GQU41MzU1NT1t
CkNPTkZJR19SRUdVTEFUT1JfRkFONTM4ODA9eQpDT05GSUdfUkVHVUxBVE9SX0dQSU89eQojIENP
TkZJR19SRUdVTEFUT1JfSEk2NDIxVjYwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9J
U0w5MzA1IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9JU0w2MjcxQT15CkNPTkZJR19SRUdV
TEFUT1JfTE0zNjNYPXkKQ09ORklHX1JFR1VMQVRPUl9MT0NITkFHQVI9eQpDT05GSUdfUkVHVUxB
VE9SX0xQMzk3MT15CkNPTkZJR19SRUdVTEFUT1JfTFAzOTcyPXkKQ09ORklHX1JFR1VMQVRPUl9M
UDg3Mlg9bQpDT05GSUdfUkVHVUxBVE9SX0xQODczWD1tCkNPTkZJR19SRUdVTEFUT1JfTFA4NzU1
PXkKQ09ORklHX1JFR1VMQVRPUl9MUDg3NTY1PW0KIyBDT05GSUdfUkVHVUxBVE9SX0xQODc4OCBp
cyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9MVEMzNTg5IGlzIG5vdCBzZXQKIyBDT05GSUdf
UkVHVUxBVE9SX0xUQzM2NzYgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFYMTQ1Nzcg
aXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX01BWDE1ODY9bQojIENPTkZJR19SRUdVTEFUT1Jf
TUFYNzc2NTAgaXMgbm90IHNldAojIENPTkZJR19SRUdVTEFUT1JfTUFYODY0OSBpcyBub3Qgc2V0
CkNPTkZJR19SRUdVTEFUT1JfTUFYODY2MD1tCiMgQ09ORklHX1JFR1VMQVRPUl9NQVg4ODkzIGlz
IG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9NQVg4OTUyPW0KQ09ORklHX1JFR1VMQVRPUl9NQVg4
OTk4PXkKIyBDT05GSUdfUkVHVUxBVE9SX01BWDIwMDg2IGlzIG5vdCBzZXQKQ09ORklHX1JFR1VM
QVRPUl9NQVg3NzY4Nj1tCkNPTkZJR19SRUdVTEFUT1JfTUFYNzc4MDI9bQpDT05GSUdfUkVHVUxB
VE9SX01BWDc3ODI2PW0KQ09ORklHX1JFR1VMQVRPUl9NQzEzWFhYX0NPUkU9eQpDT05GSUdfUkVH
VUxBVE9SX01DMTM3ODM9eQpDT05GSUdfUkVHVUxBVE9SX01DMTM4OTI9bQpDT05GSUdfUkVHVUxB
VE9SX01DUDE2NTAyPW0KQ09ORklHX1JFR1VMQVRPUl9NUDU0MTY9eQpDT05GSUdfUkVHVUxBVE9S
X01QODg1OT1tCkNPTkZJR19SRUdVTEFUT1JfTVA4ODZYPXkKQ09ORklHX1JFR1VMQVRPUl9NUFE3
OTIwPXkKQ09ORklHX1JFR1VMQVRPUl9NVDYzMTE9eQpDT05GSUdfUkVHVUxBVE9SX01UNjMxNT1t
CkNPTkZJR19SRUdVTEFUT1JfTVQ2MzIzPW0KIyBDT05GSUdfUkVHVUxBVE9SX01UNjM1OCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9NVDYzNTkgaXMgbm90IHNldApDT05GSUdfUkVHVUxB
VE9SX01UNjM2MD1tCkNPTkZJR19SRUdVTEFUT1JfTVQ2Mzk3PW0KIyBDT05GSUdfUkVHVUxBVE9S
X1BBTE1BUyBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUENBOTQ1MD15CiMgQ09ORklHX1JF
R1VMQVRPUl9QQ0Y1MDYzMyBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUEY4WDAwPW0KIyBD
T05GSUdfUkVHVUxBVE9SX1BGVVpFMTAwIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9QVjg4
MDYwPXkKQ09ORklHX1JFR1VMQVRPUl9QVjg4MDgwPXkKQ09ORklHX1JFR1VMQVRPUl9QVjg4MDkw
PXkKQ09ORklHX1JFR1VMQVRPUl9QV009eQpDT05GSUdfUkVHVUxBVE9SX1FDT01fU1BNST1tCiMg
Q09ORklHX1JFR1VMQVRPUl9RQ09NX1VTQl9WQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxB
VE9SX1JBU1BCRVJSWVBJX1RPVUNIU0NSRUVOX0FUVElOWSBpcyBub3Qgc2V0CiMgQ09ORklHX1JF
R1VMQVRPUl9SSzgwOCBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFUT1JfUk41VDYxOD1tCkNPTkZJ
R19SRUdVTEFUT1JfUk9ITT1tCiMgQ09ORklHX1JFR1VMQVRPUl9SVDQ4MDEgaXMgbm90IHNldAoj
IENPTkZJR19SRUdVTEFUT1JfUlQ1MDMzIGlzIG5vdCBzZXQKQ09ORklHX1JFR1VMQVRPUl9SVDUx
OTBBPXkKIyBDT05GSUdfUkVHVUxBVE9SX1JUNTc1OSBpcyBub3Qgc2V0CkNPTkZJR19SRUdVTEFU
T1JfUlQ2MTYwPW0KQ09ORklHX1JFR1VMQVRPUl9SVDYyNDU9bQojIENPTkZJR19SRUdVTEFUT1Jf
UlRRMjEzNCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFR1VMQVRPUl9SVE1WMjAgaXMgbm90IHNldApD
T05GSUdfUkVHVUxBVE9SX1JUUTY3NTI9eQpDT05GSUdfUkVHVUxBVE9SX1MyTVBBMDE9bQpDT05G
SUdfUkVHVUxBVE9SX1MyTVBTMTE9bQojIENPTkZJR19SRUdVTEFUT1JfUzVNODc2NyBpcyBub3Qg
c2V0CkNPTkZJR19SRUdVTEFUT1JfU0tZODE0NTI9bQojIENPTkZJR19SRUdVTEFUT1JfU0xHNTEw
MDAgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1NUUE1JQzE9bQpDT05GSUdfUkVHVUxBVE9S
X1NZNzYzNkE9bQojIENPTkZJR19SRUdVTEFUT1JfU1k4MTA2QSBpcyBub3Qgc2V0CkNPTkZJR19S
RUdVTEFUT1JfU1k4ODI0WD1tCkNPTkZJR19SRUdVTEFUT1JfU1k4ODI3Tj15CkNPTkZJR19SRUdV
TEFUT1JfVFBTNTE2MzI9bQojIENPTkZJR19SRUdVTEFUT1JfVFBTNjEwNVggaXMgbm90IHNldApD
T05GSUdfUkVHVUxBVE9SX1RQUzYyMzYwPW0KQ09ORklHX1JFR1VMQVRPUl9UUFM2Mjg2WD1tCkNP
TkZJR19SRUdVTEFUT1JfVFBTNjUwMjM9eQpDT05GSUdfUkVHVUxBVE9SX1RQUzY1MDdYPW0KQ09O
RklHX1JFR1VMQVRPUl9UUFM2NTA4Nj1tCkNPTkZJR19SRUdVTEFUT1JfVFBTNjUxMzI9bQojIENP
TkZJR19SRUdVTEFUT1JfVFBTNjUyMTcgaXMgbm90IHNldApDT05GSUdfUkVHVUxBVE9SX1RQUzY1
MjE4PW0KQ09ORklHX1JFR1VMQVRPUl9UUFM2NTkxMj15CkNPTkZJR19SRUdVTEFUT1JfVkNUUkw9
bQojIENPTkZJR19SRUdVTEFUT1JfV004MzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVHVUxBVE9S
X1FDT01fTEFCSUJCIGlzIG5vdCBzZXQKQ09ORklHX1JDX0NPUkU9bQojIENPTkZJR19MSVJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkNfTUFQIGlzIG5vdCBzZXQKQ09ORklHX1JDX0RFQ09ERVJTPXkK
IyBDT05GSUdfSVJfSU1PTl9ERUNPREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJfSlZDX0RFQ09E
RVIgaXMgbm90IHNldAojIENPTkZJR19JUl9NQ0VfS0JEX0RFQ09ERVIgaXMgbm90IHNldAojIENP
TkZJR19JUl9ORUNfREVDT0RFUiBpcyBub3Qgc2V0CkNPTkZJR19JUl9SQzVfREVDT0RFUj1tCkNP
TkZJR19JUl9SQzZfREVDT0RFUj1tCkNPTkZJR19JUl9SQ01NX0RFQ09ERVI9bQpDT05GSUdfSVJf
U0FOWU9fREVDT0RFUj1tCiMgQ09ORklHX0lSX1NIQVJQX0RFQ09ERVIgaXMgbm90IHNldApDT05G
SUdfSVJfU09OWV9ERUNPREVSPW0KIyBDT05GSUdfSVJfWE1QX0RFQ09ERVIgaXMgbm90IHNldAoj
IENPTkZJR19SQ19ERVZJQ0VTIGlzIG5vdCBzZXQKQ09ORklHX0NFQ19DT1JFPXkKQ09ORklHX0NF
Q19OT1RJRklFUj15CgojCiMgQ0VDIHN1cHBvcnQKIwojIENPTkZJR19NRURJQV9DRUNfU1VQUE9S
VCBpcyBub3Qgc2V0CiMgZW5kIG9mIENFQyBzdXBwb3J0CgpDT05GSUdfTUVESUFfU1VQUE9SVD15
CkNPTkZJR19NRURJQV9TVVBQT1JUX0ZJTFRFUj15CiMgQ09ORklHX01FRElBX1NVQkRSVl9BVVRP
U0VMRUNUIGlzIG5vdCBzZXQKCiMKIyBNZWRpYSBkZXZpY2UgdHlwZXMKIwpDT05GSUdfTUVESUFf
Q0FNRVJBX1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfQU5BTE9HX1RWX1NVUFBPUlQ9eQojIENPTkZJ
R19NRURJQV9ESUdJVEFMX1RWX1NVUFBPUlQgaXMgbm90IHNldApDT05GSUdfTUVESUFfUkFESU9f
U1VQUE9SVD15CkNPTkZJR19NRURJQV9TRFJfU1VQUE9SVD15CiMgQ09ORklHX01FRElBX1BMQVRG
T1JNX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9URVNUX1NVUFBPUlQgaXMgbm90
IHNldAojIGVuZCBvZiBNZWRpYSBkZXZpY2UgdHlwZXMKCkNPTkZJR19WSURFT19ERVY9eQpDT05G
SUdfTUVESUFfQ09OVFJPTExFUj15CgojCiMgVmlkZW80TGludXggb3B0aW9ucwojCkNPTkZJR19W
SURFT19WNEwyX0kyQz15CkNPTkZJR19WSURFT19WNEwyX1NVQkRFVl9BUEk9eQpDT05GSUdfVklE
RU9fQURWX0RFQlVHPXkKQ09ORklHX1ZJREVPX0ZJWEVEX01JTk9SX1JBTkdFUz15CkNPTkZJR19W
SURFT19UVU5FUj1tCkNPTkZJR19WNEwyX0ZXTk9ERT15CkNPTkZJR19WNEwyX0FTWU5DPXkKIyBl
bmQgb2YgVmlkZW80TGludXggb3B0aW9ucwoKIwojIE1lZGlhIGNvbnRyb2xsZXIgb3B0aW9ucwoj
CiMgZW5kIG9mIE1lZGlhIGNvbnRyb2xsZXIgb3B0aW9ucwoKIwojIE1lZGlhIGRyaXZlcnMKIwoK
IwojIERyaXZlcnMgZmlsdGVyZWQgYXMgc2VsZWN0ZWQgYXQgJ0ZpbHRlciBtZWRpYSBkcml2ZXJz
JwojCgojCiMgTWVkaWEgZHJpdmVycwojCkNPTkZJR19NRURJQV9VU0JfU1VQUE9SVD15CgojCiMg
V2ViY2FtIGRldmljZXMKIwojIENPTkZJR19WSURFT19DUElBMiBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfR1NQQ0E9bQpDT05GSUdfVVNCX0dTUENBX0JFTlE9bQojIENPTkZJR19VU0JfR1NQQ0FfQ09O
RVggaXMgbm90IHNldApDT05GSUdfVVNCX0dTUENBX0NQSUExPW0KQ09ORklHX1VTQl9HU1BDQV9E
VENTMDMzPW0KQ09ORklHX1VTQl9HU1BDQV9FVE9NUz1tCkNPTkZJR19VU0JfR1NQQ0FfRklORVBJ
WD1tCkNPTkZJR19VU0JfR1NQQ0FfSkVJTElOSj1tCkNPTkZJR19VU0JfR1NQQ0FfSkwyMDA1QkNE
PW0KQ09ORklHX1VTQl9HU1BDQV9LSU5FQ1Q9bQpDT05GSUdfVVNCX0dTUENBX0tPTklDQT1tCkNP
TkZJR19VU0JfR1NQQ0FfTUFSUz1tCkNPTkZJR19VU0JfR1NQQ0FfTVI5NzMxMEE9bQojIENPTkZJ
R19VU0JfR1NQQ0FfTlc4MFggaXMgbm90IHNldApDT05GSUdfVVNCX0dTUENBX09WNTE5PW0KQ09O
RklHX1VTQl9HU1BDQV9PVjUzND1tCkNPTkZJR19VU0JfR1NQQ0FfT1Y1MzRfOT1tCiMgQ09ORklH
X1VTQl9HU1BDQV9QQUMyMDcgaXMgbm90IHNldApDT05GSUdfVVNCX0dTUENBX1BBQzczMDI9bQoj
IENPTkZJR19VU0JfR1NQQ0FfUEFDNzMxMSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfR1NQQ0FfU0U0
MDE9bQojIENPTkZJR19VU0JfR1NQQ0FfU045QzIwMjggaXMgbm90IHNldAojIENPTkZJR19VU0Jf
R1NQQ0FfU045QzIwWCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfR1NQQ0FfU09OSVhCPW0KQ09ORklH
X1VTQl9HU1BDQV9TT05JWEo9bQojIENPTkZJR19VU0JfR1NQQ0FfU1BDQTE1MjggaXMgbm90IHNl
dApDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDA9bQojIENPTkZJR19VU0JfR1NQQ0FfU1BDQTUwMSBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfR1NQQ0FfU1BDQTUwNT1tCkNPTkZJR19VU0JfR1NQQ0FfU1BD
QTUwNj1tCiMgQ09ORklHX1VTQl9HU1BDQV9TUENBNTA4IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9H
U1BDQV9TUENBNTYxPW0KQ09ORklHX1VTQl9HU1BDQV9TUTkwNT1tCkNPTkZJR19VU0JfR1NQQ0Ff
U1E5MDVDPW0KIyBDT05GSUdfVVNCX0dTUENBX1NROTMwWCBpcyBub3Qgc2V0CkNPTkZJR19VU0Jf
R1NQQ0FfU1RLMDE0PW0KIyBDT05GSUdfVVNCX0dTUENBX1NUSzExMzUgaXMgbm90IHNldApDT05G
SUdfVVNCX0dTUENBX1NUVjA2ODA9bQpDT05GSUdfVVNCX0dTUENBX1NVTlBMVVM9bQojIENPTkZJ
R19VU0JfR1NQQ0FfVDYxMyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfR1NQQ0FfVE9QUk89bQojIENP
TkZJR19VU0JfR1NQQ0FfVE9VUFRFSyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfR1NQQ0FfVFY4NTMy
PW0KIyBDT05GSUdfVVNCX0dTUENBX1ZDMDMyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9HU1BD
QV9WSUNBTSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfR1NQQ0FfWElSTElOS19DSVQ9bQpDT05GSUdf
VVNCX0dTUENBX1pDM1hYPW0KQ09ORklHX1VTQl9HTDg2MD1tCiMgQ09ORklHX1VTQl9NNTYwMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVFYwNlhYIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9QV0M9
eQojIENPTkZJR19VU0JfUFdDX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9QV0NfSU5QVVRf
RVZERVY9eQojIENPTkZJR19VU0JfUzIyNTUgaXMgbm90IHNldApDT05GSUdfVVNCX1ZJREVPX0NM
QVNTPXkKQ09ORklHX1VTQl9WSURFT19DTEFTU19JTlBVVF9FVkRFVj15CiMgQ09ORklHX1VTQl9a
UjM2NFhYIGlzIG5vdCBzZXQKCiMKIyBBbmFsb2cgVFYgVVNCIGRldmljZXMKIwpDT05GSUdfVklE
RU9fSERQVlI9eQpDT05GSUdfVklERU9fUFZSVVNCMj1tCiMgQ09ORklHX1ZJREVPX1BWUlVTQjJf
U1lTRlMgaXMgbm90IHNldApDT05GSUdfVklERU9fU1RLMTE2MF9DT01NT049eQpDT05GSUdfVklE
RU9fU1RLMTE2MD15CgojCiMgQW5hbG9nL2RpZ2l0YWwgVFYgVVNCIGRldmljZXMKIwpDT05GSUdf
VklERU9fQ1gyMzFYWD1tCkNPTkZJR19WSURFT19DWDIzMVhYX1JDPXkKIyBDT05GSUdfVklERU9f
VE02MDAwIGlzIG5vdCBzZXQKCiMKIyBXZWJjYW0sIFRWIChhbmFsb2cvZGlnaXRhbCkgVVNCIGRl
dmljZXMKIwojIENPTkZJR19WSURFT19FTTI4WFggaXMgbm90IHNldAoKIwojIFNvZnR3YXJlIGRl
ZmluZWQgcmFkaW8gVVNCIGRldmljZXMKIwojIENPTkZJR19VU0JfQUlSU1BZIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9IQUNLUkY9bQojIENPTkZJR19NRURJQV9QQ0lfU1VQUE9SVCBpcyBub3Qgc2V0
CkNPTkZJR19SQURJT19BREFQVEVSUz1tCiMgQ09ORklHX1JBRElPX01BWElSQURJTyBpcyBub3Qg
c2V0CkNPTkZJR19SQURJT19TQUE3NzA2SD1tCkNPTkZJR19SQURJT19TSEFSSz1tCiMgQ09ORklH
X1JBRElPX1NIQVJLMiBpcyBub3Qgc2V0CkNPTkZJR19SQURJT19TSTQ3MTM9bQpDT05GSUdfUkFE
SU9fVEVBNTc1WD1tCkNPTkZJR19SQURJT19URUE1NzY0PW0KIyBDT05GSUdfUkFESU9fVEVGNjg2
MiBpcyBub3Qgc2V0CkNPTkZJR19SQURJT19XTDEyNzM9bQojIENPTkZJR19VU0JfRFNCUiBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfS0VFTkU9bQpDT05GSUdfVVNCX01BOTAxPW0KQ09ORklHX1VTQl9N
UjgwMD1tCiMgQ09ORklHX1VTQl9SQVJFTU9OTyBpcyBub3Qgc2V0CkNPTkZJR19SQURJT19TSTQ3
MFg9bQpDT05GSUdfVVNCX1NJNDcwWD1tCkNPTkZJR19JMkNfU0k0NzBYPW0KQ09ORklHX1VTQl9T
STQ3MTM9bQpDT05GSUdfUExBVEZPUk1fU0k0NzEzPW0KQ09ORklHX0kyQ19TSTQ3MTM9bQojIENP
TkZJR19SQURJT19XTDEyOFggaXMgbm90IHNldApDT05GSUdfVklERU9fQ1gyMzQxWD1tCkNPTkZJ
R19WSURFT19UVkVFUFJPTT1tCkNPTkZJR19WSURFT0JVRjJfQ09SRT15CkNPTkZJR19WSURFT0JV
RjJfVjRMMj15CkNPTkZJR19WSURFT0JVRjJfTUVNT1BTPXkKQ09ORklHX1ZJREVPQlVGMl9WTUFM
TE9DPXkKQ09ORklHX1ZJREVPQlVGMl9ETUFfU0c9eQojIGVuZCBvZiBNZWRpYSBkcml2ZXJzCgoj
CiMgTWVkaWEgYW5jaWxsYXJ5IGRyaXZlcnMKIwpDT05GSUdfTUVESUFfQVRUQUNIPXkKIyBDT05G
SUdfVklERU9fSVJfSTJDIGlzIG5vdCBzZXQKCiMKIyBDYW1lcmEgc2Vuc29yIGRldmljZXMKIwpD
T05GSUdfVklERU9fQVBUSU5BX1BMTD15CkNPTkZJR19WSURFT19BUjA1MjE9bQpDT05GSUdfVklE
RU9fSEk1NTY9eQojIENPTkZJR19WSURFT19ISTg0NiBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19I
STg0Nz1tCkNPTkZJR19WSURFT19JTVgyMDg9eQpDT05GSUdfVklERU9fSU1YMjE0PW0KIyBDT05G
SUdfVklERU9fSU1YMjE5IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX0lNWDI1OD15CkNPTkZJR19W
SURFT19JTVgyNzQ9eQpDT05GSUdfVklERU9fSU1YMjkwPW0KQ09ORklHX1ZJREVPX0lNWDMxOT1t
CkNPTkZJR19WSURFT19JTVgzMzQ9bQojIENPTkZJR19WSURFT19JTVgzMzUgaXMgbm90IHNldApD
T05GSUdfVklERU9fSU1YMzU1PXkKQ09ORklHX1ZJREVPX0lNWDQxMj15CkNPTkZJR19WSURFT19N
QVg5MjcxX0xJQj15CkNPTkZJR19WSURFT19NVDlNMDAxPXkKQ09ORklHX1ZJREVPX01UOU0wMzI9
eQpDT05GSUdfVklERU9fTVQ5TTExMT1tCkNPTkZJR19WSURFT19NVDlQMDMxPXkKIyBDT05GSUdf
VklERU9fTVQ5VDAwMSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19NVDlUMTEyPXkKQ09ORklHX1ZJ
REVPX01UOVYwMTE9eQpDT05GSUdfVklERU9fTVQ5VjAzMj15CiMgQ09ORklHX1ZJREVPX01UOVYx
MTEgaXMgbm90IHNldApDT05GSUdfVklERU9fTk9PTjAxMFBDMzA9bQpDT05GSUdfVklERU9fT0cw
MUExQj1tCkNPTkZJR19WSURFT19PVjAyQTEwPW0KQ09ORklHX1ZJREVPX09WMDhEMTA9bQojIENP
TkZJR19WSURFT19PVjEzODU4IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX09WMTNCMTA9eQojIENP
TkZJR19WSURFT19PVjI2NDAgaXMgbm90IHNldApDT05GSUdfVklERU9fT1YyNjU5PXkKIyBDT05G
SUdfVklERU9fT1YyNjgwIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX09WMjY4NT1tCiMgQ09ORklH
X1ZJREVPX09WMjc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNTY0MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX09WNTY0NSBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19PVjU2NDc9eQpD
T05GSUdfVklERU9fT1Y1NjQ4PXkKQ09ORklHX1ZJREVPX09WNTY3MD15CkNPTkZJR19WSURFT19P
VjU2NzU9eQojIENPTkZJR19WSURFT19PVjU2OTMgaXMgbm90IHNldApDT05GSUdfVklERU9fT1Y1
Njk1PW0KQ09ORklHX1ZJREVPX09WNjY1MD1tCiMgQ09ORklHX1ZJREVPX09WNzI1MSBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX09WNzY0MCBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19PVjc2NzA9
bQpDT05GSUdfVklERU9fT1Y3NzJYPXkKIyBDT05GSUdfVklERU9fT1Y3NzQwIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fT1Y4ODU2IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX09WODg2NT15CiMg
Q09ORklHX1ZJREVPX09WOTI4MiBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19PVjk2NDA9eQpDT05G
SUdfVklERU9fT1Y5NjUwPXkKQ09ORklHX1ZJREVPX09WOTczND15CkNPTkZJR19WSURFT19SREFD
TTIwPXkKQ09ORklHX1ZJREVPX1JEQUNNMjE9eQpDT05GSUdfVklERU9fUko1NE4xPW0KQ09ORklH
X1ZJREVPX1M1SzRFQ0dYPW0KQ09ORklHX1ZJREVPX1M1SzVCQUY9eQpDT05GSUdfVklERU9fUzVL
NkEzPW0KQ09ORklHX1ZJREVPX1M1SzZBQT15CiMgQ09ORklHX1ZJREVPX1NSMDMwUEMzMCBpcyBu
b3Qgc2V0CkNPTkZJR19WSURFT19WUzY2MjQ9bQojIENPTkZJR19WSURFT19DQ1MgaXMgbm90IHNl
dApDT05GSUdfVklERU9fRVQ4RUs4PW0KQ09ORklHX1ZJREVPX001TU9MUz15CiMgZW5kIG9mIENh
bWVyYSBzZW5zb3IgZGV2aWNlcwoKIwojIExlbnMgZHJpdmVycwojCkNPTkZJR19WSURFT19BRDU4
MjA9bQpDT05GSUdfVklERU9fQUs3Mzc1PXkKQ09ORklHX1ZJREVPX0RXOTcxND15CkNPTkZJR19W
SURFT19EVzk3Njg9bQpDT05GSUdfVklERU9fRFc5ODA3X1ZDTT1tCiMgZW5kIG9mIExlbnMgZHJp
dmVycwoKIwojIEZsYXNoIGRldmljZXMKIwpDT05GSUdfVklERU9fQURQMTY1Mz15CkNPTkZJR19W
SURFT19MTTM1NjA9bQpDT05GSUdfVklERU9fTE0zNjQ2PXkKIyBlbmQgb2YgRmxhc2ggZGV2aWNl
cwoKIwojIEF1ZGlvIGRlY29kZXJzLCBwcm9jZXNzb3JzIGFuZCBtaXhlcnMKIwpDT05GSUdfVklE
RU9fQ1MzMzA4PXkKQ09ORklHX1ZJREVPX0NTNTM0NT15CkNPTkZJR19WSURFT19DUzUzTDMyQT1t
CkNPTkZJR19WSURFT19NU1AzNDAwPXkKQ09ORklHX1ZJREVPX1NPTllfQlRGX01QWD15CkNPTkZJ
R19WSURFT19UREE3NDMyPXkKQ09ORklHX1ZJREVPX1REQTk4NDA9bQpDT05GSUdfVklERU9fVEVB
NjQxNUM9bQpDT05GSUdfVklERU9fVEVBNjQyMD15CkNPTkZJR19WSURFT19UTFYzMjBBSUMyM0I9
bQojIENPTkZJR19WSURFT19UVkFVRElPIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX1VEQTEzNDI9
eQpDT05GSUdfVklERU9fVlAyN1NNUFg9eQpDT05GSUdfVklERU9fV004NzM5PW0KQ09ORklHX1ZJ
REVPX1dNODc3NT15CiMgZW5kIG9mIEF1ZGlvIGRlY29kZXJzLCBwcm9jZXNzb3JzIGFuZCBtaXhl
cnMKCiMKIyBSRFMgZGVjb2RlcnMKIwojIENPTkZJR19WSURFT19TQUE2NTg4IGlzIG5vdCBzZXQK
IyBlbmQgb2YgUkRTIGRlY29kZXJzCgojCiMgVmlkZW8gZGVjb2RlcnMKIwpDT05GSUdfVklERU9f
QURWNzE4MD1tCkNPTkZJR19WSURFT19BRFY3MTgzPW0KQ09ORklHX1ZJREVPX0FEVjc0OFg9eQpD
T05GSUdfVklERU9fQURWNzYwND1tCiMgQ09ORklHX1ZJREVPX0FEVjc2MDRfQ0VDIGlzIG5vdCBz
ZXQKQ09ORklHX1ZJREVPX0FEVjc4NDI9bQpDT05GSUdfVklERU9fQURWNzg0Ml9DRUM9eQpDT05G
SUdfVklERU9fQlQ4MTk9bQpDT05GSUdfVklERU9fQlQ4NTY9eQpDT05GSUdfVklERU9fQlQ4NjY9
bQpDT05GSUdfVklERU9fSVNMNzk5OFg9bQojIENPTkZJR19WSURFT19LUzAxMjcgaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19NQVg5Mjg2IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX01MODZWNzY2
Nz15CkNPTkZJR19WSURFT19TQUE3MTEwPW0KQ09ORklHX1ZJREVPX1NBQTcxMVg9eQojIENPTkZJ
R19WSURFT19UQzM1ODc0MyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19UVlA1MTRYPXkKQ09ORklH
X1ZJREVPX1RWUDUxNTA9bQpDT05GSUdfVklERU9fVFZQNzAwMj1tCkNPTkZJR19WSURFT19UVzI4
MDQ9bQpDT05GSUdfVklERU9fVFc5OTAzPW0KQ09ORklHX1ZJREVPX1RXOTkwNj15CkNPTkZJR19W
SURFT19UVzk5MTA9eQojIENPTkZJR19WSURFT19WUFgzMjIwIGlzIG5vdCBzZXQKCiMKIyBWaWRl
byBhbmQgYXVkaW8gZGVjb2RlcnMKIwpDT05GSUdfVklERU9fU0FBNzE3WD1tCkNPTkZJR19WSURF
T19DWDI1ODQwPXkKIyBlbmQgb2YgVmlkZW8gZGVjb2RlcnMKCiMKIyBWaWRlbyBlbmNvZGVycwoj
CkNPTkZJR19WSURFT19BRDkzODlCPW0KQ09ORklHX1ZJREVPX0FEVjcxNzA9eQojIENPTkZJR19W
SURFT19BRFY3MTc1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQURWNzM0MyBpcyBub3Qgc2V0
CkNPTkZJR19WSURFT19BRFY3MzkzPXkKIyBDT05GSUdfVklERU9fQUs4ODFYIGlzIG5vdCBzZXQK
IyBDT05GSUdfVklERU9fU0FBNzEyNyBpcyBub3Qgc2V0CkNPTkZJR19WSURFT19TQUE3MTg1PXkK
Q09ORklHX1ZJREVPX1RIUzgyMDA9bQojIGVuZCBvZiBWaWRlbyBlbmNvZGVycwoKIwojIFZpZGVv
IGltcHJvdmVtZW50IGNoaXBzCiMKIyBDT05GSUdfVklERU9fVVBENjQwMzFBIGlzIG5vdCBzZXQK
Q09ORklHX1ZJREVPX1VQRDY0MDgzPXkKIyBlbmQgb2YgVmlkZW8gaW1wcm92ZW1lbnQgY2hpcHMK
CiMKIyBBdWRpby9WaWRlbyBjb21wcmVzc2lvbiBjaGlwcwojCiMgQ09ORklHX1ZJREVPX1NBQTY3
NTJIUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEF1ZGlvL1ZpZGVvIGNvbXByZXNzaW9uIGNoaXBzCgoj
CiMgU0RSIHR1bmVyIGNoaXBzCiMKQ09ORklHX1NEUl9NQVgyMTc1PXkKIyBlbmQgb2YgU0RSIHR1
bmVyIGNoaXBzCgojCiMgTWlzY2VsbGFuZW91cyBoZWxwZXIgY2hpcHMKIwojIENPTkZJR19WSURF
T19JMkMgaXMgbm90IHNldApDT05GSUdfVklERU9fTTUyNzkwPXkKQ09ORklHX1ZJREVPX1NUX01J
UElEMDI9eQpDT05GSUdfVklERU9fVEhTNzMwMz15CiMgZW5kIG9mIE1pc2NlbGxhbmVvdXMgaGVs
cGVyIGNoaXBzCgpDT05GSUdfTUVESUFfVFVORVI9eQoKIwojIEN1c3RvbWl6ZSBUViB0dW5lcnMK
IwpDT05GSUdfTUVESUFfVFVORVJfRTQwMDA9bQojIENPTkZJR19NRURJQV9UVU5FUl9GQzAwMTEg
aXMgbm90IHNldAojIENPTkZJR19NRURJQV9UVU5FUl9GQzAwMTIgaXMgbm90IHNldApDT05GSUdf
TUVESUFfVFVORVJfRkMwMDEzPXkKQ09ORklHX01FRElBX1RVTkVSX0ZDMjU4MD15CkNPTkZJR19N
RURJQV9UVU5FUl9JVDkxM1g9eQpDT05GSUdfTUVESUFfVFVORVJfTTg4UlM2MDAwVD1tCkNPTkZJ
R19NRURJQV9UVU5FUl9NQVgyMTY1PXkKQ09ORklHX01FRElBX1RVTkVSX01DNDRTODAzPW0KQ09O
RklHX01FRElBX1RVTkVSX01UMjA2MD15CkNPTkZJR19NRURJQV9UVU5FUl9NVDIwNjM9bQpDT05G
SUdfTUVESUFfVFVORVJfTVQyMFhYPXkKQ09ORklHX01FRElBX1RVTkVSX01UMjEzMT15CkNPTkZJ
R19NRURJQV9UVU5FUl9NVDIyNjY9eQojIENPTkZJR19NRURJQV9UVU5FUl9NWEwzMDFSRiBpcyBu
b3Qgc2V0CkNPTkZJR19NRURJQV9UVU5FUl9NWEw1MDA1Uz15CkNPTkZJR19NRURJQV9UVU5FUl9N
WEw1MDA3VD1tCkNPTkZJR19NRURJQV9UVU5FUl9RTTFEMUIwMDA0PXkKQ09ORklHX01FRElBX1RV
TkVSX1FNMUQxQzAwNDI9eQpDT05GSUdfTUVESUFfVFVORVJfUVQxMDEwPW0KQ09ORklHX01FRElB
X1RVTkVSX1I4MjBUPW0KQ09ORklHX01FRElBX1RVTkVSX1NJMjE1Nz15CkNPTkZJR19NRURJQV9U
VU5FUl9TSU1QTEU9bQojIENPTkZJR19NRURJQV9UVU5FUl9UREExODIxMiBpcyBub3Qgc2V0CkNP
TkZJR19NRURJQV9UVU5FUl9UREExODIxOD1tCiMgQ09ORklHX01FRElBX1RVTkVSX1REQTE4MjUw
IGlzIG5vdCBzZXQKQ09ORklHX01FRElBX1RVTkVSX1REQTE4MjcxPW0KQ09ORklHX01FRElBX1RV
TkVSX1REQTgyN1g9bQojIENPTkZJR19NRURJQV9UVU5FUl9UREE4MjkwIGlzIG5vdCBzZXQKQ09O
RklHX01FRElBX1RVTkVSX1REQTk4ODc9bQpDT05GSUdfTUVESUFfVFVORVJfVEVBNTc2MT15CiMg
Q09ORklHX01FRElBX1RVTkVSX1RFQTU3NjcgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9UVU5F
Ul9UVUE5MDAxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFfVFVORVJfWEMyMDI4IGlzIG5vdCBz
ZXQKQ09ORklHX01FRElBX1RVTkVSX1hDNDAwMD15CkNPTkZJR19NRURJQV9UVU5FUl9YQzUwMDA9
bQojIGVuZCBvZiBDdXN0b21pemUgVFYgdHVuZXJzCiMgZW5kIG9mIE1lZGlhIGFuY2lsbGFyeSBk
cml2ZXJzCgojCiMgR3JhcGhpY3Mgc3VwcG9ydAojCkNPTkZJR19BUEVSVFVSRV9IRUxQRVJTPXkK
IyBDT05GSUdfQUdQIGlzIG5vdCBzZXQKIyBDT05GSUdfVkdBX1NXSVRDSEVST08gaXMgbm90IHNl
dApDT05GSUdfRFJNPXkKQ09ORklHX0RSTV9NSVBJX0RTST15CkNPTkZJR19EUk1fREVCVUdfTU09
eQojIENPTkZJR19EUk1fREVCVUdfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfRFJNX0tNU19I
RUxQRVI9eQojIENPTkZJR19EUk1fREVCVUdfRFBfTVNUX1RPUE9MT0dZX1JFRlMgaXMgbm90IHNl
dApDT05GSUdfRFJNX0RFQlVHX01PREVTRVRfTE9DSz15CkNPTkZJR19EUk1fRkJERVZfRU1VTEFU
SU9OPXkKQ09ORklHX0RSTV9GQkRFVl9PVkVSQUxMT0M9MTAwCkNPTkZJR19EUk1fRkJERVZfTEVB
S19QSFlTX1NNRU09eQojIENPTkZJR19EUk1fTE9BRF9FRElEX0ZJUk1XQVJFIGlzIG5vdCBzZXQK
Q09ORklHX0RSTV9EUF9BVVhfQlVTPXkKQ09ORklHX0RSTV9ESVNQTEFZX0hFTFBFUj15CkNPTkZJ
R19EUk1fRElTUExBWV9EUF9IRUxQRVI9eQpDT05GSUdfRFJNX0RJU1BMQVlfSERDUF9IRUxQRVI9
eQojIENPTkZJR19EUk1fRFBfQVVYX0NIQVJERVYgaXMgbm90IHNldAojIENPTkZJR19EUk1fRFBf
Q0VDIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9HRU1fQ01BX0hFTFBFUj15CkNPTkZJR19EUk1fR0VN
X1NITUVNX0hFTFBFUj15CkNPTkZJR19EUk1fU0NIRUQ9eQoKIwojIEkyQyBlbmNvZGVyIG9yIGhl
bHBlciBjaGlwcwojCiMgQ09ORklHX0RSTV9JMkNfQ0g3MDA2IGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX0kyQ19TSUwxNjQgaXMgbm90IHNldApDT05GSUdfRFJNX0kyQ19OWFBfVERBOTk4WD15CkNP
TkZJR19EUk1fSTJDX05YUF9UREE5OTUwPXkKIyBlbmQgb2YgSTJDIGVuY29kZXIgb3IgaGVscGVy
IGNoaXBzCgojCiMgQVJNIGRldmljZXMKIwpDT05GSUdfRFJNX0tPTUVEQT1tCiMgZW5kIG9mIEFS
TSBkZXZpY2VzCgojIENPTkZJR19EUk1fUkFERU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0FN
REdQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9OT1VWRUFVIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX0k5MTUgaXMgbm90IHNldApDT05GSUdfRFJNX1ZHRU09bQojIENPTkZJR19EUk1fVktNUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WTVdHRlggaXMgbm90IHNldAojIENPTkZJR19EUk1fR01B
NTAwIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9VREw9bQojIENPTkZJR19EUk1fQVNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX01HQUcyMDAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUkNBUl9EV19I
RE1JIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9SQ0FSX1VTRV9MVkRTPXkKQ09ORklHX0RSTV9SQ0FS
X01JUElfRFNJPXkKIyBDT05GSUdfRFJNX1FYTCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fVklSVElP
X0dQVT15CkNPTkZJR19EUk1fUEFORUw9eQoKIwojIERpc3BsYXkgUGFuZWxzCiMKQ09ORklHX0RS
TV9QQU5FTF9BUk1fVkVSU0FUSUxFPW0KQ09ORklHX0RSTV9QQU5FTF9BU1VTX1owMFRfVE01UDVf
TlQzNTU5Nj1tCkNPTkZJR19EUk1fUEFORUxfQk9FX0JGMDYwWThNX0FKMD1tCkNPTkZJR19EUk1f
UEFORUxfQk9FX0hJTUFYODI3OUQ9eQpDT05GSUdfRFJNX1BBTkVMX0JPRV9UVjEwMVdVTV9OTDY9
eQpDT05GSUdfRFJNX1BBTkVMX0RTSV9DTT15CkNPTkZJR19EUk1fUEFORUxfTFZEUz1tCkNPTkZJ
R19EUk1fUEFORUxfU0lNUExFPXkKQ09ORklHX0RSTV9QQU5FTF9FRFA9eQpDT05GSUdfRFJNX1BB
TkVMX0VCQkdfRlQ4NzE5PXkKQ09ORklHX0RSTV9QQU5FTF9FTElEQV9LRDM1VDEzMz1tCkNPTkZJ
R19EUk1fUEFORUxfRkVJWElOX0sxMDFfSU0yQkEwMj15CiMgQ09ORklHX0RSTV9QQU5FTF9GRUlZ
QU5HX0ZZMDcwMjRESTI2QTMwRCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfSUxJVEVLX0lM
STk4ODFDPW0KQ09ORklHX0RSTV9QQU5FTF9JTk5PTFVYX1AwNzlaQ0E9eQpDT05GSUdfRFJNX1BB
TkVMX0pESV9MVDA3ME1FMDUwMDA9eQpDT05GSUdfRFJNX1BBTkVMX0pESV9SNjM0NTI9bQojIENP
TkZJR19EUk1fUEFORUxfS0hBREFTX1RTMDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVM
X0tJTkdESVNQTEFZX0tEMDk3RDA0IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1BBTkVMX0xFQURU
RUtfTFRLMDUwSDMxNDZXIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9MRUFEVEVLX0xUSzUw
MEhEMTgyOT15CkNPTkZJR19EUk1fUEFORUxfTk9WQVRFS19OVDM1NTEwPW0KIyBDT05GSUdfRFJN
X1BBTkVMX05PVkFURUtfTlQzNTU2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9OT1ZB
VEVLX05UMzU5NTAgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfTk9WQVRFS19OVDM2Njcy
QSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfTUFOVElYX01MQUYwNTdXRTUxPW0KIyBDT05G
SUdfRFJNX1BBTkVMX09MSU1FWF9MQ0RfT0xJTlVYSU5PIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9Q
QU5FTF9PUklTRVRFQ0hfT1RNODAwOUE9bQojIENPTkZJR19EUk1fUEFORUxfT1NEX09TRDEwMVQy
NTg3XzUzVFMgaXMgbm90IHNldAojIENPTkZJR19EUk1fUEFORUxfUEFOQVNPTklDX1ZWWDEwRjAz
NE4wMCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfUkFTUEJFUlJZUElfVE9VQ0hTQ1JFRU49
bQpDT05GSUdfRFJNX1BBTkVMX1JBWURJVU1fUk02NzE5MT15CkNPTkZJR19EUk1fUEFORUxfUkFZ
RElVTV9STTY4MjAwPXkKQ09ORklHX0RSTV9QQU5FTF9ST05CT19SQjA3MEQzMD1tCkNPTkZJR19E
Uk1fUEFORUxfU0FNU1VOR19BVE5BMzNYQzIwPXkKQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2
RDE2RDA9eQojIENPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkUzSEEyIGlzIG5vdCBzZXQKQ09O
RklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RTYzSjBYMDM9bQojIENPTkZJR19EUk1fUEFORUxfU0FN
U1VOR19TNkU2M00wIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9TQU1TVU5HX1M2RTg4QTBf
QU1TNDUyRUYwMT15CkNPTkZJR19EUk1fUEFORUxfU0FNU1VOR19TNkU4QUEwPXkKIyBDT05GSUdf
RFJNX1BBTkVMX1NBTVNVTkdfU09GRUYwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9QQU5FTF9T
RUlLT180M1dWRjFHIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9TSEFSUF9MUTEwMVIxU1gw
MT15CkNPTkZJR19EUk1fUEFORUxfU0hBUlBfTFMwMzdWN0RXMDE9eQpDT05GSUdfRFJNX1BBTkVM
X1NIQVJQX0xTMDQzVDFMRTAxPXkKQ09ORklHX0RSTV9QQU5FTF9TSEFSUF9MUzA2MFQxU1gwMT1t
CiMgQ09ORklHX0RSTV9QQU5FTF9TSVRST05JWF9TVDc3MDEgaXMgbm90IHNldApDT05GSUdfRFJN
X1BBTkVMX1NJVFJPTklYX1NUNzcwMz1tCkNPTkZJR19EUk1fUEFORUxfU09OWV9UVUxJUF9UUlVM
WV9OVDM1NTIxPXkKQ09ORklHX0RSTV9QQU5FTF9URE9fVEwwNzBXU0gzMD15CiMgQ09ORklHX0RS
TV9QQU5FTF9UUlVMWV9OVDM1NTk3X1dRWEdBIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9QQU5FTF9W
SVNJT05PWF9STTY5Mjk5PW0KQ09ORklHX0RSTV9QQU5FTF9YSU5QRU5HX1hQUDA1NUMyNzI9eQoj
IGVuZCBvZiBEaXNwbGF5IFBhbmVscwoKQ09ORklHX0RSTV9CUklER0U9eQpDT05GSUdfRFJNX1BB
TkVMX0JSSURHRT15CgojCiMgRGlzcGxheSBJbnRlcmZhY2UgQnJpZGdlcwojCiMgQ09ORklHX0RS
TV9DRE5TX0RTSSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fQ0hJUE9ORV9JQ042MjExPXkKQ09ORklH
X0RSTV9DSFJPTlRFTF9DSDcwMzM9bQpDT05GSUdfRFJNX0RJU1BMQVlfQ09OTkVDVE9SPW0KQ09O
RklHX0RSTV9JVEVfSVQ2NTA1PW0KQ09ORklHX0RSTV9MT05USVVNX0xUODkxMkI9bQpDT05GSUdf
RFJNX0xPTlRJVU1fTFQ5MjExPW0KQ09ORklHX0RSTV9MT05USVVNX0xUOTYxMT15CkNPTkZJR19E
Uk1fTE9OVElVTV9MVDk2MTFVWEM9bQpDT05GSUdfRFJNX0lURV9JVDY2MTIxPW0KIyBDT05GSUdf
RFJNX0xWRFNfQ09ERUMgaXMgbm90IHNldAojIENPTkZJR19EUk1fTUVHQUNISVBTX1NURFBYWFhY
X0dFX0I4NTBWM19GVyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fTldMX01JUElfRFNJPW0KQ09ORklH
X0RSTV9OWFBfUFROMzQ2MD15CkNPTkZJR19EUk1fUEFSQURFX1BTODYyMj15CkNPTkZJR19EUk1f
UEFSQURFX1BTODY0MD15CkNPTkZJR19EUk1fU0lMX1NJSTg2MjA9bQojIENPTkZJR19EUk1fU0lJ
OTAyWCBpcyBub3Qgc2V0CkNPTkZJR19EUk1fU0lJOTIzND15CkNPTkZJR19EUk1fU0lNUExFX0JS
SURHRT15CkNPTkZJR19EUk1fVEhJTkVfVEhDNjNMVkQxMDI0PXkKIyBDT05GSUdfRFJNX1RPU0hJ
QkFfVEMzNTg3NjIgaXMgbm90IHNldApDT05GSUdfRFJNX1RPU0hJQkFfVEMzNTg3NjQ9bQojIENP
TkZJR19EUk1fVE9TSElCQV9UQzM1ODc2NyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fVE9TSElCQV9U
QzM1ODc2OD15CkNPTkZJR19EUk1fVE9TSElCQV9UQzM1ODc3NT1tCiMgQ09ORklHX0RSTV9USV9E
TFBDMzQzMyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fVElfVEZQNDEwPW0KQ09ORklHX0RSTV9USV9T
TjY1RFNJODM9bQojIENPTkZJR19EUk1fVElfU042NURTSTg2IGlzIG5vdCBzZXQKQ09ORklHX0RS
TV9USV9UUEQxMlMwMTU9eQpDT05GSUdfRFJNX0FOQUxPR0lYX0FOWDYzNDU9bQpDT05GSUdfRFJN
X0FOQUxPR0lYX0FOWDc4WFg9eQpDT05GSUdfRFJNX0FOQUxPR0lYX0RQPXkKQ09ORklHX0RSTV9B
TkFMT0dJWF9BTlg3NjI1PW0KQ09ORklHX0RSTV9JMkNfQURWNzUxMT1tCkNPTkZJR19EUk1fSTJD
X0FEVjc1MTFfQ0VDPXkKQ09ORklHX0RSTV9DRE5TX01IRFA4NTQ2PW0KIyBlbmQgb2YgRGlzcGxh
eSBJbnRlcmZhY2UgQnJpZGdlcwoKQ09ORklHX0RSTV9FVE5BVklWPXkKQ09ORklHX0RSTV9FVE5B
VklWX1RIRVJNQUw9eQpDT05GSUdfRFJNX0xPR0lDVkM9eQpDT05GSUdfRFJNX01YUz15CkNPTkZJ
R19EUk1fTVhTRkI9eQpDT05GSUdfRFJNX0lNWF9MQ0RJRj15CkNPTkZJR19EUk1fQVJDUEdVPW0K
IyBDT05GSUdfRFJNX0JPQ0hTIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0NJUlJVU19RRU1VIGlz
IG5vdCBzZXQKQ09ORklHX0RSTV9HTTEyVTMyMD15CkNPTkZJR19EUk1fU0lNUExFRFJNPXkKIyBD
T05GSUdfRFJNX1ZCT1hWSURFTyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9HVUQgaXMgbm90IHNl
dApDT05GSUdfRFJNX1NTRDEzMFg9eQpDT05GSUdfRFJNX1NTRDEzMFhfSTJDPW0KIyBDT05GSUdf
RFJNX0xFR0FDWSBpcyBub3Qgc2V0CkNPTkZJR19EUk1fUEFORUxfT1JJRU5UQVRJT05fUVVJUktT
PXkKQ09ORklHX0RSTV9OT01PREVTRVQ9eQoKIwojIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCiMKQ09O
RklHX0ZCX0NNRExJTkU9eQpDT05GSUdfRkJfTk9USUZZPXkKQ09ORklHX0ZCPXkKIyBDT05GSUdf
RklSTVdBUkVfRURJRCBpcyBub3Qgc2V0CkNPTkZJR19GQl9DRkJfRklMTFJFQ1Q9eQpDT05GSUdf
RkJfQ0ZCX0NPUFlBUkVBPXkKQ09ORklHX0ZCX0NGQl9JTUFHRUJMSVQ9eQpDT05GSUdfRkJfU1lT
X0ZJTExSRUNUPXkKQ09ORklHX0ZCX1NZU19DT1BZQVJFQT15CkNPTkZJR19GQl9TWVNfSU1BR0VC
TElUPXkKIyBDT05GSUdfRkJfRk9SRUlHTl9FTkRJQU4gaXMgbm90IHNldApDT05GSUdfRkJfU1lT
X0ZPUFM9eQpDT05GSUdfRkJfREVGRVJSRURfSU89eQpDT05GSUdfRkJfSEVDVUJBPW0KQ09ORklH
X0ZCX0JBQ0tMSUdIVD15CkNPTkZJR19GQl9NT0RFX0hFTFBFUlM9eQojIENPTkZJR19GQl9USUxF
QkxJVFRJTkcgaXMgbm90IHNldAoKIwojIEZyYW1lIGJ1ZmZlciBoYXJkd2FyZSBkcml2ZXJzCiMK
IyBDT05GSUdfRkJfQ0lSUlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUE0yIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfQ1lCRVIyMDAwIGlzIG5vdCBzZXQKQ09ORklHX0ZCX0FSQz15CiMgQ09ORklH
X0ZCX0FTSUxJQU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSU1TVFQgaXMgbm90IHNldAojIENP
TkZJR19GQl9WR0ExNiBpcyBub3Qgc2V0CkNPTkZJR19GQl9VVkVTQT1tCiMgQ09ORklHX0ZCX1ZF
U0EgaXMgbm90IHNldApDT05GSUdfRkJfTjQxMT1tCkNPTkZJR19GQl9IR0E9bQojIENPTkZJR19G
Ql9PUEVOQ09SRVMgaXMgbm90IHNldApDT05GSUdfRkJfUzFEMTNYWFg9bQojIENPTkZJR19GQl9O
VklESUEgaXMgbm90IHNldAojIENPTkZJR19GQl9SSVZBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
STc0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0xFODA1NzggaXMgbm90IHNldAojIENPTkZJR19G
Ql9NQVRST1ggaXMgbm90IHNldAojIENPTkZJR19GQl9SQURFT04gaXMgbm90IHNldAojIENPTkZJ
R19GQl9BVFkxMjggaXMgbm90IHNldAojIENPTkZJR19GQl9BVFkgaXMgbm90IHNldAojIENPTkZJ
R19GQl9TMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NBVkFHRSBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCX1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZC
X05FT01BR0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfS1lSTyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZCXzNERlggaXMgbm90IHNldAojIENPTkZJR19GQl9WT09ET08xIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfVlQ4NjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVFJJREVOVCBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX0FSSyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1BNMyBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZCX0NBUk1JTkUgaXMgbm90IHNldApDT05GSUdfRkJfU001MDE9bQpDT05GSUdfRkJfU01T
Q1VGWD15CkNPTkZJR19GQl9VREw9bQojIENPTkZJR19GQl9JQk1fR1hUNDUwMCBpcyBub3Qgc2V0
CkNPTkZJR19GQl9WSVJUVUFMPW0KIyBDT05GSUdfRkJfTUVUUk9OT01FIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfTUI4NjJYWCBpcyBub3Qgc2V0CkNPTkZJR19GQl9TU0QxMzA3PW0KIyBDT05GSUdf
RkJfU003MTIgaXMgbm90IHNldAojIGVuZCBvZiBGcmFtZSBidWZmZXIgRGV2aWNlcwoKIwojIEJh
Y2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19MQ0RfQ0xBU1NfREVWSUNFPXkK
Q09ORklHX0xDRF9QTEFURk9STT15CkNPTkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNFPXkKIyBD
T05GSUdfQkFDS0xJR0hUX0tURDI1MyBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfTE0zNTMz
PW0KIyBDT05GSUdfQkFDS0xJR0hUX1BXTSBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfREE5
MDUyPW0KIyBDT05GSUdfQkFDS0xJR0hUX0FQUExFIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdI
VF9RQ09NX1dMRUQ9bQpDT05GSUdfQkFDS0xJR0hUX1NBSEFSQT15CkNPTkZJR19CQUNLTElHSFRf
QURQODg2MD1tCkNPTkZJR19CQUNLTElHSFRfQURQODg3MD1tCiMgQ09ORklHX0JBQ0tMSUdIVF9Q
Q0Y1MDYzMyBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfTE0zNjMwQT15CkNPTkZJR19CQUNL
TElHSFRfTE0zNjM5PXkKIyBDT05GSUdfQkFDS0xJR0hUX0xQODU1WCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JBQ0tMSUdIVF9MUDg3ODggaXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX1NLWTgxNDUy
PW0KQ09ORklHX0JBQ0tMSUdIVF9UUFM2NTIxNz1tCkNPTkZJR19CQUNLTElHSFRfR1BJTz15CkNP
TkZJR19CQUNLTElHSFRfTFY1MjA3TFA9bQojIENPTkZJR19CQUNLTElHSFRfQkQ2MTA3IGlzIG5v
dCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FSQ1hDTk4gaXMgbm90IHNldApDT05GSUdfQkFDS0xJ
R0hUX1JBVkVfU1A9eQpDT05GSUdfQkFDS0xJR0hUX0xFRD1tCiMgZW5kIG9mIEJhY2tsaWdodCAm
IExDRCBkZXZpY2Ugc3VwcG9ydAoKQ09ORklHX1ZJREVPTU9ERV9IRUxQRVJTPXkKQ09ORklHX0hE
TUk9eQpDT05GSUdfTE9HTz15CiMgQ09ORklHX0xPR09fTElOVVhfTU9OTyBpcyBub3Qgc2V0CkNP
TkZJR19MT0dPX0xJTlVYX1ZHQTE2PXkKIyBDT05GSUdfTE9HT19MSU5VWF9DTFVUMjI0IGlzIG5v
dCBzZXQKIyBlbmQgb2YgR3JhcGhpY3Mgc3VwcG9ydAoKIyBDT05GSUdfU09VTkQgaXMgbm90IHNl
dAoKIwojIEhJRCBzdXBwb3J0CiMKQ09ORklHX0hJRD1tCkNPTkZJR19ISURfQkFUVEVSWV9TVFJF
TkdUSD15CkNPTkZJR19ISURSQVc9eQpDT05GSUdfVUhJRD1tCkNPTkZJR19ISURfR0VORVJJQz1t
CgojCiMgU3BlY2lhbCBISUQgZHJpdmVycwojCiMgQ09ORklHX0hJRF9BNFRFQ0ggaXMgbm90IHNl
dApDT05GSUdfSElEX0FDQ1VUT1VDSD1tCkNPTkZJR19ISURfQUNSVVg9bQojIENPTkZJR19ISURf
QUNSVVhfRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfQVBQTEUgaXMgbm90IHNldApDT05GSUdf
SElEX0FQUExFSVI9bQpDT05GSUdfSElEX0FTVVM9bQpDT05GSUdfSElEX0FVUkVBTD1tCkNPTkZJ
R19ISURfQkVMS0lOPW0KIyBDT05GSUdfSElEX0JFVE9QX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9CSUdCRU5fRkY9bQojIENPTkZJR19ISURfQ0hFUlJZIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9D
SElDT05ZPW0KQ09ORklHX0hJRF9DT1JTQUlSPW0KIyBDT05GSUdfSElEX0NPVUdBUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9NQUNBTExZIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9DTUVESUE9bQpD
T05GSUdfSElEX0NQMjExMj1tCkNPTkZJR19ISURfQ1JFQVRJVkVfU0IwNTQwPW0KIyBDT05GSUdf
SElEX0NZUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19ISURfRFJBR09OUklTRSBpcyBub3Qgc2V0
CkNPTkZJR19ISURfRU1TX0ZGPW0KQ09ORklHX0hJRF9FTEFOPW0KIyBDT05GSUdfSElEX0VMRUNP
TSBpcyBub3Qgc2V0CkNPTkZJR19ISURfRUxPPW0KQ09ORklHX0hJRF9FWktFWT1tCkNPTkZJR19I
SURfRlQyNjA9bQpDT05GSUdfSElEX0dFTUJJUkQ9bQojIENPTkZJR19ISURfR0ZSTSBpcyBub3Qg
c2V0CkNPTkZJR19ISURfR0xPUklPVVM9bQpDT05GSUdfSElEX0hPTFRFSz1tCkNPTkZJR19IT0xU
RUtfRkY9eQpDT05GSUdfSElEX1ZJVkFMRElfQ09NTU9OPW0KQ09ORklHX0hJRF9WSVZBTERJPW0K
Q09ORklHX0hJRF9HVDY4M1I9bQpDT05GSUdfSElEX0tFWVRPVUNIPW0KQ09ORklHX0hJRF9LWUU9
bQpDT05GSUdfSElEX1VDTE9HSUM9bQpDT05GSUdfSElEX1dBTFRPUD1tCkNPTkZJR19ISURfVklF
V1NPTklDPW0KQ09ORklHX0hJRF9YSUFPTUk9bQpDT05GSUdfSElEX0dZUkFUSU9OPW0KIyBDT05G
SUdfSElEX0lDQURFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9JVEU9bQpDT05GSUdfSElEX0pBQlJB
PW0KQ09ORklHX0hJRF9UV0lOSEFOPW0KIyBDT05GSUdfSElEX0tFTlNJTkdUT04gaXMgbm90IHNl
dApDT05GSUdfSElEX0xDUE9XRVI9bQpDT05GSUdfSElEX0xFRD1tCkNPTkZJR19ISURfTEVOT1ZP
PW0KQ09ORklHX0hJRF9MRVRTS0VUQ0g9bQojIENPTkZJR19ISURfTE9HSVRFQ0ggaXMgbm90IHNl
dApDT05GSUdfSElEX01BR0lDTU9VU0U9bQojIENPTkZJR19ISURfTUFMVFJPTiBpcyBub3Qgc2V0
CkNPTkZJR19ISURfTUFZRkxBU0g9bQojIENPTkZJR19ISURfTUVHQVdPUkxEX0ZGIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1JFRFJBR09OIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9NSUNST1NPRlQ9
bQpDT05GSUdfSElEX01PTlRFUkVZPW0KIyBDT05GSUdfSElEX01VTFRJVE9VQ0ggaXMgbm90IHNl
dApDT05GSUdfSElEX05JTlRFTkRPPW0KQ09ORklHX05JTlRFTkRPX0ZGPXkKIyBDT05GSUdfSElE
X05USSBpcyBub3Qgc2V0CkNPTkZJR19ISURfTlRSSUc9bQojIENPTkZJR19ISURfT1JURUsgaXMg
bm90IHNldApDT05GSUdfSElEX1BBTlRIRVJMT1JEPW0KQ09ORklHX1BBTlRIRVJMT1JEX0ZGPXkK
IyBDT05GSUdfSElEX1BFTk1PVU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BFVEFMWU5YIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1BJQ09MQ0QgaXMgbm90IHNldAojIENPTkZJR19ISURfUExB
TlRST05JQ1MgaXMgbm90IHNldApDT05GSUdfSElEX1BMQVlTVEFUSU9OPW0KQ09ORklHX1BMQVlT
VEFUSU9OX0ZGPXkKQ09ORklHX0hJRF9SQVpFUj1tCkNPTkZJR19ISURfUFJJTUFYPW0KQ09ORklH
X0hJRF9SRVRST0RFPW0KQ09ORklHX0hJRF9ST0NDQVQ9bQpDT05GSUdfSElEX1NBSVRFSz1tCkNP
TkZJR19ISURfU0FNU1VORz1tCkNPTkZJR19ISURfU0VNSVRFSz1tCiMgQ09ORklHX0hJRF9TSUdN
QU1JQ1JPIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TT05ZPW0KQ09ORklHX1NPTllfRkY9eQpDT05G
SUdfSElEX1NQRUVETElOSz1tCiMgQ09ORklHX0hJRF9TVEVBTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9TVEVFTFNFUklFUyBpcyBub3Qgc2V0CkNPTkZJR19ISURfU1VOUExVUz1tCkNPTkZJR19I
SURfUk1JPW0KIyBDT05GSUdfSElEX0dSRUVOQVNJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9T
TUFSVEpPWVBMVVMgaXMgbm90IHNldApDT05GSUdfSElEX1RJVk89bQpDT05GSUdfSElEX1RPUFNF
RUQ9bQpDT05GSUdfSElEX1RISU5HTT1tCiMgQ09ORklHX0hJRF9USFJVU1RNQVNURVIgaXMgbm90
IHNldApDT05GSUdfSElEX1VEUkFXX1BTMz1tCkNPTkZJR19ISURfVTJGWkVSTz1tCkNPTkZJR19I
SURfV0FDT009bQojIENPTkZJR19ISURfV0lJTU9URSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9Y
SU5NTyBpcyBub3Qgc2V0CkNPTkZJR19ISURfWkVST1BMVVM9bQojIENPTkZJR19aRVJPUExVU19G
RiBpcyBub3Qgc2V0CkNPTkZJR19ISURfWllEQUNST049bQpDT05GSUdfSElEX1NFTlNPUl9IVUI9
bQojIENPTkZJR19ISURfU0VOU09SX0NVU1RPTV9TRU5TT1IgaXMgbm90IHNldApDT05GSUdfSElE
X0FMUFM9bQpDT05GSUdfSElEX01DUDIyMjE9bQojIGVuZCBvZiBTcGVjaWFsIEhJRCBkcml2ZXJz
CgojCiMgVVNCIEhJRCBzdXBwb3J0CiMKQ09ORklHX1VTQl9ISUQ9bQojIENPTkZJR19ISURfUElE
IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9ISURERVY9eQoKIwojIFVTQiBISUQgQm9vdCBQcm90b2Nv
bCBkcml2ZXJzCiMKIyBDT05GSUdfVVNCX0tCRCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTU9VU0U9
eQojIGVuZCBvZiBVU0IgSElEIEJvb3QgUHJvdG9jb2wgZHJpdmVycwojIGVuZCBvZiBVU0IgSElE
IHN1cHBvcnQKCiMKIyBJMkMgSElEIHN1cHBvcnQKIwojIENPTkZJR19JMkNfSElEX0FDUEkgaXMg
bm90IHNldAojIENPTkZJR19JMkNfSElEX09GIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19ISURfT0Zf
RUxBTj1tCiMgQ09ORklHX0kyQ19ISURfT0ZfR09PRElYIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJD
IEhJRCBzdXBwb3J0CgojCiMgSW50ZWwgSVNIIEhJRCBzdXBwb3J0CiMKIyBDT05GSUdfSU5URUxf
SVNIX0hJRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIElTSCBISUQgc3VwcG9ydAoKIwojIEFN
RCBTRkggSElEIFN1cHBvcnQKIwojIENPTkZJR19BTURfU0ZIX0hJRCBpcyBub3Qgc2V0CiMgZW5k
IG9mIEFNRCBTRkggSElEIFN1cHBvcnQKIyBlbmQgb2YgSElEIHN1cHBvcnQKCkNPTkZJR19VU0Jf
T0hDSV9MSVRUTEVfRU5ESUFOPXkKQ09ORklHX1VTQl9TVVBQT1JUPXkKQ09ORklHX1VTQl9DT01N
T049eQojIENPTkZJR19VU0JfTEVEX1RSSUcgaXMgbm90IHNldApDT05GSUdfVVNCX1VMUElfQlVT
PW0KQ09ORklHX1VTQl9DT05OX0dQSU89bQpDT05GSUdfVVNCX0FSQ0hfSEFTX0hDRD15CkNPTkZJ
R19VU0I9eQpDT05GSUdfVVNCX1BDST15CkNPTkZJR19VU0JfQU5OT1VOQ0VfTkVXX0RFVklDRVM9
eQoKIwojIE1pc2NlbGxhbmVvdXMgVVNCIG9wdGlvbnMKIwojIENPTkZJR19VU0JfREVGQVVMVF9Q
RVJTSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0ZFV19JTklUX1JFVFJJRVMgaXMgbm90IHNl
dApDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTPXkKIyBDT05GSUdfVVNCX09URyBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9PVEdfUFJPRFVDVExJU1QgaXMgbm90IHNldApDT05GSUdfVVNCX09UR19E
SVNBQkxFX0VYVEVSTkFMX0hVQj15CkNPTkZJR19VU0JfTEVEU19UUklHR0VSX1VTQlBPUlQ9eQpD
T05GSUdfVVNCX0FVVE9TVVNQRU5EX0RFTEFZPTIKQ09ORklHX1VTQl9NT049eQoKIwojIFVTQiBI
b3N0IENvbnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX1VTQl9DNjdYMDBfSENEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1hIQ0lfSENEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX0hDRD15
CkNPTkZJR19VU0JfRUhDSV9ST09UX0hVQl9UVD15CiMgQ09ORklHX1VTQl9FSENJX1RUX05FV1ND
SEVEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX1BDST15CkNPTkZJR19VU0JfRUhDSV9GU0w9
bQpDT05GSUdfVVNCX0VIQ0lfSENEX1BMQVRGT1JNPXkKQ09ORklHX1VTQl9PWFUyMTBIUF9IQ0Q9
bQojIENPTkZJR19VU0JfSVNQMTE2WF9IQ0QgaXMgbm90IHNldApDT05GSUdfVVNCX0ZPVEcyMTBf
SENEPXkKQ09ORklHX1VTQl9PSENJX0hDRD1tCkNPTkZJR19VU0JfT0hDSV9IQ0RfUENJPW0KQ09O
RklHX1VTQl9PSENJX0hDRF9TU0I9eQpDT05GSUdfVVNCX09IQ0lfSENEX1BMQVRGT1JNPW0KIyBD
T05GSUdfVVNCX1VIQ0lfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1UxMzJfSENEIGlzIG5v
dCBzZXQKQ09ORklHX1VTQl9TTDgxMV9IQ0Q9eQojIENPTkZJR19VU0JfU0w4MTFfSENEX0lTTyBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfUjhBNjY1OTdfSENEPW0KIyBDT05GSUdfVVNCX0hDRF9CQ01B
IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9IQ0RfU1NCPW0KIyBDT05GSUdfVVNCX0hDRF9URVNUX01P
REUgaXMgbm90IHNldAoKIwojIFVTQiBEZXZpY2UgQ2xhc3MgZHJpdmVycwojCkNPTkZJR19VU0Jf
QUNNPXkKIyBDT05GSUdfVVNCX1BSSU5URVIgaXMgbm90IHNldApDT05GSUdfVVNCX1dETT1tCiMg
Q09ORklHX1VTQl9UTUMgaXMgbm90IHNldAoKIwojIE5PVEU6IFVTQl9TVE9SQUdFIGRlcGVuZHMg
b24gU0NTSSBidXQgQkxLX0RFVl9TRCBtYXkKIwoKIwojIGFsc28gYmUgbmVlZGVkOyBzZWUgVVNC
X1NUT1JBR0UgSGVscCBmb3IgbW9yZSBpbmZvCiMKCiMKIyBVU0IgSW1hZ2luZyBkZXZpY2VzCiMK
Q09ORklHX1VTQl9NREM4MDA9bQpDT05GSUdfVVNCSVBfQ09SRT15CkNPTkZJR19VU0JJUF9WSENJ
X0hDRD15CkNPTkZJR19VU0JJUF9WSENJX0hDX1BPUlRTPTgKQ09ORklHX1VTQklQX1ZIQ0lfTlJf
SENTPTEKIyBDT05GSUdfVVNCSVBfSE9TVCBpcyBub3Qgc2V0CkNPTkZJR19VU0JJUF9ERUJVRz15
CkNPTkZJR19VU0JfQ0ROU19TVVBQT1JUPW0KQ09ORklHX1VTQl9DRE5TX0hPU1Q9eQpDT05GSUdf
VVNCX0NETlMzPW0KQ09ORklHX1VTQl9DRE5TM19IT1NUPXkKQ09ORklHX1VTQl9DRE5TM19QQ0lf
V1JBUD1tCiMgQ09ORklHX1VTQl9DRE5TUF9QQ0kgaXMgbm90IHNldApDT05GSUdfVVNCX01VU0Jf
SERSQz15CkNPTkZJR19VU0JfTVVTQl9IT1NUPXkKCiMKIyBQbGF0Zm9ybSBHbHVlIExheWVyCiMK
CiMKIyBNVVNCIERNQSBtb2RlCiMKIyBDT05GSUdfTVVTQl9QSU9fT05MWSBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9EV0MzIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9EV0MyPXkKQ09ORklHX1VTQl9E
V0MyX0hPU1Q9eQoKIwojIEdhZGdldC9EdWFsLXJvbGUgbW9kZSByZXF1aXJlcyBVU0IgR2FkZ2V0
IHN1cHBvcnQgdG8gYmUgZW5hYmxlZAojCiMgQ09ORklHX1VTQl9EV0MyX1BDSSBpcyBub3Qgc2V0
CkNPTkZJR19VU0JfRFdDMl9ERUJVRz15CkNPTkZJR19VU0JfRFdDMl9WRVJCT1NFPXkKIyBDT05G
SUdfVVNCX0RXQzJfVFJBQ0tfTUlTU0VEX1NPRlMgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFdD
Ml9ERUJVR19QRVJJT0RJQyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQ0hJUElERUE9bQpDT05GSUdf
VVNCX0NISVBJREVBX0hPU1Q9eQpDT05GSUdfVVNCX0NISVBJREVBX1BDST1tCkNPTkZJR19VU0Jf
Q0hJUElERUFfTVNNPW0KQ09ORklHX1VTQl9DSElQSURFQV9JTVg9bQpDT05GSUdfVVNCX0NISVBJ
REVBX0dFTkVSSUM9bQpDT05GSUdfVVNCX0NISVBJREVBX1RFR1JBPW0KQ09ORklHX1VTQl9JU1Ax
NzYwPW0KQ09ORklHX1VTQl9JU1AxNzYwX0hDRD15CkNPTkZJR19VU0JfSVNQMTc2MF9IT1NUX1JP
TEU9eQoKIwojIFVTQiBwb3J0IGRyaXZlcnMKIwpDT05GSUdfVVNCX1VTUzcyMD1tCiMgQ09ORklH
X1VTQl9TRVJJQUwgaXMgbm90IHNldAoKIwojIFVTQiBNaXNjZWxsYW5lb3VzIGRyaXZlcnMKIwoj
IENPTkZJR19VU0JfRU1JNjIgaXMgbm90IHNldApDT05GSUdfVVNCX0VNSTI2PW0KQ09ORklHX1VT
Ql9BRFVUVVg9eQpDT05GSUdfVVNCX1NFVlNFRz1tCkNPTkZJR19VU0JfTEVHT1RPV0VSPXkKQ09O
RklHX1VTQl9MQ0Q9bQpDT05GSUdfVVNCX0NZUFJFU1NfQ1k3QzYzPW0KIyBDT05GSUdfVVNCX0NZ
VEhFUk0gaXMgbm90IHNldAojIENPTkZJR19VU0JfSURNT1VTRSBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfRlRESV9FTEFOPW0KQ09ORklHX1VTQl9BUFBMRURJU1BMQVk9bQojIENPTkZJR19BUFBMRV9N
RklfRkFTVENIQVJHRSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0lTVVNCVkdBPW0KQ09ORklHX1VT
Ql9MRD1tCkNPTkZJR19VU0JfVFJBTkNFVklCUkFUT1I9eQpDT05GSUdfVVNCX0lPV0FSUklPUj1t
CiMgQ09ORklHX1VTQl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VIU0VUX1RFU1RfRklY
VFVSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU0lHSFRGVyBpcyBub3Qgc2V0CkNPTkZJR19V
U0JfWVVSRVg9eQpDT05GSUdfVVNCX0VaVVNCX0ZYMj15CkNPTkZJR19VU0JfSFVCX1VTQjI1MVhC
PW0KIyBDT05GSUdfVVNCX0hTSUNfVVNCMzUwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IU0lD
X1VTQjQ2MDQgaXMgbm90IHNldAojIENPTkZJR19VU0JfTElOS19MQVlFUl9URVNUIGlzIG5vdCBz
ZXQKQ09ORklHX1VTQl9DSEFPU0tFWT15CkNPTkZJR19VU0JfT05CT0FSRF9IVUI9bQoKIwojIFVT
QiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCiMKQ09ORklHX1VTQl9QSFk9eQpDT05GSUdfTk9QX1VT
Ql9YQ0VJVj1tCiMgQ09ORklHX1VTQl9HUElPX1ZCVVMgaXMgbm90IHNldAojIENPTkZJR19UQUhW
T19VU0IgaXMgbm90IHNldApDT05GSUdfVVNCX0lTUDEzMDE9bQojIGVuZCBvZiBVU0IgUGh5c2lj
YWwgTGF5ZXIgZHJpdmVycwoKIyBDT05GSUdfVVNCX0dBREdFVCBpcyBub3Qgc2V0CkNPTkZJR19U
WVBFQz15CkNPTkZJR19UWVBFQ19UQ1BNPXkKQ09ORklHX1RZUEVDX1RDUENJPXkKIyBDT05GSUdf
VFlQRUNfUlQxNzExSCBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQ19NVDYzNjA9bQojIENPTkZJR19U
WVBFQ19UQ1BDSV9NQVhJTSBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQ19GVVNCMzAyPXkKIyBDT05G
SUdfVFlQRUNfVUNTSSBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQ19UUFM2NTk4WD1tCkNPTkZJR19U
WVBFQ19BTlg3NDExPW0KQ09ORklHX1RZUEVDX1JUMTcxOT1tCkNPTkZJR19UWVBFQ19IRDNTUzMy
MjA9eQpDT05GSUdfVFlQRUNfU1RVU0IxNjBYPXkKQ09ORklHX1RZUEVDX1dVU0IzODAxPW0KCiMK
IyBVU0IgVHlwZS1DIE11bHRpcGxleGVyL0RlTXVsdGlwbGV4ZXIgU3dpdGNoIHN1cHBvcnQKIwoj
IENPTkZJR19UWVBFQ19NVVhfRlNBNDQ4MCBpcyBub3Qgc2V0CkNPTkZJR19UWVBFQ19NVVhfUEkz
VVNCMzA1MzI9bQojIGVuZCBvZiBVU0IgVHlwZS1DIE11bHRpcGxleGVyL0RlTXVsdGlwbGV4ZXIg
U3dpdGNoIHN1cHBvcnQKCiMKIyBVU0IgVHlwZS1DIEFsdGVybmF0ZSBNb2RlIGRyaXZlcnMKIwpD
T05GSUdfVFlQRUNfRFBfQUxUTU9ERT15CkNPTkZJR19UWVBFQ19OVklESUFfQUxUTU9ERT15CiMg
ZW5kIG9mIFVTQiBUeXBlLUMgQWx0ZXJuYXRlIE1vZGUgZHJpdmVycwoKQ09ORklHX1VTQl9ST0xF
X1NXSVRDSD15CiMgQ09ORklHX1VTQl9ST0xFU19JTlRFTF9YSENJIGlzIG5vdCBzZXQKQ09ORklH
X01NQz15CkNPTkZJR19QV1JTRVFfRU1NQz1tCiMgQ09ORklHX1BXUlNFUV9TSU1QTEUgaXMgbm90
IHNldApDT05GSUdfU0RJT19VQVJUPW0KIyBDT05GSUdfTU1DX1RFU1QgaXMgbm90IHNldAoKIwoj
IE1NQy9TRC9TRElPIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMKIyBDT05GSUdfTU1DX0RFQlVH
IGlzIG5vdCBzZXQKQ09ORklHX01NQ19TREhDST15CkNPTkZJR19NTUNfU0RIQ0lfSU9fQUNDRVNT
T1JTPXkKIyBDT05GSUdfTU1DX1NESENJX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19TREhD
SV9BQ1BJIGlzIG5vdCBzZXQKQ09ORklHX01NQ19TREhDSV9QTFRGTT1tCiMgQ09ORklHX01NQ19T
REhDSV9PRl9BUkFTQU4gaXMgbm90IHNldAojIENPTkZJR19NTUNfU0RIQ0lfT0ZfQVNQRUVEIGlz
IG5vdCBzZXQKQ09ORklHX01NQ19TREhDSV9PRl9BVDkxPW0KIyBDT05GSUdfTU1DX1NESENJX09G
X0RXQ01TSEMgaXMgbm90IHNldAojIENPTkZJR19NTUNfU0RIQ0lfQ0FERU5DRSBpcyBub3Qgc2V0
CkNPTkZJR19NTUNfU0RIQ0lfRl9TREgzMD1tCkNPTkZJR19NTUNfU0RIQ0lfTUlMQkVBVVQ9bQoj
IENPTkZJR19NTUNfV0JTRCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19USUZNX1NEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTU1DX0NCNzEwIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX1ZJQV9TRE1NQyBp
cyBub3Qgc2V0CkNPTkZJR19NTUNfVlVCMzAwPW0KIyBDT05GSUdfTU1DX1VTSEMgaXMgbm90IHNl
dApDT05GSUdfTU1DX1VTREhJNlJPTDA9bQpDT05GSUdfTU1DX1JFQUxURUtfVVNCPW0KQ09ORklH
X01NQ19DUUhDST1tCkNPTkZJR19NTUNfSFNRPW0KIyBDT05GSUdfTU1DX1RPU0hJQkFfUENJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTU1DX01USyBpcyBub3Qgc2V0CkNPTkZJR19NTUNfU0RIQ0lfWEVO
T049bQpDT05GSUdfTU1DX1NESENJX09NQVA9bQpDT05GSUdfTU1DX1NESENJX0FNNjU0PW0KQ09O
RklHX01NQ19MSVRFWD15CkNPTkZJR19NRU1TVElDSz15CkNPTkZJR19NRU1TVElDS19ERUJVRz15
CgojCiMgTWVtb3J5U3RpY2sgZHJpdmVycwojCiMgQ09ORklHX01FTVNUSUNLX1VOU0FGRV9SRVNV
TUUgaXMgbm90IHNldAoKIwojIE1lbW9yeVN0aWNrIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMK
IyBDT05GSUdfTUVNU1RJQ0tfVElGTV9NUyBpcyBub3Qgc2V0CiMgQ09ORklHX01FTVNUSUNLX0pN
SUNST05fMzhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNU1RJQ0tfUjU5MiBpcyBub3Qgc2V0CiMg
Q09ORklHX01FTVNUSUNLX1JFQUxURUtfVVNCIGlzIG5vdCBzZXQKQ09ORklHX05FV19MRURTPXkK
Q09ORklHX0xFRFNfQ0xBU1M9eQojIENPTkZJR19MRURTX0NMQVNTX0ZMQVNIIGlzIG5vdCBzZXQK
Q09ORklHX0xFRFNfQ0xBU1NfTVVMVElDT0xPUj1tCiMgQ09ORklHX0xFRFNfQlJJR0hUTkVTU19I
V19DSEFOR0VEIGlzIG5vdCBzZXQKCiMKIyBMRUQgZHJpdmVycwojCkNPTkZJR19MRURTX0FOMzAy
NTlBPW0KQ09ORklHX0xFRFNfQVcyMDEzPW0KQ09ORklHX0xFRFNfQkNNNjMyOD15CkNPTkZJR19M
RURTX0JDTTYzNTg9bQpDT05GSUdfTEVEU19MTTM1MzA9bQpDT05GSUdfTEVEU19MTTM1MzI9bQoj
IENPTkZJR19MRURTX0xNMzUzMyBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzY0Mj15CkNPTkZJ
R19MRURTX0xNMzY5Mlg9eQpDT05GSUdfTEVEU19NVDYzMjM9bQojIENPTkZJR19MRURTX1BDQTk1
MzIgaXMgbm90IHNldApDT05GSUdfTEVEU19HUElPPW0KQ09ORklHX0xFRFNfTFAzOTQ0PXkKQ09O
RklHX0xFRFNfTFAzOTUyPW0KQ09ORklHX0xFRFNfTFA1MFhYPW0KQ09ORklHX0xFRFNfTFA1NVhY
X0NPTU1PTj1tCkNPTkZJR19MRURTX0xQNTUyMT1tCkNPTkZJR19MRURTX0xQNTUyMz1tCkNPTkZJ
R19MRURTX0xQNTU2Mj1tCkNPTkZJR19MRURTX0xQODUwMT1tCiMgQ09ORklHX0xFRFNfTFA4Nzg4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MUDg4NjAgaXMgbm90IHNldApDT05GSUdfTEVEU19Q
Q0E5NTVYPXkKIyBDT05GSUdfTEVEU19QQ0E5NTVYX0dQSU8gaXMgbm90IHNldApDT05GSUdfTEVE
U19QQ0E5NjNYPXkKQ09ORklHX0xFRFNfV004MzUwPW0KIyBDT05GSUdfTEVEU19EQTkwNTIgaXMg
bm90IHNldApDT05GSUdfTEVEU19QV009eQpDT05GSUdfTEVEU19SRUdVTEFUT1I9eQojIENPTkZJ
R19MRURTX0JEMjgwMiBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xUMzU5Mz15CiMgQ09ORklHX0xF
RFNfTUMxMzc4MyBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVENBNjUwNyBpcyBub3Qgc2V0CkNP
TkZJR19MRURTX1RMQzU5MVhYPXkKQ09ORklHX0xFRFNfTUFYNzc2NTA9eQpDT05GSUdfTEVEU19M
TTM1NXg9eQojIENPTkZJR19MRURTX0lTMzFGTDMxOVggaXMgbm90IHNldApDT05GSUdfTEVEU19J
UzMxRkwzMlhYPXkKCiMKIyBMRUQgZHJpdmVyIGZvciBibGluaygxKSBVU0IgUkdCIExFRCBpcyB1
bmRlciBTcGVjaWFsIEhJRCBkcml2ZXJzIChISURfVEhJTkdNKQojCkNPTkZJR19MRURTX0JMSU5L
TT15CiMgQ09ORklHX0xFRFNfU1lTQ09OIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfTUxYUkVHPW0K
Q09ORklHX0xFRFNfVVNFUj1tCiMgQ09ORklHX0xFRFNfTklDNzhCWCBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfVElfTE1VX0NPTU1PTiBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RQUzYxMDVYPW0K
Q09ORklHX0xFRFNfTEdNPW0KCiMKIyBGbGFzaCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoKIwoj
IFJHQiBMRUQgZHJpdmVycwojCkNPTkZJR19MRURTX1BXTV9NVUxUSUNPTE9SPW0KQ09ORklHX0xF
RFNfUUNPTV9MUEc9bQoKIwojIExFRCBUcmlnZ2VycwojCkNPTkZJR19MRURTX1RSSUdHRVJTPXkK
Q09ORklHX0xFRFNfVFJJR0dFUl9USU1FUj15CkNPTkZJR19MRURTX1RSSUdHRVJfT05FU0hPVD15
CkNPTkZJR19MRURTX1RSSUdHRVJfTVREPXkKQ09ORklHX0xFRFNfVFJJR0dFUl9IRUFSVEJFQVQ9
eQpDT05GSUdfTEVEU19UUklHR0VSX0JBQ0tMSUdIVD1tCkNPTkZJR19MRURTX1RSSUdHRVJfQ1BV
PXkKQ09ORklHX0xFRFNfVFJJR0dFUl9BQ1RJVklUWT15CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9H
UElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT04gaXMgbm90IHNl
dAoKIwojIGlwdGFibGVzIHRyaWdnZXIgaXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVEIHRh
cmdldCkKIwpDT05GSUdfTEVEU19UUklHR0VSX1RSQU5TSUVOVD15CkNPTkZJR19MRURTX1RSSUdH
RVJfQ0FNRVJBPW0KIyBDT05GSUdfTEVEU19UUklHR0VSX1BBTklDIGlzIG5vdCBzZXQKQ09ORklH
X0xFRFNfVFJJR0dFUl9ORVRERVY9eQpDT05GSUdfTEVEU19UUklHR0VSX1BBVFRFUk49eQojIENP
TkZJR19MRURTX1RSSUdHRVJfQVVESU8gaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJf
VFRZIGlzIG5vdCBzZXQKCiMKIyBTaW1wbGUgTEVEIGRyaXZlcnMKIwpDT05GSUdfQUNDRVNTSUJJ
TElUWT15CgojCiMgU3BlYWt1cCBjb25zb2xlIHNwZWVjaAojCiMgZW5kIG9mIFNwZWFrdXAgY29u
c29sZSBzcGVlY2gKCiMgQ09ORklHX0lORklOSUJBTkQgaXMgbm90IHNldApDT05GSUdfRURBQ19B
VE9NSUNfU0NSVUI9eQpDT05GSUdfRURBQ19TVVBQT1JUPXkKQ09ORklHX0VEQUM9bQpDT05GSUdf
RURBQ19MRUdBQ1lfU1lTRlM9eQpDT05GSUdfRURBQ19ERUJVRz15CiMgQ09ORklHX0VEQUNfRTc1
MlggaXMgbm90IHNldAojIENPTkZJR19FREFDX0k4Mjk3NVggaXMgbm90IHNldAojIENPTkZJR19F
REFDX0kzMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19JMzIwMCBpcyBub3Qgc2V0CiMgQ09O
RklHX0VEQUNfSUUzMTIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfWDM4IGlzIG5vdCBzZXQK
IyBDT05GSUdfRURBQ19JNTQwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0VEQUNfSTUwMDAgaXMgbm90
IHNldAojIENPTkZJR19FREFDX0k1MTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRURBQ19JNzMwMCBp
cyBub3Qgc2V0CkNPTkZJR19SVENfTElCPXkKQ09ORklHX1JUQ19NQzE0NjgxOF9MSUI9eQpDT05G
SUdfUlRDX0NMQVNTPXkKIyBDT05GSUdfUlRDX0hDVE9TWVMgaXMgbm90IHNldAojIENPTkZJR19S
VENfU1lTVE9IQyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19SVENfTlZNRU09eQoKIwojIFJUQyBpbnRlcmZhY2VzCiMKQ09ORklHX1JUQ19JTlRGX1NZU0ZT
PXkKQ09ORklHX1JUQ19JTlRGX1BST0M9eQojIENPTkZJR19SVENfSU5URl9ERVYgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEkyQyBSVEMgZHJpdmVycwoj
CkNPTkZJR19SVENfRFJWXzg4UE04MFg9eQpDT05GSUdfUlRDX0RSVl9BQkI1WkVTMz15CiMgQ09O
RklHX1JUQ19EUlZfQUJFT1o5IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfQUJYODBYPW0KQ09O
RklHX1JUQ19EUlZfQVMzNzIyPW0KQ09ORklHX1JUQ19EUlZfRFMxMzA3PXkKIyBDT05GSUdfUlRD
X0RSVl9EUzEzMDdfQ0VOVFVSWSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTM3ND1tCiMg
Q09ORklHX1JUQ19EUlZfRFMxNjcyIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfSFlNODU2Mz1t
CiMgQ09ORklHX1JUQ19EUlZfTFA4Nzg4IGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfTUFYNjkw
MD1tCkNPTkZJR19SVENfRFJWX01BWDg5OTg9bQpDT05GSUdfUlRDX0RSVl9NQVg3NzY4Nj1tCkNP
TkZJR19SVENfRFJWX05DVDMwMThZPW0KQ09ORklHX1JUQ19EUlZfUks4MDg9eQpDT05GSUdfUlRD
X0RSVl9SUzVDMzcyPW0KQ09ORklHX1JUQ19EUlZfSVNMMTIwOD1tCiMgQ09ORklHX1JUQ19EUlZf
SVNMMTIwMjIgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9JU0wxMjAyNj1tCiMgQ09ORklHX1JU
Q19EUlZfWDEyMDUgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9QQ0Y4NTIzPXkKQ09ORklHX1JU
Q19EUlZfUENGODUwNjM9bQpDT05GSUdfUlRDX0RSVl9QQ0Y4NTM2Mz15CkNPTkZJR19SVENfRFJW
X1BDRjg1NjM9eQojIENPTkZJR19SVENfRFJWX1BDRjg1ODMgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX000MVQ4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQkQ3MDUyOCBpcyBub3Qg
c2V0CkNPTkZJR19SVENfRFJWX0JRMzJLPXkKQ09ORklHX1JUQ19EUlZfUEFMTUFTPXkKQ09ORklH
X1JUQ19EUlZfUkM1VDYxOT1tCkNPTkZJR19SVENfRFJWX1MzNTM5MEE9eQpDT05GSUdfUlRDX0RS
Vl9GTTMxMzA9bQpDT05GSUdfUlRDX0RSVl9SWDgwMTA9bQpDT05GSUdfUlRDX0RSVl9SWDg1ODE9
eQpDT05GSUdfUlRDX0RSVl9SWDgwMjU9eQpDT05GSUdfUlRDX0RSVl9FTTMwMjc9eQpDT05GSUdf
UlRDX0RSVl9SVjMwMjg9eQpDT05GSUdfUlRDX0RSVl9SVjMwMzI9eQojIENPTkZJR19SVENfRFJW
X1JWODgwMyBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX1M1TT1tCkNPTkZJR19SVENfRFJWX1NE
MzA3OD15CgojCiMgU1BJIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19JMkNfQU5EX1NQST15Cgoj
CiMgU1BJIGFuZCBJMkMgUlRDIGRyaXZlcnMKIwpDT05GSUdfUlRDX0RSVl9EUzMyMzI9eQpDT05G
SUdfUlRDX0RSVl9QQ0YyMTI3PXkKQ09ORklHX1JUQ19EUlZfUlYzMDI5QzI9bQpDT05GSUdfUlRD
X0RSVl9SWDYxMTA9eQoKIwojIFBsYXRmb3JtIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RS
Vl9DTU9TIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfRFMxMjg2PW0KQ09ORklHX1JUQ19EUlZf
RFMxNTExPXkKQ09ORklHX1JUQ19EUlZfRFMxNTUzPXkKQ09ORklHX1JUQ19EUlZfRFMxNjg1X0ZB
TUlMWT1tCkNPTkZJR19SVENfRFJWX0RTMTY4NT15CiMgQ09ORklHX1JUQ19EUlZfRFMxNjg5IGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE3Mjg1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9EUzE3NDg1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE3ODg1IGlzIG5vdCBz
ZXQKQ09ORklHX1JUQ19EUlZfRFMxNzQyPW0KIyBDT05GSUdfUlRDX0RSVl9EUzI0MDQgaXMgbm90
IHNldApDT05GSUdfUlRDX0RSVl9EQTkwNTI9bQpDT05GSUdfUlRDX0RSVl9EQTkwNjM9eQpDT05G
SUdfUlRDX0RSVl9TVEsxN1RBOD1tCkNPTkZJR19SVENfRFJWX000OFQ4Nj15CiMgQ09ORklHX1JU
Q19EUlZfTTQ4VDM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDhUNTkgaXMgbm90IHNl
dApDT05GSUdfUlRDX0RSVl9NU002MjQyPXkKQ09ORklHX1JUQ19EUlZfQlE0ODAyPXkKIyBDT05G
SUdfUlRDX0RSVl9SUDVDMDEgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1YzMDIwIGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRDX0RSVl9XTTgzNTAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X1BDRjUwNjMzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9aWU5RTVAgaXMgbm90IHNldAoK
IwojIG9uLUNQVSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENfRFJWX0NBREVOQ0U9eQpDT05GSUdf
UlRDX0RSVl9GVFJUQzAxMD15CiMgQ09ORklHX1JUQ19EUlZfTUMxM1hYWCBpcyBub3Qgc2V0CkNP
TkZJR19SVENfRFJWX01UNjM5Nz1tCkNPTkZJR19SVENfRFJWX1I3MzAxPW0KCiMKIyBISUQgU2Vu
c29yIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19EUlZfR09MREZJU0g9eQojIENPTkZJR19ETUFE
RVZJQ0VTIGlzIG5vdCBzZXQKCiMKIyBETUFCVUYgb3B0aW9ucwojCkNPTkZJR19TWU5DX0ZJTEU9
eQojIENPTkZJR19TV19TWU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfVURNQUJVRiBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNQUJVRl9NT1ZFX05PVElGWSBpcyBub3Qgc2V0CkNPTkZJR19ETUFCVUZfREVC
VUc9eQojIENPTkZJR19ETUFCVUZfU0VMRlRFU1RTIGlzIG5vdCBzZXQKQ09ORklHX0RNQUJVRl9I
RUFQUz15CiMgQ09ORklHX0RNQUJVRl9TWVNGU19TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RN
QUJVRl9IRUFQU19TWVNURU0gaXMgbm90IHNldAojIENPTkZJR19ETUFCVUZfSEVBUFNfQ01BIGlz
IG5vdCBzZXQKIyBlbmQgb2YgRE1BQlVGIG9wdGlvbnMKCkNPTkZJR19BVVhESVNQTEFZPXkKQ09O
RklHX0NIQVJMQ0Q9eQpDT05GSUdfTElORURJU1A9eQpDT05GSUdfSEQ0NDc4MF9DT01NT049eQpD
T05GSUdfSEQ0NDc4MD15CiMgQ09ORklHX0lNR19BU0NJSV9MQ0QgaXMgbm90IHNldApDT05GSUdf
SFQxNkszMz15CiMgQ09ORklHX0xDRDJTIGlzIG5vdCBzZXQKQ09ORklHX1BBUlBPUlRfUEFORUw9
eQpDT05GSUdfUEFORUxfUEFSUE9SVD0wCkNPTkZJR19QQU5FTF9QUk9GSUxFPTUKIyBDT05GSUdf
UEFORUxfQ0hBTkdFX01FU1NBR0UgaXMgbm90IHNldAojIENPTkZJR19DSEFSTENEX0JMX09GRiBp
cyBub3Qgc2V0CiMgQ09ORklHX0NIQVJMQ0RfQkxfT04gaXMgbm90IHNldApDT05GSUdfQ0hBUkxD
RF9CTF9GTEFTSD15CiMgQ09ORklHX1BBTkVMIGlzIG5vdCBzZXQKQ09ORklHX1VJTz15CiMgQ09O
RklHX1VJT19DSUYgaXMgbm90IHNldApDT05GSUdfVUlPX1BEUlZfR0VOSVJRPXkKQ09ORklHX1VJ
T19ETUVNX0dFTklSUT1tCiMgQ09ORklHX1VJT19BRUMgaXMgbm90IHNldAojIENPTkZJR19VSU9f
U0VSQ09TMyBpcyBub3Qgc2V0CiMgQ09ORklHX1VJT19QQ0lfR0VORVJJQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1VJT19ORVRYIGlzIG5vdCBzZXQKQ09ORklHX1VJT19QUlVTUz1tCiMgQ09ORklHX1VJ
T19NRjYyNCBpcyBub3Qgc2V0CkNPTkZJR19VSU9fREZMPW0KQ09ORklHX1ZGSU89eQpDT05GSUdf
VkZJT19JT01NVV9UWVBFMT15CiMgQ09ORklHX1ZGSU9fTk9JT01NVSBpcyBub3Qgc2V0CkNPTkZJ
R19WRklPX1BDSV9NTUFQPXkKQ09ORklHX1ZGSU9fUENJX0lOVFg9eQojIENPTkZJR19WRklPX1BD
SSBpcyBub3Qgc2V0CkNPTkZJR19WRklPX01ERVY9eQpDT05GSUdfSVJRX0JZUEFTU19NQU5BR0VS
PXkKIyBDT05GSUdfVklSVF9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJT19BTkNIT1I9
eQpDT05GSUdfVklSVElPPXkKQ09ORklHX1ZJUlRJT19NRU5VPXkKIyBDT05GSUdfVklSVElPX1BD
SSBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fVkRQQT15CkNPTkZJR19WSVJUSU9fQkFMTE9PTj15
CiMgQ09ORklHX1ZJUlRJT19NRU0gaXMgbm90IHNldAojIENPTkZJR19WSVJUSU9fSU5QVVQgaXMg
bm90IHNldAojIENPTkZJR19WSVJUSU9fTU1JTyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fRE1B
X1NIQVJFRF9CVUZGRVI9eQpDT05GSUdfVkRQQT15CkNPTkZJR19WRFBBX1VTRVI9eQpDT05GSUdf
VkhPU1RfSU9UTEI9eQpDT05GSUdfVkhPU1RfUklORz1tCkNPTkZJR19WSE9TVD15CkNPTkZJR19W
SE9TVF9NRU5VPXkKQ09ORklHX1ZIT1NUX05FVD15CkNPTkZJR19WSE9TVF9WRFBBPXkKIyBDT05G
SUdfVkhPU1RfQ1JPU1NfRU5ESUFOX0xFR0FDWSBpcyBub3Qgc2V0CgojCiMgTWljcm9zb2Z0IEh5
cGVyLVYgZ3Vlc3Qgc3VwcG9ydAojCiMgQ09ORklHX0hZUEVSViBpcyBub3Qgc2V0CiMgZW5kIG9m
IE1pY3Jvc29mdCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKCiMgQ09ORklHX0dSRVlCVVMgaXMgbm90
IHNldApDT05GSUdfQ09NRURJPXkKQ09ORklHX0NPTUVESV9ERUJVRz15CkNPTkZJR19DT01FRElf
REVGQVVMVF9CVUZfU0laRV9LQj0yMDQ4CkNPTkZJR19DT01FRElfREVGQVVMVF9CVUZfTUFYU0la
RV9LQj0yMDQ4MApDT05GSUdfQ09NRURJX01JU0NfRFJJVkVSUz15CkNPTkZJR19DT01FRElfQk9O
RD15CiMgQ09ORklHX0NPTUVESV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9QQVJQT1JU
PXkKIyBDT05GSUdfQ09NRURJX0lTQV9EUklWRVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NRURJ
X1BDSV9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9VU0JfRFJJVkVSUz15CkNPTkZJ
R19DT01FRElfRFQ5ODEyPXkKIyBDT05GSUdfQ09NRURJX05JX1VTQjY1MDEgaXMgbm90IHNldApD
T05GSUdfQ09NRURJX1VTQkRVWD15CiMgQ09ORklHX0NPTUVESV9VU0JEVVhGQVNUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ09NRURJX1VTQkRVWFNJR01BIGlzIG5vdCBzZXQKQ09ORklHX0NPTUVESV9W
TUs4MFhYPW0KIyBDT05GSUdfQ09NRURJXzgyNTVfU0EgaXMgbm90IHNldApDT05GSUdfQ09NRURJ
X0tDT01FRElMSUI9eQojIENPTkZJR19DT01FRElfVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19T
VEFHSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hST01FX1BMQVRGT1JNUyBpcyBub3Qgc2V0CkNP
TkZJR19NRUxMQU5PWF9QTEFURk9STT15CiMgQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1TIGlzIG5v
dCBzZXQKQ09ORklHX1g4Nl9QTEFURk9STV9ERVZJQ0VTPXkKIyBDT05GSUdfQUNQSV9XTUkgaXMg
bm90IHNldAojIENPTkZJR19BQ0VSSERGIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNFUl9XSVJFTEVT
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9QTUMgaXMgbm90IHNldAojIENPTkZJR19BRFZfU1dC
VVRUT04gaXMgbm90IHNldAojIENPTkZJR19BUFBMRV9HTVVYIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVNVU19MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19BU1VTX1dJUkVMRVNTIGlzIG5vdCBzZXQK
IyBDT05GSUdfQVNVU19URjEwM0NfRE9DSyBpcyBub3Qgc2V0CkNPTkZJR19YODZfUExBVEZPUk1f
RFJJVkVSU19ERUxMPXkKQ09ORklHX0RDREJBUz15CiMgQ09ORklHX0RFTExfUkJVIGlzIG5vdCBz
ZXQKQ09ORklHX0RFTExfUkJUTj1tCkNPTkZJR19ERUxMX1NNQklPUz1tCiMgQ09ORklHX0RFTExf
U01CSU9TX1NNTSBpcyBub3Qgc2V0CkNPTkZJR19ERUxMX1NNTzg4MDA9bQpDT05GSUdfQU1JTE9f
UkZLSUxMPW0KIyBDT05GSUdfRlVKSVRTVV9MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19GVUpJ
VFNVX1RBQkxFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQRF9QT0NLRVRfRkFOIGlzIG5vdCBzZXQK
IyBDT05GSUdfSFBfQUNDRUwgaXMgbm90IHNldAojIENPTkZJR19XSVJFTEVTU19IT1RLRVkgaXMg
bm90IHNldAojIENPTkZJR19JQk1fUlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfSURFQVBBRF9MQVBU
T1AgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19IREFQUz1tCiMgQ09ORklHX1RISU5LUEFEX0FD
UEkgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9BVE9NSVNQMl9MRUQgaXMgbm90IHNldAojIENP
TkZJR19JTlRFTF9TQVJfSU5UMTA5MiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NLTF9JTlQz
NDcyIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfUE1DX0NPUkUgaXMgbm90IHNldAoKIwojIElu
dGVsIFNwZWVkIFNlbGVjdCBUZWNobm9sb2d5IGludGVyZmFjZSBzdXBwb3J0CiMKIyBDT05GSUdf
SU5URUxfU1BFRURfU0VMRUNUX0lOVEVSRkFDRSBpcyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIFNw
ZWVkIFNlbGVjdCBUZWNobm9sb2d5IGludGVyZmFjZSBzdXBwb3J0CgojCiMgSW50ZWwgVW5jb3Jl
IEZyZXF1ZW5jeSBDb250cm9sCiMKIyBDT05GSUdfSU5URUxfVU5DT1JFX0ZSRVFfQ09OVFJPTCBp
cyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIFVuY29yZSBGcmVxdWVuY3kgQ29udHJvbAoKIyBDT05G
SUdfSU5URUxfSElEX0VWRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVkJUTiBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOVEVMX0lOVDAwMDJfVkdQSU8gaXMgbm90IHNldAojIENPTkZJR19JTlRF
TF9PQUtUUkFJTCBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9QVU5JVF9JUEM9bQojIENPTkZJR19J
TlRFTF9SU1QgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9TTUFSVENPTk5FQ1QgaXMgbm90IHNl
dAojIENPTkZJR19JTlRFTF9WU0VDIGlzIG5vdCBzZXQKIyBDT05GSUdfTVNJX0xBUFRPUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BDRU5HSU5FU19BUFUyIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFSQ09f
UDUwX0dQSU8gaXMgbm90IHNldApDT05GSUdfU0FNU1VOR19MQVBUT1A9bQojIENPTkZJR19TQU1T
VU5HX1ExMCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPU0hJQkFfQlRfUkZLSUxMIGlzIG5vdCBzZXQK
IyBDT05GSUdfVE9TSElCQV9IQVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9DTVBDIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFOQVNPTklDX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NPTllf
TEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9QU1RBUl9MQVBUT1AgaXMgbm90IHNldApDT05G
SUdfTUxYX1BMQVRGT1JNPXkKIyBDT05GSUdfSU5URUxfSVBTIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU5URUxfU0NVX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NDVV9QTEFURk9STSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NJRU1FTlNfU0lNQVRJQ19JUEMgaXMgbm90IHNldAojIENPTkZJR19X
SU5NQVRFX0ZNMDdfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1AyU0IgaXMgbm90IHNldApDT05G
SUdfSEFWRV9DTEs9eQpDT05GSUdfSEFWRV9DTEtfUFJFUEFSRT15CkNPTkZJR19DT01NT05fQ0xL
PXkKQ09ORklHX0NPTU1PTl9DTEtfTUFYNzc2ODY9bQpDT05GSUdfQ09NTU9OX0NMS19NQVg5NDg1
PW0KIyBDT05GSUdfQ09NTU9OX0NMS19SSzgwOCBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xL
X1NJNTM0MT1tCkNPTkZJR19DT01NT05fQ0xLX1NJNTM1MT1tCiMgQ09ORklHX0NPTU1PTl9DTEtf
U0k1MTQgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19TSTU0ND1tCkNPTkZJR19DT01NT05f
Q0xLX1NJNTcwPW0KQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTcwNj15CkNPTkZJR19DT01NT05fQ0xL
X0NEQ0U5MjU9bQpDT05GSUdfQ09NTU9OX0NMS19DUzIwMDBfQ1A9eQojIENPTkZJR19DT01NT05f
Q0xLX1MyTVBTMTEgaXMgbm90IHNldApDT05GSUdfQ09NTU9OX0NMS19BWElfQ0xLR0VOPXkKQ09O
RklHX0NPTU1PTl9DTEtfTE9DSE5BR0FSPW0KQ09ORklHX0NPTU1PTl9DTEtfUEFMTUFTPXkKQ09O
RklHX0NPTU1PTl9DTEtfUFdNPXkKQ09ORklHX0NPTU1PTl9DTEtfUlM5X1BDSUU9eQojIENPTkZJ
R19DT01NT05fQ0xLX1ZDNSBpcyBub3Qgc2V0CkNPTkZJR19DT01NT05fQ0xLX0JENzE4WFg9bQoj
IENPTkZJR19DT01NT05fQ0xLX0ZJWEVEX01NSU8gaXMgbm90IHNldAojIENPTkZJR19DTEtfTEdN
X0NHVSBpcyBub3Qgc2V0CkNPTkZJR19YSUxJTlhfVkNVPW0KIyBDT05GSUdfSFdTUElOTE9DSyBp
cyBub3Qgc2V0CgojCiMgQ2xvY2sgU291cmNlIGRyaXZlcnMKIwpDT05GSUdfVElNRVJfT0Y9eQpD
T05GSUdfVElNRVJfUFJPQkU9eQpDT05GSUdfQ0xLRVZUX0k4MjUzPXkKQ09ORklHX0NMS0JMRF9J
ODI1Mz15CkNPTkZJR19NSUNST0NISVBfUElUNjRCPXkKIyBlbmQgb2YgQ2xvY2sgU291cmNlIGRy
aXZlcnMKCkNPTkZJR19NQUlMQk9YPXkKQ09ORklHX1BMQVRGT1JNX01IVT15CiMgQ09ORklHX1BD
QyBpcyBub3Qgc2V0CkNPTkZJR19BTFRFUkFfTUJPWD15CiMgQ09ORklHX01BSUxCT1hfVEVTVCBp
cyBub3Qgc2V0CkNPTkZJR19JT01NVV9JT1ZBPXkKQ09ORklHX0lPTU1VX0FQST15CkNPTkZJR19J
T01NVV9TVVBQT1JUPXkKCiMKIyBHZW5lcmljIElPTU1VIFBhZ2V0YWJsZSBTdXBwb3J0CiMKIyBl
bmQgb2YgR2VuZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAoKIyBDT05GSUdfSU9NTVVfREVC
VUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lPTU1VX0RFRkFVTFRfRE1BX1NUUklDVCBpcyBub3Qg
c2V0CkNPTkZJR19JT01NVV9ERUZBVUxUX0RNQV9MQVpZPXkKIyBDT05GSUdfSU9NTVVfREVGQVVM
VF9QQVNTVEhST1VHSCBpcyBub3Qgc2V0CkNPTkZJR19PRl9JT01NVT15CkNPTkZJR19JT01NVV9E
TUE9eQojIENPTkZJR19BTURfSU9NTVUgaXMgbm90IHNldApDT05GSUdfVklSVElPX0lPTU1VPW0K
CiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwpDT05GSUdfUkVNT1RFUFJPQz15CiMgQ09ORklHX1JF
TU9URVBST0NfQ0RFViBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlbW90ZXByb2MgZHJpdmVycwoKIwoj
IFJwbXNnIGRyaXZlcnMKIwpDT05GSUdfUlBNU0c9eQojIENPTkZJR19SUE1TR19DSEFSIGlzIG5v
dCBzZXQKQ09ORklHX1JQTVNHX0NUUkw9bQpDT05GSUdfUlBNU0dfTlM9eQpDT05GSUdfUlBNU0df
UUNPTV9HTElOSz15CkNPTkZJR19SUE1TR19RQ09NX0dMSU5LX1JQTT15CiMgQ09ORklHX1JQTVNH
X1ZJUlRJTyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJwbXNnIGRyaXZlcnMKCkNPTkZJR19TT1VORFdJ
UkU9bQoKIwojIFNvdW5kV2lyZSBEZXZpY2VzCiMKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBz
cGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQW1s
b2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQnJv
YWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNjYWxlIFFvcklRIFNvQyBkcml2ZXJzCiMK
IyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwoKIwojIGZ1aml0c3UgU29D
IGRyaXZlcnMKIwojIGVuZCBvZiBmdWppdHN1IFNvQyBkcml2ZXJzCgojCiMgaS5NWCBTb0MgZHJp
dmVycwojCiMgZW5kIG9mIGkuTVggU29DIGRyaXZlcnMKCiMKIyBFbmFibGUgTGl0ZVggU29DIEJ1
aWxkZXIgc3BlY2lmaWMgZHJpdmVycwojCkNPTkZJR19MSVRFWD15CkNPTkZJR19MSVRFWF9TT0Nf
Q09OVFJPTExFUj15CiMgZW5kIG9mIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBk
cml2ZXJzCgojCiMgUXVhbGNvbW0gU29DIGRyaXZlcnMKIwojIGVuZCBvZiBRdWFsY29tbSBTb0Mg
ZHJpdmVycwoKIyBDT05GSUdfU09DX1RJIGlzIG5vdCBzZXQKCiMKIyBYaWxpbnggU29DIGRyaXZl
cnMKIwojIGVuZCBvZiBYaWxpbnggU29DIGRyaXZlcnMKIyBlbmQgb2YgU09DIChTeXN0ZW0gT24g
Q2hpcCkgc3BlY2lmaWMgRHJpdmVycwoKQ09ORklHX1BNX0RFVkZSRVE9eQoKIwojIERFVkZSRVEg
R292ZXJub3JzCiMKQ09ORklHX0RFVkZSRVFfR09WX1NJTVBMRV9PTkRFTUFORD15CkNPTkZJR19E
RVZGUkVRX0dPVl9QRVJGT1JNQU5DRT1tCiMgQ09ORklHX0RFVkZSRVFfR09WX1BPV0VSU0FWRSBp
cyBub3Qgc2V0CkNPTkZJR19ERVZGUkVRX0dPVl9VU0VSU1BBQ0U9eQojIENPTkZJR19ERVZGUkVR
X0dPVl9QQVNTSVZFIGlzIG5vdCBzZXQKCiMKIyBERVZGUkVRIERyaXZlcnMKIwojIENPTkZJR19Q
TV9ERVZGUkVRX0VWRU5UIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTj15CgojCiMgRXh0Y29uIERl
dmljZSBEcml2ZXJzCiMKIyBDT05GSUdfRVhUQ09OX0ZTQTk0ODAgaXMgbm90IHNldApDT05GSUdf
RVhUQ09OX0dQSU89bQojIENPTkZJR19FWFRDT05fSU5URUxfSU5UMzQ5NiBpcyBub3Qgc2V0CkNP
TkZJR19FWFRDT05fTUFYMTQ1Nzc9bQpDT05GSUdfRVhUQ09OX01BWDMzNTU9eQpDT05GSUdfRVhU
Q09OX1BBTE1BUz15CkNPTkZJR19FWFRDT05fUFRONTE1MD1tCiMgQ09ORklHX0VYVENPTl9SVDg5
NzNBIGlzIG5vdCBzZXQKQ09ORklHX0VYVENPTl9TTTU1MDI9eQpDT05GSUdfRVhUQ09OX1VTQl9H
UElPPW0KIyBDT05GSUdfRVhUQ09OX1VTQkNfVFVTQjMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01F
TU9SWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05UQiBpcyBu
b3Qgc2V0CkNPTkZJR19QV009eQpDT05GSUdfUFdNX1NZU0ZTPXkKIyBDT05GSUdfUFdNX0RFQlVH
IGlzIG5vdCBzZXQKQ09ORklHX1BXTV9BVE1FTF9UQ0I9eQpDT05GSUdfUFdNX0NMSz15CiMgQ09O
RklHX1BXTV9EV0MgaXMgbm90IHNldApDT05GSUdfUFdNX0ZTTF9GVE09eQojIENPTkZJR19QV01f
SU5URUxfTEdNIGlzIG5vdCBzZXQKQ09ORklHX1BXTV9JUVM2MjBBPW0KQ09ORklHX1BXTV9MUDM5
NDM9eQojIENPTkZJR19QV01fTFBTU19QQ0kgaXMgbm90IHNldAojIENPTkZJR19QV01fTFBTU19Q
TEFURk9STSBpcyBub3Qgc2V0CkNPTkZJR19QV01fUENBOTY4NT15CiMgQ09ORklHX1BXTV9YSUxJ
TlggaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwpDT05GSUdfSVJRQ0hJUD15CkNP
TkZJR19BTF9GSUM9eQojIENPTkZJR19YSUxJTlhfSU5UQyBpcyBub3Qgc2V0CiMgZW5kIG9mIElS
USBjaGlwIHN1cHBvcnQKCkNPTkZJR19JUEFDS19CVVM9bQojIENPTkZJR19CT0FSRF9UUENJMjAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0lQT0NUQUwgaXMgbm90IHNldApDT05GSUdfUkVT
RVRfQ09OVFJPTExFUj15CiMgQ09ORklHX1JFU0VUX0lOVEVMX0dXIGlzIG5vdCBzZXQKQ09ORklH
X1JFU0VUX1NJTVBMRT15CiMgQ09ORklHX1JFU0VUX1RJX1NZU0NPTiBpcyBub3Qgc2V0CkNPTkZJ
R19SRVNFVF9USV9UUFMzODBYPW0KCiMKIyBQSFkgU3Vic3lzdGVtCiMKQ09ORklHX0dFTkVSSUNf
UEhZPXkKQ09ORklHX0dFTkVSSUNfUEhZX01JUElfRFBIWT15CkNPTkZJR19VU0JfTEdNX1BIWT15
CkNPTkZJR19QSFlfQ0FOX1RSQU5TQ0VJVkVSPXkKCiMKIyBQSFkgZHJpdmVycyBmb3IgQnJvYWRj
b20gcGxhdGZvcm1zCiMKIyBDT05GSUdfQkNNX0tPTkFfVVNCMl9QSFkgaXMgbm90IHNldAojIGVu
ZCBvZiBQSFkgZHJpdmVycyBmb3IgQnJvYWRjb20gcGxhdGZvcm1zCgpDT05GSUdfUEhZX0NBREVO
Q0VfVE9SUkVOVD15CkNPTkZJR19QSFlfQ0FERU5DRV9EUEhZPXkKQ09ORklHX1BIWV9DQURFTkNF
X0RQSFlfUlg9eQojIENPTkZJR19QSFlfQ0FERU5DRV9TSUVSUkEgaXMgbm90IHNldApDT05GSUdf
UEhZX0NBREVOQ0VfU0FMVk89eQojIENPTkZJR19QSFlfUFhBXzI4Tk1fSFNJQyBpcyBub3Qgc2V0
CkNPTkZJR19QSFlfUFhBXzI4Tk1fVVNCMj1tCkNPTkZJR19QSFlfTEFOOTY2WF9TRVJERVM9bQpD
T05GSUdfUEhZX01BUFBIT05FX01ETTY2MDA9eQpDT05GSUdfUEhZX09DRUxPVF9TRVJERVM9bQpD
T05GSUdfUEhZX1FDT01fVVNCX0hTPW0KQ09ORklHX1BIWV9RQ09NX1VTQl9IU0lDPW0KQ09ORklH
X1BIWV9TQU1TVU5HX1VTQjI9eQpDT05GSUdfUEhZX1RVU0IxMjEwPW0KIyBDT05GSUdfUEhZX0lO
VEVMX0xHTV9DT01CTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9JTlRFTF9MR01fRU1NQyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIFBIWSBTdWJzeXN0ZW0KCkNPTkZJR19QT1dFUkNBUD15CiMgQ09ORklH
X0lETEVfSU5KRUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfRFRQTSBpcyBub3Qgc2V0CiMgQ09ORklH
X01DQiBpcyBub3Qgc2V0CgojCiMgUGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CiMKIyBlbmQg
b2YgUGVyZm9ybWFuY2UgbW9uaXRvciBzdXBwb3J0CgpDT05GSUdfUkFTPXkKIyBDT05GSUdfVVNC
NCBpcyBub3Qgc2V0CgojCiMgQW5kcm9pZAojCiMgQ09ORklHX0FORFJPSURfQklOREVSX0lQQyBp
cyBub3Qgc2V0CiMgZW5kIG9mIEFuZHJvaWQKCiMgQ09ORklHX0RBWCBpcyBub3Qgc2V0CkNPTkZJ
R19OVk1FTT15CkNPTkZJR19OVk1FTV9TWVNGUz15CiMgQ09ORklHX05WTUVNX1NQTUlfU0RBTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1JBVkVfU1BfRUVQUk9NIGlzIG5vdCBzZXQKIyBDT05GSUdfTlZN
RU1fUk1FTSBpcyBub3Qgc2V0CgojCiMgSFcgdHJhY2luZyBzdXBwb3J0CiMKIyBDT05GSUdfU1RN
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVEggaXMgbm90IHNldAojIGVuZCBvZiBIVyB0cmFj
aW5nIHN1cHBvcnQKCkNPTkZJR19GUEdBPXkKQ09ORklHX0FMVEVSQV9QUl9JUF9DT1JFPXkKQ09O
RklHX0FMVEVSQV9QUl9JUF9DT1JFX1BMQVQ9eQojIENPTkZJR19GUEdBX01HUl9BTFRFUkFfQ1ZQ
IGlzIG5vdCBzZXQKQ09ORklHX0ZQR0FfQlJJREdFPXkKQ09ORklHX0FMVEVSQV9GUkVFWkVfQlJJ
REdFPW0KQ09ORklHX1hJTElOWF9QUl9ERUNPVVBMRVI9eQpDT05GSUdfRlBHQV9SRUdJT049eQpD
T05GSUdfT0ZfRlBHQV9SRUdJT049eQpDT05GSUdfRlBHQV9ERkw9eQpDT05GSUdfRlBHQV9ERkxf
QUZVPW0KQ09ORklHX0ZQR0FfREZMX05JT1NfSU5URUxfUEFDX04zMDAwPXkKIyBDT05GSUdfRlBH
QV9ERkxfUENJIGlzIG5vdCBzZXQKQ09ORklHX0ZTST15CiMgQ09ORklHX0ZTSV9ORVdfREVWX05P
REUgaXMgbm90IHNldAojIENPTkZJR19GU0lfTUFTVEVSX0dQSU8gaXMgbm90IHNldAojIENPTkZJ
R19GU0lfTUFTVEVSX0hVQiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTSV9NQVNURVJfQVNQRUVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfRlNJX1NDT00gaXMgbm90IHNldApDT05GSUdfRlNJX1NCRUZJRk89
eQpDT05GSUdfRlNJX09DQz1tCkNPTkZJR19NVUxUSVBMRVhFUj15CgojCiMgTXVsdGlwbGV4ZXIg
ZHJpdmVycwojCiMgQ09ORklHX01VWF9BREc3OTJBIGlzIG5vdCBzZXQKQ09ORklHX01VWF9HUElP
PW0KQ09ORklHX01VWF9NTUlPPXkKIyBlbmQgb2YgTXVsdGlwbGV4ZXIgZHJpdmVycwoKQ09ORklH
X1BNX09QUD15CiMgQ09ORklHX1NJT1ggaXMgbm90IHNldApDT05GSUdfU0xJTUJVUz1tCiMgQ09O
RklHX1NMSU1fUUNPTV9DVFJMIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVSQ09OTkVDVD15CkNPTkZJ
R19DT1VOVEVSPW0KQ09ORklHX0lOVEVSUlVQVF9DTlQ9bQojIENPTkZJR19GVE1fUVVBRERFQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01JQ1JPQ0hJUF9UQ0JfQ0FQVFVSRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOVEVMX1FFUCBpcyBub3Qgc2V0CkNPTkZJR19NT1NUPXkKQ09ORklHX01PU1RfVVNCX0hE
TT15CiMgQ09ORklHX01PU1RfQ0RFViBpcyBub3Qgc2V0CiMgQ09ORklHX1BFQ0kgaXMgbm90IHNl
dApDT05GSUdfSFRFPXkKIyBlbmQgb2YgRGV2aWNlIERyaXZlcnMKCiMKIyBGaWxlIHN5c3RlbXMK
IwpDT05GSUdfRENBQ0hFX1dPUkRfQUNDRVNTPXkKQ09ORklHX1ZBTElEQVRFX0ZTX1BBUlNFUj15
CkNPTkZJR19GU19QT1NJWF9BQ0w9eQpDT05GSUdfRVhQT1JURlM9eQpDT05GSUdfRVhQT1JURlNf
QkxPQ0tfT1BTPXkKQ09ORklHX0ZJTEVfTE9DS0lORz15CiMgQ09ORklHX0ZTX0VOQ1JZUFRJT04g
aXMgbm90IHNldApDT05GSUdfRlNfVkVSSVRZPXkKIyBDT05GSUdfRlNfVkVSSVRZX0RFQlVHIGlz
IG5vdCBzZXQKQ09ORklHX0ZTX1ZFUklUWV9CVUlMVElOX1NJR05BVFVSRVM9eQpDT05GSUdfRlNO
T1RJRlk9eQojIENPTkZJR19ETk9USUZZIGlzIG5vdCBzZXQKQ09ORklHX0lOT1RJRllfVVNFUj15
CkNPTkZJR19GQU5PVElGWT15CkNPTkZJR19GQU5PVElGWV9BQ0NFU1NfUEVSTUlTU0lPTlM9eQoj
IENPTkZJR19RVU9UQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FVVE9GUzRfRlMgaXMgbm90IHNldAoj
IENPTkZJR19BVVRPRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19GVVNFX0ZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfT1ZFUkxBWV9GUyBpcyBub3Qgc2V0CgojCiMgQ2FjaGVzCiMKQ09ORklHX05FVEZT
X1NVUFBPUlQ9eQojIENPTkZJR19ORVRGU19TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19GU0NBQ0hF
PXkKIyBDT05GSUdfRlNDQUNIRV9TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19GU0NBQ0hFX0RFQlVH
PXkKIyBlbmQgb2YgQ2FjaGVzCgojCiMgUHNldWRvIGZpbGVzeXN0ZW1zCiMKQ09ORklHX1BST0Nf
RlM9eQojIENPTkZJR19QUk9DX0tDT1JFIGlzIG5vdCBzZXQKQ09ORklHX1BST0NfVk1DT1JFPXkK
IyBDT05GSUdfUFJPQ19WTUNPUkVfREVWSUNFX0RVTVAgaXMgbm90IHNldApDT05GSUdfUFJPQ19T
WVNDVEw9eQpDT05GSUdfUFJPQ19QQUdFX01PTklUT1I9eQojIENPTkZJR19QUk9DX0NISUxEUkVO
IGlzIG5vdCBzZXQKQ09ORklHX1BST0NfUElEX0FSQ0hfU1RBVFVTPXkKQ09ORklHX0tFUk5GUz15
CkNPTkZJR19TWVNGUz15CkNPTkZJR19UTVBGUz15CkNPTkZJR19UTVBGU19QT1NJWF9BQ0w9eQpD
T05GSUdfVE1QRlNfWEFUVFI9eQojIENPTkZJR19UTVBGU19JTk9ERTY0IGlzIG5vdCBzZXQKQ09O
RklHX0hVR0VUTEJGUz15CkNPTkZJR19IVUdFVExCX1BBR0U9eQpDT05GSUdfQVJDSF9XQU5UX0hV
R0VUTEJfUEFHRV9PUFRJTUlaRV9WTUVNTUFQPXkKQ09ORklHX0hVR0VUTEJfUEFHRV9PUFRJTUla
RV9WTUVNTUFQPXkKIyBDT05GSUdfSFVHRVRMQl9QQUdFX09QVElNSVpFX1ZNRU1NQVBfREVGQVVM
VF9PTiBpcyBub3Qgc2V0CkNPTkZJR19NRU1GRF9DUkVBVEU9eQpDT05GSUdfQVJDSF9IQVNfR0lH
QU5USUNfUEFHRT15CkNPTkZJR19DT05GSUdGU19GUz15CiMgZW5kIG9mIFBzZXVkbyBmaWxlc3lz
dGVtcwoKQ09ORklHX01JU0NfRklMRVNZU1RFTVM9eQpDT05GSUdfT1JBTkdFRlNfRlM9eQojIENP
TkZJR19FQ1JZUFRfRlMgaXMgbm90IHNldApDT05GSUdfSkZGUzJfRlM9eQpDT05GSUdfSkZGUzJf
RlNfREVCVUc9MApDT05GSUdfSkZGUzJfRlNfV1JJVEVCVUZGRVI9eQpDT05GSUdfSkZGUzJfRlNf
V0JVRl9WRVJJRlk9eQojIENPTkZJR19KRkZTMl9TVU1NQVJZIGlzIG5vdCBzZXQKIyBDT05GSUdf
SkZGUzJfRlNfWEFUVFIgaXMgbm90IHNldAojIENPTkZJR19KRkZTMl9DT01QUkVTU0lPTl9PUFRJ
T05TIGlzIG5vdCBzZXQKQ09ORklHX0pGRlMyX1pMSUI9eQpDT05GSUdfSkZGUzJfUlRJTUU9eQpD
T05GSUdfVUJJRlNfRlM9bQpDT05GSUdfVUJJRlNfRlNfQURWQU5DRURfQ09NUFI9eQpDT05GSUdf
VUJJRlNfRlNfTFpPPXkKQ09ORklHX1VCSUZTX0ZTX1pMSUI9eQojIENPTkZJR19VQklGU19GU19a
U1REIGlzIG5vdCBzZXQKIyBDT05GSUdfVUJJRlNfQVRJTUVfU1VQUE9SVCBpcyBub3Qgc2V0CkNP
TkZJR19VQklGU19GU19YQVRUUj15CkNPTkZJR19VQklGU19GU19TRUNVUklUWT15CiMgQ09ORklH
X1VCSUZTX0ZTX0FVVEhFTlRJQ0FUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JBTUZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfUk9NRlNfRlMgaXMgbm90IHNldApDT05GSUdfUFNUT1JFPXkKQ09ORklH
X1BTVE9SRV9ERUZBVUxUX0tNU0dfQllURVM9MTAyNDAKIyBDT05GSUdfUFNUT1JFX0RFRkxBVEVf
Q09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19QU1RPUkVfTFpPX0NPTVBSRVNTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUFNUT1JFX0xaNF9DT01QUkVTUyBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVf
TFo0SENfQ09NUFJFU1M9bQpDT05GSUdfUFNUT1JFXzg0Ml9DT01QUkVTUz15CiMgQ09ORklHX1BT
VE9SRV9aU1REX0NPTVBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX1BTVE9SRV9DT01QUkVTUz15CkNP
TkZJR19QU1RPUkVfTFo0SENfQ09NUFJFU1NfREVGQVVMVD15CiMgQ09ORklHX1BTVE9SRV84NDJf
Q09NUFJFU1NfREVGQVVMVCBpcyBub3Qgc2V0CkNPTkZJR19QU1RPUkVfQ09NUFJFU1NfREVGQVVM
VD0ibHo0aGMiCiMgQ09ORklHX1BTVE9SRV9DT05TT0xFIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNU
T1JFX1BNU0cgaXMgbm90IHNldAojIENPTkZJR19QU1RPUkVfRlRSQUNFIGlzIG5vdCBzZXQKIyBD
T05GSUdfUFNUT1JFX1JBTSBpcyBub3Qgc2V0CkNPTkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkK
Q09ORklHX05GU19GUz15CkNPTkZJR19ORlNfVjI9eQpDT05GSUdfTkZTX1YzPXkKIyBDT05GSUdf
TkZTX1YzX0FDTCBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjQ9bQojIENPTkZJR19ORlNfVjRfMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1JPT1RfTkZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZTX0ZTQ0FD
SEUgaXMgbm90IHNldAojIENPTkZJR19ORlNfVVNFX0xFR0FDWV9ETlMgaXMgbm90IHNldApDT05G
SUdfTkZTX1VTRV9LRVJORUxfRE5TPXkKQ09ORklHX05GU19ESVNBQkxFX1VEUF9TVVBQT1JUPXkK
IyBDT05GSUdfTkZTRCBpcyBub3Qgc2V0CkNPTkZJR19HUkFDRV9QRVJJT0Q9eQpDT05GSUdfTE9D
S0Q9eQpDT05GSUdfTE9DS0RfVjQ9eQpDT05GSUdfTkZTX0NPTU1PTj15CkNPTkZJR19TVU5SUEM9
eQpDT05GSUdfU1VOUlBDX0dTUz1tCiMgQ09ORklHX1NVTlJQQ19ERUJVRyBpcyBub3Qgc2V0CiMg
Q09ORklHX0NFUEhfRlMgaXMgbm90IHNldApDT05GSUdfQ0lGUz1tCkNPTkZJR19DSUZTX1NUQVRT
Mj15CkNPTkZJR19DSUZTX0FMTE9XX0lOU0VDVVJFX0xFR0FDWT15CiMgQ09ORklHX0NJRlNfVVBD
QUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0lGU19YQVRUUiBpcyBub3Qgc2V0CkNPTkZJR19DSUZT
X0RFQlVHPXkKIyBDT05GSUdfQ0lGU19ERUJVRzIgaXMgbm90IHNldAojIENPTkZJR19DSUZTX0RF
QlVHX0RVTVBfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlNfREZTX1VQQ0FMTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NJRlNfU1dOX1VQQ0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlNfRlND
QUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NNQl9TRVJWRVIgaXMgbm90IHNldApDT05GSUdfU01C
RlNfQ09NTU9OPW0KIyBDT05GSUdfQ09EQV9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGU19GUyBp
cyBub3Qgc2V0CiMgQ09ORklHXzlQX0ZTIGlzIG5vdCBzZXQKQ09ORklHX05MUz15CkNPTkZJR19O
TFNfREVGQVVMVD0iaXNvODg1OS0xIgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15CkNPTkZJR19O
TFNfQ09ERVBBR0VfNzM3PW0KQ09ORklHX05MU19DT0RFUEFHRV83NzU9eQpDT05GSUdfTkxTX0NP
REVQQUdFXzg1MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODUyPW0KIyBDT05GSUdfTkxTX0NPREVQ
QUdFXzg1NSBpcyBub3Qgc2V0CkNPTkZJR19OTFNfQ09ERVBBR0VfODU3PXkKIyBDT05GSUdfTkxT
X0NPREVQQUdFXzg2MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjEgaXMgbm90
IHNldApDT05GSUdfTkxTX0NPREVQQUdFXzg2Mj1tCiMgQ09ORklHX05MU19DT0RFUEFHRV84NjMg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY0IGlzIG5vdCBzZXQKQ09ORklHX05M
U19DT0RFUEFHRV84NjU9bQojIENPTkZJR19OTFNfQ09ERVBBR0VfODY2IGlzIG5vdCBzZXQKQ09O
RklHX05MU19DT0RFUEFHRV84Njk9eQpDT05GSUdfTkxTX0NPREVQQUdFXzkzNj15CkNPTkZJR19O
TFNfQ09ERVBBR0VfOTUwPW0KQ09ORklHX05MU19DT0RFUEFHRV85MzI9eQpDT05GSUdfTkxTX0NP
REVQQUdFXzk0OT1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODc0PW0KQ09ORklHX05MU19JU084ODU5
Xzg9eQpDT05GSUdfTkxTX0NPREVQQUdFXzEyNTA9bQpDT05GSUdfTkxTX0NPREVQQUdFXzEyNTE9
eQpDT05GSUdfTkxTX0FTQ0lJPXkKIyBDT05GSUdfTkxTX0lTTzg4NTlfMSBpcyBub3Qgc2V0CkNP
TkZJR19OTFNfSVNPODg1OV8yPXkKQ09ORklHX05MU19JU084ODU5XzM9bQojIENPTkZJR19OTFNf
SVNPODg1OV80IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNSBpcyBub3Qgc2V0CkNP
TkZJR19OTFNfSVNPODg1OV82PXkKQ09ORklHX05MU19JU084ODU5Xzc9bQpDT05GSUdfTkxTX0lT
Tzg4NTlfOT1tCkNPTkZJR19OTFNfSVNPODg1OV8xMz1tCiMgQ09ORklHX05MU19JU084ODU5XzE0
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTUgaXMgbm90IHNldAojIENPTkZJR19O
TFNfS09JOF9SIGlzIG5vdCBzZXQKQ09ORklHX05MU19LT0k4X1U9bQpDT05GSUdfTkxTX01BQ19S
T01BTj1tCkNPTkZJR19OTFNfTUFDX0NFTFRJQz15CkNPTkZJR19OTFNfTUFDX0NFTlRFVVJPPXkK
Q09ORklHX05MU19NQUNfQ1JPQVRJQU49eQpDT05GSUdfTkxTX01BQ19DWVJJTExJQz15CkNPTkZJ
R19OTFNfTUFDX0dBRUxJQz15CkNPTkZJR19OTFNfTUFDX0dSRUVLPW0KQ09ORklHX05MU19NQUNf
SUNFTEFORD1tCkNPTkZJR19OTFNfTUFDX0lOVUlUPXkKIyBDT05GSUdfTkxTX01BQ19ST01BTklB
TiBpcyBub3Qgc2V0CkNPTkZJR19OTFNfTUFDX1RVUktJU0g9eQpDT05GSUdfTkxTX1VURjg9bQoj
IENPTkZJR19ETE0gaXMgbm90IHNldAojIENPTkZJR19VTklDT0RFIGlzIG5vdCBzZXQKIyBlbmQg
b2YgRmlsZSBzeXN0ZW1zCgojCiMgU2VjdXJpdHkgb3B0aW9ucwojCkNPTkZJR19LRVlTPXkKIyBD
T05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFIGlzIG5vdCBzZXQKQ09ORklHX1BFUlNJU1RFTlRfS0VZ
UklOR1M9eQojIENPTkZJR19CSUdfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19UUlVTVEVEX0tFWVM9
bQojIENPTkZJR19UUlVTVEVEX0tFWVNfVFBNIGlzIG5vdCBzZXQKCiMKIyBObyB0cnVzdCBzb3Vy
Y2Ugc2VsZWN0ZWQhCiMKQ09ORklHX0VOQ1JZUFRFRF9LRVlTPW0KQ09ORklHX1VTRVJfREVDUllQ
VEVEX0RBVEE9eQojIENPTkZJR19LRVlfREhfT1BFUkFUSU9OUyBpcyBub3Qgc2V0CkNPTkZJR19L
RVlfTk9USUZJQ0FUSU9OUz15CkNPTkZJR19TRUNVUklUWV9ETUVTR19SRVNUUklDVD15CkNPTkZJ
R19TRUNVUklUWT15CkNPTkZJR19TRUNVUklUWUZTPXkKQ09ORklHX1NFQ1VSSVRZX05FVFdPUks9
eQpDT05GSUdfU0VDVVJJVFlfUEFUSD15CkNPTkZJR19GT1JUSUZZX1NPVVJDRT15CiMgQ09ORklH
X1NUQVRJQ19VU0VSTU9ERUhFTFBFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1NFTElO
VVggaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFQ1VSSVRZX1RPTU9ZTyBpcyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWV9BUFBBUk1PUj15CkNP
TkZJR19TRUNVUklUWV9BUFBBUk1PUl9ERUJVRz15CiMgQ09ORklHX1NFQ1VSSVRZX0FQUEFSTU9S
X0RFQlVHX0FTU0VSVFMgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFlfQVBQQVJNT1JfREVCVUdf
TUVTU0FHRVM9eQojIENPTkZJR19TRUNVUklUWV9BUFBBUk1PUl9JTlRST1NQRUNUX1BPTElDWSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQUEFSTU9SX1BBUkFOT0lEX0xPQUQgaXMgbm90
IHNldAojIENPTkZJR19TRUNVUklUWV9ZQU1BIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlf
U0FGRVNFVElEIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VSSVRZX0xPQ0tET1dOX0xTTT15CiMgQ09O
RklHX1NFQ1VSSVRZX0xPQ0tET1dOX0xTTV9FQVJMWSBpcyBub3Qgc2V0CkNPTkZJR19MT0NLX0RP
V05fS0VSTkVMX0ZPUkNFX05PTkU9eQojIENPTkZJR19MT0NLX0RPV05fS0VSTkVMX0ZPUkNFX0lO
VEVHUklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfRE9XTl9LRVJORUxfRk9SQ0VfQ09ORklE
RU5USUFMSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfTEFORExPQ0sgaXMgbm90IHNl
dApDT05GSUdfSU5URUdSSVRZPXkKIyBDT05GSUdfSU5URUdSSVRZX1NJR05BVFVSRSBpcyBub3Qg
c2V0CkNPTkZJR19JTlRFR1JJVFlfQVVESVQ9eQpDT05GSUdfSU1BPXkKQ09ORklHX0lNQV9NRUFT
VVJFX1BDUl9JRFg9MTAKQ09ORklHX0lNQV9MU01fUlVMRVM9eQojIENPTkZJR19JTUFfTkdfVEVN
UExBVEUgaXMgbm90IHNldApDT05GSUdfSU1BX1NJR19URU1QTEFURT15CkNPTkZJR19JTUFfREVG
QVVMVF9URU1QTEFURT0iaW1hLXNpZyIKIyBDT05GSUdfSU1BX0RFRkFVTFRfSEFTSF9TSEExIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU1BX0RFRkFVTFRfSEFTSF9TSEEyNTYgaXMgbm90IHNldAojIENP
TkZJR19JTUFfREVGQVVMVF9IQVNIX1NIQTUxMiBpcyBub3Qgc2V0CkNPTkZJR19JTUFfREVGQVVM
VF9IQVNIX1NNMz15CkNPTkZJR19JTUFfREVGQVVMVF9IQVNIPSJzbTMiCiMgQ09ORklHX0lNQV9X
UklURV9QT0xJQ1kgaXMgbm90IHNldApDT05GSUdfSU1BX1JFQURfUE9MSUNZPXkKIyBDT05GSUdf
SU1BX0FQUFJBSVNFIGlzIG5vdCBzZXQKQ09ORklHX0lNQV9NRUFTVVJFX0FTWU1NRVRSSUNfS0VZ
Uz15CkNPTkZJR19JTUFfUVVFVUVfRUFSTFlfQk9PVF9LRVlTPXkKQ09ORklHX0lNQV9ESVNBQkxF
X0hUQUJMRT15CiMgQ09ORklHX0VWTSBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1NFQ1VSSVRZ
X0FQUEFSTU9SPXkKIyBDT05GSUdfREVGQVVMVF9TRUNVUklUWV9EQUMgaXMgbm90IHNldApDT05G
SUdfTFNNPSJsYW5kbG9jayxsb2NrZG93bix5YW1hLGxvYWRwaW4sc2FmZXNldGlkLGludGVncml0
eSx0b21veW8sYnBmIgoKIwojIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwojCgojCiMgTWVtb3J5
IGluaXRpYWxpemF0aW9uCiMKQ09ORklHX0lOSVRfU1RBQ0tfTk9ORT15CiMgQ09ORklHX0lOSVRf
T05fQUxMT0NfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZB
VUxUX09OIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19aRVJPX0NBTExfVVNFRF9SRUdTPXkKQ09O
RklHX1pFUk9fQ0FMTF9VU0VEX1JFR1M9eQojIGVuZCBvZiBNZW1vcnkgaW5pdGlhbGl6YXRpb24K
CkNPTkZJR19SQU5EU1RSVUNUX05PTkU9eQojIGVuZCBvZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlv
bnMKIyBlbmQgb2YgU2VjdXJpdHkgb3B0aW9ucwoKQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRv
IGNvcmUgb3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FM
R0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklH
X0NSWVBUT19TS0NJUEhFUj15CkNPTkZJR19DUllQVE9fU0tDSVBIRVIyPXkKQ09ORklHX0NSWVBU
T19IQVNIPXkKQ09ORklHX0NSWVBUT19IQVNIMj15CkNPTkZJR19DUllQVE9fUk5HPXkKQ09ORklH
X0NSWVBUT19STkcyPXkKQ09ORklHX0NSWVBUT19STkdfREVGQVVMVD15CkNPTkZJR19DUllQVE9f
QUtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUj15CkNPTkZJR19DUllQVE9fS1BQMj15
CkNPTkZJR19DUllQVE9fS1BQPW0KQ09ORklHX0NSWVBUT19BQ09NUDI9eQpDT05GSUdfQ1JZUFRP
X01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVIyPXkKQ09ORklHX0NSWVBUT19VU0VSPXkK
Q09ORklHX0NSWVBUT19NQU5BR0VSX0RJU0FCTEVfVEVTVFM9eQpDT05GSUdfQ1JZUFRPX0dGMTI4
TVVMPXkKQ09ORklHX0NSWVBUT19OVUxMPXkKQ09ORklHX0NSWVBUT19OVUxMMj15CiMgQ09ORklH
X0NSWVBUT19QQ1JZUFQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NSWVBURD15CkNPTkZJR19D
UllQVE9fQVVUSEVOQz1tCiMgQ09ORklHX0NSWVBUT19URVNUIGlzIG5vdCBzZXQKQ09ORklHX0NS
WVBUT19TSU1EPXkKCiMKIyBQdWJsaWMta2V5IGNyeXB0b2dyYXBoeQojCkNPTkZJR19DUllQVE9f
UlNBPXkKIyBDT05GSUdfQ1JZUFRPX0RIIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19FQ0M9eQpD
T05GSUdfQ1JZUFRPX0VDREg9bQpDT05GSUdfQ1JZUFRPX0VDRFNBPXkKIyBDT05GSUdfQ1JZUFRP
X0VDUkRTQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TTTIgaXMgbm90IHNldApDT05GSUdf
Q1JZUFRPX0NVUlZFMjU1MTk9bQpDT05GSUdfQ1JZUFRPX0NVUlZFMjU1MTlfWDg2PW0KCiMKIyBB
dXRoZW50aWNhdGVkIEVuY3J5cHRpb24gd2l0aCBBc3NvY2lhdGVkIERhdGEKIwpDT05GSUdfQ1JZ
UFRPX0NDTT15CkNPTkZJR19DUllQVE9fR0NNPXkKQ09ORklHX0NSWVBUT19DSEFDSEEyMFBPTFkx
MzA1PW0KQ09ORklHX0NSWVBUT19BRUdJUzEyOD15CkNPTkZJR19DUllQVE9fQUVHSVMxMjhfQUVT
TklfU1NFMj1tCkNPTkZJR19DUllQVE9fU0VRSVY9eQpDT05GSUdfQ1JZUFRPX0VDSEFJTklWPXkK
CiMKIyBCbG9jayBtb2RlcwojCkNPTkZJR19DUllQVE9fQ0JDPXkKQ09ORklHX0NSWVBUT19DRkI9
eQpDT05GSUdfQ1JZUFRPX0NUUj15CiMgQ09ORklHX0NSWVBUT19DVFMgaXMgbm90IHNldApDT05G
SUdfQ1JZUFRPX0VDQj15CkNPTkZJR19DUllQVE9fTFJXPXkKIyBDT05GSUdfQ1JZUFRPX09GQiBp
cyBub3Qgc2V0CkNPTkZJR19DUllQVE9fUENCQz1tCkNPTkZJR19DUllQVE9fWENUUj15CkNPTkZJ
R19DUllQVE9fWFRTPW0KQ09ORklHX0NSWVBUT19LRVlXUkFQPXkKQ09ORklHX0NSWVBUT19OSFBP
TFkxMzA1PXkKQ09ORklHX0NSWVBUT19OSFBPTFkxMzA1X1NTRTI9eQpDT05GSUdfQ1JZUFRPX05I
UE9MWTEzMDVfQVZYMj15CkNPTkZJR19DUllQVE9fQURJQU5UVU09bQpDT05GSUdfQ1JZUFRPX0hD
VFIyPXkKIyBDT05GSUdfQ1JZUFRPX0VTU0lWIGlzIG5vdCBzZXQKCiMKIyBIYXNoIG1vZGVzCiMK
Q09ORklHX0NSWVBUT19DTUFDPXkKQ09ORklHX0NSWVBUT19ITUFDPXkKIyBDT05GSUdfQ1JZUFRP
X1hDQkMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVk1BQyBpcyBub3Qgc2V0CgojCiMgRGln
ZXN0CiMKQ09ORklHX0NSWVBUT19DUkMzMkM9eQojIENPTkZJR19DUllQVE9fQ1JDMzJDX0lOVEVM
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NSQzMyIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBU
T19DUkMzMl9QQ0xNVUw9bQpDT05GSUdfQ1JZUFRPX1hYSEFTSD15CiMgQ09ORklHX0NSWVBUT19C
TEFLRTJCIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19CTEFLRTJTX1g4Nj15CkNPTkZJR19DUllQ
VE9fQ1JDVDEwRElGPXkKQ09ORklHX0NSWVBUT19DUkM2NF9ST0NLU09GVD15CkNPTkZJR19DUllQ
VE9fR0hBU0g9eQpDT05GSUdfQ1JZUFRPX1BPTFlWQUw9eQojIENPTkZJR19DUllQVE9fUE9MWVZB
TF9DTE1VTF9OSSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fUE9MWTEzMDU9bQojIENPTkZJR19D
UllQVE9fUE9MWTEzMDVfWDg2XzY0IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19NRDQ9bQpDT05G
SUdfQ1JZUFRPX01ENT15CkNPTkZJR19DUllQVE9fTUlDSEFFTF9NSUM9eQpDT05GSUdfQ1JZUFRP
X1JNRDE2MD1tCkNPTkZJR19DUllQVE9fU0hBMT15CkNPTkZJR19DUllQVE9fU0hBMV9TU1NFMz15
CiMgQ09ORklHX0NSWVBUT19TSEEyNTZfU1NTRTMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NI
QTUxMl9TU1NFMz15CkNPTkZJR19DUllQVE9fU0hBMjU2PXkKQ09ORklHX0NSWVBUT19TSEE1MTI9
eQpDT05GSUdfQ1JZUFRPX1NIQTM9bQpDT05GSUdfQ1JZUFRPX1NNMz15CkNPTkZJR19DUllQVE9f
U00zX0dFTkVSSUM9bQpDT05GSUdfQ1JZUFRPX1NNM19BVlhfWDg2XzY0PXkKIyBDT05GSUdfQ1JZ
UFRPX1NUUkVFQk9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1dQNTEyIGlzIG5vdCBzZXQK
Q09ORklHX0NSWVBUT19HSEFTSF9DTE1VTF9OSV9JTlRFTD1tCgojCiMgQ2lwaGVycwojCkNPTkZJ
R19DUllQVE9fQUVTPXkKQ09ORklHX0NSWVBUT19BRVNfVEk9bQpDT05GSUdfQ1JZUFRPX0FFU19O
SV9JTlRFTD1tCkNPTkZJR19DUllQVE9fQU5VQklTPXkKQ09ORklHX0NSWVBUT19BUkM0PXkKIyBD
T05GSUdfQ1JZUFRPX0JMT1dGSVNIIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19CTE9XRklTSF9D
T01NT049bQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIX1g4Nl82ND1tCiMgQ09ORklHX0NSWVBUT19D
QU1FTExJQSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfWDg2XzY0PXkKQ09ORklH
X0NSWVBUT19DQU1FTExJQV9BRVNOSV9BVlhfWDg2XzY0PXkKQ09ORklHX0NSWVBUT19DQU1FTExJ
QV9BRVNOSV9BVlgyX1g4Nl82ND15CkNPTkZJR19DUllQVE9fQ0FTVF9DT01NT049eQpDT05GSUdf
Q1JZUFRPX0NBU1Q1PXkKQ09ORklHX0NSWVBUT19DQVNUNV9BVlhfWDg2XzY0PW0KIyBDT05GSUdf
Q1JZUFRPX0NBU1Q2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NBU1Q2X0FWWF9YODZfNjQg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RFUz1tCkNPTkZJR19DUllQVE9fREVTM19FREVfWDg2
XzY0PW0KIyBDT05GSUdfQ1JZUFRPX0ZDUllQVCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fS0hB
WkFEPW0KQ09ORklHX0NSWVBUT19DSEFDSEEyMD15CiMgQ09ORklHX0NSWVBUT19DSEFDSEEyMF9Y
ODZfNjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU0VFRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19BUklBIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TRVJQRU5UPW0KIyBDT05GSUdf
Q1JZUFRPX1NFUlBFTlRfU1NFMl9YODZfNjQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NFUlBF
TlRfQVZYX1g4Nl82ND1tCkNPTkZJR19DUllQVE9fU0VSUEVOVF9BVlgyX1g4Nl82ND1tCkNPTkZJ
R19DUllQVE9fU000PW0KIyBDT05GSUdfQ1JZUFRPX1NNNF9HRU5FUklDIGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19TTTRfQUVTTklfQVZYX1g4Nl82ND1tCkNPTkZJR19DUllQVE9fU000X0FFU05J
X0FWWDJfWDg2XzY0PW0KIyBDT05GSUdfQ1JZUFRPX1RFQSBpcyBub3Qgc2V0CkNPTkZJR19DUllQ
VE9fVFdPRklTSD1tCkNPTkZJR19DUllQVE9fVFdPRklTSF9DT01NT049eQpDT05GSUdfQ1JZUFRP
X1RXT0ZJU0hfWDg2XzY0PXkKQ09ORklHX0NSWVBUT19UV09GSVNIX1g4Nl82NF8zV0FZPXkKIyBD
T05GSUdfQ1JZUFRPX1RXT0ZJU0hfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CgojCiMgQ29tcHJlc3Np
b24KIwpDT05GSUdfQ1JZUFRPX0RFRkxBVEU9eQpDT05GSUdfQ1JZUFRPX0xaTz15CkNPTkZJR19D
UllQVE9fODQyPXkKQ09ORklHX0NSWVBUT19MWjQ9eQpDT05GSUdfQ1JZUFRPX0xaNEhDPW0KQ09O
RklHX0NSWVBUT19aU1REPXkKCiMKIyBSYW5kb20gTnVtYmVyIEdlbmVyYXRpb24KIwpDT05GSUdf
Q1JZUFRPX0FOU0lfQ1BSTkc9bQpDT05GSUdfQ1JZUFRPX0RSQkdfTUVOVT15CkNPTkZJR19DUllQ
VE9fRFJCR19ITUFDPXkKIyBDT05GSUdfQ1JZUFRPX0RSQkdfSEFTSCBpcyBub3Qgc2V0CkNPTkZJ
R19DUllQVE9fRFJCR19DVFI9eQpDT05GSUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJ
VFRFUkVOVFJPUFk9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJPXkKIyBDT05GSUdfQ1JZUFRPX1VT
RVJfQVBJX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVVNFUl9BUElfU0tDSVBIRVIg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVVNFUl9BUElfUk5HIGlzIG5vdCBzZXQKQ09ORklH
X0NSWVBUT19VU0VSX0FQSV9BRUFEPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9FTkFCTEVfT0JT
T0xFVEU9eQojIENPTkZJR19DUllQVE9fU1RBVFMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0hB
U0hfSU5GTz15CiMgQ09ORklHX0NSWVBUT19IVyBpcyBub3Qgc2V0CkNPTkZJR19BU1lNTUVUUklD
X0tFWV9UWVBFPXkKQ09ORklHX0FTWU1NRVRSSUNfUFVCTElDX0tFWV9TVUJUWVBFPXkKQ09ORklH
X1g1MDlfQ0VSVElGSUNBVEVfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzhfUFJJVkFURV9LRVlfUEFS
U0VSIGlzIG5vdCBzZXQKQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKIyBDT05GSUdfUEtD
UzdfVEVTVF9LRVkgaXMgbm90IHNldApDT05GSUdfU0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9O
PXkKIyBDT05GSUdfRklQU19TSUdOQVRVUkVfU0VMRlRFU1QgaXMgbm90IHNldAoKIwojIENlcnRp
ZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNoZWNraW5nCiMKQ09ORklHX01PRFVMRV9TSUdfS0VZPSJj
ZXJ0cy9zaWduaW5nX2tleS5wZW0iCiMgQ09ORklHX01PRFVMRV9TSUdfS0VZX1RZUEVfUlNBIGlz
IG5vdCBzZXQKQ09ORklHX01PRFVMRV9TSUdfS0VZX1RZUEVfRUNEU0E9eQpDT05GSUdfU1lTVEVN
X1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCkNPTkZJR19T
WVNURU1fRVhUUkFfQ0VSVElGSUNBVEU9eQpDT05GSUdfU1lTVEVNX0VYVFJBX0NFUlRJRklDQVRF
X1NJWkU9NDA5NgpDT05GSUdfU0VDT05EQVJZX1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNU
RU1fQkxBQ0tMSVNUX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9IQVNIX0xJU1Q9
IiIKQ09ORklHX1NZU1RFTV9SRVZPQ0FUSU9OX0xJU1Q9eQpDT05GSUdfU1lTVEVNX1JFVk9DQVRJ
T05fS0VZUz0iIgpDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9BVVRIX1VQREFURT15CiMgZW5kIG9m
IENlcnRpZmljYXRlcyBmb3Igc2lnbmF0dXJlIGNoZWNraW5nCgpDT05GSUdfQklOQVJZX1BSSU5U
Rj15CgojCiMgTGlicmFyeSByb3V0aW5lcwojCkNPTkZJR19MSU5FQVJfUkFOR0VTPXkKIyBDT05G
SUdfUEFDS0lORyBpcyBub3Qgc2V0CkNPTkZJR19CSVRSRVZFUlNFPXkKQ09ORklHX0dFTkVSSUNf
U1RSTkNQWV9GUk9NX1VTRVI9eQpDT05GSUdfR0VORVJJQ19TVFJOTEVOX1VTRVI9eQpDT05GSUdf
R0VORVJJQ19ORVRfVVRJTFM9eQpDT05GSUdfQ09SRElDPXkKQ09ORklHX1BSSU1FX05VTUJFUlM9
eQpDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19QQ0lfSU9NQVA9eQpDT05GSUdfR0VO
RVJJQ19JT01BUD15CkNPTkZJR19BUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQpDT05GSUdfQVJD
SF9IQVNfRkFTVF9NVUxUSVBMSUVSPXkKQ09ORklHX0FSQ0hfVVNFX1NZTV9BTk5PVEFUSU9OUz15
CgojCiMgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9BRVM9eQpD
T05GSUdfQ1JZUFRPX0xJQl9BUkM0PXkKQ09ORklHX0NSWVBUT19BUkNIX0hBVkVfTElCX0JMQUtF
MlM9eQpDT05GSUdfQ1JZUFRPX0xJQl9CTEFLRTJTX0dFTkVSSUM9eQpDT05GSUdfQ1JZUFRPX0xJ
Ql9DSEFDSEFfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX0NIQUNIQT15CkNPTkZJR19DUllQ
VE9fQVJDSF9IQVZFX0xJQl9DVVJWRTI1NTE5PW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUx
OV9HRU5FUklDPW0KIyBDT05GSUdfQ1JZUFRPX0xJQl9DVVJWRTI1NTE5IGlzIG5vdCBzZXQKQ09O
RklHX0NSWVBUT19MSUJfREVTPW0KQ09ORklHX0NSWVBUT19MSUJfUE9MWTEzMDVfUlNJWkU9MTEK
Q09ORklHX0NSWVBUT19MSUJfUE9MWTEzMDVfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX1BP
TFkxMzA1PXkKQ09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBMjBQT0xZMTMwNT15CkNPTkZJR19DUllQ
VE9fTElCX1NIQTE9eQpDT05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9eQojIGVuZCBvZiBDcnlwdG8g
bGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0xJQl9NRU1ORVE9eQpDT05GSUdfQ1JDX0NDSVRUPXkK
Q09ORklHX0NSQzE2PXkKIyBDT05GSUdfQ1JDX1QxMERJRiBpcyBub3Qgc2V0CkNPTkZJR19DUkM2
NF9ST0NLU09GVD15CkNPTkZJR19DUkNfSVRVX1Q9bQpDT05GSUdfQ1JDMzI9eQojIENPTkZJR19D
UkMzMl9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX1NMSUNFQlk4IGlzIG5vdCBz
ZXQKQ09ORklHX0NSQzMyX1NMSUNFQlk0PXkKIyBDT05GSUdfQ1JDMzJfU0FSV0FURSBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSQzMyX0JJVCBpcyBub3Qgc2V0CkNPTkZJR19DUkM2ND15CkNPTkZJR19D
UkM0PXkKQ09ORklHX0NSQzc9eQpDT05GSUdfTElCQ1JDMzJDPXkKQ09ORklHX0NSQzg9bQpDT05G
SUdfWFhIQVNIPXkKIyBDT05GSUdfUkFORE9NMzJfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdf
ODQyX0NPTVBSRVNTPXkKQ09ORklHXzg0Ml9ERUNPTVBSRVNTPXkKQ09ORklHX1pMSUJfSU5GTEFU
RT15CkNPTkZJR19aTElCX0RFRkxBVEU9eQpDT05GSUdfTFpPX0NPTVBSRVNTPXkKQ09ORklHX0xa
T19ERUNPTVBSRVNTPXkKQ09ORklHX0xaNF9DT01QUkVTUz15CkNPTkZJR19MWjRIQ19DT01QUkVT
Uz1tCkNPTkZJR19MWjRfREVDT01QUkVTUz15CkNPTkZJR19aU1REX0NPTVBSRVNTPXkKQ09ORklH
X1pTVERfREVDT01QUkVTUz15CkNPTkZJR19YWl9ERUM9eQojIENPTkZJR19YWl9ERUNfWDg2IGlz
IG5vdCBzZXQKQ09ORklHX1haX0RFQ19QT1dFUlBDPXkKQ09ORklHX1haX0RFQ19JQTY0PXkKQ09O
RklHX1haX0RFQ19BUk09eQpDT05GSUdfWFpfREVDX0FSTVRIVU1CPXkKIyBDT05GSUdfWFpfREVD
X1NQQVJDIGlzIG5vdCBzZXQKIyBDT05GSUdfWFpfREVDX01JQ1JPTFpNQSBpcyBub3Qgc2V0CkNP
TkZJR19YWl9ERUNfQkNKPXkKIyBDT05GSUdfWFpfREVDX1RFU1QgaXMgbm90IHNldApDT05GSUdf
REVDT01QUkVTU19HWklQPXkKQ09ORklHX0RFQ09NUFJFU1NfQlpJUDI9eQpDT05GSUdfREVDT01Q
UkVTU19MWk1BPXkKQ09ORklHX0RFQ09NUFJFU1NfWFo9eQpDT05GSUdfREVDT01QUkVTU19MWk89
eQpDT05GSUdfREVDT01QUkVTU19MWjQ9eQpDT05GSUdfREVDT01QUkVTU19aU1REPXkKQ09ORklH
X0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX0JDSD15CkNPTkZJR19JTlRFUlZBTF9UUkVFPXkK
Q09ORklHX0FTU09DSUFUSVZFX0FSUkFZPXkKQ09ORklHX0hBU19JT01FTT15CkNPTkZJR19IQVNf
SU9QT1JUX01BUD15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX0RNQV9PUFM9eQpDT05GSUdfTkVF
RF9TR19ETUFfTEVOR1RIPXkKQ09ORklHX05FRURfRE1BX01BUF9TVEFURT15CkNPTkZJR19BUkNI
X0RNQV9BRERSX1RfNjRCSVQ9eQpDT05GSUdfU1dJT1RMQj15CkNPTkZJR19ETUFfQ01BPXkKIyBD
T05GSUdfRE1BX1BFUk5VTUFfQ01BIGlzIG5vdCBzZXQKCiMKIyBEZWZhdWx0IGNvbnRpZ3VvdXMg
bWVtb3J5IGFyZWEgc2l6ZToKIwpDT05GSUdfQ01BX1NJWkVfTUJZVEVTPTAKQ09ORklHX0NNQV9T
SVpFX1NFTF9NQllURVM9eQojIENPTkZJR19DTUFfU0laRV9TRUxfUEVSQ0VOVEFHRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0NNQV9TSVpFX1NFTF9NSU4gaXMgbm90IHNldAojIENPTkZJR19DTUFfU0la
RV9TRUxfTUFYIGlzIG5vdCBzZXQKQ09ORklHX0NNQV9BTElHTk1FTlQ9OAojIENPTkZJR19ETUFf
QVBJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BX01BUF9CRU5DSE1BUksgaXMgbm90IHNl
dApDT05GSUdfU0dMX0FMTE9DPXkKQ09ORklHX0NIRUNLX1NJR05BVFVSRT15CkNPTkZJR19DUFVN
QVNLX09GRlNUQUNLPXkKQ09ORklHX0NQVV9STUFQPXkKQ09ORklHX0RRTD15CkNPTkZJR19HTE9C
PXkKIyBDT05GSUdfR0xPQl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19OTEFUVFI9eQpDT05G
SUdfQ0xaX1RBQj15CkNPTkZJR19JUlFfUE9MTD15CkNPTkZJR19NUElMSUI9eQpDT05GSUdfT0lE
X1JFR0lTVFJZPXkKQ09ORklHX0hBVkVfR0VORVJJQ19WRFNPPXkKQ09ORklHX0dFTkVSSUNfR0VU
VElNRU9GREFZPXkKQ09ORklHX0dFTkVSSUNfVkRTT19USU1FX05TPXkKQ09ORklHX0FSQ0hfSEFT
X1BNRU1fQVBJPXkKQ09ORklHX0FSQ0hfSEFTX1VBQ0NFU1NfRkxVU0hDQUNIRT15CkNPTkZJR19B
UkNIX0hBU19DT1BZX01DPXkKQ09ORklHX0FSQ0hfU1RBQ0tXQUxLPXkKQ09ORklHX1NUQUNLREVQ
T1Q9eQojIGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVzCgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwoj
IHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwojCkNPTkZJR19QUklOVEtfVElNRT15CkNPTkZJR19Q
UklOVEtfQ0FMTEVSPXkKIyBDT05GSUdfU1RBQ0tUUkFDRV9CVUlMRF9JRCBpcyBub3Qgc2V0CkNP
TkZJR19DT05TT0xFX0xPR0xFVkVMX0RFRkFVTFQ9NwpDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9R
VUlFVD00CkNPTkZJR19NRVNTQUdFX0xPR0xFVkVMX0RFRkFVTFQ9NAojIENPTkZJR19CT09UX1BS
SU5US19ERUxBWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RZTkFNSUNfREVCVUcgaXMgbm90IHNldApD
T05GSUdfRFlOQU1JQ19ERUJVR19DT1JFPXkKIyBDT05GSUdfU1lNQk9MSUNfRVJSTkFNRSBpcyBu
b3Qgc2V0CkNPTkZJR19ERUJVR19CVUdWRVJCT1NFPXkKIyBlbmQgb2YgcHJpbnRrIGFuZCBkbWVz
ZyBvcHRpb25zCgpDT05GSUdfREVCVUdfS0VSTkVMPXkKQ09ORklHX0RFQlVHX01JU0M9eQoKIwoj
IENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKIwpDT05GSUdfREVCVUdf
SU5GTz15CiMgQ09ORklHX0RFQlVHX0lORk9fTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVH
X0lORk9fRFdBUkZfVE9PTENIQUlOX0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfREVCVUdfSU5G
T19EV0FSRjQ9eQojIENPTkZJR19ERUJVR19JTkZPX0RXQVJGNSBpcyBub3Qgc2V0CkNPTkZJR19E
RUJVR19JTkZPX1JFRFVDRUQ9eQojIENPTkZJR19ERUJVR19JTkZPX0NPTVBSRVNTRUQgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19JTkZPX1NQTElUIGlzIG5vdCBzZXQKQ09ORklHX1BBSE9MRV9I
QVNfU1BMSVRfQlRGPXkKQ09ORklHX0dEQl9TQ1JJUFRTPXkKQ09ORklHX0ZSQU1FX1dBUk49ODE5
MgpDT05GSUdfU1RSSVBfQVNNX1NZTVM9eQpDT05GSUdfUkVBREFCTEVfQVNNPXkKQ09ORklHX0hF
QURFUlNfSU5TVEFMTD15CkNPTkZJR19ERUJVR19TRUNUSU9OX01JU01BVENIPXkKQ09ORklHX1NF
Q1RJT05fTUlTTUFUQ0hfV0FSTl9PTkxZPXkKIyBDT05GSUdfREVCVUdfRk9SQ0VfRlVOQ1RJT05f
QUxJR05fNjRCIGlzIG5vdCBzZXQKQ09ORklHX0ZSQU1FX1BPSU5URVI9eQpDT05GSUdfT0JKVE9P
TD15CkNPTkZJR19TVEFDS19WQUxJREFUSU9OPXkKIyBDT05GSUdfVk1MSU5VWF9NQVAgaXMgbm90
IHNldApDT05GSUdfREVCVUdfRk9SQ0VfV0VBS19QRVJfQ1BVPXkKIyBlbmQgb2YgQ29tcGlsZS10
aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwoKIwojIEdlbmVyaWMgS2VybmVsIERlYnVn
Z2luZyBJbnN0cnVtZW50cwojCkNPTkZJR19NQUdJQ19TWVNSUT15CkNPTkZJR19NQUdJQ19TWVNS
UV9ERUZBVUxUX0VOQUJMRT0weDEKIyBDT05GSUdfTUFHSUNfU1lTUlFfU0VSSUFMIGlzIG5vdCBz
ZXQKQ09ORklHX0RFQlVHX0ZTPXkKIyBDT05GSUdfREVCVUdfRlNfQUxMT1dfQUxMIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfRlNfRElTQUxMT1dfTU9VTlQgaXMgbm90IHNldApDT05GSUdfREVC
VUdfRlNfQUxMT1dfTk9ORT15CkNPTkZJR19IQVZFX0FSQ0hfS0dEQj15CiMgQ09ORklHX0tHREIg
aXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfVUJTQU5fU0FOSVRJWkVfQUxMPXkKQ09ORklHX1VC
U0FOPXkKIyBDT05GSUdfVUJTQU5fVFJBUCBpcyBub3Qgc2V0CkNPTkZJR19DQ19IQVNfVUJTQU5f
Qk9VTkRTPXkKQ09ORklHX1VCU0FOX0JPVU5EUz15CkNPTkZJR19VQlNBTl9PTkxZX0JPVU5EUz15
CkNPTkZJR19VQlNBTl9TSElGVD15CiMgQ09ORklHX1VCU0FOX0RJVl9aRVJPIGlzIG5vdCBzZXQK
IyBDT05GSUdfVUJTQU5fQk9PTCBpcyBub3Qgc2V0CiMgQ09ORklHX1VCU0FOX0VOVU0gaXMgbm90
IHNldAojIENPTkZJR19VQlNBTl9BTElHTk1FTlQgaXMgbm90IHNldApDT05GSUdfVUJTQU5fU0FO
SVRJWkVfQUxMPXkKIyBDT05GSUdfVEVTVF9VQlNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FS
Q0hfS0NTQU49eQpDT05GSUdfSEFWRV9LQ1NBTl9DT01QSUxFUj15CiMgQ09ORklHX0tDU0FOIGlz
IG5vdCBzZXQKIyBlbmQgb2YgR2VuZXJpYyBLZXJuZWwgRGVidWdnaW5nIEluc3RydW1lbnRzCgoj
CiMgTmV0d29ya2luZyBEZWJ1Z2dpbmcKIwojIENPTkZJR19ORVRfREVWX1JFRkNOVF9UUkFDS0VS
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX05TX1JFRkNOVF9UUkFDS0VSIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfTkVUIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29ya2luZyBEZWJ1Z2dpbmcK
CiMKIyBNZW1vcnkgRGVidWdnaW5nCiMKQ09ORklHX1BBR0VfRVhURU5TSU9OPXkKIyBDT05GSUdf
REVCVUdfUEFHRUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1BBR0VfT1dORVI9eQpDT05GSUdfUEFH
RV9UQUJMRV9DSEVDSz15CkNPTkZJR19QQUdFX1RBQkxFX0NIRUNLX0VORk9SQ0VEPXkKQ09ORklH
X1BBR0VfUE9JU09OSU5HPXkKQ09ORklHX0RFQlVHX1BBR0VfUkVGPXkKIyBDT05GSUdfREVCVUdf
Uk9EQVRBX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfREVCVUdfV1g9eQojIENPTkZJ
R19ERUJVR19XWCBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX1BURFVNUD15CiMgQ09ORklHX1BU
RFVNUF9ERUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX09CSkVDVFM9eQojIENPTkZJR19E
RUJVR19PQkpFQ1RTX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfT0JKRUNUU19G
UkVFIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX09CSkVDVFNfVElNRVJTPXkKQ09ORklHX0RFQlVH
X09CSkVDVFNfV09SSz15CkNPTkZJR19ERUJVR19PQkpFQ1RTX1JDVV9IRUFEPXkKIyBDT05GSUdf
REVCVUdfT0JKRUNUU19QRVJDUFVfQ09VTlRFUiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19PQkpF
Q1RTX0VOQUJMRV9ERUZBVUxUPTEKQ09ORklHX1NIUklOS0VSX0RFQlVHPXkKQ09ORklHX0hBVkVf
REVCVUdfS01FTUxFQUs9eQojIENPTkZJR19ERUJVR19LTUVNTEVBSyBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX1NUQUNLX1VTQUdFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfU1RBQ0tfRU5E
X0NIRUNLIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEU9eQpDT05G
SUdfREVCVUdfVk09eQojIENPTkZJR19ERUJVR19WTV9WTUFDQUNIRSBpcyBub3Qgc2V0CkNPTkZJ
R19ERUJVR19WTV9SQj15CkNPTkZJR19ERUJVR19WTV9QR0ZMQUdTPXkKQ09ORklHX0RFQlVHX1ZN
X1BHVEFCTEU9eQpDT05GSUdfQVJDSF9IQVNfREVCVUdfVklSVFVBTD15CkNPTkZJR19ERUJVR19W
SVJUVUFMPXkKQ09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkKIyBDT05GSUdfREVCVUdfUEVSX0NQ
VV9NQVBTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LQVNBTj15CkNPTkZJR19IQVZFX0FS
Q0hfS0FTQU5fVk1BTExPQz15CkNPTkZJR19DQ19IQVNfS0FTQU5fR0VORVJJQz15CkNPTkZJR19D
Q19IQVNfV09SS0lOR19OT1NBTklUSVpFX0FERFJFU1M9eQpDT05GSUdfSEFWRV9BUkNIX0tGRU5D
RT15CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCiMgQ09ORklHX0RFQlVHX1NISVJRIGlzIG5v
dCBzZXQKCiMKIyBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwojCkNPTkZJR19QQU5JQ19P
Tl9PT1BTPXkKQ09ORklHX1BBTklDX09OX09PUFNfVkFMVUU9MQpDT05GSUdfUEFOSUNfVElNRU9V
VD0wCkNPTkZJR19MT0NLVVBfREVURUNUT1I9eQpDT05GSUdfU09GVExPQ0tVUF9ERVRFQ1RPUj15
CkNPTkZJR19CT09UUEFSQU1fU09GVExPQ0tVUF9QQU5JQz15CkNPTkZJR19IQVJETE9DS1VQX0RF
VEVDVE9SX1BFUkY9eQpDT05GSUdfSEFSRExPQ0tVUF9DSEVDS19USU1FU1RBTVA9eQpDT05GSUdf
SEFSRExPQ0tVUF9ERVRFQ1RPUj15CkNPTkZJR19CT09UUEFSQU1fSEFSRExPQ0tVUF9QQU5JQz15
CkNPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKQ09ORklHX0RFRkFVTFRfSFVOR19UQVNLX1RJTUVP
VVQ9NDgwCiMgQ09ORklHX0JPT1RQQVJBTV9IVU5HX1RBU0tfUEFOSUMgaXMgbm90IHNldApDT05G
SUdfV1FfV0FUQ0hET0c9eQojIENPTkZJR19URVNUX0xPQ0tVUCBpcyBub3Qgc2V0CiMgZW5kIG9m
IERlYnVnIE9vcHMsIExvY2t1cHMgYW5kIEhhbmdzCgojCiMgU2NoZWR1bGVyIERlYnVnZ2luZwoj
CkNPTkZJR19TQ0hFRF9ERUJVRz15CkNPTkZJR19TQ0hFRF9JTkZPPXkKIyBDT05GSUdfU0NIRURT
VEFUUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNjaGVkdWxlciBEZWJ1Z2dpbmcKCiMgQ09ORklHX0RF
QlVHX1RJTUVLRUVQSU5HIGlzIG5vdCBzZXQKCiMKIyBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tz
LCBtdXRleGVzLCBldGMuLi4pCiMKQ09ORklHX0xPQ0tfREVCVUdHSU5HX1NVUFBPUlQ9eQpDT05G
SUdfUFJPVkVfTE9DS0lORz15CiMgQ09ORklHX1BST1ZFX1JBV19MT0NLX05FU1RJTkcgaXMgbm90
IHNldApDT05GSUdfTE9DS19TVEFUPXkKQ09ORklHX0RFQlVHX1JUX01VVEVYRVM9eQpDT05GSUdf
REVCVUdfU1BJTkxPQ0s9eQpDT05GSUdfREVCVUdfTVVURVhFUz15CkNPTkZJR19ERUJVR19XV19N
VVRFWF9TTE9XUEFUSD15CkNPTkZJR19ERUJVR19SV1NFTVM9eQpDT05GSUdfREVCVUdfTE9DS19B
TExPQz15CkNPTkZJR19MT0NLREVQPXkKQ09ORklHX0xPQ0tERVBfQklUUz0xNQpDT05GSUdfTE9D
S0RFUF9DSEFJTlNfQklUUz0xNgpDT05GSUdfTE9DS0RFUF9TVEFDS19UUkFDRV9CSVRTPTE5CkNP
TkZJR19MT0NLREVQX1NUQUNLX1RSQUNFX0hBU0hfQklUUz0xNApDT05GSUdfTE9DS0RFUF9DSVJD
VUxBUl9RVUVVRV9CSVRTPTEyCiMgQ09ORklHX0RFQlVHX0xPQ0tERVAgaXMgbm90IHNldApDT05G
SUdfREVCVUdfQVRPTUlDX1NMRUVQPXkKIyBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRF
U1RTIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkKIyBDT05GSUdfV1dfTVVU
RVhfU0VMRlRFU1QgaXMgbm90IHNldAojIENPTkZJR19TQ0ZfVE9SVFVSRV9URVNUIGlzIG5vdCBz
ZXQKQ09ORklHX0NTRF9MT0NLX1dBSVRfREVCVUc9eQojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAo
c3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCgpDT05GSUdfVFJBQ0VfSVJRRkxBR1M9eQpDT05G
SUdfVFJBQ0VfSVJRRkxBR1NfTk1JPXkKQ09ORklHX0RFQlVHX0lSUUZMQUdTPXkKQ09ORklHX1NU
QUNLVFJBQ0U9eQojIENPTkZJR19XQVJOX0FMTF9VTlNFRURFRF9SQU5ET00gaXMgbm90IHNldAoj
IENPTkZJR19ERUJVR19LT0JKRUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfS09CSkVDVF9S
RUxFQVNFIGlzIG5vdCBzZXQKCiMKIyBEZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKQ09O
RklHX0RFQlVHX0xJU1Q9eQpDT05GSUdfREVCVUdfUExJU1Q9eQojIENPTkZJR19ERUJVR19TRyBp
cyBub3Qgc2V0CkNPTkZJR19ERUJVR19OT1RJRklFUlM9eQpDT05GSUdfQlVHX09OX0RBVEFfQ09S
UlVQVElPTj15CiMgZW5kIG9mIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKCkNPTkZJR19E
RUJVR19DUkVERU5USUFMUz15CgojCiMgUkNVIERlYnVnZ2luZwojCkNPTkZJR19QUk9WRV9SQ1U9
eQpDT05GSUdfVE9SVFVSRV9URVNUPXkKIyBDT05GSUdfUkNVX1NDQUxFX1RFU1QgaXMgbm90IHNl
dAojIENPTkZJR19SQ1VfVE9SVFVSRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1JFRl9T
Q0FMRV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX1JDVV9DUFVfU1RBTExfVElNRU9VVD0yMQpDT05G
SUdfUkNVX0VYUF9DUFVfU1RBTExfVElNRU9VVD0wCkNPTkZJR19SQ1VfVFJBQ0U9eQojIENPTkZJ
R19SQ1VfRVFTX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgUkNVIERlYnVnZ2luZwoKIyBDT05G
SUdfREVCVUdfV1FfRk9SQ0VfUlJfQ1BVIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0hPVFBMVUdf
U1RBVEVfQ09OVFJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX0xBVEVOQ1lUT1AgaXMgbm90IHNldApD
T05GSUdfVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfTk9QX1RSQUNFUj15CkNPTkZJ
R19IQVZFX1JFVEhPT0s9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9UUkFDRVI9eQpDT05GSUdfSEFW
RV9GVU5DVElPTl9HUkFQSF9UUkFDRVI9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRT15CkNP
TkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUz15CkNPTkZJR19IQVZFX0RZTkFNSUNf
RlRSQUNFX1dJVEhfRElSRUNUX0NBTExTPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lU
SF9BUkdTPXkKQ09ORklHX0hBVkVfRlRSQUNFX01DT1VOVF9SRUNPUkQ9eQpDT05GSUdfSEFWRV9T
WVNDQUxMX1RSQUNFUE9JTlRTPXkKQ09ORklHX0hBVkVfRkVOVFJZPXkKQ09ORklHX0hBVkVfT0JK
VE9PTF9NQ09VTlQ9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19IQVZFX0JV
SUxEVElNRV9NQ09VTlRfU09SVD15CkNPTkZJR19CVUlMRFRJTUVfTUNPVU5UX1NPUlQ9eQpDT05G
SUdfVFJBQ0VSX01BWF9UUkFDRT15CkNPTkZJR19UUkFDRV9DTE9DSz15CkNPTkZJR19SSU5HX0JV
RkZFUj15CkNPTkZJR19FVkVOVF9UUkFDSU5HPXkKQ09ORklHX0NPTlRFWFRfU1dJVENIX1RSQUNF
Uj15CkNPTkZJR19QUkVFTVBUSVJRX1RSQUNFUE9JTlRTPXkKQ09ORklHX1RSQUNJTkc9eQpDT05G
SUdfR0VORVJJQ19UUkFDRVI9eQpDT05GSUdfVFJBQ0lOR19TVVBQT1JUPXkKQ09ORklHX0ZUUkFD
RT15CiMgQ09ORklHX0JPT1RUSU1FX1RSQUNJTkcgaXMgbm90IHNldApDT05GSUdfRlVOQ1RJT05f
VFJBQ0VSPXkKQ09ORklHX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUj15CkNPTkZJR19EWU5BTUlDX0ZU
UkFDRT15CkNPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1M9eQpDT05GSUdfRFlOQU1JQ19G
VFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFM9eQpDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdT
PXkKIyBDT05GSUdfRlBST0JFIGlzIG5vdCBzZXQKQ09ORklHX0ZVTkNUSU9OX1BST0ZJTEVSPXkK
Q09ORklHX1NUQUNLX1RSQUNFUj15CiMgQ09ORklHX0lSUVNPRkZfVFJBQ0VSIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NIRURfVFJBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdMQVRfVFJBQ0VSIGlz
IG5vdCBzZXQKQ09ORklHX09TTk9JU0VfVFJBQ0VSPXkKQ09ORklHX1RJTUVSTEFUX1RSQUNFUj15
CiMgQ09ORklHX01NSU9UUkFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZUUkFDRV9TWVNDQUxMUyBp
cyBub3Qgc2V0CkNPTkZJR19UUkFDRVJfU05BUFNIT1Q9eQojIENPTkZJR19UUkFDRVJfU05BUFNI
T1RfUEVSX0NQVV9TV0FQIGlzIG5vdCBzZXQKQ09ORklHX0JSQU5DSF9QUk9GSUxFX05PTkU9eQoj
IENPTkZJR19QUk9GSUxFX0FOTk9UQVRFRF9CUkFOQ0hFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VQ
Uk9CRV9FVkVOVFMgaXMgbm90IHNldApDT05GSUdfRlRSQUNFX01DT1VOVF9SRUNPUkQ9eQpDT05G
SUdfRlRSQUNFX01DT1VOVF9VU0VfQ0M9eQojIENPTkZJR19TWU5USF9FVkVOVFMgaXMgbm90IHNl
dAojIENPTkZJR19ISVNUX1RSSUdHRVJTIGlzIG5vdCBzZXQKQ09ORklHX1RSQUNFX0VWRU5UX0lO
SkVDVD15CkNPTkZJR19UUkFDRVBPSU5UX0JFTkNITUFSSz15CiMgQ09ORklHX1JJTkdfQlVGRkVS
X0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19UUkFDRV9FVkFMX01BUF9GSUxFPXkKQ09ORklH
X0ZUUkFDRV9SRUNPUkRfUkVDVVJTSU9OPXkKQ09ORklHX0ZUUkFDRV9SRUNPUkRfUkVDVVJTSU9O
X1NJWkU9MTI4CkNPTkZJR19SSU5HX0JVRkZFUl9SRUNPUkRfUkVDVVJTSU9OPXkKIyBDT05GSUdf
RlRSQUNFX1NUQVJUVVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZUUkFDRV9TT1JUX1NUQVJU
VVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JJTkdfQlVGRkVSX1NUQVJUVVBfVEVTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JJTkdfQlVGRkVSX1ZBTElEQVRFX1RJTUVfREVMVEFTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUFJFRU1QVElSUV9ERUxBWV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0RBX01P
Tl9FVkVOVFM9eQpDT05GSUdfREFfTU9OX0VWRU5UU19JRD15CkNPTkZJR19SVj15CkNPTkZJR19S
Vl9NT05fV1dOUj15CiMgQ09ORklHX1JWX1JFQUNUT1JTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJP
VklERV9PSENJMTM5NF9ETUFfSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NBTVBMRVMgaXMgbm90
IHNldApDT05GSUdfSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVD15CkNPTkZJR19IQVZFX1NBTVBM
RV9GVFJBQ0VfRElSRUNUX01VTFRJPXkKQ09ORklHX0FSQ0hfSEFTX0RFVk1FTV9JU19BTExPV0VE
PXkKQ09ORklHX1NUUklDVF9ERVZNRU09eQojIENPTkZJR19JT19TVFJJQ1RfREVWTUVNIGlzIG5v
dCBzZXQKCiMKIyB4ODYgRGVidWdnaW5nCiMKQ09ORklHX0VBUkxZX1BSSU5US19VU0I9eQpDT05G
SUdfWDg2X1ZFUkJPU0VfQk9PVFVQPXkKQ09ORklHX0VBUkxZX1BSSU5USz15CkNPTkZJR19FQVJM
WV9QUklOVEtfREJHUD15CkNPTkZJR19FQVJMWV9QUklOVEtfVVNCX1hEQkM9eQpDT05GSUdfREVC
VUdfVExCRkxVU0g9eQpDT05GSUdfSEFWRV9NTUlPVFJBQ0VfU1VQUE9SVD15CiMgQ09ORklHX1g4
Nl9ERUNPREVSX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU9fREVMQVlfMFg4MCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lPX0RFTEFZXzBYRUQgaXMgbm90IHNldApDT05GSUdfSU9fREVMQVlf
VURFTEFZPXkKIyBDT05GSUdfSU9fREVMQVlfTk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVH
X0JPT1RfUEFSQU1TIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BBX0RFQlVHIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfRU5UUlkgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19OTUlfU0VMRlRFU1Qg
aXMgbm90IHNldAojIENPTkZJR19YODZfREVCVUdfRlBVIGlzIG5vdCBzZXQKIyBDT05GSUdfUFVO
SVRfQVRPTV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VOV0lOREVSX09SQyBpcyBub3Qgc2V0
CkNPTkZJR19VTldJTkRFUl9GUkFNRV9QT0lOVEVSPXkKIyBlbmQgb2YgeDg2IERlYnVnZ2luZwoK
IwojIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCiMgQ09ORklHX0tVTklUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkFVTFRfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0tDT1Y9eQpDT05GSUdf
Q0NfSEFTX1NBTkNPVl9UUkFDRV9QQz15CkNPTkZJR19LQ09WPXkKIyBDT05GSUdfS0NPVl9FTkFC
TEVfQ09NUEFSSVNPTlMgaXMgbm90IHNldAojIENPTkZJR19LQ09WX0lOU1RSVU1FTlRfQUxMIGlz
IG5vdCBzZXQKQ09ORklHX0tDT1ZfSVJRX0FSRUFfU0laRT0weDQwMDAwCiMgQ09ORklHX1JVTlRJ
TUVfVEVTVElOR19NRU5VIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfVVNFX01FTVRFU1Q9eQojIENP
TkZJR19NRU1URVNUIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVsIFRlc3RpbmcgYW5kIENvdmVy
YWdlCgojCiMgUnVzdCBoYWNraW5nCiMKIyBlbmQgb2YgUnVzdCBoYWNraW5nCiMgZW5kIG9mIEtl
cm5lbCBoYWNraW5nCg==

--===============0681853179116116561==--

