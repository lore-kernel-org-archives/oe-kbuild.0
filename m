Content-Type: multipart/mixed; boundary="===============5383447120417123370=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xiang:erofs/initrd-fsdax 2/3] drivers/block/brd.c:466 brd_alloc() warn: missing error code 'err'
Date: Mon, 06 Jun 2022 21:47:39 +0800
Message-ID: <202206062100.MJhGyCcE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5383447120417123370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Xiang Gao <xiang@kernel.org>
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git ero=
fs/initrd-fsdax
head:   e04a723ce39c31ea57edfbfd70c867a2025910e3
commit: a610c807a6b52cbce515911dba9b9cc316a6c117 [2/3] brd: support FSDAX
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220606/202206062100.MJhGyCcE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/block/brd.c:466 brd_alloc() warn: missing error code 'err'

vim +/err +466 drivers/block/brd.c

a610c807a6b52c Gao Xiang         2022-06-05  406  =

7f9b348cb5e942 Christoph Hellwig 2021-05-21  407  static int brd_alloc(int =
i)
9db5579be4bb53 Nicholas Piggin   2008-02-08  408  {
9db5579be4bb53 Nicholas Piggin   2008-02-08  409  	struct brd_device *brd;
9db5579be4bb53 Nicholas Piggin   2008-02-08  410  	struct gendisk *disk;
f4be591f1436af Calvin Owens      2021-04-16  411  	char buf[DISK_NAME_LEN];
e1528830bd4ebf Luis Chamberlain  2021-10-15  412  	int err =3D -ENOMEM;
9db5579be4bb53 Nicholas Piggin   2008-02-08  413  =

00358933f66c44 Tetsuo Handa      2022-01-06  414  	list_for_each_entry(brd,=
 &brd_devices, brd_list)
00358933f66c44 Tetsuo Handa      2022-01-06  415  		if (brd->brd_number =3D=
=3D i)
f7bf35862477d6 Tetsuo Handa      2021-09-07  416  			return -EEXIST;
9db5579be4bb53 Nicholas Piggin   2008-02-08  417  	brd =3D kzalloc(sizeof(*=
brd), GFP_KERNEL);
00358933f66c44 Tetsuo Handa      2022-01-06  418  	if (!brd)
7f9b348cb5e942 Christoph Hellwig 2021-05-21  419  		return -ENOMEM;
9db5579be4bb53 Nicholas Piggin   2008-02-08  420  	brd->brd_number		=3D i;
f7bf35862477d6 Tetsuo Handa      2021-09-07  421  	list_add_tail(&brd->brd_=
list, &brd_devices);
f7bf35862477d6 Tetsuo Handa      2021-09-07  422  =

9db5579be4bb53 Nicholas Piggin   2008-02-08  423  	spin_lock_init(&brd->brd=
_lock);
9db5579be4bb53 Nicholas Piggin   2008-02-08  424  	INIT_RADIX_TREE(&brd->br=
d_pages, GFP_ATOMIC);
9db5579be4bb53 Nicholas Piggin   2008-02-08  425  =

f4be591f1436af Calvin Owens      2021-04-16  426  	snprintf(buf, DISK_NAME_=
LEN, "ram%d", i);
f4be591f1436af Calvin Owens      2021-04-16  427  	if (!IS_ERR_OR_NULL(brd_=
debugfs_dir))
f4be591f1436af Calvin Owens      2021-04-16  428  		debugfs_create_u64(buf,=
 0444, brd_debugfs_dir,
f4be591f1436af Calvin Owens      2021-04-16  429  				&brd->brd_nr_pages);
f4be591f1436af Calvin Owens      2021-04-16  430  =

7f9b348cb5e942 Christoph Hellwig 2021-05-21  431  	disk =3D brd->brd_disk =
=3D blk_alloc_disk(NUMA_NO_NODE);
9db5579be4bb53 Nicholas Piggin   2008-02-08  432  	if (!disk)
7f9b348cb5e942 Christoph Hellwig 2021-05-21  433  		goto out_free_dev;
7f9b348cb5e942 Christoph Hellwig 2021-05-21  434  =

9db5579be4bb53 Nicholas Piggin   2008-02-08  435  	disk->major		=3D RAMDISK=
_MAJOR;
937af5ecd0591e Boaz Harrosh      2015-01-07  436  	disk->first_minor	=3D i =
* max_part;
7f9b348cb5e942 Christoph Hellwig 2021-05-21  437  	disk->minors		=3D max_pa=
rt;
9db5579be4bb53 Nicholas Piggin   2008-02-08  438  	disk->fops		=3D &brd_fop=
s;
9db5579be4bb53 Nicholas Piggin   2008-02-08  439  	disk->private_data	=3D b=
rd;
f4be591f1436af Calvin Owens      2021-04-16  440  	strlcpy(disk->disk_name,=
 buf, DISK_NAME_LEN);
9db5579be4bb53 Nicholas Piggin   2008-02-08  441  	set_capacity(disk, rd_si=
ze * 2);
9db5579be4bb53 Nicholas Piggin   2008-02-08  442  	=

7f9b348cb5e942 Christoph Hellwig 2021-05-21  443  	/*
7f9b348cb5e942 Christoph Hellwig 2021-05-21  444  	 * This is so fdisk will=
 align partitions on 4k, because of
7f9b348cb5e942 Christoph Hellwig 2021-05-21  445  	 * direct_access API nee=
ding 4k alignment, returning a PFN
7f9b348cb5e942 Christoph Hellwig 2021-05-21  446  	 * (This is only a probl=
em on very small devices <=3D 4M,
7f9b348cb5e942 Christoph Hellwig 2021-05-21  447  	 *  otherwise fdisk will=
 align on 1M. Regardless this call
7f9b348cb5e942 Christoph Hellwig 2021-05-21  448  	 *  is harmless)
7f9b348cb5e942 Christoph Hellwig 2021-05-21  449  	 */
7f9b348cb5e942 Christoph Hellwig 2021-05-21  450  	blk_queue_physical_block=
_size(disk->queue, PAGE_SIZE);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  451  =

316ba5736c9caa SeongJae Park     2018-05-03  452  	/* Tell the block layer =
that this is not a rotational device */
7f9b348cb5e942 Christoph Hellwig 2021-05-21  453  	blk_queue_flag_set(QUEUE=
_FLAG_NONROT, disk->queue);
7f9b348cb5e942 Christoph Hellwig 2021-05-21  454  	blk_queue_flag_clear(QUE=
UE_FLAG_ADD_RANDOM, disk->queue);
a610c807a6b52c Gao Xiang         2022-06-05  455  =

a610c807a6b52c Gao Xiang         2022-06-05  456  	if (enable_fsdax)
a610c807a6b52c Gao Xiang         2022-06-05  457  		blk_queue_flag_set(QUEU=
E_FLAG_DAX, disk->queue);
e1528830bd4ebf Luis Chamberlain  2021-10-15  458  	err =3D add_disk(disk);
e1528830bd4ebf Luis Chamberlain  2021-10-15  459  	if (err)
e1528830bd4ebf Luis Chamberlain  2021-10-15  460  		goto out_cleanup_disk;
316ba5736c9caa SeongJae Park     2018-05-03  461  =

a610c807a6b52c Gao Xiang         2022-06-05  462  	if (enable_fsdax) {
a610c807a6b52c Gao Xiang         2022-06-05  463  		brd->dax_dev =3D alloc_=
dax(brd, &brd_dax_ops);
a610c807a6b52c Gao Xiang         2022-06-05  464  		if (IS_ERR(brd->dax_dev=
)) {
a610c807a6b52c Gao Xiang         2022-06-05  465  			brd->dax_dev =3D NULL;
a610c807a6b52c Gao Xiang         2022-06-05 @466  			goto out_del_gendisk;
a610c807a6b52c Gao Xiang         2022-06-05  467  		}
a610c807a6b52c Gao Xiang         2022-06-05  468  		set_dax_nocache(brd->da=
x_dev);
a610c807a6b52c Gao Xiang         2022-06-05  469  		set_dax_nomc(brd->dax_d=
ev);
a610c807a6b52c Gao Xiang         2022-06-05  470  		run_dax(brd->dax_dev);
a610c807a6b52c Gao Xiang         2022-06-05  471  		if (dax_add_host(brd->d=
ax_dev, disk))
a610c807a6b52c Gao Xiang         2022-06-05  472  			goto out_del_gendisk;
a610c807a6b52c Gao Xiang         2022-06-05  473  	}
7f9b348cb5e942 Christoph Hellwig 2021-05-21  474  	return 0;
9db5579be4bb53 Nicholas Piggin   2008-02-08  475  =

a610c807a6b52c Gao Xiang         2022-06-05  476  out_del_gendisk:
a610c807a6b52c Gao Xiang         2022-06-05  477  	del_gendisk(disk);
e1528830bd4ebf Luis Chamberlain  2021-10-15  478  out_cleanup_disk:
e1528830bd4ebf Luis Chamberlain  2021-10-15  479  	blk_cleanup_disk(disk);
9db5579be4bb53 Nicholas Piggin   2008-02-08  480  out_free_dev:
f7bf35862477d6 Tetsuo Handa      2021-09-07  481  	list_del(&brd->brd_list);
9db5579be4bb53 Nicholas Piggin   2008-02-08  482  	kfree(brd);
e1528830bd4ebf Luis Chamberlain  2021-10-15  483  	return err;
9db5579be4bb53 Nicholas Piggin   2008-02-08  484  }
9db5579be4bb53 Nicholas Piggin   2008-02-08  485  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5383447120417123370==--

