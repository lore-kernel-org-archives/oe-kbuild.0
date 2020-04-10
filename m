Content-Type: multipart/mixed; boundary="===============0388509873853202972=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [dhowells-fs:afs-fixes 6/6] fs/afs/dir_silly.c:188:11: warning: The if condition is the same as the previous if condition [duplicateCondition]
Date: Sat, 11 Apr 2020 04:22:35 +0800
Message-ID: <202004110426.nalZpUGs%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0388509873853202972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it afs-fixes
head:   0a2d3be765d4a808eddcda5e3f303e57c19dd61f
commit: 0a2d3be765d4a808eddcda5e3f303e57c19dd61f [6/6] afs: Fix race betwee=
n post-modification dir edit and readdir/d_revalidate
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/afs/dir_silly.c:188:11: warning: The if condition is the same as the =
previous if condition [duplicateCondition]
     if (ret =3D=3D 0) {
             ^
   fs/afs/dir_silly.c:181:11: note: First condition
     if (ret =3D=3D 0) {
             ^
   fs/afs/dir_silly.c:188:11: note: Second condition
     if (ret =3D=3D 0) {
             ^
   fs/afs/dir_silly.c:211:6: warning: The scope of the variable 'ret' can b=
e reduced. [variableScope]
    int ret;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/com=
mit/?id=3D0a2d3be765d4a808eddcda5e3f303e57c19dd61f
git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/=
dhowells/linux-fs.git
git remote update dhowells-fs
git checkout 0a2d3be765d4a808eddcda5e3f303e57c19dd61f
vim +188 fs/afs/dir_silly.c

79ddbfa500b37a David Howells 2019-04-25  141  =

79ddbfa500b37a David Howells 2019-04-25  142  /*
79ddbfa500b37a David Howells 2019-04-25  143   * Tell the server to remove =
a sillyrename file.
79ddbfa500b37a David Howells 2019-04-25  144   */
79ddbfa500b37a David Howells 2019-04-25  145  static int afs_do_silly_unlin=
k(struct afs_vnode *dvnode, struct afs_vnode *vnode,
79ddbfa500b37a David Howells 2019-04-25  146  			       struct dentry *dent=
ry, struct key *key)
79ddbfa500b37a David Howells 2019-04-25  147  {
79ddbfa500b37a David Howells 2019-04-25  148  	struct afs_fs_cursor fc;
a58823ac458968 David Howells 2019-05-09  149  	struct afs_status_cb *scb;
79ddbfa500b37a David Howells 2019-04-25  150  	int ret =3D -ERESTARTSYS;
79ddbfa500b37a David Howells 2019-04-25  151  =

79ddbfa500b37a David Howells 2019-04-25  152  	_enter("");
79ddbfa500b37a David Howells 2019-04-25  153  =

a58823ac458968 David Howells 2019-05-09  154  	scb =3D kcalloc(2, sizeof(st=
ruct afs_status_cb), GFP_KERNEL);
a58823ac458968 David Howells 2019-05-09  155  	if (!scb)
a58823ac458968 David Howells 2019-05-09  156  		return -ENOMEM;
a58823ac458968 David Howells 2019-05-09  157  =

79ddbfa500b37a David Howells 2019-04-25  158  	trace_afs_silly_rename(vnode=
, true);
20b8391fff56f6 David Howells 2019-05-08  159  	if (afs_begin_vnode_operatio=
n(&fc, dvnode, key, false)) {
a58823ac458968 David Howells 2019-05-09  160  		afs_dataversion_t dir_data_=
version =3D dvnode->status.data_version + 1;
a58823ac458968 David Howells 2019-05-09  161  =

79ddbfa500b37a David Howells 2019-04-25  162  		while (afs_select_fileserve=
r(&fc)) {
79ddbfa500b37a David Howells 2019-04-25  163  			fc.cb_break =3D afs_calc_v=
node_cb_break(dvnode);
79ddbfa500b37a David Howells 2019-04-25  164  =

79ddbfa500b37a David Howells 2019-04-25  165  			if (test_bit(AFS_SERVER_FL=
_IS_YFS, &fc.cbi->server->flags) &&
79ddbfa500b37a David Howells 2019-04-25  166  			    !test_bit(AFS_SERVER_F=
L_NO_RM2, &fc.cbi->server->flags)) {
79ddbfa500b37a David Howells 2019-04-25  167  				yfs_fs_remove_file2(&fc, =
vnode, dentry->d_name.name,
a58823ac458968 David Howells 2019-05-09  168  						    &scb[0], &scb[1]);
79ddbfa500b37a David Howells 2019-04-25  169  				if (fc.ac.error !=3D -ECO=
NNABORTED ||
79ddbfa500b37a David Howells 2019-04-25  170  				    fc.ac.abort_code !=3D=
 RXGEN_OPCODE)
79ddbfa500b37a David Howells 2019-04-25  171  					continue;
79ddbfa500b37a David Howells 2019-04-25  172  				set_bit(AFS_SERVER_FL_NO_=
RM2, &fc.cbi->server->flags);
79ddbfa500b37a David Howells 2019-04-25  173  			}
79ddbfa500b37a David Howells 2019-04-25  174  =

a58823ac458968 David Howells 2019-05-09  175  			afs_fs_remove(&fc, vnode, =
dentry->d_name.name, false, &scb[0]);
79ddbfa500b37a David Howells 2019-04-25  176  		}
79ddbfa500b37a David Howells 2019-04-25  177  =

a58823ac458968 David Howells 2019-05-09  178  		afs_vnode_commit_status(&fc=
, dvnode, fc.cb_break,
a58823ac458968 David Howells 2019-05-09  179  					&dir_data_version, &scb[=
0]);
79ddbfa500b37a David Howells 2019-04-25  180  		ret =3D afs_end_vnode_opera=
tion(&fc);
79ddbfa500b37a David Howells 2019-04-25  181  		if (ret =3D=3D 0) {
79ddbfa500b37a David Howells 2019-04-25  182  			drop_nlink(&vnode->vfs_ino=
de);
79ddbfa500b37a David Howells 2019-04-25  183  			if (vnode->vfs_inode.i_nli=
nk =3D=3D 0) {
79ddbfa500b37a David Howells 2019-04-25  184  				set_bit(AFS_VNODE_DELETED=
, &vnode->flags);
79ddbfa500b37a David Howells 2019-04-25  185  				clear_bit(AFS_VNODE_CB_PR=
OMISED, &vnode->flags);
79ddbfa500b37a David Howells 2019-04-25  186  			}
79ddbfa500b37a David Howells 2019-04-25  187  		}
0a2d3be765d4a8 David Howells 2020-04-10 @188  		if (ret =3D=3D 0) {
0a2d3be765d4a8 David Howells 2020-04-10  189  			down_write(&dvnode->valida=
te_lock);
0a2d3be765d4a8 David Howells 2020-04-10  190  			if (test_bit(AFS_VNODE_DIR=
_VALID, &dvnode->flags) &&
0a2d3be765d4a8 David Howells 2020-04-10  191  			    dvnode->status.data_ve=
rsion =3D=3D dir_data_version)
79ddbfa500b37a David Howells 2019-04-25  192  				afs_edit_dir_remove(dvnod=
e, &dentry->d_name,
79ddbfa500b37a David Howells 2019-04-25  193  						    afs_edit_dir_for_un=
link);
0a2d3be765d4a8 David Howells 2020-04-10  194  			up_write(&dvnode->validate=
_lock);
0a2d3be765d4a8 David Howells 2020-04-10  195  		}
79ddbfa500b37a David Howells 2019-04-25  196  	}
79ddbfa500b37a David Howells 2019-04-25  197  =

a58823ac458968 David Howells 2019-05-09  198  	kfree(scb);
79ddbfa500b37a David Howells 2019-04-25  199  	_leave(" =3D %d", ret);
79ddbfa500b37a David Howells 2019-04-25  200  	return ret;
79ddbfa500b37a David Howells 2019-04-25  201  }
79ddbfa500b37a David Howells 2019-04-25  202  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0388509873853202972==--

