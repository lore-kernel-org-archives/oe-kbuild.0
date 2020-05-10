Content-Type: multipart/mixed; boundary="===============1081633550181119667=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v7 09/18] pstore/blk: Introduce backend for block devices
Date: Mon, 11 May 2020 06:14:26 +0800
Message-ID: <202005110656.VG93l6Af%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1081633550181119667==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200510202436.63222-10-keescook@chromium.org>
References: <20200510202436.63222-10-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>

Hi Kees,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200508]
[cannot apply to kees/for-next/pstore ia64/next linus/master v5.7-rc4 v5.7-=
rc3 v5.7-rc2 v5.7-rc4]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kees-Cook/pstore-mtd-suppo=
rt-crash-log-to-block-and-mtd-device/20200511-043555
base:    30e2206e11ce27ae910cc0dab21472429e400a87
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/pstore/ram.c:927:19: warning: Variable 'pdata.max_reason' is reassign=
ed a value before the old one has been used. [redundantAssignment]
    pdata.max_reason =3D ramoops_max_reason;
                     ^
   fs/pstore/ram.c:925:20: note: pdata.max_reason is assigned
     pdata.max_reason =3D ramoops_dump_oops ? KMSG_DUMP_OOPS
                      ^
   fs/pstore/ram.c:927:19: note: pdata.max_reason is overwritten
    pdata.max_reason =3D ramoops_max_reason;
                     ^
--
>> fs/pstore/zone.c:433:6: warning: Redundant initialization for 'ret'. The=
 initialized value is overwritten before it is read. [redundantInitializati=
on]
    ret =3D psz_kmsg_recover(cxt);
        ^
   fs/pstore/zone.c:428:10: note: ret is initialized
    int ret =3D -EBUSY;
            ^
   fs/pstore/zone.c:433:6: note: ret is overwritten
    ret =3D psz_kmsg_recover(cxt);
        ^
>> fs/pstore/zone.c:895:6: warning: Redundant initialization for 'err'. The=
 initialized value is overwritten before it is read. [redundantInitializati=
on]
    err =3D psz_alloc_zones(cxt);
        ^
   fs/pstore/zone.c:839:10: note: err is initialized
    int err =3D -EINVAL;
            ^
   fs/pstore/zone.c:895:6: note: err is overwritten
    err =3D psz_alloc_zones(cxt);
        ^
>> fs/pstore/blk.c:193:7: warning: Redundant initialization for 'bdev'. The=
 initialized value is overwritten before it is read. [redundantInitializati=
on]
    bdev =3D blkdev_get_by_path(blkdev, mode, holder);
         ^
   fs/pstore/blk.c:178:28: note: bdev is initialized
    struct block_device *bdev =3D ERR_PTR(-ENODEV);
                              ^
   fs/pstore/blk.c:193:7: note: bdev is overwritten
    bdev =3D blkdev_get_by_path(blkdev, mode, holder);
         ^
>> fs/pstore/blk.c:359:6: warning: Redundant initialization for 'ret'. The =
initialized value is overwritten before it is read. [redundantInitializatio=
n]
    ret =3D psblk_register_do(&dev);
        ^
   fs/pstore/blk.c:321:10: note: ret is initialized
    int ret =3D -ENODEV;
            ^
   fs/pstore/blk.c:359:6: note: ret is overwritten
    ret =3D psblk_register_do(&dev);
        ^

# https://github.com/0day-ci/linux/commit/1fe49524a73cc357622236b617f4ccf86=
1dde190
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 1fe49524a73cc357622236b617f4ccf861dde190
vim +/bdev +193 fs/pstore/blk.c

