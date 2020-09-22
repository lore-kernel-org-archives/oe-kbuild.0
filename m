Content-Type: multipart/mixed; boundary="===============8652329694139462176=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [goldwynr:btrfs-inode-lock 10/15] fs/btrfs/file.c:2075:10: warning: Variable 'err' is not assigned a value.
Date: Tue, 22 Sep 2020 18:20:55 +0800
Message-ID: <202009221845.Xs9AWEvp%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8652329694139462176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Goldwyn Rodrigues <rgoldwyn@suse.com>

tree:   https://github.com/goldwynr/linux btrfs-inode-lock
head:   3451713251bab2ecc1863f402a9d69614cd1e9d5
commit: f60162fe02a11725c03ef257f8a33d50e1b3ab41 [10/15] btrfs: Push inode =
locking and unlocking into buffered/direct write
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/btrfs/inode.c:8606:34: warning: Either the condition '!root' is redun=
dant or there is possible null pointer dereference: root. [nullPointerRedun=
dantCheck]
    struct btrfs_fs_info *fs_info =3D root->fs_info;
                                    ^
   fs/btrfs/inode.c:8623:6: note: Assuming that condition '!root' is not re=
dundant
    if (!root)
        ^
   fs/btrfs/inode.c:8606:34: note: Null pointer dereference
    struct btrfs_fs_info *fs_info =3D root->fs_info;
                                    ^
   fs/btrfs/inode.c:1165:19: warning: Variable 'extent_reserved' is reassig=
