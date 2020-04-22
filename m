Content-Type: multipart/mixed; boundary="===============2459734526238813435=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [brauner:loopfs 2/8] drivers/block/loopfs/loopfs.c:194:14-23: ERROR: lo_info is NULL but dereferenced.
Date: Thu, 23 Apr 2020 05:01:48 +0800
Message-ID: <202004230545.Jl3nPNqS%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2459734526238813435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christian Brauner <christian.brauner@ubuntu.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git l=
oopfs
head:   ad3014dee3e5228885046a8439b26014f5a4ebc1
commit: f22ce7d13f84b6d2ae0c3abe225b1d5ec506e925 [2/8] loopfs: implement lo=
opfs
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/block/loopfs/loopfs.c:194:14-23: ERROR: lo_info is NULL but dere=
ferenced.

# https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/=
?id=3Df22ce7d13f84b6d2ae0c3abe225b1d5ec506e925
git remote add brauner https://git.kernel.org/pub/scm/linux/kernel/git/brau=
ner/linux.git
git remote update brauner
git checkout f22ce7d13f84b6d2ae0c3abe225b1d5ec506e925
vim +194 drivers/block/loopfs/loopfs.c

f22ce7d13f84b6 Christian Brauner 2020-04-02   88  =

f22ce7d13f84b6 Christian Brauner 2020-04-02   89  /**
f22ce7d13f84b6 Christian Brauner 2020-04-02   90   * loopfs_add - allocate =
inode from super block of a loopfs mount
f22ce7d13f84b6 Christian Brauner 2020-04-02   91   * @lo:		loop device for =
which we are creating a new device entry
f22ce7d13f84b6 Christian Brauner 2020-04-02   92   * @ref_inode:	inode from=
 wich the super block will be taken
f22ce7d13f84b6 Christian Brauner 2020-04-02   93   * @device_nr:  device nu=
mber of the associated disk device
f22ce7d13f84b6 Christian Brauner 2020-04-02   94   *
f22ce7d13f84b6 Christian Brauner 2020-04-02   95   * This function creates =
a new device node for @lo.
f22ce7d13f84b6 Christian Brauner 2020-04-02   96   * Minor numbers are limi=
ted and tracked globally. The
f22ce7d13f84b6 Christian Brauner 2020-04-02   97   * function will stash a =
struct loop_device for the specific loop
f22ce7d13f84b6 Christian Brauner 2020-04-02   98   * device in i_private of=
 the inode.
f22ce7d13f84b6 Christian Brauner 2020-04-02   99   * It will go on to alloc=
ate a new inode from the super block of the
f22ce7d13f84b6 Christian Brauner 2020-04-02  100   * filesystem mount, stas=
h a struct loop_device in its i_private field
f22ce7d13f84b6 Christian Brauner 2020-04-02  101   * and attach a dentry to=
 that inode.
f22ce7d13f84b6 Christian Brauner 2020-04-02  102   *
f22ce7d13f84b6 Christian Brauner 2020-04-02  103   * Return: 0 on success, =
negative errno on failure
f22ce7d13f84b6 Christian Brauner 2020-04-02  104   */
f22ce7d13f84b6 Christian Brauner 2020-04-02  105  int loopfs_add(struct loo=
p_device *lo, struct inode *ref_inode, dev_t device_nr)
f22ce7d13f84b6 Christian Brauner 2020-04-02  106  {
f22ce7d13f84b6 Christian Brauner 2020-04-02  107  	int ret;
f22ce7d13f84b6 Christian Brauner 2020-04-02  108  	char name[DISK_NAME_LEN];
f22ce7d13f84b6 Christian Brauner 2020-04-02  109  	struct super_block *sb;
f22ce7d13f84b6 Christian Brauner 2020-04-02  110  	struct loopfs_info *info;
f22ce7d13f84b6 Christian Brauner 2020-04-02  111  	struct dentry *root, *de=
ntry;
f22ce7d13f84b6 Christian Brauner 2020-04-02  112  	struct inode *inode;
f22ce7d13f84b6 Christian Brauner 2020-04-02  113  	struct lo_loopfs *lo_inf=
o;
f22ce7d13f84b6 Christian Brauner 2020-04-02  114  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  115  	sb =3D loopfs_i_sb(ref_i=
node);
f22ce7d13f84b6 Christian Brauner 2020-04-02  116  	if (!sb)
f22ce7d13f84b6 Christian Brauner 2020-04-02  117  		return 0;
f22ce7d13f84b6 Christian Brauner 2020-04-02  118  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  119  	if (MAJOR(device_nr) !=
=3D LOOP_MAJOR)
f22ce7d13f84b6 Christian Brauner 2020-04-02  120  		return -EINVAL;
f22ce7d13f84b6 Christian Brauner 2020-04-02  121  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  122  	lo_info =3D kzalloc(size=
of(struct lo_loopfs), GFP_KERNEL);
f22ce7d13f84b6 Christian Brauner 2020-04-02  123  	if (!lo_info) {
f22ce7d13f84b6 Christian Brauner 2020-04-02  124  		ret =3D -ENOMEM;
f22ce7d13f84b6 Christian Brauner 2020-04-02  125  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  126  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  127  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  128  	info =3D LOOPFS_SB(sb);
f22ce7d13f84b6 Christian Brauner 2020-04-02  129  	if ((info->device_count =
+ 1) > info->mount_opts.max) {
f22ce7d13f84b6 Christian Brauner 2020-04-02  130  		ret =3D -ENOSPC;
f22ce7d13f84b6 Christian Brauner 2020-04-02  131  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  132  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  133  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  134  	lo_info->lo_ucount =3D i=
nc_ucount(sb->s_user_ns,
f22ce7d13f84b6 Christian Brauner 2020-04-02  135  					info->root_uid, UCOU=
NT_LOOP_DEVICES);
f22ce7d13f84b6 Christian Brauner 2020-04-02  136  	if (!lo_info->lo_ucount)=
 {
f22ce7d13f84b6 Christian Brauner 2020-04-02  137  		ret =3D -ENOSPC;
f22ce7d13f84b6 Christian Brauner 2020-04-02  138  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  139  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  140  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  141  	if (snprintf(name, sizeo=
f(name), "loop%d", lo->lo_number) >=3D sizeof(name)) {
f22ce7d13f84b6 Christian Brauner 2020-04-02  142  		ret =3D -EINVAL;
f22ce7d13f84b6 Christian Brauner 2020-04-02  143  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  144  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  145  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  146  	inode =3D new_inode(sb);
f22ce7d13f84b6 Christian Brauner 2020-04-02  147  	if (!inode) {
f22ce7d13f84b6 Christian Brauner 2020-04-02  148  		ret =3D -ENOMEM;
f22ce7d13f84b6 Christian Brauner 2020-04-02  149  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  150  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  151  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  152  	/*
f22ce7d13f84b6 Christian Brauner 2020-04-02  153  	 * The i_fop field will =
be set to the correct fops by the device layer
f22ce7d13f84b6 Christian Brauner 2020-04-02  154  	 * when the loop device =
in this loopfs instance is opened.
f22ce7d13f84b6 Christian Brauner 2020-04-02  155  	 */
f22ce7d13f84b6 Christian Brauner 2020-04-02  156  	inode->i_ino =3D MINOR(d=
evice_nr) + INODE_OFFSET;
f22ce7d13f84b6 Christian Brauner 2020-04-02  157  	inode->i_mtime =3D inode=
->i_atime =3D inode->i_ctime =3D current_time(inode);
f22ce7d13f84b6 Christian Brauner 2020-04-02  158  	inode->i_uid =3D info->r=
oot_uid;
f22ce7d13f84b6 Christian Brauner 2020-04-02  159  	inode->i_gid =3D info->r=
oot_gid;
f22ce7d13f84b6 Christian Brauner 2020-04-02  160  	init_special_inode(inode=
, S_IFBLK | 0600, device_nr);
f22ce7d13f84b6 Christian Brauner 2020-04-02  161  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  162  	root =3D sb->s_root;
f22ce7d13f84b6 Christian Brauner 2020-04-02  163  	inode_lock(d_inode(root)=
);
f22ce7d13f84b6 Christian Brauner 2020-04-02  164  	/* look it up */
f22ce7d13f84b6 Christian Brauner 2020-04-02  165  	dentry =3D lookup_one_le=
n(name, root, strlen(name));
f22ce7d13f84b6 Christian Brauner 2020-04-02  166  	if (IS_ERR(dentry)) {
f22ce7d13f84b6 Christian Brauner 2020-04-02  167  		inode_unlock(d_inode(ro=
ot));
f22ce7d13f84b6 Christian Brauner 2020-04-02  168  		iput(inode);
f22ce7d13f84b6 Christian Brauner 2020-04-02  169  		ret =3D PTR_ERR(dentry);
f22ce7d13f84b6 Christian Brauner 2020-04-02  170  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  171  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  172  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  173  	if (d_really_is_positive=
(dentry)) {
f22ce7d13f84b6 Christian Brauner 2020-04-02  174  		/* already exists */
f22ce7d13f84b6 Christian Brauner 2020-04-02  175  		dput(dentry);
f22ce7d13f84b6 Christian Brauner 2020-04-02  176  		inode_unlock(d_inode(ro=
ot));
f22ce7d13f84b6 Christian Brauner 2020-04-02  177  		iput(inode);
f22ce7d13f84b6 Christian Brauner 2020-04-02  178  		ret =3D -EEXIST;
f22ce7d13f84b6 Christian Brauner 2020-04-02  179  		goto err;
f22ce7d13f84b6 Christian Brauner 2020-04-02  180  	}
f22ce7d13f84b6 Christian Brauner 2020-04-02  181  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  182  	d_instantiate(dentry, in=
ode);
f22ce7d13f84b6 Christian Brauner 2020-04-02  183  	fsnotify_create(d_inode(=
root), dentry);
f22ce7d13f84b6 Christian Brauner 2020-04-02  184  	inode_unlock(d_inode(roo=
t));
f22ce7d13f84b6 Christian Brauner 2020-04-02  185  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  186  	lo_info->lo_inode =3D in=
ode;
f22ce7d13f84b6 Christian Brauner 2020-04-02  187  	lo->lo_info =3D lo_info;
f22ce7d13f84b6 Christian Brauner 2020-04-02  188  	inode->i_private =3D lo;
f22ce7d13f84b6 Christian Brauner 2020-04-02  189  	info->device_count++;
f22ce7d13f84b6 Christian Brauner 2020-04-02  190  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  191  	return 0;
f22ce7d13f84b6 Christian Brauner 2020-04-02  192  =

f22ce7d13f84b6 Christian Brauner 2020-04-02  193  err:
f22ce7d13f84b6 Christian Brauner 2020-04-02 @194  	if (lo_info->lo_ucount)
f22ce7d13f84b6 Christian Brauner 2020-04-02  195  		dec_ucount(lo_info->lo_=
ucount, UCOUNT_LOOP_DEVICES);
f22ce7d13f84b6 Christian Brauner 2020-04-02  196  	kfree(lo_info);
f22ce7d13f84b6 Christian Brauner 2020-04-02  197  	return ret;
f22ce7d13f84b6 Christian Brauner 2020-04-02  198  }
f22ce7d13f84b6 Christian Brauner 2020-04-02  199  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2459734526238813435==--

