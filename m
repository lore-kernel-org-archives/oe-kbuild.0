Content-Type: multipart/mixed; boundary="===============2478492843328290063=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] btrfs: Make btrfs_direct_write atomic with respect to inode_lock
Date: Wed, 30 Dec 2020 00:03:32 +0800
Message-ID: <202012292314.O3QIepCn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2478492843328290063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <8846c296bcd4d5d3c21c6a98ee467ab5060c6757.1608307404.git.rgold=
wyn@suse.com>
References: <8846c296bcd4d5d3c21c6a98ee467ab5060c6757.1608307404.git.rgoldw=
yn@suse.com>
TO: Goldwyn Rodrigues <rgoldwyn@suse.de>
TO: linux-btrfs(a)vger.kernel.org
CC: Goldwyn Rodrigues <rgoldwyn@suse.com>

Hi Goldwyn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.11-rc1 next-20201223]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Goldwyn-Rodrigues/btrfs-Ma=
ke-btrfs_direct_write-atomic-with-respect-to-inode_lock/20201219-001114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-m001-20201229 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/file.c:1980 btrfs_direct_write() error: uninitialized symbol 'dsyn=
c'.

Old smatch warnings:
fs/btrfs/file.c:1865 __btrfs_buffered_write() error: uninitialized symbol '=
ret'.
fs/btrfs/file.c:2013 btrfs_direct_write() error: uninitialized symbol 'dsyn=
c'.

vim +/dsync +1980 fs/btrfs/file.c

4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1909  =

