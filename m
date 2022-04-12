Content-Type: multipart/mixed; boundary="===============6959675815514990749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [trondmy-nfs-2.6:testing 107/109] fs/nfs/file.c:679 nfs_file_write() error: uninitialized symbol 'written'.
Date: Tue, 12 Apr 2022 21:12:36 +0800
Message-ID: <202204122125.n4b4u3oe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6959675815514990749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   b9d284d92b8b0f614c96193391741893d3680c89
commit: bf5e5c86c50f9dbbda976beb6d59bfac31302f5e [107/109] NFS: Don't repor=
t ENOSPC write errors twice
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220412/202204122125.n4b4u3oe-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/nfs/file.c:679 nfs_file_write() error: uninitialized symbol 'written'.

vim +/written +679 fs/nfs/file.c

94387fb1aa16ee Trond Myklebust    2007-07-22  600  =

edaf43694898c5 Al Viro            2014-04-03  601  ssize_t nfs_file_write(s=
truct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 Linus Torvalds     2005-04-16  602  {
6de1472f1a4a3b Al Viro            2013-09-16  603  	struct file *file =3D i=
ocb->ki_filp;
6de1472f1a4a3b Al Viro            2013-09-16  604  	struct inode *inode =3D=
 file_inode(file);
ed7bcdb374d20f Trond Myklebust    2021-02-12  605  	unsigned int mntflags =
=3D NFS_SERVER(inode)->flags;
ed7bcdb374d20f Trond Myklebust    2021-02-12  606  	ssize_t result, written;
ce368536dd6144 Scott Mayhew       2020-08-01  607  	errseq_t since;
ce368536dd6144 Scott Mayhew       2020-08-01  608  	int error;
^1da177e4c3f41 Linus Torvalds     2005-04-16  609  =

6de1472f1a4a3b Al Viro            2013-09-16  610  	result =3D nfs_key_time=
out_notify(file, inode);
dc24826bfca8d7 Andy Adamson       2013-08-14  611  	if (result)
dc24826bfca8d7 Andy Adamson       2013-08-14  612  		return result;
dc24826bfca8d7 Andy Adamson       2013-08-14  613  =

89698b24d24f9c Trond Myklebust    2016-06-23  614  	if (iocb->ki_flags & IO=
CB_DIRECT)
64158668ac8b31 NeilBrown          2022-03-07  615  		return nfs_file_direct=
_write(iocb, from, false);
^1da177e4c3f41 Linus Torvalds     2005-04-16  616  =

619d30b4b8c488 Al Viro            2014-03-04  617  	dprintk("NFS: write(%pD=
2, %zu@%Ld)\n",
18290650b1c865 Trond Myklebust    2016-06-23  618  		file, iov_iter_count(f=
rom), (long long) iocb->ki_pos);
^1da177e4c3f41 Linus Torvalds     2005-04-16  619  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  620  	if (IS_SWAPFILE(inode))
^1da177e4c3f41 Linus Torvalds     2005-04-16  621  		goto out_swapfile;
7d52e86274e09f Trond Myklebust    2005-06-22  622  	/*
7d52e86274e09f Trond Myklebust    2005-06-22  623  	 * O_APPEND implies tha=
t we must revalidate the file length.
7d52e86274e09f Trond Myklebust    2005-06-22  624  	 */
fc9dc401899ab2 Trond Myklebust    2021-02-08  625  	if (iocb->ki_flags & IO=
CB_APPEND || iocb->ki_pos > i_size_read(inode)) {
6de1472f1a4a3b Al Viro            2013-09-16  626  		result =3D nfs_revalid=
ate_file_size(inode, file);
^1da177e4c3f41 Linus Torvalds     2005-04-16  627  		if (result)
bf5e5c86c50f9d Trond Myklebust    2022-04-09  628  			return result;
fe51beecc55d0b Trond Myklebust    2005-06-22  629  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  630  =

28aa2f9e73e762 Trond Myklebust    2021-02-08  631  	nfs_clear_invalid_mappi=
ng(file->f_mapping);
28aa2f9e73e762 Trond Myklebust    2021-02-08  632  =

ce368536dd6144 Scott Mayhew       2020-08-01  633  	since =3D filemap_sampl=
e_wb_err(file->f_mapping);
a5864c999de670 Trond Myklebust    2016-06-03  634  	nfs_start_io_write(inod=
e);
18290650b1c865 Trond Myklebust    2016-06-23  635  	result =3D generic_writ=
e_checks(iocb, from);
18290650b1c865 Trond Myklebust    2016-06-23  636  	if (result > 0) {
18290650b1c865 Trond Myklebust    2016-06-23  637  		current->backing_dev_i=
nfo =3D inode_to_bdi(inode);
18290650b1c865 Trond Myklebust    2016-06-23  638  		result =3D generic_per=
form_write(file, from, iocb->ki_pos);
18290650b1c865 Trond Myklebust    2016-06-23  639  		current->backing_dev_i=
nfo =3D NULL;
18290650b1c865 Trond Myklebust    2016-06-23  640  	}
a5864c999de670 Trond Myklebust    2016-06-03  641  	nfs_end_io_write(inode);
18290650b1c865 Trond Myklebust    2016-06-23  642  	if (result <=3D 0)
^1da177e4c3f41 Linus Torvalds     2005-04-16  643  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  644  =

c49edecd513693 Trond Myklebust    2016-09-03  645  	written =3D result;
18290650b1c865 Trond Myklebust    2016-06-23  646  	iocb->ki_pos +=3D writt=
en;
ed7bcdb374d20f Trond Myklebust    2021-02-12  647  =

ed7bcdb374d20f Trond Myklebust    2021-02-12  648  	if (mntflags & NFS_MOUN=
T_WRITE_EAGER) {
ed7bcdb374d20f Trond Myklebust    2021-02-12  649  		result =3D filemap_fda=
tawrite_range(file->f_mapping,
ed7bcdb374d20f Trond Myklebust    2021-02-12  650  						  iocb->ki_pos - w=
ritten,
ed7bcdb374d20f Trond Myklebust    2021-02-12  651  						  iocb->ki_pos - 1=
);
ed7bcdb374d20f Trond Myklebust    2021-02-12  652  		if (result < 0)
ed7bcdb374d20f Trond Myklebust    2021-02-12  653  			goto out;
ed7bcdb374d20f Trond Myklebust    2021-02-12  654  	}
ed7bcdb374d20f Trond Myklebust    2021-02-12  655  	if (mntflags & NFS_MOUN=
T_WRITE_WAIT) {
ed7bcdb374d20f Trond Myklebust    2021-02-12  656  		result =3D filemap_fda=
tawait_range(file->f_mapping,
ed7bcdb374d20f Trond Myklebust    2021-02-12  657  						 iocb->ki_pos - wr=
itten,
ed7bcdb374d20f Trond Myklebust    2021-02-12  658  						 iocb->ki_pos - 1);
ed7bcdb374d20f Trond Myklebust    2021-02-12  659  		if (result < 0)
ed7bcdb374d20f Trond Myklebust    2021-02-12  660  			goto out;
ed7bcdb374d20f Trond Myklebust    2021-02-12  661  	}
e973b1a5999e57 tarangg(a)amazon.com 2017-09-07  662  	result =3D generic_wr=
ite_sync(iocb, written);
e973b1a5999e57 tarangg@amazon.com 2017-09-07  663  	if (result < 0)
bf5e5c86c50f9d Trond Myklebust    2022-04-09  664  		return result;
bf5e5c86c50f9d Trond Myklebust    2022-04-09  665  out:
7e94d6c4ab6956 Trond Myklebust    2015-08-17  666  	/* Return error values =
*/
ce368536dd6144 Scott Mayhew       2020-08-01  667  	error =3D filemap_check=
_wb_err(file->f_mapping, since);
bf5e5c86c50f9d Trond Myklebust    2022-04-09  668  	switch (error) {
bf5e5c86c50f9d Trond Myklebust    2022-04-09  669  	default:
bf5e5c86c50f9d Trond Myklebust    2022-04-09  670  		break;
bf5e5c86c50f9d Trond Myklebust    2022-04-09  671  	case -EDQUOT:
bf5e5c86c50f9d Trond Myklebust    2022-04-09  672  	case -EFBIG:
bf5e5c86c50f9d Trond Myklebust    2022-04-09  673  	case -ENOSPC:
bf5e5c86c50f9d Trond Myklebust    2022-04-09  674  		nfs_wb_all(inode);
bf5e5c86c50f9d Trond Myklebust    2022-04-09  675  		error =3D file_check_a=
nd_advance_wb_err(file);
bf5e5c86c50f9d Trond Myklebust    2022-04-09  676  		if (error < 0)
bf5e5c86c50f9d Trond Myklebust    2022-04-09  677  			result =3D error;
200baa2112012d Trond Myklebust    2006-12-05  678  	}
7e381172cf6e02 Chuck Lever        2010-02-01 @679  	nfs_add_stats(inode, NF=
SIOS_NORMALWRITTENBYTES, written);
^1da177e4c3f41 Linus Torvalds     2005-04-16  680  	return result;
^1da177e4c3f41 Linus Torvalds     2005-04-16  681  =

^1da177e4c3f41 Linus Torvalds     2005-04-16  682  out_swapfile:
^1da177e4c3f41 Linus Torvalds     2005-04-16  683  	printk(KERN_INFO "NFS: =
attempt to write to active swap file!\n");
89658c4d04c766 Anna Schumaker     2019-11-08  684  	return -ETXTBSY;
^1da177e4c3f41 Linus Torvalds     2005-04-16  685  }
89d77c8fa8e6d1 Bryan Schumaker    2012-07-30  686  EXPORT_SYMBOL_GPL(nfs_fi=
le_write);
^1da177e4c3f41 Linus Torvalds     2005-04-16  687  =


:::::: The code@line 679 was first introduced by commit
:::::: 7e381172cf6e0282a56374e50667515aed55166a NFS: Improve NFS iostat byt=
e count accuracy for writes

:::::: TO: Chuck Lever <chuck.lever@oracle.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6959675815514990749==--

