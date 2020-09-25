Content-Type: multipart/mixed; boundary="===============8178577923340559555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/afs/dir.c:839:20: warning: Variable 'dentry->d_fsdata' is reassigned a value before the old one has been used.
Date: Fri, 25 Sep 2020 12:33:29 +0800
Message-ID: <202009251222.0s8BIdY8%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8178577923340559555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   171d4ff79f965c1f164705ef0aaea102a6ad238b
commit: e49c7b2f6de7ff81ca34c56e4eeb4fa740c099f2 afs: Build an abstraction =
around an "operation" concept
date:   4 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/afs/dir.c:839:20: warning: Variable 'dentry->d_fsdata' is reassigned =
a value before the old one has been used. [redundantAssignment]
     dentry->d_fsdata =3D (void *)(unsigned long)op->file[0].scb.status.dat=
a_version;
                      ^
   fs/afs/dir.c:753:19: note: Variable 'dentry->d_fsdata' is reassigned a v=
alue before the old one has been used.
    dentry->d_fsdata =3D (void *)(unsigned long)data_version;
                     ^
   fs/afs/dir.c:839:20: note: Variable 'dentry->d_fsdata' is reassigned a v=
alue before the old one has been used.
     dentry->d_fsdata =3D (void *)(unsigned long)op->file[0].scb.status.dat=
a_version;
                      ^
>> fs/afs/dir.c:842:6: warning: Variable 'ret' is reassigned a value before=
 the old one has been used. [redundantAssignment]
    ret =3D afs_put_operation(op);
        ^
   fs/afs/dir.c:755:6: note: Variable 'ret' is reassigned a value before th=
e old one has been used.
    ret =3D -ENOENT;
        ^
   fs/afs/dir.c:842:6: note: Variable 'ret' is reassigned a value before th=
e old one has been used.
    ret =3D afs_put_operation(op);
        ^
   fs/afs/dir.c:896:6: warning: Variable 'ret' is reassigned a value before=
 the old one has been used. [redundantAssignment]
    ret =3D NULL;
        ^
   fs/afs/dir.c:863:6: note: Variable 'ret' is reassigned a value before th=
e old one has been used.
    ret =3D ERR_PTR(-ENOMEM);
        ^
   fs/afs/dir.c:896:6: note: Variable 'ret' is reassigned a value before th=
e old one has been used.
    ret =3D NULL;
        ^
   fs/afs/dir.c:1693:6: warning: Variable 'ret' is reassigned a value befor=
e the old one has been used. [redundantAssignment]
    ret =3D -EINVAL;
        ^
   fs/afs/dir.c:1689:6: note: Variable 'ret' is reassigned a value before t=
he old one has been used.
    ret =3D -ENAMETOOLONG;
        ^
   fs/afs/dir.c:1693:6: note: Variable 'ret' is reassigned a value before t=
he old one has been used.
    ret =3D -EINVAL;
        ^
   fs/afs/dir.c:1870:8: warning: Variable 'ret' is reassigned a value befor=