4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1910  static ssize_t btrfs_d=
irect_write(struct kiocb *iocb, struct iov_iter *from)
d0215f3e5ebb580 Josef Bacik        2011-01-25  1911  {
d0215f3e5ebb580 Josef Bacik        2011-01-25  1912  	struct file *file =3D=
 iocb->ki_filp;
728404dacfddb53 Filipe Manana      2014-10-10  1913  	struct inode *inode =
=3D file_inode(file);
4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1914  	struct btrfs_fs_info =
*fs_info =3D btrfs_sb(inode->i_sb);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1915  	loff_t pos;
4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1916  	ssize_t written =3D 0;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1917  	ssize_t written_buffe=
red;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1918  	loff_t endbyte;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1919  	ssize_t err;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1920  	unsigned int ilock_fl=
ags =3D 0;
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1921  	struct iomap_dio *dio=
 =3D NULL;
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1922  	bool dsync;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1923  =

c352370633400d1 Goldwyn Rodrigues  2020-09-24  1924  	if (iocb->ki_flags & =
IOCB_NOWAIT)
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1925  		ilock_flags |=3D BTR=
FS_ILOCK_TRY;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1926  =

e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1927  	/* If the write DIO i=
s within EOF, use a shared lock */
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1928  	if (iocb->ki_pos + io=
v_iter_count(from) <=3D i_size_read(inode))
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1929  		ilock_flags |=3D BTR=
FS_ILOCK_SHARED;
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1930  =

e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1931  relock:
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1932  	err =3D btrfs_inode_l=
ock(inode, ilock_flags);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1933  	if (err < 0)
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1934  		return err;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1935  =

c352370633400d1 Goldwyn Rodrigues  2020-09-24  1936  	err =3D generic_write=
_checks(iocb, from);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1937  	if (err <=3D 0) {
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1938  		btrfs_inode_unlock(i=
node, ilock_flags);
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1939  		return err;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1940  	}
d0215f3e5ebb580 Josef Bacik        2011-01-25  1941  =

c352370633400d1 Goldwyn Rodrigues  2020-09-24  1942  	err =3D btrfs_write_c=
heck(iocb, from, err);
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1943  	if (err < 0)
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1944  		goto out;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1945  =

c352370633400d1 Goldwyn Rodrigues  2020-09-24  1946  	pos =3D iocb->ki_pos;
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1947  	/*
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1948  	 * Re-check since fil=
e size may have changed just before taking the
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1949  	 * lock or pos may ha=
ve changed because of O_APPEND in generic_write_check()
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1950  	 */
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1951  	if ((ilock_flags & BT=
RFS_ILOCK_SHARED) &&
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1952  	    pos + iov_iter_co=
unt(from) > i_size_read(inode)) {
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1953  		btrfs_inode_unlock(i=
node, ilock_flags);
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1954  		ilock_flags &=3D ~BT=
RFS_ILOCK_SHARED;
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1955  		goto relock;
e9adabb9712ef94 Goldwyn Rodrigues  2020-09-24  1956  	}
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1957  =

e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1958  	if (check_direct_IO(f=
s_info, from, pos))
4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1959  		goto buffered;
4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1960  =

a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1961  	dio =3D __iomap_dio_r=
w(iocb, from, &btrfs_dio_iomap_ops,
4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1962  			     &btrfs_dio_ops=
, is_sync_kiocb(iocb));
4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1963  =

d0215f3e5ebb580 Josef Bacik        2011-01-25  1964  =

a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1965  	if (IS_ERR_OR_NULL(di=
o)) {
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1966  		err =3D PTR_ERR_OR_Z=
ERO(dio);
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1967  		if (err < 0 && err !=
=3D -ENOTBLK)
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1968  			goto out;
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1969  	} else {
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1970  		/*
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1971  		 * Remove the DSYNC =
flag because iomap_dio_complete() calls
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1972  		 * generic_write_syn=
c() which may deadlock with btrfs_sync()
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1973  		 * on inode->i_rwsem
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1974  		 */
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1975  		if (iocb->ki_flags &=
 IOCB_DSYNC) {
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1976  			dsync =3D true;
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1977  			iocb->ki_flags &=3D=
 ~IOCB_DSYNC;
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1978  		}
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1979  		written =3D iomap_di=
o_complete(dio);
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18 @1980  		if (dsync)
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1981  			iocb->ki_flags |=3D=
 IOCB_DSYNC;
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1982  	}
a42fa643169d232 Goldwyn Rodrigues  2020-09-24  1983  =

c352370633400d1 Goldwyn Rodrigues  2020-09-24  1984  	if (written < 0 || !i=
ov_iter_count(from)) {
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1985  		err =3D written;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1986  		goto out;
c352370633400d1 Goldwyn Rodrigues  2020-09-24  1987  	}
d0215f3e5ebb580 Josef Bacik        2011-01-25  1988  =

4e4cabece9f9c6b Goldwyn Rodrigues  2020-09-24  1989  buffered:
e4af400a9c5081e Goldwyn Rodrigues  2018-06-17  1990  	pos =3D iocb->ki_pos;
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  1991  	written_buffered =3D =
__btrfs_buffered_write(iocb, from);
d0215f3e5ebb580 Josef Bacik        2011-01-25  1992  	if (written_buffered =
< 0) {
d0215f3e5ebb580 Josef Bacik        2011-01-25  1993  		err =3D written_buff=
ered;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1994  		goto out;
d0215f3e5ebb580 Josef Bacik        2011-01-25  1995  	}
075bdbdbe9f21d6 Filipe Manana      2014-10-09  1996  	/*
075bdbdbe9f21d6 Filipe Manana      2014-10-09  1997  	 * Ensure all data is=
 persisted. We want the next direct IO read to be
075bdbdbe9f21d6 Filipe Manana      2014-10-09  1998  	 * able to read what =
was just written.
075bdbdbe9f21d6 Filipe Manana      2014-10-09  1999  	 */
d0215f3e5ebb580 Josef Bacik        2011-01-25  2000  	endbyte =3D pos + wri=
tten_buffered - 1;
728404dacfddb53 Filipe Manana      2014-10-10  2001  	err =3D btrfs_fdatawr=
ite_range(inode, pos, endbyte);
075bdbdbe9f21d6 Filipe Manana      2014-10-09  2002  	if (err)
075bdbdbe9f21d6 Filipe Manana      2014-10-09  2003  		goto out;
728404dacfddb53 Filipe Manana      2014-10-10  2004  	err =3D filemap_fdata=
wait_range(inode->i_mapping, pos, endbyte);
d0215f3e5ebb580 Josef Bacik        2011-01-25  2005  	if (err)
d0215f3e5ebb580 Josef Bacik        2011-01-25  2006  		goto out;
d0215f3e5ebb580 Josef Bacik        2011-01-25  2007  	written +=3D written_=
buffered;
867c4f9329e1bf7 Al Viro            2014-02-11  2008  	iocb->ki_pos =3D pos =
+ written_buffered;
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  2009  	invalidate_mapping_pa=
ges(file->f_mapping, pos >> PAGE_SHIFT,
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  2010  				 endbyte >> PAGE_S=
HIFT);
39279cc3d2704cf Chris Mason        2007-06-12  2011  out:
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  2012  	btrfs_inode_unlock(in=
ode, ilock_flags);
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  2013  	if (written > 0 && ds=
ync)
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  2014  		generic_write_sync(i=
ocb, written);
e7a8dd2d9537a7e Goldwyn Rodrigues  2020-12-18  2015  =

d0215f3e5ebb580 Josef Bacik        2011-01-25  2016  	return written ? writ=
ten : err;
d0215f3e5ebb580 Josef Bacik        2011-01-25  2017  }
d0215f3e5ebb580 Josef Bacik        2011-01-25  2018  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2478492843328290063==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
7bLd/C9FDILiQXUCAA==
--===============2478492843328290063==--

