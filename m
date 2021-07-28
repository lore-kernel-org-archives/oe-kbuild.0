Content-Type: multipart/mixed; boundary="===============7062982952481671411=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] btrfs: do not pin logs too early during renames
Date: Thu, 29 Jul 2021 06:04:28 +0800
Message-ID: <202107290512.NuBwLok7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7062982952481671411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <019dba0981817da70e0820550267b368e3ce7389.1627379796.git.fdman=
ana@suse.com>
References: <019dba0981817da70e0820550267b368e3ce7389.1627379796.git.fdmana=
na@suse.com>
TO: fdmanana(a)kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.14-rc3 next-20210727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/fdmanana-kernel-org/btrfs-=
fsync-changes-a-bug-fix-and-a-couple-improvements/20210727-182628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-m031-20210728 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/inode.c:9338 btrfs_rename_exchange() warn: variable dereferenced b=
efore check 'new_inode' (see line 9225)

Old smatch warnings:
fs/btrfs/inode.c:285 insert_inline_extent() error: we previously assumed 'c=
ompressed_pages' could be null (see line 254)

vim +/new_inode +9338 fs/btrfs/inode.c

39279cc3d2704c Chris Mason     2007-06-12  9117  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9118  static int btrfs_rename_ex=
change(struct inode *old_dir,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9119  			      struct dentry *ol=
d_dentry,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9120  			      struct inode *new=
_dir,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9121  			      struct dentry *ne=
w_dentry)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9122  {
0b246afa62b0cf Jeff Mahoney    2016-06-22  9123  	struct btrfs_fs_info *fs_=
info =3D btrfs_sb(old_dir->i_sb);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9124  	struct btrfs_trans_handle=
 *trans;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9125  	struct btrfs_root *root =
=3D BTRFS_I(old_dir)->root;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9126  	struct btrfs_root *dest =
=3D BTRFS_I(new_dir)->root;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9127  	struct inode *new_inode =
=3D new_dentry->d_inode;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9128  	struct inode *old_inode =
=3D old_dentry->d_inode;
95582b00838837 Deepa Dinamani  2018-05-08  9129  	struct timespec64 ctime =
=3D current_time(old_inode);
4a0cc7ca6c40b6 Nikolay Borisov 2017-01-10  9130  	u64 old_ino =3D btrfs_ino=
(BTRFS_I(old_inode));
4a0cc7ca6c40b6 Nikolay Borisov 2017-01-10  9131  	u64 new_ino =3D btrfs_ino=
(BTRFS_I(new_inode));
cdd1fedf8261cd Dan Fuhry       2016-03-17  9132  	u64 old_idx =3D 0;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9133  	u64 new_idx =3D 0;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9134  	int ret;
75b463d2b47aef Filipe Manana   2020-08-11  9135  	int ret2;
86e8aa0e772cab Filipe Manana   2016-05-05  9136  	bool root_log_pinned =3D =
false;
86e8aa0e772cab Filipe Manana   2016-05-05  9137  	bool dest_log_pinned =3D =
false;
dc09ef3562726c Josef Bacik     2021-05-19  9138  	bool need_abort =3D false;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9139  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9140  	/* we only allow rename s=
ubvolume link between subvolumes */
cdd1fedf8261cd Dan Fuhry       2016-03-17  9141  	if (old_ino !=3D BTRFS_FI=
RST_FREE_OBJECTID && root !=3D dest)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9142  		return -EXDEV;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9143  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9144  	/* close the race window =
with snapshot create/destroy ioctl */
943eb3bf25f4a7 Josef Bacik     2019-11-19  9145  	if (old_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID ||
943eb3bf25f4a7 Josef Bacik     2019-11-19  9146  	    new_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID)
0b246afa62b0cf Jeff Mahoney    2016-06-22  9147  		down_read(&fs_info->subv=
ol_sem);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9148  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9149  	/*
cdd1fedf8261cd Dan Fuhry       2016-03-17  9150  	 * We want to reserve the=
 absolute worst case amount of items.  So if
cdd1fedf8261cd Dan Fuhry       2016-03-17  9151  	 * both inodes are subvol=
s and we need to unlink them then that would
cdd1fedf8261cd Dan Fuhry       2016-03-17  9152  	 * require 4 item modific=
ations, but if they are both normal inodes it
cdd1fedf8261cd Dan Fuhry       2016-03-17  9153  	 * would require 5 item m=
odifications, so we'll assume their normal
cdd1fedf8261cd Dan Fuhry       2016-03-17  9154  	 * inodes.  So 5 * 2 is 1=
0, plus 2 for the new links, so 12 total items
cdd1fedf8261cd Dan Fuhry       2016-03-17  9155  	 * should cover the worst=
 case number of items we'll modify.
cdd1fedf8261cd Dan Fuhry       2016-03-17  9156  	 */
cdd1fedf8261cd Dan Fuhry       2016-03-17  9157  	trans =3D btrfs_start_tra=
nsaction(root, 12);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9158  	if (IS_ERR(trans)) {
cdd1fedf8261cd Dan Fuhry       2016-03-17  9159  		ret =3D PTR_ERR(trans);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9160  		goto out_notrans;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9161  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9162  =

00aa8e87c9dc63 Josef Bacik     2021-03-12  9163  	if (dest !=3D root) {
00aa8e87c9dc63 Josef Bacik     2021-03-12  9164  		ret =3D btrfs_record_roo=
t_in_trans(trans, dest);
00aa8e87c9dc63 Josef Bacik     2021-03-12  9165  		if (ret)
00aa8e87c9dc63 Josef Bacik     2021-03-12  9166  			goto out_fail;
00aa8e87c9dc63 Josef Bacik     2021-03-12  9167  	}
3e1740993e4311 Josef Bacik     2019-11-15  9168  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9169  	/*
cdd1fedf8261cd Dan Fuhry       2016-03-17  9170  	 * We need to find a free=
 sequence number both in the source and
cdd1fedf8261cd Dan Fuhry       2016-03-17  9171  	 * in the destination dir=
ectory for the exchange.
cdd1fedf8261cd Dan Fuhry       2016-03-17  9172  	 */
877574e2548bbf Nikolay Borisov 2017-02-20  9173  	ret =3D btrfs_set_inode_i=
ndex(BTRFS_I(new_dir), &old_idx);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9174  	if (ret)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9175  		goto out_fail;
877574e2548bbf Nikolay Borisov 2017-02-20  9176  	ret =3D btrfs_set_inode_i=
ndex(BTRFS_I(old_dir), &new_idx);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9177  	if (ret)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9178  		goto out_fail;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9179  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9180  	BTRFS_I(old_inode)->dir_i=
ndex =3D 0ULL;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9181  	BTRFS_I(new_inode)->dir_i=
ndex =3D 0ULL;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9182  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9183  	/* Reference for the sour=
ce. */
cdd1fedf8261cd Dan Fuhry       2016-03-17  9184  	if (old_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID) {
cdd1fedf8261cd Dan Fuhry       2016-03-17  9185  		/* force full log commit=
 if subvolume involved. */
907877664e2d85 David Sterba    2019-03-20  9186  		btrfs_set_log_full_commi=
t(trans);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9187  	} else {
cdd1fedf8261cd Dan Fuhry       2016-03-17  9188  		ret =3D btrfs_insert_ino=
de_ref(trans, dest,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9189  					     new_dentry->d_na=
me.name,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9190  					     new_dentry->d_na=
me.len,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9191  					     old_ino,
f85b7379cd76ad David Sterba    2017-01-20  9192  					     btrfs_ino(BTRFS_=
I(new_dir)),
f85b7379cd76ad David Sterba    2017-01-20  9193  					     old_idx);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9194  		if (ret)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9195  			goto out_fail;
dc09ef3562726c Josef Bacik     2021-05-19  9196  		need_abort =3D true;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9197  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9198  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9199  	/* And now for the dest. =
*/
cdd1fedf8261cd Dan Fuhry       2016-03-17  9200  	if (new_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID) {
cdd1fedf8261cd Dan Fuhry       2016-03-17  9201  		/* force full log commit=
 if subvolume involved. */
907877664e2d85 David Sterba    2019-03-20  9202  		btrfs_set_log_full_commi=
t(trans);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9203  	} else {
cdd1fedf8261cd Dan Fuhry       2016-03-17  9204  		ret =3D btrfs_insert_ino=
de_ref(trans, root,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9205  					     old_dentry->d_na=
me.name,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9206  					     old_dentry->d_na=
me.len,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9207  					     new_ino,
f85b7379cd76ad David Sterba    2017-01-20  9208  					     btrfs_ino(BTRFS_=
I(old_dir)),
f85b7379cd76ad David Sterba    2017-01-20  9209  					     new_idx);
dc09ef3562726c Josef Bacik     2021-05-19  9210  		if (ret) {
dc09ef3562726c Josef Bacik     2021-05-19  9211  			if (need_abort)
dc09ef3562726c Josef Bacik     2021-05-19  9212  				btrfs_abort_transactio=
n(trans, ret);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9213  			goto out_fail;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9214  		}
dc09ef3562726c Josef Bacik     2021-05-19  9215  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9216  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9217  	/* Update inode version a=
nd ctime/mtime. */
cdd1fedf8261cd Dan Fuhry       2016-03-17  9218  	inode_inc_iversion(old_di=
r);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9219  	inode_inc_iversion(new_di=
r);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9220  	inode_inc_iversion(old_in=
ode);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9221  	inode_inc_iversion(new_in=
ode);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9222  	old_dir->i_ctime =3D old_=
dir->i_mtime =3D ctime;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9223  	new_dir->i_ctime =3D new_=
dir->i_mtime =3D ctime;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9224  	old_inode->i_ctime =3D ct=
ime;
cdd1fedf8261cd Dan Fuhry       2016-03-17 @9225  	new_inode->i_ctime =3D ct=
ime;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9226  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9227  	if (old_dentry->d_parent =
!=3D new_dentry->d_parent) {
f85b7379cd76ad David Sterba    2017-01-20  9228  		btrfs_record_unlink_dir(=
trans, BTRFS_I(old_dir),
f85b7379cd76ad David Sterba    2017-01-20  9229  				BTRFS_I(old_inode), 1);
f85b7379cd76ad David Sterba    2017-01-20  9230  		btrfs_record_unlink_dir(=
trans, BTRFS_I(new_dir),
f85b7379cd76ad David Sterba    2017-01-20  9231  				BTRFS_I(new_inode), 1);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9232  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9233  =

c8758bb7bea761 Filipe Manana   2021-07-27  9234  	/*
c8758bb7bea761 Filipe Manana   2021-07-27  9235  	 * Now pin the logs of th=
e roots. We do it to ensure that no other task
c8758bb7bea761 Filipe Manana   2021-07-27  9236  	 * can sync the logs whil=
e we are in progress with the rename, because
c8758bb7bea761 Filipe Manana   2021-07-27  9237  	 * that could result in a=
n inconsistency in case any of the inodes that
c8758bb7bea761 Filipe Manana   2021-07-27  9238  	 * are part of this renam=
e operation were logged before.
c8758bb7bea761 Filipe Manana   2021-07-27  9239  	 *
c8758bb7bea761 Filipe Manana   2021-07-27  9240  	 * We pin the logs even i=
f at this precise moment none of the inodes was
c8758bb7bea761 Filipe Manana   2021-07-27  9241  	 * logged before. This is=
 because right after we checked for that, some
c8758bb7bea761 Filipe Manana   2021-07-27  9242  	 * other task fsyncing so=
me other inode not involved with this rename
c8758bb7bea761 Filipe Manana   2021-07-27  9243  	 * operation could log th=
at one of our inodes exists.
c8758bb7bea761 Filipe Manana   2021-07-27  9244  	 *
c8758bb7bea761 Filipe Manana   2021-07-27  9245  	 * We don't need to pin t=
he logs before the above calls to
c8758bb7bea761 Filipe Manana   2021-07-27  9246  	 * btrfs_insert_inode_ref=
(), since those don't ever need to change a log.
c8758bb7bea761 Filipe Manana   2021-07-27  9247  	 */
c8758bb7bea761 Filipe Manana   2021-07-27  9248  	if (old_ino !=3D BTRFS_FI=
RST_FREE_OBJECTID) {
c8758bb7bea761 Filipe Manana   2021-07-27  9249  		btrfs_pin_log_trans(root=
);
c8758bb7bea761 Filipe Manana   2021-07-27  9250  		root_log_pinned =3D true;
c8758bb7bea761 Filipe Manana   2021-07-27  9251  	}
c8758bb7bea761 Filipe Manana   2021-07-27  9252  	if (new_ino !=3D BTRFS_FI=
RST_FREE_OBJECTID) {
c8758bb7bea761 Filipe Manana   2021-07-27  9253  		btrfs_pin_log_trans(dest=
);
c8758bb7bea761 Filipe Manana   2021-07-27  9254  		dest_log_pinned =3D true;
c8758bb7bea761 Filipe Manana   2021-07-27  9255  	}
c8758bb7bea761 Filipe Manana   2021-07-27  9256  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9257  	/* src is a subvolume */
cdd1fedf8261cd Dan Fuhry       2016-03-17  9258  	if (old_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID) {
045d3967b6920b Josef Bacik     2019-12-18  9259  		ret =3D btrfs_unlink_sub=
vol(trans, old_dir, old_dentry);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9260  	} else { /* src is an ino=
de */
4ec5934e43cabd Nikolay Borisov 2017-01-18  9261  		ret =3D __btrfs_unlink_i=
node(trans, root, BTRFS_I(old_dir),
4ec5934e43cabd Nikolay Borisov 2017-01-18  9262  					   BTRFS_I(old_dentry=
->d_inode),
cdd1fedf8261cd Dan Fuhry       2016-03-17  9263  					   old_dentry->d_name=
.name,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9264  					   old_dentry->d_name=
.len);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9265  		if (!ret)
9a56fcd15a9c6b Nikolay Borisov 2020-11-02  9266  			ret =3D btrfs_update_in=
ode(trans, root, BTRFS_I(old_inode));
cdd1fedf8261cd Dan Fuhry       2016-03-17  9267  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9268  	if (ret) {
66642832f06a43 Jeff Mahoney    2016-06-10  9269  		btrfs_abort_transaction(=
trans, ret);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9270  		goto out_fail;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9271  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9272  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9273  	/* dest is a subvolume */
cdd1fedf8261cd Dan Fuhry       2016-03-17  9274  	if (new_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID) {
045d3967b6920b Josef Bacik     2019-12-18  9275  		ret =3D btrfs_unlink_sub=
vol(trans, new_dir, new_dentry);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9276  	} else { /* dest is an in=
ode */
4ec5934e43cabd Nikolay Borisov 2017-01-18  9277  		ret =3D __btrfs_unlink_i=
node(trans, dest, BTRFS_I(new_dir),
4ec5934e43cabd Nikolay Borisov 2017-01-18  9278  					   BTRFS_I(new_dentry=
->d_inode),
cdd1fedf8261cd Dan Fuhry       2016-03-17  9279  					   new_dentry->d_name=
.name,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9280  					   new_dentry->d_name=
.len);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9281  		if (!ret)
9a56fcd15a9c6b Nikolay Borisov 2020-11-02  9282  			ret =3D btrfs_update_in=
ode(trans, dest, BTRFS_I(new_inode));
cdd1fedf8261cd Dan Fuhry       2016-03-17  9283  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9284  	if (ret) {
66642832f06a43 Jeff Mahoney    2016-06-10  9285  		btrfs_abort_transaction(=
trans, ret);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9286  		goto out_fail;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9287  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9288  =

db0a669fb00241 Nikolay Borisov 2017-02-20  9289  	ret =3D btrfs_add_link(tr=
ans, BTRFS_I(new_dir), BTRFS_I(old_inode),
cdd1fedf8261cd Dan Fuhry       2016-03-17  9290  			     new_dentry->d_name=
.name,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9291  			     new_dentry->d_name=
.len, 0, old_idx);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9292  	if (ret) {
66642832f06a43 Jeff Mahoney    2016-06-10  9293  		btrfs_abort_transaction(=
trans, ret);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9294  		goto out_fail;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9295  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9296  =

db0a669fb00241 Nikolay Borisov 2017-02-20  9297  	ret =3D btrfs_add_link(tr=
ans, BTRFS_I(old_dir), BTRFS_I(new_inode),
cdd1fedf8261cd Dan Fuhry       2016-03-17  9298  			     old_dentry->d_name=
.name,
cdd1fedf8261cd Dan Fuhry       2016-03-17  9299  			     old_dentry->d_name=
.len, 0, new_idx);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9300  	if (ret) {
66642832f06a43 Jeff Mahoney    2016-06-10  9301  		btrfs_abort_transaction(=
trans, ret);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9302  		goto out_fail;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9303  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9304  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9305  	if (old_inode->i_nlink =
=3D=3D 1)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9306  		BTRFS_I(old_inode)->dir_=
index =3D old_idx;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9307  	if (new_inode->i_nlink =
=3D=3D 1)
cdd1fedf8261cd Dan Fuhry       2016-03-17  9308  		BTRFS_I(new_inode)->dir_=
index =3D new_idx;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9309  =

86e8aa0e772cab Filipe Manana   2016-05-05  9310  	if (root_log_pinned) {
75b463d2b47aef Filipe Manana   2020-08-11  9311  		btrfs_log_new_name(trans=
, BTRFS_I(old_inode), BTRFS_I(old_dir),
75b463d2b47aef Filipe Manana   2020-08-11  9312  				   new_dentry->d_paren=
t);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9313  		btrfs_end_log_trans(root=
);
86e8aa0e772cab Filipe Manana   2016-05-05  9314  		root_log_pinned =3D fals=
e;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9315  	}
86e8aa0e772cab Filipe Manana   2016-05-05  9316  	if (dest_log_pinned) {
75b463d2b47aef Filipe Manana   2020-08-11  9317  		btrfs_log_new_name(trans=
, BTRFS_I(new_inode), BTRFS_I(new_dir),
75b463d2b47aef Filipe Manana   2020-08-11  9318  				   old_dentry->d_paren=
t);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9319  		btrfs_end_log_trans(dest=
);
86e8aa0e772cab Filipe Manana   2016-05-05  9320  		dest_log_pinned =3D fals=
e;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9321  	}
cdd1fedf8261cd Dan Fuhry       2016-03-17  9322  out_fail:
86e8aa0e772cab Filipe Manana   2016-05-05  9323  	/*
86e8aa0e772cab Filipe Manana   2016-05-05  9324  	 * If we have pinned a lo=
g and an error happened, we unpin tasks
86e8aa0e772cab Filipe Manana   2016-05-05  9325  	 * trying to sync the log=
 and force them to fallback to a transaction
86e8aa0e772cab Filipe Manana   2016-05-05  9326  	 * commit if the log curr=
ently contains any of the inodes involved in
86e8aa0e772cab Filipe Manana   2016-05-05  9327  	 * this rename operation =
(to ensure we do not persist a log with an
86e8aa0e772cab Filipe Manana   2016-05-05  9328  	 * inconsistent state for=
 any of these inodes or leading to any
86e8aa0e772cab Filipe Manana   2016-05-05  9329  	 * inconsistencies when r=
eplayed). If the transaction was aborted, the
86e8aa0e772cab Filipe Manana   2016-05-05  9330  	 * abortion reason is pro=
pagated to userspace when attempting to commit
86e8aa0e772cab Filipe Manana   2016-05-05  9331  	 * the transaction. If th=
e log does not contain any of these inodes, we
86e8aa0e772cab Filipe Manana   2016-05-05  9332  	 * allow the tasks to syn=
c it.
86e8aa0e772cab Filipe Manana   2016-05-05  9333  	 */
86e8aa0e772cab Filipe Manana   2016-05-05  9334  	if (ret && (root_log_pinn=
ed || dest_log_pinned)) {
0f8939b8ac8623 Nikolay Borisov 2017-01-18  9335  		if (btrfs_inode_in_log(B=
TRFS_I(old_dir), fs_info->generation) ||
0f8939b8ac8623 Nikolay Borisov 2017-01-18  9336  		    btrfs_inode_in_log(B=
TRFS_I(new_dir), fs_info->generation) ||
0f8939b8ac8623 Nikolay Borisov 2017-01-18  9337  		    btrfs_inode_in_log(B=
TRFS_I(old_inode), fs_info->generation) ||
86e8aa0e772cab Filipe Manana   2016-05-05 @9338  		    (new_inode &&
0f8939b8ac8623 Nikolay Borisov 2017-01-18  9339  		     btrfs_inode_in_log(=
BTRFS_I(new_inode), fs_info->generation)))
907877664e2d85 David Sterba    2019-03-20  9340  			btrfs_set_log_full_comm=
it(trans);
86e8aa0e772cab Filipe Manana   2016-05-05  9341  =

86e8aa0e772cab Filipe Manana   2016-05-05  9342  		if (root_log_pinned) {
86e8aa0e772cab Filipe Manana   2016-05-05  9343  			btrfs_end_log_trans(roo=
t);
86e8aa0e772cab Filipe Manana   2016-05-05  9344  			root_log_pinned =3D fal=
se;
86e8aa0e772cab Filipe Manana   2016-05-05  9345  		}
86e8aa0e772cab Filipe Manana   2016-05-05  9346  		if (dest_log_pinned) {
86e8aa0e772cab Filipe Manana   2016-05-05  9347  			btrfs_end_log_trans(des=
t);
86e8aa0e772cab Filipe Manana   2016-05-05  9348  			dest_log_pinned =3D fal=
se;
86e8aa0e772cab Filipe Manana   2016-05-05  9349  		}
86e8aa0e772cab Filipe Manana   2016-05-05  9350  	}
c5b4a50b74018b Filipe Manana   2018-06-11  9351  	ret2 =3D btrfs_end_transa=
ction(trans);
c5b4a50b74018b Filipe Manana   2018-06-11  9352  	ret =3D ret ? ret : ret2;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9353  out_notrans:
943eb3bf25f4a7 Josef Bacik     2019-11-19  9354  	if (new_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID ||
943eb3bf25f4a7 Josef Bacik     2019-11-19  9355  	    old_ino =3D=3D BTRFS_=
FIRST_FREE_OBJECTID)
0b246afa62b0cf Jeff Mahoney    2016-06-22  9356  		up_read(&fs_info->subvol=
_sem);
cdd1fedf8261cd Dan Fuhry       2016-03-17  9357  =

cdd1fedf8261cd Dan Fuhry       2016-03-17  9358  	return ret;
cdd1fedf8261cd Dan Fuhry       2016-03-17  9359  }
cdd1fedf8261cd Dan Fuhry       2016-03-17  9360  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7062982952481671411==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7062982952481671411==--