e the old one has been used. [redundantAssignment]
      ret =3D afs_sillyrename(new_dvnode,
          ^
   fs/afs/dir.c:1864:8: note: Variable 'ret' is reassigned a value before t=
he old one has been used.
      ret =3D -ENOMEM;
          ^
   fs/afs/dir.c:1870:8: note: Variable 'ret' is reassigned a value before t=
he old one has been used.
      ret =3D afs_sillyrename(new_dvnode,
          ^
>> fs/afs/write.c:528:5: warning: Variable 'n' is reassigned a value before=
 the old one has been used. [redundantAssignment]
     n =3D find_get_pages_contig(mapping, start, ARRAY_SIZE(pages), pages);
       ^
   fs/afs/write.c:527:6: note: Variable 'n' is reassigned a value before th=
e old one has been used.
      n =3D ARRAY_SIZE(pages);
        ^
   fs/afs/write.c:528:5: note: Variable 'n' is reassigned a value before th=
e old one has been used.
     n =3D find_get_pages_contig(mapping, start, ARRAY_SIZE(pages), pages);
       ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3De49c7b2f6de7ff81ca34c56e4eeb4fa740c099f2
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout e49c7b2f6de7ff81ca34c56e4eeb4fa740c099f2
vim +839 fs/afs/dir.c

e49c7b2f6de7ff David Howells 2020-04-10  704  =

5cf9dd55a0ec26 David Howells 2018-04-09  705  /*
5cf9dd55a0ec26 David Howells 2018-04-09  706   * Do a lookup in a directory=
.  We make use of bulk lookup to query a slew of
5cf9dd55a0ec26 David Howells 2018-04-09  707   * files in one go and create=
 inodes for them.  The inode of the file we were
5cf9dd55a0ec26 David Howells 2018-04-09  708   * asked for is returned.
5cf9dd55a0ec26 David Howells 2018-04-09  709   */
5cf9dd55a0ec26 David Howells 2018-04-09  710  static struct inode *afs_do_l=
ookup(struct inode *dir, struct dentry *dentry,
5cf9dd55a0ec26 David Howells 2018-04-09  711  				   struct key *key)
5cf9dd55a0ec26 David Howells 2018-04-09  712  {
5cf9dd55a0ec26 David Howells 2018-04-09  713  	struct afs_lookup_cookie *co=
okie;
e49c7b2f6de7ff David Howells 2020-04-10  714  	struct afs_cb_interest *dcbi;
e49c7b2f6de7ff David Howells 2020-04-10  715  	struct afs_vnode_param *vp;
e49c7b2f6de7ff David Howells 2020-04-10  716  	struct afs_operation *op;
f642404a0436a5 David Howells 2019-05-13  717  	struct afs_server *server;
39db9815da489b David Howells 2019-05-14  718  	struct afs_vnode *dvnode =3D=
 AFS_FS_I(dir), *vnode;
39db9815da489b David Howells 2019-05-14  719  	struct inode *inode =3D NULL=
, *ti;
9dd0b82ef530cd David Howells 2019-07-30  720  	afs_dataversion_t data_versi=
on =3D READ_ONCE(dvnode->status.data_version);
e49c7b2f6de7ff David Howells 2020-04-10  721  	long ret;
e49c7b2f6de7ff David Howells 2020-04-10  722  	int i;
5cf9dd55a0ec26 David Howells 2018-04-09  723  =

5cf9dd55a0ec26 David Howells 2018-04-09  724  	_enter("{%lu},%p{%pd},", dir=
->i_ino, dentry, dentry);
5cf9dd55a0ec26 David Howells 2018-04-09  725  =

5cf9dd55a0ec26 David Howells 2018-04-09  726  	cookie =3D kzalloc(sizeof(st=
ruct afs_lookup_cookie), GFP_KERNEL);
5cf9dd55a0ec26 David Howells 2018-04-09  727  	if (!cookie)
5cf9dd55a0ec26 David Howells 2018-04-09  728  		return ERR_PTR(-ENOMEM);
5cf9dd55a0ec26 David Howells 2018-04-09  729  =

e49c7b2f6de7ff David Howells 2020-04-10  730  	for (i =3D 0; i < ARRAY_SIZE=
(cookie->fids); i++)
e49c7b2f6de7ff David Howells 2020-04-10  731  		cookie->fids[i].vid =3D dvn=
ode->fid.vid;
5cf9dd55a0ec26 David Howells 2018-04-09  732  	cookie->ctx.actor =3D afs_lo=
okup_filldir;
5cf9dd55a0ec26 David Howells 2018-04-09  733  	cookie->name =3D dentry->d_n=
ame;
13fcc6356a9455 David Howells 2020-04-16  734  	cookie->nr_fids =3D 2; /* sl=
ot 0 is saved for the fid we actually want
13fcc6356a9455 David Howells 2020-04-16  735  			      * and slot 1 for the=
 directory */
5cf9dd55a0ec26 David Howells 2018-04-09  736  =

5cf9dd55a0ec26 David Howells 2018-04-09  737  	read_seqlock_excl(&dvnode->c=
b_lock);
f642404a0436a5 David Howells 2019-05-13  738  	dcbi =3D rcu_dereference_pro=
tected(dvnode->cb_interest,
f642404a0436a5 David Howells 2019-05-13  739  					 lockdep_is_held(&dvnode=
->cb_lock.lock));
f642404a0436a5 David Howells 2019-05-13  740  	if (dcbi) {
f642404a0436a5 David Howells 2019-05-13  741  		server =3D dcbi->server;
f642404a0436a5 David Howells 2019-05-13  742  		if (server &&
f642404a0436a5 David Howells 2019-05-13  743  		    test_bit(AFS_SERVER_FL_=
NO_IBULK, &server->flags))
5cf9dd55a0ec26 David Howells 2018-04-09  744  			cookie->one_only =3D true;
f642404a0436a5 David Howells 2019-05-13  745  	}
5cf9dd55a0ec26 David Howells 2018-04-09  746  	read_sequnlock_excl(&dvnode-=
>cb_lock);
5cf9dd55a0ec26 David Howells 2018-04-09  747  =

5cf9dd55a0ec26 David Howells 2018-04-09  748  	/* search the directory */
9dd0b82ef530cd David Howells 2019-07-30  749  	ret =3D afs_dir_iterate(dir,=
 &cookie->ctx, key, &data_version);
e49c7b2f6de7ff David Howells 2020-04-10  750  	if (ret < 0)
5cf9dd55a0ec26 David Howells 2018-04-09  751  		goto out;
5cf9dd55a0ec26 David Howells 2018-04-09  752  =

9dd0b82ef530cd David Howells 2019-07-30  753  	dentry->d_fsdata =3D (void *=
)(unsigned long)data_version;
9dd0b82ef530cd David Howells 2019-07-30  754  =

e49c7b2f6de7ff David Howells 2020-04-10  755  	ret =3D -ENOENT;
5cf9dd55a0ec26 David Howells 2018-04-09  756  	if (!cookie->found)
5cf9dd55a0ec26 David Howells 2018-04-09  757  		goto out;
5cf9dd55a0ec26 David Howells 2018-04-09  758  =

5cf9dd55a0ec26 David Howells 2018-04-09  759  	/* Check to see if we alread=
y have an inode for the primary fid. */
e49c7b2f6de7ff David Howells 2020-04-10  760  	inode =3D ilookup5(dir->i_sb=
, cookie->fids[1].vnode,
e49c7b2f6de7ff David Howells 2020-04-10  761  			 afs_ilookup5_test_by_fid,=
 &cookie->fids[1]);
5cf9dd55a0ec26 David Howells 2018-04-09  762  	if (inode)
e49c7b2f6de7ff David Howells 2020-04-10  763  		goto out; /* We do */
5cf9dd55a0ec26 David Howells 2018-04-09  764  =

e49c7b2f6de7ff David Howells 2020-04-10  765  	/* Okay, we didn't find it. =
 We need to query the server - and whilst
e49c7b2f6de7ff David Howells 2020-04-10  766  	 * we're doing that, we're g=
oing to attempt to look up a bunch of other
e49c7b2f6de7ff David Howells 2020-04-10  767  	 * vnodes also.
e49c7b2f6de7ff David Howells 2020-04-10  768  	 */
e49c7b2f6de7ff David Howells 2020-04-10  769  	op =3D afs_alloc_operation(N=
ULL, dvnode->volume);
e49c7b2f6de7ff David Howells 2020-04-10  770  	if (IS_ERR(op)) {
e49c7b2f6de7ff David Howells 2020-04-10  771  		ret =3D PTR_ERR(op);
5cf9dd55a0ec26 David Howells 2018-04-09  772  		goto out;
e49c7b2f6de7ff David Howells 2020-04-10  773  	}
5cf9dd55a0ec26 David Howells 2018-04-09  774  =

e49c7b2f6de7ff David Howells 2020-04-10  775  	afs_op_set_vnode(op, 0, dvno=
de);
e49c7b2f6de7ff David Howells 2020-04-10  776  	afs_op_set_fid(op, 1, &cooki=
e->fids[1]);
e49c7b2f6de7ff David Howells 2020-04-10  777  =

e49c7b2f6de7ff David Howells 2020-04-10  778  	op->nr_files =3D cookie->nr_=
fids;
e49c7b2f6de7ff David Howells 2020-04-10  779  	_debug("nr_files %u", op->nr=
_files);
39db9815da489b David Howells 2019-05-14  780  =

e49c7b2f6de7ff David Howells 2020-04-10  781  	/* Need space for examining =
all the selected files */
e49c7b2f6de7ff David Howells 2020-04-10  782  	op->error =3D -ENOMEM;
e49c7b2f6de7ff David Howells 2020-04-10  783  	if (op->nr_files > 2) {
e49c7b2f6de7ff David Howells 2020-04-10  784  		op->more_files =3D kvcalloc=
(op->nr_files - 2,
e49c7b2f6de7ff David Howells 2020-04-10  785  					  sizeof(struct afs_vnod=
e_param),
e49c7b2f6de7ff David Howells 2020-04-10  786  					  GFP_KERNEL);
e49c7b2f6de7ff David Howells 2020-04-10  787  		if (!op->more_files)
e49c7b2f6de7ff David Howells 2020-04-10  788  			goto out_op;
13fcc6356a9455 David Howells 2020-04-16  789  =

e49c7b2f6de7ff David Howells 2020-04-10  790  		for (i =3D 2; i < op->nr_fi=
les; i++) {
e49c7b2f6de7ff David Howells 2020-04-10  791  			vp =3D &op->more_files[i -=
 2];
e49c7b2f6de7ff David Howells 2020-04-10  792  			vp->fid =3D cookie->fids[i=
];
39db9815da489b David Howells 2019-05-14  793  =

39db9815da489b David Howells 2019-05-14  794  			/* Find any inodes that al=
ready exist and get their
39db9815da489b David Howells 2019-05-14  795  			 * callback counters.
39db9815da489b David Howells 2019-05-14  796  			 */
e49c7b2f6de7ff David Howells 2020-04-10  797  			ti =3D ilookup5_nowait(dir=
->i_sb, vp->fid.vnode,
e49c7b2f6de7ff David Howells 2020-04-10  798  					     afs_ilookup5_test_b=
y_fid, &vp->fid);
39db9815da489b David Howells 2019-05-14  799  			if (!IS_ERR_OR_NULL(ti)) {
39db9815da489b David Howells 2019-05-14  800  				vnode =3D AFS_FS_I(ti);
e49c7b2f6de7ff David Howells 2020-04-10  801  				vp->dv_before =3D vnode->=
status.data_version;
e49c7b2f6de7ff David Howells 2020-04-10  802  				vp->cb_break_before =3D a=
fs_calc_vnode_cb_break(vnode);
e49c7b2f6de7ff David Howells 2020-04-10  803  				vp->vnode =3D vnode;
e49c7b2f6de7ff David Howells 2020-04-10  804  				vp->put_vnode =3D true;
e49c7b2f6de7ff David Howells 2020-04-10  805  			}
39db9815da489b David Howells 2019-05-14  806  		}
39db9815da489b David Howells 2019-05-14  807  	}
39db9815da489b David Howells 2019-05-14  808  =

5cf9dd55a0ec26 David Howells 2018-04-09  809  	/* Try FS.InlineBulkStatus f=
irst.  Abort codes for the individual
5cf9dd55a0ec26 David Howells 2018-04-09  810  	 * lookups contained therein=
 are stored in the reply without aborting
5cf9dd55a0ec26 David Howells 2018-04-09  811  	 * the whole operation.
5cf9dd55a0ec26 David Howells 2018-04-09  812  	 */
e49c7b2f6de7ff David Howells 2020-04-10  813  	op->error =3D -ENOTSUPP;
e49c7b2f6de7ff David Howells 2020-04-10  814  	if (!cookie->one_only) {
e49c7b2f6de7ff David Howells 2020-04-10  815  		op->ops =3D &afs_inline_bul=
k_status_operation;
e49c7b2f6de7ff David Howells 2020-04-10  816  		afs_begin_vnode_operation(o=
p);
e49c7b2f6de7ff David Howells 2020-04-10  817  		afs_wait_for_operation(op);
5cf9dd55a0ec26 David Howells 2018-04-09  818  	}
5cf9dd55a0ec26 David Howells 2018-04-09  819  =

e49c7b2f6de7ff David Howells 2020-04-10  820  	if (op->error =3D=3D -ENOTSU=
PP) {
e49c7b2f6de7ff David Howells 2020-04-10  821  		/* We could try FS.BulkStat=
us next, but this aborts the entire
e49c7b2f6de7ff David Howells 2020-04-10  822  		 * op if any of the lookups=
 fails - so, for the moment, revert
e49c7b2f6de7ff David Howells 2020-04-10  823  		 * to FS.FetchStatus for op=
->file[1].
5cf9dd55a0ec26 David Howells 2018-04-09  824  		 */
e49c7b2f6de7ff David Howells 2020-04-10  825  		op->fetch_status.which =3D =
1;
e49c7b2f6de7ff David Howells 2020-04-10  826  		op->ops =3D &afs_fetch_stat=
us_operation;
e49c7b2f6de7ff David Howells 2020-04-10  827  		afs_begin_vnode_operation(o=
p);
e49c7b2f6de7ff David Howells 2020-04-10  828  		afs_wait_for_operation(op);
5cf9dd55a0ec26 David Howells 2018-04-09  829  	}
e49c7b2f6de7ff David Howells 2020-04-10  830  	inode =3D ERR_PTR(op->error);
5cf9dd55a0ec26 David Howells 2018-04-09  831  =

e49c7b2f6de7ff David Howells 2020-04-10  832  out_op:
e49c7b2f6de7ff David Howells 2020-04-10  833  	if (op->error =3D=3D 0) {
e49c7b2f6de7ff David Howells 2020-04-10  834  		inode =3D &op->file[1].vnod=
e->vfs_inode;
e49c7b2f6de7ff David Howells 2020-04-10  835  		op->file[1].vnode =3D NULL;
5cf9dd55a0ec26 David Howells 2018-04-09  836  	}
5cf9dd55a0ec26 David Howells 2018-04-09  837  =

e49c7b2f6de7ff David Howells 2020-04-10  838  	if (op->file[0].scb.have_sta=
tus)
e49c7b2f6de7ff David Howells 2020-04-10 @839  		dentry->d_fsdata =3D (void =
*)(unsigned long)op->file[0].scb.status.data_version;
e49c7b2f6de7ff David Howells 2020-04-10  840  	else
e49c7b2f6de7ff David Howells 2020-04-10  841  		dentry->d_fsdata =3D (void =
*)(unsigned long)op->file[0].dv_before;
e49c7b2f6de7ff David Howells 2020-04-10 @842  	ret =3D afs_put_operation(op=
);
5cf9dd55a0ec26 David Howells 2018-04-09  843  out:
5cf9dd55a0ec26 David Howells 2018-04-09  844  	kfree(cookie);
e49c7b2f6de7ff David Howells 2020-04-10  845  	_leave("");
e49c7b2f6de7ff David Howells 2020-04-10  846  	return inode ?: ERR_PTR(ret);
5cf9dd55a0ec26 David Howells 2018-04-09  847  }
5cf9dd55a0ec26 David Howells 2018-04-09  848  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8178577923340559555==--