1fe49524a73cc3 WeiXiong Liao 2020-05-10  164  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  165  /**
1fe49524a73cc3 WeiXiong Liao 2020-05-10  166   * psblk_get_bdev() - open bl=
ock device
1fe49524a73cc3 WeiXiong Liao 2020-05-10  167   *
1fe49524a73cc3 WeiXiong Liao 2020-05-10  168   * @holder:	Exclusive holder =
identifier
1fe49524a73cc3 WeiXiong Liao 2020-05-10  169   * @info:	Information about b=
dev to fill in
1fe49524a73cc3 WeiXiong Liao 2020-05-10  170   *
1fe49524a73cc3 WeiXiong Liao 2020-05-10  171   * Return: pointer to block d=
evice on success and others on error.
1fe49524a73cc3 WeiXiong Liao 2020-05-10  172   *
1fe49524a73cc3 WeiXiong Liao 2020-05-10  173   * On success, the returned b=
lock_device has reference count of one.
1fe49524a73cc3 WeiXiong Liao 2020-05-10  174   */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  175  static struct block_device *p=
sblk_get_bdev(void *holder,
1fe49524a73cc3 WeiXiong Liao 2020-05-10  176  					   struct bdev_info *inf=
o)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  177  {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  178  	struct block_device *bdev =
=3D ERR_PTR(-ENODEV);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  179  	fmode_t mode =3D FMODE_READ =
| FMODE_WRITE;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  180  	sector_t nr_sects;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  181  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  182  	if (WARN_ON(!mutex_is_locked=
(&pstore_blk_lock)))
1fe49524a73cc3 WeiXiong Liao 2020-05-10  183  		return ERR_PTR(-EINVAL);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  184  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  185  	if (pstore_zone_info)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  186  		return ERR_PTR(-EBUSY);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  187  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  188  	if (!blkdev[0])
1fe49524a73cc3 WeiXiong Liao 2020-05-10  189  		return ERR_PTR(-ENODEV);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  190  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  191  	if (holder)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  192  		mode |=3D FMODE_EXCL;
1fe49524a73cc3 WeiXiong Liao 2020-05-10 @193  	bdev =3D blkdev_get_by_path(=
blkdev, mode, holder);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  194  	if (IS_ERR(bdev)) {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  195  		dev_t devt;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  196  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  197  		devt =3D name_to_dev_t(blkd=
ev);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  198  		if (devt =3D=3D 0)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  199  			return ERR_PTR(-ENODEV);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  200  		bdev =3D blkdev_get_by_dev(=
devt, mode, holder);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  201  	}
1fe49524a73cc3 WeiXiong Liao 2020-05-10  202  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  203  	nr_sects =3D part_nr_sects_r=
ead(bdev->bd_part);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  204  	if (!nr_sects) {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  205  		pr_err("not enough space fo=
r '%s'\n", blkdev);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  206  		blkdev_put(bdev, mode);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  207  		return ERR_PTR(-ENOSPC);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  208  	}
1fe49524a73cc3 WeiXiong Liao 2020-05-10  209  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  210  	if (info) {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  211  		info->devt =3D bdev->bd_dev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  212  		info->nr_sects =3D nr_sects;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  213  		info->start_sect =3D get_st=
art_sect(bdev);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  214  	}
1fe49524a73cc3 WeiXiong Liao 2020-05-10  215  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  216  	return bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  217  }
1fe49524a73cc3 WeiXiong Liao 2020-05-10  218  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  219  static void psblk_put_bdev(st=
ruct block_device *bdev, void *holder)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  220  {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  221  	fmode_t mode =3D FMODE_READ =
| FMODE_WRITE;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  222  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  223  	if (!bdev)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  224  		return;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  225  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  226  	if (WARN_ON(!mutex_is_locked=
(&pstore_blk_lock)))
1fe49524a73cc3 WeiXiong Liao 2020-05-10  227  		return;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  228  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  229  	if (holder)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  230  		mode |=3D FMODE_EXCL;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  231  	blkdev_put(bdev, mode);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  232  }
1fe49524a73cc3 WeiXiong Liao 2020-05-10  233  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  234  static ssize_t psblk_generic_=
blk_read(char *buf, size_t bytes, loff_t pos)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  235  {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  236  	struct block_device *bdev =
=3D psblk_bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  237  	struct file file;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  238  	struct kiocb kiocb;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  239  	struct iov_iter iter;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  240  	struct kvec iov =3D {.iov_ba=
se =3D buf, .iov_len =3D bytes};
1fe49524a73cc3 WeiXiong Liao 2020-05-10  241  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  242  	if (!bdev)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  243  		return -ENODEV;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  244  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  245  	memset(&file, 0, sizeof(stru=
ct file));
1fe49524a73cc3 WeiXiong Liao 2020-05-10  246  	file.f_mapping =3D bdev->bd_=
inode->i_mapping;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  247  	file.f_flags =3D O_DSYNC | _=
_O_SYNC | O_NOATIME;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  248  	file.f_inode =3D bdev->bd_in=
ode;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  249  	file_ra_state_init(&file.f_r=
a, file.f_mapping);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  250  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  251  	init_sync_kiocb(&kiocb, &fil=
e);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  252  	kiocb.ki_pos =3D pos;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  253  	iov_iter_kvec(&iter, READ, &=
iov, 1, bytes);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  254  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  255  	return generic_file_read_ite=
r(&kiocb, &iter);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  256  }
1fe49524a73cc3 WeiXiong Liao 2020-05-10  257  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  258  static ssize_t psblk_generic_=
blk_write(const char *buf, size_t bytes,
1fe49524a73cc3 WeiXiong Liao 2020-05-10  259  		loff_t pos)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  260  {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  261  	struct block_device *bdev =
=3D psblk_bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  262  	struct iov_iter iter;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  263  	struct kiocb kiocb;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  264  	struct file file;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  265  	ssize_t ret;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  266  	struct kvec iov =3D {.iov_ba=
se =3D (void *)buf, .iov_len =3D bytes};
1fe49524a73cc3 WeiXiong Liao 2020-05-10  267  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  268  	if (!bdev)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  269  		return -ENODEV;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  270  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  271  	/* Console/Ftrace backend ma=
y handle buffer until flush dirty zones */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  272  	if (in_interrupt() || irqs_d=
isabled())
1fe49524a73cc3 WeiXiong Liao 2020-05-10  273  		return -EBUSY;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  274  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  275  	memset(&file, 0, sizeof(stru=
ct file));
1fe49524a73cc3 WeiXiong Liao 2020-05-10  276  	file.f_mapping =3D bdev->bd_=
inode->i_mapping;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  277  	file.f_flags =3D O_DSYNC | _=
_O_SYNC | O_NOATIME;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  278  	file.f_inode =3D bdev->bd_in=
ode;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  279  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  280  	init_sync_kiocb(&kiocb, &fil=
e);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  281  	kiocb.ki_pos =3D pos;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  282  	iov_iter_kvec(&iter, WRITE, =
&iov, 1, bytes);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  283  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  284  	inode_lock(bdev->bd_inode);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  285  	ret =3D generic_write_checks=
(&kiocb, &iter);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  286  	if (ret > 0)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  287  		ret =3D generic_perform_wri=
te(&file, &iter, pos);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  288  	inode_unlock(bdev->bd_inode);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  289  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  290  	if (likely(ret > 0)) {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  291  		const struct file_operation=
s f_op =3D {.fsync =3D blkdev_fsync};
1fe49524a73cc3 WeiXiong Liao 2020-05-10  292  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  293  		file.f_op =3D &f_op;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  294  		kiocb.ki_pos +=3D ret;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  295  		ret =3D generic_write_sync(=
&kiocb, ret);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  296  	}
1fe49524a73cc3 WeiXiong Liao 2020-05-10  297  	return ret;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  298  }
1fe49524a73cc3 WeiXiong Liao 2020-05-10  299  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  300  static ssize_t psblk_blk_pani=
c_write(const char *buf, size_t size,
1fe49524a73cc3 WeiXiong Liao 2020-05-10  301  		loff_t off)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  302  {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  303  	int ret;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  304  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  305  	if (!blkdev_panic_write)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  306  		return -EOPNOTSUPP;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  307  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  308  	/* size and off must align t=
o SECTOR_SIZE for block device */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  309  	ret =3D blkdev_panic_write(b=
uf, off >> SECTOR_SHIFT,
1fe49524a73cc3 WeiXiong Liao 2020-05-10  310  			size >> SECTOR_SHIFT);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  311  	return ret ? -EIO : size;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  312  }
1fe49524a73cc3 WeiXiong Liao 2020-05-10  313  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  314  static int __register_pstore_=
blk(struct pstore_blk_info *info)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  315  {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  316  	char bdev_name[BDEVNAME_SIZE=
];
1fe49524a73cc3 WeiXiong Liao 2020-05-10  317  	struct block_device *bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  318  	struct pstore_device_info de=
v;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  319  	struct bdev_info binfo;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  320  	void *holder =3D blkdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  321  	int ret =3D -ENODEV;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  322  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  323  	if (WARN_ON(!mutex_is_locked=
(&pstore_blk_lock)))
1fe49524a73cc3 WeiXiong Liao 2020-05-10  324  		return -EINVAL;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  325  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  326  	/* hold bdev exclusively */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  327  	memset(&binfo, 0, sizeof(bin=
fo));
1fe49524a73cc3 WeiXiong Liao 2020-05-10  328  	bdev =3D psblk_get_bdev(hold=
er, &binfo);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  329  	if (IS_ERR(bdev)) {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  330  		pr_err("failed to open '%s'=
!\n", blkdev);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  331  		ret =3D PTR_ERR(bdev);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  332  		goto err_put_bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  333  	}
1fe49524a73cc3 WeiXiong Liao 2020-05-10  334  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  335  	/* only allow driver matchin=
g the @blkdev */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  336  	if (!binfo.devt || MAJOR(bin=
fo.devt) !=3D info->major) {
1fe49524a73cc3 WeiXiong Liao 2020-05-10  337  		pr_debug("invalid major %u =
(expect %u)\n",
1fe49524a73cc3 WeiXiong Liao 2020-05-10  338  				info->major, MAJOR(binfo.=
devt));
1fe49524a73cc3 WeiXiong Liao 2020-05-10  339  		ret =3D -ENODEV;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  340  		goto err_put_bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  341  	}
1fe49524a73cc3 WeiXiong Liao 2020-05-10  342  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  343  	/* psblk_bdev must be assign=
ed before register to pstore/blk */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  344  	psblk_bdev =3D bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  345  	blkdev_panic_write =3D info-=
>panic_write;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  346  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  347  	/* Copy back block device de=
tails. */
1fe49524a73cc3 WeiXiong Liao 2020-05-10  348  	info->devt =3D binfo.devt;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  349  	info->nr_sects =3D binfo.nr_=
sects;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  350  	info->start_sect =3D binfo.s=
tart_sect;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  351  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  352  	memset(&dev, 0, sizeof(dev));
1fe49524a73cc3 WeiXiong Liao 2020-05-10  353  	dev.total_size =3D info->nr_=
sects << SECTOR_SHIFT;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  354  	dev.flags =3D info->flags;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  355  	dev.read =3D psblk_generic_b=
lk_read;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  356  	dev.write =3D psblk_generic_=
blk_write;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  357  	dev.panic_write =3D info->pa=
nic_write ? psblk_blk_panic_write : NULL;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  358  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10 @359  	ret =3D psblk_register_do(&d=
ev);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  360  	if (ret)
1fe49524a73cc3 WeiXiong Liao 2020-05-10  361  		goto err_put_bdev;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  362  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  363  	bdevname(bdev, bdev_name);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  364  	pr_info("attached %s%s\n", b=
dev_name,
1fe49524a73cc3 WeiXiong Liao 2020-05-10  365  		info->panic_write ? "" : " =
(no dedicated panic_write!)");
1fe49524a73cc3 WeiXiong Liao 2020-05-10  366  	return 0;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  367  =

1fe49524a73cc3 WeiXiong Liao 2020-05-10  368  err_put_bdev:
1fe49524a73cc3 WeiXiong Liao 2020-05-10  369  	psblk_bdev =3D NULL;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  370  	blkdev_panic_write =3D NULL;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  371  	psblk_put_bdev(bdev, holder);
1fe49524a73cc3 WeiXiong Liao 2020-05-10  372  	return ret;
1fe49524a73cc3 WeiXiong Liao 2020-05-10  373  }
1fe49524a73cc3 WeiXiong Liao 2020-05-10  374  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1081633550181119667==--