ned a value before the old one has been used. [redundantAssignment]
     extent_reserved =3D false;
                     ^
   fs/btrfs/inode.c:1101:19: note: Variable 'extent_reserved' is reassigned=
 a value before the old one has been used.
     extent_reserved =3D true;
                     ^
   fs/btrfs/inode.c:1165:19: note: Variable 'extent_reserved' is reassigned=
 a value before the old one has been used.
     extent_reserved =3D false;
                     ^
   fs/btrfs/inode.c:4624:6: warning: Variable 'ret' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    ret =3D btrfs_set_extent_delalloc(BTRFS_I(inode), block_start, block_en=
d, 0,
        ^
   fs/btrfs/inode.c:4592:7: note: Variable 'ret' is reassigned a value befo=
re the old one has been used.
     ret =3D btrfs_readpage(NULL, page);
         ^
   fs/btrfs/inode.c:4624:6: note: Variable 'ret' is reassigned a value befo=
re the old one has been used.
    ret =3D btrfs_set_extent_delalloc(BTRFS_I(inode), block_start, block_en=
d, 0,
        ^
   fs/btrfs/inode.c:5292:6: warning: Variable 'err' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    err =3D 0;
        ^
   fs/btrfs/inode.c:5256:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D -ENOENT;
        ^
   fs/btrfs/inode.c:5292:6: note: Variable 'err' is reassigned a value befo=
re the old one has been used.
    err =3D 0;
        ^
   fs/btrfs/file.c:629:12: warning: Variable 'modified' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     modified =3D !list_empty(&em->list);
              ^
   fs/btrfs/file.c:597:12: note: Variable 'modified' is reassigned a value =
before the old one has been used.
     modified =3D false;
              ^
   fs/btrfs/file.c:629:12: note: Variable 'modified' is reassigned a value =
before the old one has been used.
     modified =3D !list_empty(&em->list);
              ^
   fs/btrfs/file.c:942:16: warning: Variable 'search_start' is reassigned a=
 value before the old one has been used. [redundantAssignment]
     search_start =3D extent_end;
                  ^
   fs/btrfs/file.c:855:16: note: Variable 'search_start' is reassigned a va=
lue before the old one has been used.
     search_start =3D max(key.offset, start);
                  ^
   fs/btrfs/file.c:942:16: note: Variable 'search_start' is reassigned a va=
lue before the old one has been used.
     search_start =3D extent_end;
                  ^
   fs/btrfs/file.c:1909:17: warning: Variable 'release_bytes' is reassigned=
 a value before the old one has been used. [redundantAssignment]
     release_bytes =3D 0;
                   ^
   fs/btrfs/file.c:1882:17: note: Variable 'release_bytes' is reassigned a =
value before the old one has been used.
     release_bytes =3D round_up(copied + sector_offset,
                   ^
   fs/btrfs/file.c:1909:17: note: Variable 'release_bytes' is reassigned a =
value before the old one has been used.
     release_bytes =3D 0;
                   ^
>> fs/btrfs/file.c:2075:10: warning: Variable 'err' is not assigned a value=
. [unassignedVariable]
    ssize_t err;
            ^
>> fs/btrfs/file.c:2147:21: warning: Uninitialized variable: err [uninitvar]
    return num_written ? num_written : err;
                       ^

# https://github.com/goldwynr/linux/commit/f60162fe02a11725c03ef257f8a33d50=
e1b3ab41
git remote add goldwynr https://github.com/goldwynr/linux
git fetch --no-tags goldwynr btrfs-inode-lock
git checkout f60162fe02a11725c03ef257f8a33d50e1b3ab41
vim +/err +2075 fs/btrfs/file.c

d0215f3e5ebb580 Josef Bacik       2011-01-25  2065  =

b30ac0fc4109701 Al Viro           2014-04-03  2066  static ssize_t btrfs_fi=
le_write_iter(struct kiocb *iocb,
b30ac0fc4109701 Al Viro           2014-04-03  2067  				    struct iov_iter=
 *from)
d0215f3e5ebb580 Josef Bacik       2011-01-25  2068  {
d0215f3e5ebb580 Josef Bacik       2011-01-25  2069  	struct file *file =3D =
iocb->ki_filp;
496ad9aa8ef4480 Al Viro           2013-01-23  2070  	struct inode *inode =
=3D file_inode(file);
0b246afa62b0cf5 Jeff Mahoney      2016-06-22  2071  	struct btrfs_fs_info *=
fs_info =3D btrfs_sb(inode->i_sb);
d0215f3e5ebb580 Josef Bacik       2011-01-25  2072  	struct btrfs_root *roo=
t =3D BTRFS_I(inode)->root;
d0215f3e5ebb580 Josef Bacik       2011-01-25  2073  	ssize_t num_written =
=3D 0;
f50cb7aff964599 Omar Sandoval     2019-08-15  2074  	const bool sync =3D io=
cb->ki_flags & IOCB_DSYNC;
3309dd04cbcd2cd Al Viro           2015-04-09 @2075  	ssize_t err;
d0215f3e5ebb580 Josef Bacik       2011-01-25  2076  =

cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2077  	/*
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2078  	 * If BTRFS flips read=
only due to some impossible error
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2079  	 * (fs_info->fs_state =
now has BTRFS_SUPER_FLAG_ERROR),
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2080  	 * although we have op=
ened a file as writable, we have
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2081  	 * to stop this write =
operation to ensure FS consistency.
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2082  	 */
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2083  	if (test_bit(BTRFS_FS_=
STATE_ERROR, &fs_info->fs_state))
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2084  		return -EROFS;
cb6bec6e5e0f694 Goldwyn Rodrigues 2020-09-16  2085  =

91f9943e1c7b663 Christoph Hellwig 2017-08-29  2086  	if (!(iocb->ki_flags &=
 IOCB_DIRECT) &&
91f9943e1c7b663 Christoph Hellwig 2017-08-29  2087  	    (iocb->ki_flags & =
IOCB_NOWAIT))
91f9943e1c7b663 Christoph Hellwig 2017-08-29  2088  		return -EOPNOTSUPP;
91f9943e1c7b663 Christoph Hellwig 2017-08-29  2089  =

b812ce28796f746 Josef Bacik       2012-11-16  2090  	if (sync)
b812ce28796f746 Josef Bacik       2012-11-16  2091  		atomic_inc(&BTRFS_I(i=
node)->sync_writers);
b812ce28796f746 Josef Bacik       2012-11-16  2092  =

2ba48ce513c4e54 Al Viro           2015-04-09  2093  	if (iocb->ki_flags & I=
OCB_DIRECT) {
09745ff88d93537 Josef Bacik       2020-09-03  2094  		/*
09745ff88d93537 Josef Bacik       2020-09-03  2095  		 * 1. We must always =
clear IOCB_DSYNC in order to not deadlock
09745ff88d93537 Josef Bacik       2020-09-03  2096  		 *    in iomap, as it=
 calls generic_write_sync() in this case.
09745ff88d93537 Josef Bacik       2020-09-03  2097  		 * 2. If we are async=
, we can call iomap_dio_complete() either
09745ff88d93537 Josef Bacik       2020-09-03  2098  		 *    in
09745ff88d93537 Josef Bacik       2020-09-03  2099  		 *
09745ff88d93537 Josef Bacik       2020-09-03  2100  		 *    2.1. A worker t=
hread from the last bio completed.  In this
09745ff88d93537 Josef Bacik       2020-09-03  2101  		 *	   case we need to=
 mark the btrfs_dio_data that it is
09745ff88d93537 Josef Bacik       2020-09-03  2102  		 *	   async in order =
to call generic_write_sync() properly.
09745ff88d93537 Josef Bacik       2020-09-03  2103  		 *	   This is handled=
 by setting BTRFS_DIO_SYNC_STUB in the
09745ff88d93537 Josef Bacik       2020-09-03  2104  		 *	   current->journa=
l_info.
09745ff88d93537 Josef Bacik       2020-09-03  2105  		 *    2.2  The submit=
ter context, because all IO completed
09745ff88d93537 Josef Bacik       2020-09-03  2106  		 *         before we =
exited iomap_dio_rw().  In this case we can
09745ff88d93537 Josef Bacik       2020-09-03  2107  		 *         just re-se=
t the IOCB_DSYNC on the iocb and we'll do
09745ff88d93537 Josef Bacik       2020-09-03  2108  		 *         the sync b=
elow.  If our ->end_io() gets called and
09745ff88d93537 Josef Bacik       2020-09-03  2109  		 *         current->j=
ournal_info is set, then we know we're in
09745ff88d93537 Josef Bacik       2020-09-03  2110  		 *         our curren=
t context and we will clear
09745ff88d93537 Josef Bacik       2020-09-03  2111  		 *         current->j=
ournal_info to indicate that we need to
09745ff88d93537 Josef Bacik       2020-09-03  2112  		 *         sync below.
09745ff88d93537 Josef Bacik       2020-09-03  2113  		 */
09745ff88d93537 Josef Bacik       2020-09-03  2114  		if (sync) {
09745ff88d93537 Josef Bacik       2020-09-03  2115  			ASSERT(current->jour=
nal_info =3D=3D NULL);
09745ff88d93537 Josef Bacik       2020-09-03  2116  			iocb->ki_flags &=3D =
~IOCB_DSYNC;
09745ff88d93537 Josef Bacik       2020-09-03  2117  			current->journal_inf=
o =3D BTRFS_DIO_SYNC_STUB;
09745ff88d93537 Josef Bacik       2020-09-03  2118  		}
96640a0da7ea888 Goldwyn Rodrigues 2020-09-16  2119  		num_written =3D btrfs=
_direct_write(iocb, from);
09745ff88d93537 Josef Bacik       2020-09-03  2120  =

09745ff88d93537 Josef Bacik       2020-09-03  2121  		/*
09745ff88d93537 Josef Bacik       2020-09-03  2122  		 * As stated above, w=
e cleared journal_info, so we need to do
09745ff88d93537 Josef Bacik       2020-09-03  2123  		 * the sync ourselves.
09745ff88d93537 Josef Bacik       2020-09-03  2124  		 */
09745ff88d93537 Josef Bacik       2020-09-03  2125  		if (sync && current->=
journal_info =3D=3D NULL)
09745ff88d93537 Josef Bacik       2020-09-03  2126  			iocb->ki_flags |=3D =
IOCB_DSYNC;
09745ff88d93537 Josef Bacik       2020-09-03  2127  		current->journal_info=
 =3D NULL;
d0215f3e5ebb580 Josef Bacik       2011-01-25  2128  	} else {
e4af400a9c5081e Goldwyn Rodrigues 2018-06-17  2129  		num_written =3D btrfs=
_buffered_write(iocb, from);
d0215f3e5ebb580 Josef Bacik       2011-01-25  2130  	}
d0215f3e5ebb580 Josef Bacik       2011-01-25  2131  =

5a3f23d515a2ebf Chris Mason       2009-03-31  2132  	/*
6c760c072403f44 Josef Bacik       2012-11-09  2133  	 * We also have to set=
 last_sub_trans to the current log transid,
6c760c072403f44 Josef Bacik       2012-11-09  2134  	 * otherwise subsequen=
t syncs to a file that's been synced in this
bb7ab3b92e46da0 Adam Buchbinder   2016-03-04  2135  	 * transaction will ap=
pear to have already occurred.
5a3f23d515a2ebf Chris Mason       2009-03-31  2136  	 */
2f2ff0ee5e4303e Filipe Manana     2015-03-20  2137  	spin_lock(&BTRFS_I(ino=
de)->lock);
6c760c072403f44 Josef Bacik       2012-11-09  2138  	BTRFS_I(inode)->last_s=
ub_trans =3D root->log_transid;
2f2ff0ee5e4303e Filipe Manana     2015-03-20  2139  	spin_unlock(&BTRFS_I(i=
node)->lock);
e259221763a4040 Christoph Hellwig 2016-04-07  2140  	if (num_written > 0)
e259221763a4040 Christoph Hellwig 2016-04-07  2141  		num_written =3D gener=
ic_write_sync(iocb, num_written);
0a3404dcff29a75 Miao Xie          2013-01-28  2142  =

b812ce28796f746 Josef Bacik       2012-11-16  2143  	if (sync)
b812ce28796f746 Josef Bacik       2012-11-16  2144  		atomic_dec(&BTRFS_I(i=
node)->sync_writers);
7a234e28f0877c8 Goldwyn Rodrigues 2020-09-16  2145  =

39279cc3d2704cf Chris Mason       2007-06-12  2146  	current->backing_dev_i=
nfo =3D NULL;
39279cc3d2704cf Chris Mason       2007-06-12 @2147  	return num_written ? n=
um_written : err;
39279cc3d2704cf Chris Mason       2007-06-12  2148  }
39279cc3d2704cf Chris Mason       2007-06-12  2149  =


:::::: The code at line 2075 was first introduced by commit
:::::: 3309dd04cbcd2cdad168485af5cf3576b5051e49 switch generic_write_checks=
() to iocb and iter

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8652329694139462176==--

