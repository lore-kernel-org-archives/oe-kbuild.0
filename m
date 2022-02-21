Content-Type: multipart/mixed; boundary="===============6547530318489995861=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-4.9 28/31] fs/nfs/inode.c:693:1: sparse: sparse: unused label 'out'
Date: Mon, 21 Feb 2022 16:40:06 +0800
Message-ID: <202202211634.vMS60QYe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6547530318489995861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-4.9
head:   4b5a13c7c300502dc61385a0a6858c1d747884ec
commit: 3975f55d867b6d3061405f787ff1cd6034a5b90b [28/31] NFS: Do not report=
 writeback errors in nfs_getattr()
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-s001-20220221 (https://download.01.org/0day-ci/arch=
ive/20220221/202202211634.vMS60QYe-lkp(a)intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3D3975f55d867b6d3061405f787ff1cd6034a5b90b
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/k=
ernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.9
        git checkout 3975f55d867b6d3061405f787ff1cd6034a5b90b
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash fs/nfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/nfs/inode.c:693:1: sparse: sparse: unused label 'out'
   fs/nfs/inode.c: In function 'nfs_getattr':
   fs/nfs/inode.c:693:1: warning: label 'out' defined but not used [-Wunuse=
d-label]
    out:
    ^~~

vim +/out +693 fs/nfs/inode.c

311324ad171366 Trond Myklebust   2014-02-07  655  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  656  int nfs_getattr(struct vf=
smount *mnt, struct dentry *dentry, struct kstat *stat)
^1da177e4c3f41 Linus Torvalds    2005-04-16  657  {
2b0143b5c986be David Howells     2015-03-17  658  	struct inode *inode =3D =
d_inode(dentry);
5529680981807b Chuck Lever       2005-08-18  659  	int need_atime =3D NFS_I=
(inode)->cache_validity & NFS_INO_INVALID_ATIME;
16caf5b6101d03 Jan Kara          2014-10-23  660  	int err =3D 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  661  =

f4ce1299b329e9 Trond Myklebust   2013-08-19  662  	trace_nfs_getattr_enter(=
inode);
acdc53b2146c7e Trond Myklebust   2010-02-19  663  	/* Flush out writes to t=
he server in order to update c/mtime.  */
3975f55d867b6d Trond Myklebust   2022-02-15  664  	if (S_ISREG(inode->i_mod=
e))
3975f55d867b6d Trond Myklebust   2022-02-15  665  		filemap_write_and_wait(=
inode->i_mapping);
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  666  =

fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  667  	/*
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  668  	 * We may force a getatt=
r if the user cares about atime.
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  669  	 *
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  670  	 * Note that we only hav=
e to check the vfsmount flags here:
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  671  	 *  - NFS always sets S_=
NOATIME by so checking it would give a
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  672  	 *    bogus result
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  673  	 *  - NFS never sets MS_=
NOATIME or MS_NODIRATIME so there is
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  674  	 *    no point in checki=
ng those.
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  675  	 */
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  676   	if ((mnt->mnt_flags & M=
NT_NOATIME) ||
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  677   	    ((mnt->mnt_flags & =
MNT_NODIRATIME) && S_ISDIR(inode->i_mode)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  678  		need_atime =3D 0;
fc33a7bb9c6dd8 Christoph Hellwig 2006-01-09  679  =

311324ad171366 Trond Myklebust   2014-02-07  680  	if (need_atime || nfs_ne=
ed_revalidate_inode(inode)) {
311324ad171366 Trond Myklebust   2014-02-07  681  		struct nfs_server *serv=
er =3D NFS_SERVER(inode);
311324ad171366 Trond Myklebust   2014-02-07  682  =

311324ad171366 Trond Myklebust   2014-02-07  683  		if (server->caps & NFS_=
CAP_READDIRPLUS)
311324ad171366 Trond Myklebust   2014-02-07  684  			nfs_request_parent_use=
_readdirplus(dentry);
311324ad171366 Trond Myklebust   2014-02-07  685  		err =3D __nfs_revalidat=
e_inode(server, inode);
311324ad171366 Trond Myklebust   2014-02-07  686  	}
4e769b934e7638 Peter Staubach    2007-08-03  687  	if (!err) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  688  		generic_fillattr(inode,=
 stat);
f43bf0bebed7c3 Trond Myklebust   2007-10-09  689  		stat->ino =3D nfs_compa=
t_user_ino64(NFS_FILEID(inode));
7ef5ca4fe41e6a NeilBrown         2015-05-08  690  		if (S_ISDIR(inode->i_mo=
de))
7ef5ca4fe41e6a NeilBrown         2015-05-08  691  			stat->blksize =3D NFS_=
SERVER(inode)->dtsize;
4e769b934e7638 Peter Staubach    2007-08-03  692  	}
acdc53b2146c7e Trond Myklebust   2010-02-19 @693  out:
f4ce1299b329e9 Trond Myklebust   2013-08-19  694  	trace_nfs_getattr_exit(i=
node, err);
^1da177e4c3f41 Linus Torvalds    2005-04-16  695  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  696  }
ddda8e0aa8b955 Bryan Schumaker   2012-07-30  697  EXPORT_SYMBOL_GPL(nfs_get=
attr);
^1da177e4c3f41 Linus Torvalds    2005-04-16  698  =


:::::: The code at line 693 was first introduced by commit
:::::: acdc53b2146c7ee67feb1f02f7bc3020126514b8 NFS: Replace __nfs_write_ma=
pping with sync_inode()

:::::: TO: Trond Myklebust <Trond.Myklebust@netapp.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6547530318489995861==--

