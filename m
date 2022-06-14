Content-Type: multipart/mixed; boundary="===============2494224146320481750=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 01/12] VFS: support parallel updates in the one directory.
Date: Wed, 15 Jun 2022 01:47:50 +0800
Message-ID: <202206150106.UQt97GFW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2494224146320481750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <165516230195.21248.5682920287666811819.stgit@noble.brown>
References: <165516230195.21248.5682920287666811819.stgit@noble.brown>
TO: NeilBrown <neilb@suse.de>
TO: Al Viro <viro@zeniv.linux.org.uk>
TO: Daire Byrne <daire@dneg.com>
TO: Trond Myklebust <trond.myklebust@hammerspace.com>
TO: Chuck Lever <chuck.lever@oracle.com>
CC: Linux NFS Mailing List <linux-nfs@vger.kernel.org>
CC: linux-fsdevel(a)vger.kernel.org
CC: LKML <linux-kernel@vger.kernel.org>

Hi NeilBrown,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc2 next-20220614]
[cannot apply to trondmy-nfs/linux-next viro-vfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/Allow-conc=
urrent-directory-updates/20220614-072355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021-20220613 (https://download.01.org/0day-ci/arch=
ive/20220615/202206150106.UQt97GFW-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/namei.c:1663 lookup_hash_update() warn: inconsistent returns '&dir->i_rw=
sem'.

Old smatch warnings:
fs/namei.c:1571 lookup_dcache() warn: passing zero to 'ERR_PTR'
fs/namei.c:1756 lookup_fast() warn: passing zero to 'ERR_PTR'
fs/namei.c:2284 hash_name() error: uninitialized symbol 'bdata'.
fs/namei.c:2685 __kern_path_locked() warn: inconsistent returns '&path->den=
try->d_inode->i_rwsem'.
fs/namei.c:3586 open_last_lookups() error: uninitialized symbol 'inode'.
fs/namei.c:3586 open_last_lookups() error: uninitialized symbol 'seq'.

vim +1663 fs/namei.c

a32555466caee3 Al Viro   2012-03-30  1618  =

5af00285eef74d NeilBrown 2022-06-14  1619  /*
5af00285eef74d NeilBrown 2022-06-14  1620   * Parent directory (base) is no=
t locked.  We take either an exclusive
5af00285eef74d NeilBrown 2022-06-14  1621   * or shared lock depending on t=
he fs preference, then do a lookup,
5af00285eef74d NeilBrown 2022-06-14  1622   * and then set the DCACHE_PAR_U=
PDATE bit on the child if a shared lock
5af00285eef74d NeilBrown 2022-06-14  1623   * was taken on the parent.
5af00285eef74d NeilBrown 2022-06-14  1624   */
5af00285eef74d NeilBrown 2022-06-14  1625  static struct dentry *lookup_has=
h_update(const struct qstr *name,
5af00285eef74d NeilBrown 2022-06-14  1626  					 struct dentry *base, unsig=
ned int flags,
5af00285eef74d NeilBrown 2022-06-14  1627  					 wait_queue_head_t *wq)
5af00285eef74d NeilBrown 2022-06-14  1628  {
5af00285eef74d NeilBrown 2022-06-14  1629  	struct dentry *dentry;
5af00285eef74d NeilBrown 2022-06-14  1630  	struct inode *dir =3D base->d_i=
node;
5af00285eef74d NeilBrown 2022-06-14  1631  	int err;
5af00285eef74d NeilBrown 2022-06-14  1632  =

5af00285eef74d NeilBrown 2022-06-14  1633  	if (!(dir->i_flags & S_PAR_UPDA=
TE))
5af00285eef74d NeilBrown 2022-06-14  1634  		wq =3D NULL;
5af00285eef74d NeilBrown 2022-06-14  1635  =

5af00285eef74d NeilBrown 2022-06-14  1636  	if (wq)
5af00285eef74d NeilBrown 2022-06-14  1637  		inode_lock_shared_nested(dir, =
I_MUTEX_PARENT);
5af00285eef74d NeilBrown 2022-06-14  1638  	else
5af00285eef74d NeilBrown 2022-06-14  1639  		inode_lock_nested(dir, I_MUTEX=
_PARENT);
5af00285eef74d NeilBrown 2022-06-14  1640  =

5af00285eef74d NeilBrown 2022-06-14  1641  retry:
5af00285eef74d NeilBrown 2022-06-14  1642  	dentry =3D __lookup_hash(name, =
base, flags, wq);
5af00285eef74d NeilBrown 2022-06-14  1643  	if (IS_ERR(dentry)) {
5af00285eef74d NeilBrown 2022-06-14  1644  		err =3D PTR_ERR(dentry);
5af00285eef74d NeilBrown 2022-06-14  1645  		goto out_err;
5af00285eef74d NeilBrown 2022-06-14  1646  	}
5af00285eef74d NeilBrown 2022-06-14  1647  	if (wq && !d_lock_update(dentry=
, base, name)) {
5af00285eef74d NeilBrown 2022-06-14  1648  		/*
5af00285eef74d NeilBrown 2022-06-14  1649  		 * Failed to get lock due to r=
ace with unlink or rename
5af00285eef74d NeilBrown 2022-06-14  1650  		 * - try again
5af00285eef74d NeilBrown 2022-06-14  1651  		 */
5af00285eef74d NeilBrown 2022-06-14  1652  		d_lookup_done(dentry);
5af00285eef74d NeilBrown 2022-06-14  1653  		dput(dentry);
5af00285eef74d NeilBrown 2022-06-14  1654  		goto retry;
5af00285eef74d NeilBrown 2022-06-14  1655  	}
5af00285eef74d NeilBrown 2022-06-14  1656  	return dentry;
5af00285eef74d NeilBrown 2022-06-14  1657  =

5af00285eef74d NeilBrown 2022-06-14  1658  out_err:
5af00285eef74d NeilBrown 2022-06-14  1659  	if (wq)
5af00285eef74d NeilBrown 2022-06-14  1660  		inode_unlock_shared(dir);
5af00285eef74d NeilBrown 2022-06-14  1661  	else
5af00285eef74d NeilBrown 2022-06-14  1662  		inode_unlock(dir);
5af00285eef74d NeilBrown 2022-06-14 @1663  	return ERR_PTR(err);
5af00285eef74d NeilBrown 2022-06-14  1664  }
5af00285eef74d NeilBrown 2022-06-14  1665  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2494224146320481750==--

