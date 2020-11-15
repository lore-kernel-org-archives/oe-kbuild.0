Content-Type: multipart/mixed; boundary="===============3803383556026000315=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:bdev-inode 71/72] block/partitions/core.c:417 add_partition() warn: passing zero to 'ERR_PTR'
Date: Sun, 15 Nov 2020 08:23:57 +0800
Message-ID: <202011150853.XzHCTEdS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3803383556026000315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git bdev-inode
head:   aa9426788d1aeb32c20dfd1e0181a42a8dd0890d
commit: 884bbcdbaaf8439db16bcf64ec891dcc62d172ea [71/72] block: merge struc=
t block_device and struct hd_struct
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: x86_64-randconfig-m001-20201115 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
block/partitions/core.c:417 add_partition() warn: passing zero to 'ERR_PTR'
block/partitions/core.c:602 blk_add_partition() error: 'part' dereferencing=
 possible ERR_PTR()

Old smatch warnings:
block/partitions/core.c:179 check_partition() warn: passing zero to 'ERR_PT=
R'

vim +/ERR_PTR +417 block/partitions/core.c

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  308  =

6d2cf6f2b446c4 block/partition-generic.c Bart Van Assche   2017-08-17  309 =
 /*
0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  310 =
  * Must be called either with disk->mutex held, before a disk can be opene=
d or
6d2cf6f2b446c4 block/partition-generic.c Bart Van Assche   2017-08-17  311 =
  * after all disk users are gone.
6d2cf6f2b446c4 block/partition-generic.c Bart Van Assche   2017-08-17  312 =
  */
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  313 =
 static struct block_device *add_partition(struct gendisk *disk, int partno,
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  314 =
 				sector_t start, sector_t len, int flags,
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  315 =
 				struct partition_meta_info *info)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  316 =
 {
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  317 =
 	struct block_device *p;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  318 =
 	dev_t devt =3D MKDEV(0, 0);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  319 =
 	struct device *ddev =3D disk_to_dev(disk);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  320 =
 	struct device *pdev;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  321 =
 	struct disk_part_tbl *ptbl;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  322 =
 	const char *dname;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  323 =
 	int err;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  324  =

b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  325 =
 	/*
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  326 =
 	 * Partitions are not supported on zoned block devices that are used as
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  327 =
 	 * such.
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  328 =
 	 */
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  329 =
 	switch (disk->queue->limits.zoned) {
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  330 =
 	case BLK_ZONED_HM:
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  331 =
 		pr_warn("%s: partitions not supported on host managed zoned block device=
\n",
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  332 =
 			disk->disk_name);
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  333 =
 		return ERR_PTR(-ENXIO);
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  334 =
 	case BLK_ZONED_HA:
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  335 =
 		pr_info("%s: disabling host aware zoned block device support due to part=
itions\n",
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  336 =
 			disk->disk_name);
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  337 =
 		disk->queue->limits.zoned =3D BLK_ZONED_NONE;
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  338 =
 		break;
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  339 =
 	case BLK_ZONED_NONE:
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  340 =
 		break;
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  341 =
 	}
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  342  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  343 =
 	err =3D disk_expand_part_tbl(disk, partno);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  344 =
 	if (err)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  345 =
 		return ERR_PTR(err);
6d2cf6f2b446c4 block/partition-generic.c Bart Van Assche   2017-08-17  346 =
 	ptbl =3D rcu_dereference_protected(disk->part_tbl, 1);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  347  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  348 =
 	if (ptbl->part[partno])
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  349 =
 		return ERR_PTR(-EBUSY);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  350  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  351 =
 	p =3D bdev_alloc(disk, partno);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  352 =
 	if (!p)
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  353 =
 		return ERR_PTR(-ENOMEM);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  354  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  355 =
 	p->bd_start_sect =3D start;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  356 =
 	bdev_set_nr_sectors(p, len);
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  357 =
 	p->bd_policy =3D get_disk_ro(disk);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  358  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  359 =
 	if (info) {
f17c21c1ecb80e block/partition-generic.c Christoph Hellwig 2020-03-24  360 =
 		struct partition_meta_info *pinfo;
f17c21c1ecb80e block/partition-generic.c Christoph Hellwig 2020-03-24  361  =

f17c21c1ecb80e block/partition-generic.c Christoph Hellwig 2020-03-24  362 =
 		pinfo =3D kzalloc_node(sizeof(*pinfo), GFP_KERNEL, disk->node_id);
010459fd9ad527 block/partitions/core.c   Christoph Hellwig 2020-08-31  363 =
 		if (!pinfo)
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  364 =
 			goto out_free_stats;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  365 =
 		memcpy(pinfo, info, sizeof(*info));
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  366 =
 		p->bd_meta_info =3D pinfo;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  367 =
 	}
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  368  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  369 =
 	pdev =3D part_to_dev(p);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  370 =
 	dname =3D dev_name(ddev);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  371 =
 	if (isdigit(dname[strlen(dname) - 1]))
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  372 =
 		dev_set_name(pdev, "%sp%d", dname, partno);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  373 =
 	else
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  374 =
 		dev_set_name(pdev, "%s%d", dname, partno);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  375  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  376 =
 	device_initialize(pdev);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  377 =
 	pdev->class =3D &block_class;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  378 =
 	pdev->type =3D &part_type;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  379 =
 	pdev->parent =3D ddev;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  380  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  381 =
 	err =3D blk_alloc_devt(p, &devt);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  382 =
 	if (err)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  383 =
 		goto out_free_info;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  384 =
 	pdev->devt =3D devt;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  385  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  386 =
 	/* delay uevent until 'holders' subdir is created */
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  387 =
 	dev_set_uevent_suppress(pdev, 1);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  388 =
 	err =3D device_add(pdev);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  389 =
 	if (err)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  390 =
 		goto out_put;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  391  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  392 =
 	err =3D -ENOMEM;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  393 =
 	p->bd_holder_dir =3D kobject_create_and_add("holders", &pdev->kobj);
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  394 =
 	if (!p->bd_holder_dir)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  395 =
 		goto out_del;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  396  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  397 =
 	dev_set_uevent_suppress(pdev, 0);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  398 =
 	if (flags & ADDPART_FLAG_WHOLEDISK) {
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  399 =
 		err =3D device_create_file(pdev, &dev_attr_whole_disk);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  400 =
 		if (err)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  401 =
 			goto out_del;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  402 =
 	}
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  403  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  404 =
 	/* everything is up and running, commence */
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  405 =
 	bdev_add(p, devt);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  406 =
 	rcu_assign_pointer(ptbl->part[partno], p);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  407  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  408 =
 	/* suppress uevent if the disk suppresses it */
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  409 =
 	if (!dev_get_uevent_suppress(ddev))
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  410 =
 		kobject_uevent(&pdev->kobj, KOBJ_ADD);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  411 =
 	return p;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  412  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  413 =
 out_free_info:
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  414 =
 	kfree(p->bd_meta_info);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  415 =
 out_free_stats:
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  416 =
 	bdput(p);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16 @417 =
 	return ERR_PTR(err);
010459fd9ad527 block/partitions/core.c   Christoph Hellwig 2020-08-31  418  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  419 =
 out_del:
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  420 =
 	kobject_put(p->bd_holder_dir);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  421 =
 	device_del(pdev);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  422 =
 out_put:
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  423 =
 	put_device(pdev);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  424 =
 	return ERR_PTR(err);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  425 =
 }
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  426  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  427 =
 static bool partition_overlaps(struct gendisk *disk, sector_t start,
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  428 =
 		sector_t length, int skip_partno)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  429 =
 {
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  430 =
 	struct disk_part_iter piter;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  431 =
 	struct block_device *part;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  432 =
 	bool overlap =3D false;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  433  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  434 =
 	disk_part_iter_init(&piter, disk, DISK_PITER_INCL_EMPTY);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  435 =
 	while ((part =3D disk_part_iter_next(&piter))) {
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  436 =
 		if (part->bd_partno =3D=3D skip_partno ||
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  437 =
 		    start >=3D part->bd_start_sect + bdev_nr_sectors(part) ||
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  438 =
 		    start + length <=3D part->bd_start_sect)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  439 =
 			continue;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  440 =
 		overlap =3D true;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  441 =
 		break;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  442 =
 	}
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  443  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  444 =
 	disk_part_iter_exit(&piter);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  445 =
 	return overlap;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  446 =
 }
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  447  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  448 =
 int bdev_add_partition(struct block_device *bdev, int partno,
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  449 =
 		sector_t start, sector_t length)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  450 =
 {
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  451 =
 	struct block_device *part;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  452  =

0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  453 =
 	mutex_lock(&bdev->bd_disk->mutex);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  454 =
 	if (partition_overlaps(bdev->bd_disk, start, length, -1)) {
0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  455 =
 		mutex_unlock(&bdev->bd_disk->mutex);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  456 =
 		return -EBUSY;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  457 =
 	}
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  458  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  459 =
 	part =3D add_partition(bdev->bd_disk, partno, start, length,
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  460 =
 			ADDPART_FLAG_NONE, NULL);
0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  461 =
 	mutex_unlock(&bdev->bd_disk->mutex);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  462 =
 	return PTR_ERR_OR_ZERO(part);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  463 =
 }
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  464  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  465 =
 int bdev_del_partition(struct block_device *bdev, int partno)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  466 =
 {
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  467 =
 	struct block_device *part =3D NULL;
08fc1ab6d748ab block/partitions/core.c   Christoph Hellwig 2020-09-01  468 =
 	int ret;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  469  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  470 =
 	part =3D bdget_disk(bdev->bd_disk, partno);
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  471 =
 	if (!part)
88ce2a530cc986 block/partitions/core.c   Christoph Hellwig 2020-09-08  472 =
 		return -ENXIO;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  473  =

0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  474 =
 	mutex_lock(&bdev->bd_disk->mutex);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  475 =
 	ret =3D -EBUSY;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  476 =
 	if (part->bd_openers)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  477 =
 		goto out_unlock;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  478  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  479 =
 	sync_blockdev(part);
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  480 =
 	invalidate_bdev(part);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  481  =

8328eb28369a7d block/partitions/core.c   Christoph Hellwig 2020-08-31  482 =
 	delete_partition(part);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  483 =
 	ret =3D 0;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  484 =
 out_unlock:
0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  485 =
 	mutex_unlock(&bdev->bd_disk->mutex);
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  486 =
 	bdput(part);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  487 =
 	return ret;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  488 =
 }
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  489  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  490 =
 int bdev_resize_partition(struct block_device *bdev, int partno,
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  491 =
 		sector_t start, sector_t length)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  492 =
 {
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  493 =
 	struct block_device *part =3D NULL;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  494 =
 	int ret =3D 0;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  495  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  496 =
 	part =3D bdget_disk(bdev->bd_disk, partno);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  497 =
 	if (!part)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  498 =
 		return -ENXIO;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  499  =

0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  500 =
 	mutex_lock(&bdev->bd_disk->mutex);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  501 =
 	ret =3D -EINVAL;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  502 =
 	if (start !=3D part->bd_start_sect)
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  503 =
 		goto out_unlock;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  504  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  505 =
 	ret =3D -EBUSY;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  506 =
 	if (partition_overlaps(bdev->bd_disk, start, length, partno))
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  507 =
 		goto out_unlock;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  508  =

884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  509 =
 	bdev_set_nr_sectors(part, length);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  510  =

fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  511 =
 	ret =3D 0;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  512 =
 out_unlock:
0e00b86c67ced3 block/partitions/core.c   Christoph Hellwig 2020-11-14  513 =
 	mutex_unlock(&bdev->bd_disk->mutex);
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  514 =
 	bdput(part);
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  515 =
 	return ret;
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  516 =
 }
fa9156ae597c24 block/partitions/core.c   Christoph Hellwig 2020-04-14  517  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  518 =
 static bool disk_unlock_native_capacity(struct gendisk *disk)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  519 =
 {
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  520 =
 	const struct block_device_operations *bdops =3D disk->fops;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  521  =

94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  522 =
 	if (bdops->unlock_native_capacity &&
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  523 =
 	    !(disk->flags & GENHD_FL_NATIVE_CAPACITY)) {
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  524 =
 		printk(KERN_CONT "enabling native capacity\n");
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  525 =
 		bdops->unlock_native_capacity(disk);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  526 =
 		disk->flags |=3D GENHD_FL_NATIVE_CAPACITY;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  527 =
 		return true;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  528 =
 	} else {
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  529 =
 		printk(KERN_CONT "truncated\n");
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  530 =
 		return false;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  531 =
 	}
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  532 =
 }
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  533  =

d46430bf5a2298 block/partitions/core.c   Christoph Hellwig 2020-04-14  534 =
 int blk_drop_partitions(struct block_device *bdev)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  535 =
 {
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  536 =
 	struct disk_part_iter piter;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  537 =
 	struct block_device *part;
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  538  =

10c70d95c0f2f9 block/partitions/core.c   Christoph Hellwig 2020-04-28  539 =
 	if (bdev->bd_part_count)
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  540 =
 		return -EBUSY;
e669c1da03a9dd block/partitions/core.c   Christoph Hellwig 2020-04-14  541  =

e669c1da03a9dd block/partitions/core.c   Christoph Hellwig 2020-04-14  542 =
 	sync_blockdev(bdev);
e669c1da03a9dd block/partitions/core.c   Christoph Hellwig 2020-04-14  543 =
 	invalidate_bdev(bdev);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  544  =

d46430bf5a2298 block/partitions/core.c   Christoph Hellwig 2020-04-14  545 =
 	disk_part_iter_init(&piter, bdev->bd_disk, DISK_PITER_INCL_EMPTY);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  546 =
 	while ((part =3D disk_part_iter_next(&piter)))
8328eb28369a7d block/partitions/core.c   Christoph Hellwig 2020-08-31  547 =
 		delete_partition(part);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  548 =
 	disk_part_iter_exit(&piter);
94ea4158f1733e block/partition-generic.c Al Viro           2011-09-16  549  =

fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  550 =
 	return 0;
fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  551 =
 }
21be6cdc00954b block/partitions/core.c   Christoph Hellwig 2020-04-14  552 =
 #ifdef CONFIG_S390
21be6cdc00954b block/partitions/core.c   Christoph Hellwig 2020-04-14  553 =
 /* for historic reasons in the DASD driver */
21be6cdc00954b block/partitions/core.c   Christoph Hellwig 2020-04-14  554 =
 EXPORT_SYMBOL_GPL(blk_drop_partitions);
21be6cdc00954b block/partitions/core.c   Christoph Hellwig 2020-04-14  555 =
 #endif
fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  556  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  557 =
 static bool blk_add_partition(struct gendisk *disk, struct block_device *b=
dev,
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  558 =
 		struct parsed_partitions *state, int p)
fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  559 =
 {
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  560 =
 	sector_t size =3D state->parts[p].size;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  561 =
 	sector_t from =3D state->parts[p].from;
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14  562 =
 	struct block_device *part;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  563  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  564 =
 	if (!size)
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  565 =
 		return true;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  566  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  567 =
 	if (from >=3D get_capacity(disk)) {
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  568 =
 		printk(KERN_WARNING
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  569 =
 		       "%s: p%d start %llu is beyond EOD, ",
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  570 =
 		       disk->disk_name, p, (unsigned long long) from);
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  571 =
 		if (disk_unlock_native_capacity(disk))
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  572 =
 			return false;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  573 =
 		return true;
fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  574 =
 	}
fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  575  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  576 =
 	if (from + size > get_capacity(disk)) {
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  577 =
 		printk(KERN_WARNING
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  578 =
 		       "%s: p%d size %llu extends beyond EOD, ",
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  579 =
 		       disk->disk_name, p, (unsigned long long) size);
fe316bf2d5847b block/partition-generic.c Jun'ichi Nomura   2012-03-02  580  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  581 =
 		if (disk_unlock_native_capacity(disk))
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  582 =
 			return false;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  583  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  584 =
 		/*
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  585 =
 		 * We can not ignore partitions of broken tables created by for
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  586 =
 		 * example camera firmware, but we limit them to the end of the
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  587 =
 		 * disk to avoid creating invalid block devices.
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  588 =
 		 */
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  589 =
 		size =3D get_capacity(disk) - from;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  590 =
 	}
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  591  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  592 =
 	part =3D add_partition(disk, p, from, size, state->parts[p].flags,
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  593 =
 			     &state->parts[p].info);
b72053072c0bbe block/partition-generic.c Christoph Hellwig 2020-01-26  594 =
 	if (IS_ERR(part) && PTR_ERR(part) !=3D -ENXIO) {
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  595 =
 		printk(KERN_ERR " %s: p%d could not be added: %ld\n",
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  596 =
 		       disk->disk_name, p, -PTR_ERR(part));
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  597 =
 		return true;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  598 =
 	}
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  599  =

74cc979c3c7f83 block/partition-generic.c Christoph Hellwig 2020-03-24  600 =
 	if (IS_BUILTIN(CONFIG_BLK_DEV_MD) &&
74cc979c3c7f83 block/partition-generic.c Christoph Hellwig 2020-03-24  601 =
 	    (state->parts[p].flags & ADDPART_FLAG_RAID))
884bbcdbaaf843 block/partitions/core.c   Christoph Hellwig 2020-11-14 @602 =
 		md_autodetect_dev(part->bd_dev);
74cc979c3c7f83 block/partition-generic.c Christoph Hellwig 2020-03-24  603  =

f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  604 =
 	return true;
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  605 =
 }
f902b02600028d block/partition-generic.c Christoph Hellwig 2019-11-14  606  =


:::::: The code at line 417 was first introduced by commit
:::::: 94ea4158f1733e3b10cef067d535f504866e0c41 separate partition format h=
andling from generic code

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3803383556026000315==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICPJxsF8AAy5jb25maWcAjDxJc9w2s/f8iinnkhycT5v1nHqlA4YEh8iQBA2As+jCUuSxo4ot
5Y2kL/G/f90AFwBsjuOD7UE39t67wR9/+HHBXl+evt69PNzfffnybfH58Hg43r0cPi4+PXw5/O8i
lYtKmgVPhfkFkIuHx9d//vPP++v2+mrx7pfzs1/O3h7vLxfrw/Hx8GWRPD1+evj8CgM8PD3+8OMP
iawysWqTpN1wpYWsWsN35ubN5/v7t78ufkoPvz/cPS5+/eUShjl/97P73xuvm9DtKkluvvVNq3Go
m1/PLs/OekCRDu0Xl+/O7J9hnIJVqwF85g2fsKotRLUeJ/AaW22YEUkAy5lumS7blTSSBIgKunIP
JCttVJMYqfTYKtSHdiuVN++yEUVqRMlbw5YFb7VUZoSaXHGWwuCZhL8ARWNXOOAfFyt7YV8Wz4eX
17/GI18queZVCyeuy9qbuBKm5dWmZQrOTJTC3FxewCjDastawOyGa7N4eF48Pr3gwH3vhtWizWEl
XFmUcdxCJqzoT/jNG6q5ZY1/ZnbDrWaF8fBztuHtmquKF+3qVngL9yFLgFzQoOK2ZDRkdzvXQ84B
rmjArTYpQIZD89brn1kMt6s+hYBrPwXf3Z7uLYkbC/YSd8GNEH1SnrGmMJZWvLvpm3OpTcVKfvPm
p8enx8PPA4LeMu/C9F5vRJ1MGvDfxBT+cmqpxa4tPzS84cR6tswkeWuhHl8pqXVb8lKqfcuMYUnu
D9loXogleV6sAVlGTGOvmCmYymLgMllR9GwGHLt4fv39+dvzy+HryGYrXnElEsvQtZJLb4U+SOdy
S0NE9RtPDHKNR2sqBZCGA20V17xKQ8GRypKJimprc8EVbmFPT1Yyo+CkYVvAlyCRaCycU20YLqot
ZcrDmTKpEp52EklUK++Ca6Y0RyR63JQvm1Wm7TUdHj8unj5FpzrKa5mstWxgInf5qfSmsVfko1g6
/UZ13rBCpMzwtmDatMk+KYj7sUJ3M153BLbj8Q2vjD4JRInL0oT5UpFCK+GaWPpbQ+KVUrdNjUuO
RI9jkaRu7HKVtiqgVyGWQM3D18PxmaLR/LatYXiZWl028EElESLSguI5+Ac1dWsUS9bulj0lEcIc
SZC8ZucgIblY5Uhp3X5CnI46JlvqV1crzsvawPBW1Y6CpGvfyKKpDFN7cuoOi9h13z+R0L0/WDj0
/5i75z8XL7CcxR0s7fnl7uV5cXd///T6+PLw+Hk86o1Qxt4SS+wY0cmBNbGOwMQqiEGQQkI2tFQb
zNLrVZ2iJEo4iEeAm3lIu7kMFgcUhRaPpg9NC/KO/sXp2FNUSbPQU9qEte9bgI2rhB8t3wHBeivX
AYbtEzXh2m3XjpUI0KSpSTnVjmTdA8LDGUGtNcfKJXkk4VaHS1u7/3jXuB7ITiZ+s7OwPHFTSLSX
MlAjIjM3F2cjvYrKgJ3KMh7hnF8G4qMBI9SZlUkOwtvKo56+9f0fh4+vXw7HxafD3cvr8fBsm7vN
ENBAEOumrsFU1W3VlKxdMjC1k4AeLdaWVQaAxs7eVCWrW1Ms26xodD4xo2FP5xfvoxGGeWJoslKy
qb3DqtmKOw7mnoIDSyFZRT8ji8W1reEf/+aXxbqbgxKTFuBOdRwoY0K1JCTJQE+wKt2K1HgbB34P
0UdZ69prkdJs2cFVOmM6dvAMBNstV/M7yJsVhxuJjxV09kYknFgR8D3KkPkRgYMzop81AmhdATYl
mBAgnuid5DxZ1xKuH9UGGC+U2nLkjY6Gnc2fHxQ8HH7KQcaD7cMpw1fxgnmWE9487N/aF8q3wfA3
K2E0Z2Z4NrJKe7dlmBeaJpb/COr8FR97xsy3yHIedEVP0Dkr/ZakRO0WyiFgO1mDPhG3HFW5vTmp
SmDk8OIjNA3/oa6gN+8D+SPS8+vAFQAcEPMJr62ZaQVrbPIkul7DagpmcDneJups/DGoitH0x7mI
hZXgvAjwCzyhoIHoSzSkJtafo5ZJc5YD8xahzWEts6kVE4hoTzo5kV2VwneFvduY3zYD4zprguU0
YIhFP0FWeKdTy2BXYlWxIvMIwq7bb7BWqt+gcycQe2EsPHdZyLZRobRPNwKW2R2c9g8KhlkypQQp
htaIvS89Md63tMEFDK32NJBhjdgE9wHU0U9PzDNqo96dRfzfREhBQCQWmFFSwg6BemrcEExYgfUO
MingZc0/EP2hF09TXys4coc528HPGMkrOT8LWNsq5y7cVh+On56OX+8e7w8L/t/DI9hdDNR2gpYX
WM6jmTUzuBXGDgh7bjel9QxJo+ZfzjjYsKWbrlfEwbQYZWJw8mpNyY+CLQO5XTS0H68LOQdgS7gc
BWZAd8kz01i1WAhwDRWwtSzDaX04uuRgWKb0fHmTZWBbWcNj8K1p0Wh42YJ7xzAaKTKRsM7195wT
mYmCdgyslLQqMHCiwwhgj3x9tfTd4p0N2Qa/fY3mYpQoilOegM/vCUnZmLoxrVUJ5ubN4cun66u3
/7y/fnt95cf51qBaeyvNkx4GfERnNk9gZenZ3parSjQMVQUaUzhP+ebi/SkEtsPoJYnQ01g/0Mw4
ARoMd349iVxo1qZ+ULEHBFLbaxykUmuvKjDk3eRs32u4NkuT6SAgu8RSYdwiDS2SQfSgd4jT7CgY
AyMIA9jcqmgCAwgMltXWKyA2E4khzY0z3pwHCn7OiFBxMK56kBVjMJTCyEre+DH0AM9yBYnm1iOW
XFUu2ASqVItlES9ZN7rmcFczYCvN7dGxYmrH3ko4B7i/Sy9gbON7tvOck9EJRli65Wdf/2hWAcez
VG5bmWVwXDdn/3z8BH/uz4Y/9KCNDRB61JCB4cCZKvYJRtp8LVuvnLtWgBAFLXoVeUiwBu5YC2+Q
Jy6UZzVDfXy6Pzw/Px0XL9/+cg554NZFx0ILtJLydVCCZJyZRnFnq/tiC4G7C1aLZKZnWdvooN9n
JYs0EzonLXEDlosIozs4jCN8sB4Vpd0Rg+8MEAsS4GhBBUNQ0wYIyLQFCA1a2o8YRa1pVwVRWDmu
oPOiSFwhddaWSzGzm4F4ukg3uJZFE5oZzueRJZB0Bm7JIHaoEPceuBIMNLDeV02Qv4HLYRh3ClRR
1zb12bwF5hsUV8USaBF0WkeJ40nwijL2wDqI5ndB3brBcCSQeGE6w3VczIa+sGGRUUCMMsV71D78
MQzyG5xqLtEEssui0waJqk6Ay/V7ur3WCQ1Ac5HOB4GelSWxgUE/1J7i7OlRVaC2O+HvYkDXPkpx
Pg8zOgnHS8p6l+SryF7A8PQmbAHNKsqmtGyZsVIU+5vrKx/Bkg74eqX2LAoB0tiKkjbwFBF/U+7m
hUwXvETfkxecDj7AQoBnHId6Lm7XDFw5bcz3Kz/90jcnYL6yRk0BtzmTOz8Bk9fc0V9A+2kpyNtd
MSBBIcH6IdZfWaWp0SAFtbnkK5jnnAZiXmgC6gzeCWBsgA0UaFqEWRNLIpisbVGGR9QliUbFFRiG
LhLQ5ZptcAETVxGNJBMpDk0Yriz4iiX7OYVhMzvBLfbNwS32jZiQ0jnI9inI5djCdpNzsGeLUWY5
7em5N1+fHh9eno5BfN/zozol0FSd2zeLoVhdnIInGHSfGcFqEbntCKuz92cWGbBR5wGDldYUEx/D
XWpd4F9wCsQFiPeenVaKBBjPJQJHGdU3ul1Q8ZYBI7ivsRnuykmuLAj+2FvzxUWn90Ua7+GdNY9m
6CcVCq62XS3RitPxaMwVd2gjkkDE4IGDqgXmStSezBE5m84aMw6RERbrAO75MYJb8dXrdMyxBrrO
eQkOaG1G6oYK5J6iV/aY6mw4mqKHu49n3p/wxGpc00m2s2FW8IekxniGauowN40oyOeoS8t+jSOi
6x5LCkwnY4Ji6ymH0qhAWuJvtGuFEXSg2i6fxScJOluDtYxsyMJQuwVP/XprVIH3NzNDU/pFJ541
ONyGcen6ds33EwvY4Rq9s3eK/sHMNDHilD1DBIxok8qEZ7SSyW/b87OzOdDFuzPKOrxtL8/O/JW4
UWjcm0ufuNZ8x2k7x0LQ5aTt30QxnbdpQ7ocdb7XApUSMKtCR+s89K/ABcZgS8eBY+DN3jrGqTFK
eGpccLRXFYx7EfFKFxbYpJoqqnEMFAvZYAkxyk5WBZ2NjjExp02fVJlapx7Yr6DNRpmKbN8WqTkR
ALVOfiE2vMZsXKBWTniOkxACS9M2EqwW5sRhzy45CIqiiZOBExwF/9vEMrTD0nUBjk2NetB0ZjuB
hW6/DTSUYqVYKLJ8PJPXAYpT+k9/H44L0Kd3nw9fD48vdussqcXi6S+sY/TiqJOQhUvVBu6Yi1ZQ
R9/144PH5J2eN2jAgd5cumI1WDjoj20ooi6BTfBWlBEmLMNDUMF5kJeCNpQqtp32rMp2y9bcltOQ
00WjzXmJAEoK7962H5xJA7IrE4ngYyx+LhqDd+HBJr96HrKCQIOikeumjgaDW89NV+OFXWo/8GZb
uuisW5u1ybQXs/T8QMC1e12ResqNVSeqNZFlYFda+1a3w+1uxm9TfNMCSyglUu7HvcJVgFztaqrm
1sHiTS6ZAWthH7c2xoR0Z5s3MDsl/ywwY9MOhtExE3dmQEhzg1n/UXGgDK2jtY1OX2woR2CRTk57
AE5WKuoZ7ywalK1WCoiLjue7PTtHggizdkeCcqepQeak8fJiGEFjJ9aYIOnIuWAFHqoEBxY0hppH
6QR0J4vntthjCdn5geEgekmHwVzfmaSJW2GjjUQz0uTyBJriaYM1h5iF2TKF9tKMMrXo8L/5+k7L
FTX3JEjY3mVmwxERcIKwa5OdvAX4fzZTVQXeUCtrIDEQ2HNGbzmNLejQ7Ovr1BbZ8fB/r4fH+2+L
5/u7L4Hr2rNYGM+wTLeSGyyhxbCKmQGDQVTGQRILRJ70VzYA+vwq9vYqCmjThuyEgljD5cyEeSYd
MG1rC0i+ux5ZpRxWQ5Mc2QNgXVHs6fVEuyVX8q83F2+Kgvdbmb23cd03Y0Hj4lNMKIuPx4f/upwx
4YjUVvTOBrvrxAYlcdb5gHgn508igenEU1DDLvqmREV7PXbOKxfHLUPJYdf//Mfd8fDRM9/8ckWC
SYZjER+/HEKWCbVK32LPtgAjOGTLAFzyqpklsAHLcHqLAVIfECelmgP1wXPfoh925KUb7HXGRb+j
D/BdU9ge1fL1uW9Y/ASKaHF4uf/lZy9MBrrJxV+8sBa0laX74UWDbAvGjs/PggJ+RE+q5cUZHMGH
RoSlAuN2NAPjhTJ/urQtRi49rQtuRBVUF1ii2+uMruSc2ac7g4fHu+O3Bf/6+uUu8hJsfHs28ra7
pGrBOo/TT1O6pvi3jbg211fOdwUi87Pt3ROLoee4k8lq7Sayh+PXv4FXFunA/d1QPA3CbfBzJpyR
CVVapQw2RMkCF0PoRIOptcwodZxt2yTrCq38Tn577/NSuRApVwUfZg/zihaEcVkbkrZmFlWIk4kh
/drLRnP4fLxbfOqPxQlFX4DMIPTgyYEGVsZ64+V4MRXVwCXexv4qWI6b3bvzi6BJ5+y8rUTcdvHu
Om41NWv0IOz74pC74/0fDy+He/Tn3348/AXrRf6eeLh9jgnFr+cm2OVLV5ziycO+Ba2mqZWydglv
4uh/a0pMQyzDuKd7b2cjaxgizeJXaDGijZdQiP6iRy+zqSzLYIFogub9NJRoH6UZUbXLsDLYDiSA
nrBshCiaWMeZfdeKWWwKIGu6vRsGH+1lVEVk1lQu9giOITo81NOhDQ9rC8dXTXbEHHzjCIhSEl0F
sWpkQ7xx0XBVVhO5Jz+EowMSyWDkqSuHnSKAXdm5GDPALlhfTg7drdy9fnQ1Su02F8ZWZUVjYR2I
btN9xdCotu9jXI94SF1iqKx7lRjfAZjiwH9V6sorOkoJtYjD074pHV4Pvq2c7Zhv2yVsx5UyR7BS
7IA6R7C2y4mQ0CLEAolGVW0l4eCFX60V1xIS1IBuFFpOthrbVY/01dqTQYj5+3JB1R0Rxm6pWwt4
/ATUr+IcrIKmBac7510QxRbikWB8i0GhdNTluME9kOiS2tFiulaX/JyBpbKZKTvqVDLqXPf4rX8C
S+BiumvEp85E8wQRToC60q1AaDrIrMNre+NFFUBV0dCTEiJfwnqQk4NvhclBZDpisBUoMcWgdIke
k/ng7753cuL31KMnxz0SqbOMC2t74VdhVg71QB8s/rd4bd2QYyIca2bjUKO9bQvEsDUoaUVOpWVm
BZ+J1SwIpz6NyBMsEvUoX6YNhjhRV4Hes6xDiFQL6pMg1NxBHWWEwHfC0LI+7DWWZhLjenWVc4P4
KMRQHdiiYxonXqajt+6F51QJwskIl0AYKlBHjM5tCKUz8qcWqy5+fzmxuzs4i1TuYLgvhSsCoc4b
qcStxGeysfVUmTkoMQFqr3uzrbZezecJUNzdUQ7ZnQKNS6/hJMGd6VJtocYc7CZQ7oFxNGa3QM/4
leBkpNorqO8T79PL7g2+ecj47QVn+SZy8/b3u+fDx8Wfrnj9r+PTp4cwKoZI3fkRZ2ehvYnLwoK0
GEY6kKfWEGwDv2uBMVZRkaXd37He+6FAjpb4BsRnFvtQQmNl//jli06M+NvpiMA+5YVbmwnkd1hN
dQqjt6xOjaBVMnwWIj67CFPQQfAOjOyn+EwhZoeDNbxbMK60RtUyvDNrRWnzSwRJNhVQNbD7vlzK
Qk/lrwFjY5JnWob5SXw+Zh1gxT+ExY79w7KlXpGNhQhiFOM7NMNXShgqTt/jYF1vGg7a542tgaJC
2HZp4pmgqS2pdytuCqyLznS8bNdKzY7HKGvftMJWx6k9swfylAS3WZcx7Zm7vju+PCDxL8y3vw7+
S5c+/YlPkTAE6yuxRILNPCZI5wBt0pSsYvNwzrXc3QRZghBBJHMpkRCPpTO5uxDNRovBFDs1pRI6
ETtqMLEL9jyMgJXHA4DqWIK2o7syw5Q42blkCd211KnUdNdRa6TldzD0amb6AaMp7LcuvjNMU30H
Y81Uyb6Dg4Gk78yz15vr9ycPzGNT79D6uGxE7oHImQQKkYXKDxhCnbShre2/4MNmm8l3HzmR43tv
j6egn5CuzDwFqzD8wJEHXO+XvoDpm5fZB38v4SRj4Ko6H7s2VScCdA2uBaqbSeXHWB1gJDr8qtze
TA0T+9WY1A5jCxnmUdSWQkAroALuwmR8weoaFQhLU9Q4bZSWGS2u/jFgu+QZ/oPOcvghFQ/XVf1s
FQzuH173Yru/Gf7P4f715e73Lwf7Xa6FLQB98e5oKaqsNGj5T0xTCgQ/wrrVDkknStShTnAA0J50
fRcOE5dvDXc9t2y7p/Lw9en4bVGO2YZJNJIulOyBQ5UlSOuGURAKGTxRsFU5Bdq4GPakqHOCEUd+
8PMyqyb8lgCuWGhZRN7JXGlU2N5NOQvuc5Oyil/JxGVVhKjpaqqMEx5YHX4VkEwSy2zrBSuO/EY/
rSDKrhIbUmyj91NYeWcZqDXxC0X3ikOiYzY2rrV3h/2m7R257+ik6ubq7NdrWjJM3syERzRpz7e1
hBurJgXjM9GD4XzIqAErtmxPaXcSu3Qvp8mYJlathQHpaUvw5m7tHVpScOaKY/0VZwquB0cgNVHw
SQL4OVvbNcB8kxAbYXdM3/zPOMptHZUt9u1LP7hyq8ueYMaeXdvwKK50cpiURgMy+oUnntDYvE8f
0vdns5FueyN9tOqUx1rbN5phDMg9whreFUTqRrsvH0GXNivYitI3dVda3LMMV/blCX6aZ2wFaQPq
pUrykqkgqGBD5VggY4kEk4W0ielvwQaaWOFr6XnhPFLc8Imk6vDy99PxTywj8HPug/RI1pz8nGAl
vJAD/gL9E5QV2rZUMPqyTTHz/i5TpVW6JBTWjSkmKmfstjTSQu0+GoEf9aLTz/XgZbT2OQwVKQWk
uvI/wWh/t2me1NFk2GyL6+cmQwTFFA3HfYl65huEDrhSSK5lQ7kJDqM1TVVFWbk9OET/z9m1NLmN
I+n7/oqKOWx0R4yjJepR0sEHkIQkdPFVBCVRvjCq7ZruivHYjqrq2dl/v0iADwDMJDu2I9y2kIk3
CGQmEl8qVVcQwCwm46XCPaSAeshxR4iWNlSLVwDT0jD8+Z+mKXWeJoqCMI9rat9dOxEWnJdURUWX
7BZ/jgt6gWqOkl1nOICq5kVWZY67tUHt6p/HfrVhp0rHE51D22TcHZod/ePfPv/528vnv7mlp/HG
M7T0q+6ydZfpZduudTAN4o5vmsmAxcALmyYmjEXQ++3U1G4n53aLTK7bhlQUW5rqrVmbJEU16rVK
a7YlNvaanMVKRG7gFWZ1K/got1lpE02FnaZIWvxX4kvQjHr0abrkx22TXOfq02zq9MClejPNRTJd
kJoDfYWHG98KtbCobIBcCFdXcHpN8iiBUVvV1fGXkqe+YjYXYyg1LCaIau+JI6KdAgC5iN24JAC5
1BziI8qqFE1PAqKGsBTxERPfzbUm7BvSEdTaJLSwS8KyZrcIlrjvXcyjjONnXJJE+CtlVrEEn7s6
2OBFsQJHbClOOVX9NsmvBcOtKoJzDn3arKlVYR7H412OQmRs4wzu3JXWpvT9j/+yJkNNH9M2RbSw
vODZRV5FFeF72UUCACgBrQhfEcBNk4dEWhAnI/QwI5AMTpIWf0xLvWckDkeyUmK2hE2e4nosK7qC
LPLhIjvdwKDAAU9RCsL1ceCJEialwLZcfbLWoCzeGhfkKnx0xJcW38kuwpZZ796f31oMT6cHxUN1
5Piy099ZmatDM8+Edzvey8+j4j2CLStbk8bSksXUuBCfQUi8ATioASqp3ejQPETYy9+rKHlinKOG
ig9H+MyWozHsCd+en7+83b1/v/vtWfUT7D1fwNZzp44XzWDZEtsU0GdA/wA4nNoA1Vjv765CpeL7
7uFBoI6wMCt7RyGG34PB05m+/RQQYcQELtZEvDg1FKx0dsBHupDq4CIeP2r59IDTsIO326QAS6fV
6Dt1sMxV8zzENTBwgOESKYJXp0op5N3e47sADKBoep7j53+/fEacRA2zcI8h+E2dWo5J2v/Rglh7
8GdCm51wJ1+gMlmkTjE6xXpS5pSlaajzPcEG1qS/xDzzxAEYla6NywDaN1piwihQtPuzPyoT61e/
DKrO2PEGJLD6wRc+4EA6OUWO7/dAU1s2TWP4Rq2r9D099WiAB4Za49Q76Z6HmEpNA88ueryB4y9N
jGHkZQD/w4/T1vAKXuD+Nghpn79/e3/9/hWAcoeXFO3H8/by+7crOAUDY/Rd/UP++ePH99d327F4
is2Yy7//psp9+QrkZ7KYCS6zZT99eQbgCE0eGg0o26Oy5nn7+yl8BPrR4d++/Pj+8u3dMQuphcGz
WDs6okeok7Ev6u1/Xt4//4GPt/sJXFs5p/Jfplvl06UNyzBiNvprEaWRYO5ihBTtNNFEAtunoARj
1m678eHz0+uXu99eX7787uJy3QB0Bl+n8fY+2ONy8C5Y7HEhvWSF8OSJwS385XO7pd/lY6vd2Xjt
nHhSoCeIkgurtHB997s0JRmdMxR1sWJZzJIxbLuuq39KoGODjNrc+9Z//a4W5utwDB2uevCd67Mu
SdtyY0DGti6/6qpkw9OB4Z30kEv7t5q+OycqxtA7JyAdHjJ0jipecfocR5en393ecqu9WcDZo7t6
c6cAfDHiUuDnfkvml5LLcTbwo2/zNuTtkTrsHnPZPJwhlEwbBWZQf6EEpm9A23IoABOTv2PiXjwZ
C+pKP1MnYmsA+XJOAPsvFImohO35VPKjY5g3vxsRRKM0mYjUuXdq06/LcXY7vEWXPYosyEFwqNde
n3rZHXxUKLXyeBaZ+wV85omPs3969UWLY87Xmp6E/xDKecXUZbGE2VxJl4Rz7zGzX0ekbrgb9VNP
lhyfg72Xwo+n1zfXhaACn9Z77d3gFu04PngkNYT6Bc8EybwcgOs84371YUkWoB+AaC9GPuqQywh3
KOM3xiNfjK6XuvNn9U91+oJbg8HErV6fvr2Z11Z3ydP/joYjTB7Ud+h1K/Sh6Q4Vquwc3Ag68Lsp
r6iV22MtD7Ff6GDql4cYA3CUaXOwkdqgpXleeG1vLySdce29WdTHYAwKo1VTsvSXMk9/OXx9elMn
8R8vP6wT3V4nB+HW9yuPeeRtDJCuNoc+Fo/TGFUCWHC0ZdrzT7S4jMNx9tBokP5m6RbuUYNJ6tpb
6ap+sUTSAiQNHmpCrDSsD2mMR27qGNQxy8ZFnivhzaEaei/BBUvSX20oOSGgTcyckViffvywnhZr
i4DmevoMSDPe9OagJtfd7a63tsBvIEWWl0luPV2IEemYjgUg2YHLgLtsw6g51rWbqIb4flub4bCS
RXSqkTHiMgzKHNftdN8edot1PcUhozCAC2HCmAcsSlV/f/5K9DFZrxfHejQ8Ea6vGRpIrSTZPBS+
lE2GnhC6hIRVZgUN2sfMjJuAI89f//EBJO6nl2/PX+5UUe3xhEnyuqI02myW9NglqhXk3I/WuPrj
pwGWWZVXADQFhijbo6SlKgFDtnjKy+HhQ79jB+aMNPrey9s/P+TfPkTQb8pyAjnjPDpazwxC/egh
U/JT+nG5HqdWH9fDQM+PoTFyKnHbrVTtxJkDF2AlGlDyW3MtRcVxjiG8jjMFHdm7u0Y4ghr25uNo
VjSRRxGobSeWpl7kJIJFnUwEuqre3a46z+jEUWWocfxdjRym9WLU3ngL46mZk0JtJHf/bf4OlEqX
3v3LuEwQi9hkwLbR+aLsgTqH3jGoEpprYuFfestXM4Q8bMM9DtGDOhp4rzmCckc4JmeO1TYSUoCg
sYVHImjLkGMGHh+XyTyiczHiqYSmcNZgl6qUMsFw2WbIqDS/A25ht3i02U9g6EcWE2ILaIms3u3u
91gYko5DbSPrcbeyvO1al257jmi3Ea2opUqRbNHXOtTv9++fv3+1HeGzwkXKap8IOHcj7auB7Jwk
8AO/XmiZDvg9mmq5iHHTWpcTTGxSws4rilVQ44b9T94mPirlnPJphkSJpJMMcRnifejHYYYuH2bo
NQ4C3dGpLkaxkg3gyimKLwQOUsW0DzIY7vEbRn3PMTuJcyNQSnd6zClySblja/SHDejo/YYiNAdM
o9CUipVH1+PKSqan02YiLl1slpEXQreX270y8urL22dLue6UH57JvJRq+5Sr5LII7Acl8SbY1E1c
2IgAVqJra4jPaXpr7QeD7S5M4UU6cS3OsooQGitxSLUBCLcIRnK/CuR6gUtNPIuSXALGNoADCSrk
1qloRIICwBWx3O8WAXPvm4RMgv1iscKbpIkBBibajXClWDabxTBiHSE8Le/vHWTSjqJbsl9gDm2n
NNquNoFjfJHL7Q5DX5GdHNuNvGWbpoIh1xCmpW5kfOD2C11wAior6cjixaVgmcC+gyhwjzfzWy0V
1SBWNsFSD4eRWngBGsQgsXSTqdPVDhFY50mbaIARnds5Q0hZvd3db5AWtQz7VVRvR+UprbbZ7U8F
l/WIxvlysVjb2oDXYmu/C++Xi9HqbQFY/vP0die+vb2//vkvHV+oBXN6B3MKlHP3FUSzL+pbffkB
/7R3pAp0X/Rr/3+Ui20A7hfNwK1IQ0kXjo2lwwzGta+e2hDb5sBQ1TjHxdjJLymh4Ckx/fqIZ+XR
CRd+9MplSQRoEJTe2C1un2NEP0vnCeOJhSxjDcNjiDr7rnNfLFxcRE/QMNokuJq0us/o29DvL9Pc
MfeVTMQa7g4zAEEGa/+B7E7wH50C8JDmEeTQgrZqg537k1pF//z73fvTj+e/30XxB/UV/IwdnJJA
oDuVhow7dvS50XiOXV47wF+XZge80T3RmiXzooJpSpIfj7jzuybLCLyhwM7vjELVfUxv3hxIQFGE
MR9VdIjGk+FyGBipqRlrJIAmtcX76YkI1V+jeoEEocz9aDceV1lgzeu0cK/P/+WO4FXj07snJFA8
icShaSv0CBTLTFZ9DFeGjW4wMK3nmMKsDiZ4Qh5MENvVt7o2tfpPf050TaeCcEjUVFXGvib0gY5B
zRNNZ3CzOkFm0XTzmIjuJxsADPsZhv16iiG9TPYgvZwJJFqz+RQgROIbtqkfPMLlbWqMyiglfAE1
nav2BTg9VeKD3i4zfqW84XqecViBMc/0UBTVao4hmGSQSmaqikfsaNL080Geonj0YZlk8tRzeNqQ
ThM1tM/6R9kb/Zh9YipPcC0xsReFZ6l2ZYFrPGaAbiURErGl4mPXShPFZXrXkNlU3XFar5b75cTH
djD+XdPjfIwJBbc7CibyimLqFIHQEhOjr+hsicY6MGd+4UsBIk1H0yw+iaLhRYEGoB04JNzgR1U5
PpQqPrGVyFu6WUU7tenizh6a6VGvETAv4eEfWiY2d0bE0Wq/+c/EtgJt2d/jrtea4xrfL/cT3aE9
2MyIpzObd5HuFq6Ca1P9l+7OmUx78bATW24CvNUtS7uOp1ge6Q+15TBzuSFidJjx8T4EW+jwBF7H
UIQJ5h4qBxzgqXsJbsJmG0A4fBOPdVBJhl4HxVoOsFT3NmU5ThkzrTdbJ808hWHVyWugdgPET5hw
5Efj9TZOO3DH8UjE9hvjNpCBkxKeD64PccfVAjAAWsiRl9q1EheaoRCRgwOltB9Jx9pxVAr13UMY
BDV5Xi1niMwqCvTFlyJ3WEl2li5MBJ5DY7UpBeYiAHzHAVGD8vx3wl2aOloxTBhF1pdFnjeySuah
9MpRmjLRCd8fTKWlAiAu0alWVH9fGCifeJk77UDXkp2uvlW8qIHDdkxyCCeP4oVrhZSzx9KGXXPm
WHu/UX09JAx/rapocF9XuRWapO4mr1TahHayl66j78B4IML2wEIavWcZaBC+Tc+8P8tTIEUwPy1C
0GCxMUZa0pJ5OEsPL8UglXDO75ar/frup8PL6/NV/fnZuczrsouSw5MGvOyW2GS5xH19JqvpdywW
qV7nEMZIe7PZrgssAiDoFGJLhpX14We8MkFBpZM2iiEe5llMvXrT9mSUAp06ninViD9q2OGJ59GU
VR2s6Zy4w1BdhUdmuEGrIEmXmqLAVTPhdR8qcfUc46LykXhOp9onibWu+qX+JXPilUZ1xhuo0puL
nrQyl7Ihcl9mbmyoh29ZkhJgQkqh8zJ1fgfvry+//fn+/OVOGrdmZsHGOffSnc/5X8zSW3oBczWz
g0RA99XuFedls4pyz4auBR0l5BBC4sCww/2aL3lJycPVrTjlKI6S1SIWs8JHzTJJOqDYwdsXkALU
oe58jrxarpbU6/kuU8IifSY6R45MRJRLzIDlZK24H4eHU1pXa3yu0AhndqEp+5Rn6JQxVwZUP3fL
5ZK8Yyxg3a1w3aOdzCyNqO8ZwPfrI+oLbDdJbU5Z5Yrm7JHAzLLzlRHeRViyuRvjsUqoF60Jfl8G
BPzrBgo1PXPr5KwkHLefOqXJwt0OVUStzGGZs9j74MI1/p2FUQp7KWFMzmp8MCJq3VXimGf4HR8U
Rih8OrgW3G1RGTF51e1w5EVJCjNMoLTyQAYvCIs6BbB3UU6mizg741qdzhl48KsBaQr8ZaDNcpln
CY/ErmbxlARPIh7P/pMOpBcnnkhXZ2mTmgpf4z0Zn9qejK+xgXzBXH3slgkZOe3yNzgki8adckGJ
6kYpHYTQnKFoM1aBsXsoGCCQRGBWeTtX+1JyqCgJcG8LqabRf3A2Lg8ihHDnnjjkwWzb+afoJAp0
rzucfxWVPCOH8CG9/LrczWxIJm4GWvLpzK52zCyLJHbBxvaetUlt+OZhqnEDGyQvfL4FcTd6xC2c
Kp348ERNZfFPo4GyJmvH98Rf05m5Tll54S6AcHpJqZfe8uGI1y8fbpj7gl2RqoVlLjppmtTrhjLf
J/WG1r4UVV4nyQfs0YHdHhGV7iJ4kLvdGj9zgLRZqmJxF74H+UllpS6fvUrz9jMZNk6W3a9XM9+A
zil5iq/19FY6weHg93JBzNWBsySbqS5jVVvZsBmZJFwnkLvVDnWhscvkFXguOmKkDIiVdqlRiBG3
uDLP8hTfGDK37UJJeLw1h0FoosaXO8Yl7Fb7BbJjsZpUjHjwQN4htLkLX0NCWn5Rp6hzpmjs69gT
fscZ8wenzxC7cOb8MgBoaiyOInMNJiclnKt1inblxuGh30HMCL4FzyRA/TvXzPnsmWos1Hamx4St
qLvQx4QUB1WZNc8aivyImi7thpzB58S9S3mMwJ+IwiYq09nJLWOna+V2sZ75akoO+pRzvDPCkrBb
rvYEYhCQqhz/1Mrdcrufa0TGja8CQgMEmRIlSZYqicO9dISzzVfkkJzcjmJjE/JEKcjqjyM9S8Iw
pNLhEWw0p6RJkbhRY2W0DxYr7A7HyeX6Qgi5p65NhFzuZyZapjJC9huZRvtlRLyi5oWIqHDqUN5+
uSTUHiCu53ZsmUfwQq7G7Sqy0oeSMwRVqi2Ls9N7doNJs6K4pZxwkIclRHhYR4DCkxFnkjjPNOKW
5YW8uYbia9TUydH7wsd5K346V852a1Jmcrk5IOykkmIASUwSWGWVZ7QYl3lxzwr1sylPggjVDtQL
BMzA7eBWsVfxyQOdNCnNdUMtuJ5hNWckMB6qduGtzyqrBb29tjxJosZ6doJqUeJmPyAExH38IY7x
taQktoKGkZQhqAX4sX+6Ubg8IGQ3xtY+MpkWkcSenvX4ECOqVWNCIG0WBeHCgeuXZxm2gFLd1UGf
A0hKx8VnCYgPSikjTHVALviRSeJBDtDLKtktN/iADnR8RwQ6CNQ7QmAAuvpDyXBAFsUJ38Cu3iHR
QVI11xiznwL7YPFNzSGO0dw7QLi/mwixXZ02IykTLTS14UNtkmWiQ6idGQQhdWozQSqlcPQpcGJk
xFoshUxddDyk0EE3xYhcScnkmNqKFkIumQsu5dB6gQsj2l64NsG+TbXTK4L/0y225SmbpA3NPMsw
L5CS3aIxvgHXyGZ31xcAJ/tpDOT2MyCgvT0/373/0XEhjwGv1E1YCioPbn1rLTsNDcELUAICP731
jR4CBTaoCzJGT7+Ls7Grn03hvS8yd7Hffvz5Trpgi6w4u1iqkNAkHP2YDfFwAIz2xInRaSgA9Wce
sTnJBi3/wXnFaCgpgzAgLaUHavgKcY1fvr0/v/7jyXns02aC+1rvrZxLAVg3FEbZY5NRyZV2VH9c
LoL1NM/t4/1259f3a36jABgNA794dI9qXFmseaJeJJsMD/wW5gbvaDC7tGlqdy02mwA/MFymHf4O
zmPCtKGBpXoI8WY8VssFcWw5PPezPMFyO8MTt8ic5XaHY5r2nMnDA/G2rmcBAIJ5Dr3GCdDSnrGK
2Ha9xLGNbabdejkzFeYDmelbulsF+M7k8KxmeNSOeL/a4Je9AxMRO2lgKMplgF9i9DwZv1ZURJ+O
B0BbwbQ5U12rXc8wVfmVXRnujjFwnbPZRSIe5Za4RBsmNg2aKj9HJ88zaMxZV7MVgsGzITwjhjGv
IE4QalSydjPL8QV+qk3SeX7XJzYsKVD4lZ4hvMV4TjBbqb8LTJYeuJTOyYpKRBIvpCcrBR1Hlhx4
o9sItmsg6hgRCILdiJEnIGwQ6MBWwzjIfoQpzapWz71AAU96pgNEtPXdEAbyJdX/nqhp/JjeIbOi
SLhuiT/tYZRu9vdrPzm6MduJ2iTCwLSP6rzqOwr8mWhlzzY9lRdZ1zUbVQ8b7rjqYX1M1z3wKYWG
/DTUGQ4o+I5tsUtrWMbUkkbyDhyrGM9JKNE9Q5SHqMtlz3A8BJb8PSSX7sWJQ2iI11ID01mo4yvN
8S+iZ9OaDIuwJdzzSBHzq8hiF0GtJ1cpClY1VKEN+mhWQ/JnjeQLVtitW891ZWUp7GAvPSVlR30f
h5B09LC8DNH2aWLIUKDjgQmCMVFjcxXxrzlmfOpZPp14djozNHscYrLZMMcs5ZF7wzTUfC5DwHc5
YNLxsHjlZrFcIsMCAq8TULyn1AXDPwQgNAf88tdlIpSOnqmoywit4iAF29JfuA7ZYMeL0r+1lUPN
Y2QHUrZJonAUYIt0rGzjgEU4sUzpj0eU9hCqHyiltQQ5VlFDNXu8WsFRnuKeHW0PYZ83isoElx8k
riWWqVg3brg5neQiMUKK2sO9lMNiNU7Rzc699CBuX2r7/HqdWbdHOo2AS9XEFWZXbUnrcVkrbJM1
pM3ab8xm06ljp6fXLxrfU/yS3/lvZt3+IUg5Hof+2YjdYh34ier/LcbAYIvUhKjaBdH9EkdkAAal
VHs6WJsegQhGZktE6Al+Jr1kV3TQDbV1Z/QK9muWAXjfk1WrgWqFTifZqFVum86SwPeBzc0FZehS
mkwqrRVJT5xV0Sfz9LxcPOCaSs90SHc+Skdrf8YWSO+YjtlcjJXpj6fXp8/vgGTsI5lUlQMFcaFi
cu13TVHZIcjM004y0YT2/hhsetipRMfCgQdFgH7brXj5/Pry9HWM7thuQjomW2S7qraEXeCCgvSJ
TcyVcK4BPTtQR5zPwCg5i6kjLbf/x9iVLDeOJNlf0a27zbqmsC+HPoAASCIFgEgGuEgXGiulrpKN
lErLVPVk/f24R2CJxQPsg2SSv4fYF4/NPQyd7HLMQNRaPHTI/DVqLpSpX5mUi+vklkQrBgXkVMoG
8WWgPGd7W/otq2WZ0pQtrKqp6UtmtfvLgdtZDSh0DzVcNeVEISMqz30J6hp14q8UwEnzcK2CN/Oz
772EvMwmk2CFaWkMTTW1yPb96y8og0B40+QmHIhnJMPnmPm66qkbMwNDneUkodQk9FA/Wcz/DDCu
HCvabc/AYHneni2nTiPDjSoW296pC9IwAn/qM3w7QuvvKvUmbW+5LyDgfWcf6wFeM8h8dysOzqra
dV2eb1GxHzy6Pr2RN5ZUp7+amSwuKoOXVsVN3u9rYzU5gK2wslHYHuS0l42lCbS7x53tLhjabOst
zyG5bWlYP7WW+6kiXdzdvOWAEELG46O2p4Y6Dqgrj7obWzjF77TN9OHti/2LqmsqVHaLWvEojVJ8
gm88lRQIGlm62F/TcZI4Chbrz3VG3tHlPPkESghYtdZEpwzdKO02egrRcchuvVZO6U6g/7SFxZoX
7qVUuQoOJ9TcSusXYlKfa/Ohzfk2tWUqQBsZ6LwqsJ2ezwTylhSo/V5wVkt7PJMlu4o10dL+ySkj
jcujM9VSOXYCyb3N8l97pC2/cpeL/EBd2u/JzkKONrclVQX+19XjbUfeL4PmuMm3Ja5xYSaUgu5z
+JG90HBBxbTZYJAqq7CBiPtX/CiZiFbmwDhXtdoTIRlvD8edbd8beS25PkNkPMhW6GN0lm9ydfcC
RccefeHsd2dq62FMKet9/7GTzZXpiL4j2Jd1jo+ryYydq7p+sBm/N9XhuZFgd4Sh8oDulLqDtFKT
ETTIM3mXEOdoXk4ccyp2wfKu4vWxA/V0o7jFRinfUoey3aliYcRak22Bqpx3grA5nMe0NH++frx8
e33+CRnEdHGjw1Ti8CNjfhrldZ8HvkPZrBgZXZ6lYeAa6RiAnyYAGTeFTX3Ou1osKUfjX0s5UJM6
uNvAZYUlqayR3KxgaNnr7+/fXz7+ePuhlkZWb3aK9/FR2OVrSpjJSdYCniKbFmzocWGuhGEgv4PE
gfyP9x8fN7zXiGgrN7SoKhMeWUwtjvh5AW+KOLT4RhUwPgVcwi+NRX3jA5WxqJVBZjkIEWBjmb0B
7KrqbNmmwtGP79baEyWufEMvoN0R8wZUwRI/tRc74JFPz6IDnEa0ko3w0WJwfcBg3DQUABxKbG2E
5Y3pjIqPTn/9+Hh+u/sNHX8Mltj//gbt7vWvu+e3356fnp6f7n4dWL/AEghNtP9DDz1Hp1j6kbWE
FyWrNi23HKS/WtdgVtOTvUYbbSsthGS79o+0simP1KYUYtTAxzeFhG/kqv1kc4XCR3F+SqwOCzAk
yAlW2kCjPTpGqbhVadRW+ROmpq+wrgDOr2KAuD5dv30oA4NcFtUOz7sO8mzDk5MZm3wo3u9Wu359
eHy87JjFqSHS+gyPgI+UKsXhqn3QLTqKJosmv3fasobna/fxhxjPh0xJTVGblqYZQW564khadkYu
Db3kMKv1DM39nQrqzVFrbWjXxW5Zd6LgxHCDYlNKZA1iyrevtJkcPdGCjPCaMiquJwlXVp0daQCt
kx81bZn6j6KTiO1pJrt0m7zZcfHrC1pQlQcMDAJ1FXLxp/ou7Jh573LU5/tuoIs5s2NjXNSmDIYE
Cx98ZnTPNXKyNiQW35WkUzhSTHvzMzYMIlPSfkc3TdeP9+/mZN93kPD3L/+rA8MNwuG6Ml5Cs/q5
lq4SXp+euMMhGCZ4qD/+R7mmbEQ2pb1qcVtCykzVCt1RIsBf0o724FdrBqR1GLboIUi6pAWGugFV
yANaZKkTKTvxI9Lkneczh76vNJLY2Q0di3mugbLKHvp9Vi0nEhZy+/3DsSrp7caRVj+0Z/v9jilG
WPDYll1ThFnb7lo05rNMK4sMHVbSS52pEMsWFre3oiybpurZ6rC3+AkdaJuyqdrqZsqqvLzJ+ZQx
mBJu0uryVN1OFzu0+4qVt4u/rzZmpMK3FHTRH9cfd99evn75+P5K3fK3UfR22+ASMFP7Dq8wFsS1
G1oA3wYkEoADi9gRVwXcMwc3NCVcd4SuJzMuqn+H8aNq/1l/+ir6rkWX40GNFmdlWa4sPCfR5ehq
0tkpjCzll/2ceaUqXJq8Xb99A+2Tp4VQa0W+mqKjNmA4WJyyTtFEuBRPSGxfTIMaoV9yQmVZjohs
rJKIxfSIIwhl++h6sZ1wPCchZWmdg9MbHa0ALuvh4ta4TLYXn5hyYOD/ZUDxvHCxgNexqx2gaAXS
Jwv5YaRRsBHyXfdslPCpatGSle2zE3OjPEjk/C7mZ1rocOnzz28wk5INybyLbLZQh2q3npmHQY79
y142fDvEXyhaToipbdYBXidhbEbed1XuJa628pTUSa0kRJdbF2YJGeXjOUZs2b563JHWVUQXhCk8
1MavS935aeAbwiT29dY9jaR6FlkUJpbVs2B8bs4JvWchmlGT+PpDzLH7mEUxeRS+1YgWtkI4YdXb
XkGJ7MLUuVsYYLjTbXykZrnOPZJKwfLo/Q/O2he571lKgMipeA7BVsuNZF7lyf2T+ExtWpvNvtxk
/W5vdqRdfn+g7u9yb6s8Ue4v//cyLPCa648P/QWNO6x6+OX1HXUSPFMK5gWp1MdVJPFoxD01FKDv
I8wI29C+DYicyDlkr9f/POuZ4wvUCxquolbkE4FpJyUTgBlzqBlHZSRKDmWAO0BFj8YWhuvbPo2s
CbK8H5A5ye1E+44lZt+1xmx5laByqElCZoTOmY45TixJihOXBpLSCWyJTUo3XmpHQ3uRdGA8a4T6
YuSRlUDZoetqyUyoLJ2s3WohDuj2ZLNC2BWZoFIFxwfiC7agg/w0UIj5V+rpDuvNsCZ4lfXQwx4u
SdI1SUT6+sGtBzTAixOaE0nlPn6bnzxHVtJHOdZT5NDyxCYnwudyz5SzlaRVj6lkqm3c0XowiIms
jSGtPnvoqkD+UIP0y+oW1rb4TAUCk7rtMfBIAQ3IjekzYo1ClARHPPdsFgfoPFBpvm8iFeswNBOA
wJKU3wydN8wGCFUOVRvXCMMYboTIK8EE6t6PQpdMQhxHKZkGKOrADZcaKmfI05IMeGFMAzFfTlLR
hVp0JCdJLef/EidNqOqdWm6z8oPYrNxNdtiUeIzopYFLta59HzrqOKyFvO/TQNYppzQVaZrK12j5
iKT9CzqKck1VCIed3K367l7c+7p+wEqCuok4uBUr4sCVIlXkibLZOiGN63ikNXqFEVKBIhDZQ6Xu
4isM36VDdeOYBFKYqenoesjfkos2wXCtH0e2G10Sh1z9qIyQjID5y5+yPI48Om1ndHPa4oUjUBgt
9k8G7n2CliqXKa5zk7POGjfcWqfIKWWw1Mf9ic0DUVP4woo1OYFwWxh0IXWl5fHoROnPHb2cGRk5
/Mqq/SXXTiQ1WsEij0wE+tlb7AtFWdcwmDRmzqa1pRFoFd5DaVn8m4yFHrugRFIWKGVG4q03Zszr
OPTjkJlAk7t+nPjQNImaWLN8K3tXmOQ9LAsOfdaXRIibOnQTRuQeAM8hAdBSMqpUAKBv4gt4W20j
1ydcKlarJiuJiEDeqUYp5/IPafcoc6MpsVeQ39o2lEbCpzxYygb0or3reUQ+uEuKTUkAfDIihlsB
EAPjAKhXeRQwpRLQ5zDXEwMwAp5LNmUOeUsZ5gxL6gMvsqTDi4h0oOIVORERFkfc1AJECQ2kMZUl
QHw3Jl/OSJTIMj5zyKcfhiucxVbCGZT/UA4spZs0Gjb3/853PKJk+zwKAzLQfQz9mF52TvXVRJQ+
NMOxT1RyE1NtoqHmeZASNVg3CTlk4/P9xeQkdEtubnTsulksW4A9Otx0OTlp6Plk2XMoWJp8BIPM
TpcnsR8tJRgZgUc2pbbPxaZNxei7JBMx76F3EdWLQEzVMACwHPVoIHXIgmi7vLHf+B9zs07ClCqs
brhJp38wiElN1YtIt1cyg8rcCv0xrUsqVPSOnK/XpLGAidOy7rBH518dmbJq74feojYCjMSJCHW/
2ncsDByi61esjhJQC6gO5sFqNiIAnEFicvEwQHhn8lBnvcXxjcT2E5faKtOGfCJHYmSncgSI58SU
qiCQ0DZww/BpsY0ik4KAvls+U5IoIQun6aBslnLbnUuYxoiE9x0LHJhoSST0o5iY+g55kToOERgC
HgWci650qUge68iipLNtv1h/gNPzJAD+z+UPc/pD816jrng3Jczf5MBWggYcOEvjMTA81yFGNAAi
3HozETSNGcTNApISZSqwlU9P5qCLh5HlKFbh+EsDFet7ZmnusGQBDWNxkMtdLykSl5h6s4LFiUcB
UEgJpWBUbeY5KTmoAXJjbAeKvzzu9XlMDBH9tskpJapvOpeagricqHouJ3ILcnJIRTnd6gEJ3aXm
h/Y28+5gW30AHCWRxQ/tyOldz3LIN1MSz1+mnBI/jn3Sa7LESNyCSiZCmgNNiuERq00OEHXA5cSU
K+S4JaJeEJPwGkb1npxQBRjRzqFnDnTE7ZoMGpCShPj5wL/+Wr75PPUafGRhPzWYaP2945J7WlxX
y9RHL0KEJvNq2+O5kcNgcV+heQhKORlJZVPuN2WL76SHR2HCSdylYf9ydLK2tTmK0c8aWmu4oCdA
ZuJFKW4xb3boMrzsLqeKlVSuZOIa93fYNrNcc6U+wRfzwjLJ4if20AniYnqRsMraDf91I6A5cXJI
RXlc78vPI3Mx3eiOI9MdDQ2G8z6eX/Em5ve36yt5GR+tNokazuusoc62Qb25dPd41tV0U8t704Ng
u/xS9IxK79wngOoHzvlGgpBC53s4UVwMy8hbvl0MjC6iMfPmO8lRoj2Rm8Tt7pQ97FTDkRMo3oUK
V+lli12DGjQnOtp543drMTyHCI9ffjPK+nT9+PLH0/vvd93354+Xt+f3Pz/uNu+Qr6/v8pHBFEq3
L4dIsEESeVIJMEApDcBGa3c78q6Ehd7hG9jlyOU+PdLVHNtsRLLduicqUxFLMc0Msasrfzp3UbwP
7E8QkVVxY5iIF2/eOVFKBnsqMkhTQV8cHQ6iF+IcjGCbcT5W1R7P6k1k8DZFZ/K0FBluT/nnM/ll
ln8+oItKW1a4/3e08mZn1FWDT8kWCbHruFZCucovsOQMdMIA8033hCdRURc6NGEOSiZ5hABBrqu+
yz0y1+Vhv6MyNY5JqxhCFvFNoiZje7nhr2FC0JJURb7jlGxlzWlVRlgPNhTyYktRn8SutzYiBLE1
uG1HNoq5AGEpIbJJ7c/gPpTr6xG2R73AJyhyFrIG2rPRQMZkwJJrvNipljkifryKRR6VGZzf1LPG
hvq6tW8OmqMlNQAncWwUNIjTQUx2sHz7qKUdGmDZnaFdkw2wrVLHtxcXDJqx4ya26GC+yTx3iHC8
Z/jLb9cfz0/zIJtfvz8pkzaaVcoXWwQEqL2AG6/w2QIfPgTGHLRUCGgbbMdYtVJs1bCVSmHdXjZj
zr/KK7Q7Tn89oroQrQIsfjUStOiLarfw2QirUvH8H1PCra9In879y6BRrX8mqRdHVnmTkcEiYFQR
f+X87z+/fsF3PKbPgbHhrAvjLSXK8OTbpXdpq1y6xSt/kvVeEjuafoUIt87pqDeJuLxIw9htTpQ1
aR7iufPkS3CzTD0x45kYHvApLwgQ0F9RzDIiEP1lxST0KaF6QDGJLXdeZtzizxRLFjUPy2Vu/J5r
NZ7l2tVE0NI6vX/SZb4hc0NHz1JRt9QJGC/G3PXPZ62CBqFZuE3nRZ6ytbTt8Rkpq3JqpwVBCGN8
uy8FJNYHnw/Z/n56VkuWWN3l1pcWiFkfhU8rI90AsYVyybf96b8lFvi81VrDgo+mpPh2w3/Dsz1R
nmldk19WpL9TzuH2n/VS/pS1j5e82dk8BiLnHpaWNbUSQpBfnnS0QUIIQ0IYOUYS8OggCGPqat0A
G/fhJnkS0IehAyFJHXrTdsI9+oRhwtMb36fU/V6O9pEfacWCMnWDmUvLdu25q8bW2bV78hICCyLK
RxJC0t1HSQ8QMtxMJjW/ATZsF2NU5gsAGeW38Ixv8rAPydNfRFmZE5MIq4I4OpOTFau9JLc3RNaE
jmt8g0LbAzVOuH9IoPVJ42a2OoeOPr9lK9+1CXd9Z0T7wHLL9WaE++qSNb4fni89y+nKQNr08kX5
GO+hkk+PhpDr5qB/0mU1LGKoja6ORa4TKl2SP5dx9BdBCmh5tcYTwAmWxzQzYWHyREJC3+Ubc6g9
/pmCTSJjcOHy1JIbibA02wIFRjj1IUB/qgPHd+zv+YGAzgENghTuqXa92Cc6Qd34oa9N22Llo2fP
9gSQ61DisZWmWAmhYRl91FrUV0ByYptQOaUZZa6hSpwafdjUwUQPJgn0GWTasjdkVNIRCR27UfUx
Ymvm8iL1B1Nksvkgm2I9fjudq8sJmoRWcwQzY12dS6jFXd2Lu2ZEIGjS7sCNPbbsYDNGMNNxv5pv
V5MfGHSYlDei21DQMLMT0QyTOVXNMynL+ySRL4hJUBH6cjuQELHAICE+4JKItoaYEWlVYtaPpkar
iGpMQME8y4CikaiVlVT3WRv6IR2/uiSc5RWrU98hP8GbI17sZnSiYUiJSB/FEgWmm9ilguaIRyNJ
7JFliwidN7xmEiapDYriiIJQSwwTG5REARkghyKyyXD1LSRzJamcNJZ4dEKGRZFmklzB44QOFqAk
tbS4pksSi3cbiQTK5Y0WhxTPt8QBWEibyFBJ5C02laLquDOGb5SDcPl789GOhK0Pj6VrG5K6Y5I4
N1LHOQnZHjiUkhB3GzzYuSEi5jCawz/ajJ7O3H3GuhVaCOkq2fb9JevRGNKtj/vAZv5MJukvYkhS
cyS9x84U5jVdpmrUKshutDYWNkkcWZrCqHffSCerN6HunNMg4aUrF1o2VXWShktink+PDkJN9chm
OCrBdM446pKOPTSSZd6l1M0ZNd+iU5TA1kl4W62zVbWiHzzsc5vGmpvrNXThyOX4qFOzEsbp29j3
6Crm8IKDKO5d4lCzMkGqlbLPqpZts2J30mlKGuf0UWLQwupeMek6oKtif+RWIVlZl/m05948P71c
R5Xw469vsin8oUyyBnceiWIRuHDOc+mPI4VWWzm3qDZVD/ofTVao+wwf8ltjZcX+ZhCjLRN7KPxR
LZnsyaKIUTxjHMeqKHfa5q0osB1/P1XPxlCPL0/P70H98vXPn6MbzLmURTjHoJb6/CxTNyUlOdZo
CTXaKQO5IGTF0aqvC4bQ1Zuq5cN4u5Ef4AhGf2jlZsTjXNcZ26KDmEsOfzEdPbW7opTXHVS+pVYn
GficS0UreoIjt9vpcIALh7P4u3+/vH48f39+urv+gKy/Pn/5wL8/7v625sDdm/zx3/QGj31xbjHi
0P/5ty/XN9NZBJ8oeXFpBaIBsh9Kubq4GxsGqgRRUXzUOOVqmCCYHqNrYksUQyq6KrM7KX7c+1Fw
pgZiXhb9/alcwTCgp5x5nrpgl8rqn3f98e7v16/X1/fff316+f3l4/r6D24QwyhEkcKy8RJ5ZSNL
x96h9V40CrI05oghJCuyDh0CW/tCfyxL9fCOy1eHtadNErOc6K5c3pTNrtP7kviiyep6p6z2IZB5
jBp8W1OpDNAqf+PBD+UBW2RiIpTcaHttXEBTBzTZRpAQXb9+eXl9vX7/izhxE+N832fc3JK4ZPXn
08s71OWXdzRr8s+7b9/foVJ/oJ0/tNj39vJTCWIs6exQyIvBQVxkceAbwx+I0yRwDHGJXj1DY1Tk
cs+gN6zzlR2ZoUMw35cv3o7S0Fcfvczy2veobjpEXh99z8mq3PNX5ueHInP9gO5/ggFqThzT2/cz
wafeOA9TQufFrOnOZtxs1z5cVv0aFl60zZv/riaFpbiCTUS9blmWgRaomKdS6PNEKAdhTlx4T2ah
HASD2oef8Ui2hqCIUbGioCQwWt8gpr5Y9YmbmiUN4pC6Mj+hUWR+dM8cl7TEMLTeOokg5erKYyrw
mL6zK+PGiMo3LGLZCJUqpzLcH7vQDcygUKwev05A7DjUqmHAT15i1lF/SlPHTBdKiYJDuWXnauwS
Z1DYHWN+Em0Qm/ZVaflEg47dmOhR+dkLk8AhO5PWwKUIn7/aGj2PaKENcFw2hSj1hNgY2ISYZPvq
AYwEkO8IZzxUjRkogGWtMnJSP0mJETG7TxJy5TdU7pYl3rDsU0p2KkWpZF/eYMj6z/9z9mzLbeNK
/opqHrbmPEyN7pL31DxQJCQi4i0EKEt5YXkcJXGNY6dsp3ayX7/dACni0lDm7MNMrO5GA8Sl0QD6
cv56fnobYZBuooubKlnO4RgaFuCaYj3zq/TZDxvg75rk/hloQGbi7XrfAk84rhbTVJjsr3PQycCS
evT2/QlU1uHD+lQ7Dkpv5Q+v92fYxZ/OzxhF//z4zSrq9vFqRjosdaJnMV3deNOLOI4IzGlY8WQ8
td4cwk3Rbbn7en65g2qfYKsJKYWYOLbAg1zmT6GUL66IW54fpxNPxCjoDQVdeLoAQlckhxtC5AF8
NqGvNQcC8nlLo8vDdOnrOghdEFsNwskYNAaaUGMAviI9DHv0YjkndprygB7jV74NC5KPnAaabM5i
Sbrb9ejVdEEIHoCvpmHZAWiyJ1dLX1giK4p2DTu5D70h+d4sqS2wPExm6wX1tN3tTmK5nM79crm8
ycdj6jLSwPu6MoInlJQGRDWeXeUnx2O6oJxMwns44A9WdloDPJuS/A4T8pa1kyL1eDau4pnXw0VZ
FuMJicoXeZkRh6E6ieKcvBLu8O8W84L4ZrHYL6PwHqHQnoIC0DmLd552BPDFJtoSteQ8IlOzd0de
uWZ7S4+mRaWSohnA/ANbv/ku1lNiakb71ezqWSO5vVlN6AiaA8GSfl+5EKzHq/YQ56SWZLVafcf2
8e71S3AXSKrJcuF1PFoWLL05gY+D86XZfTZvva9W3N8d+43VxdnH4P5eTG9i31/fnr8+/O8ZbzvU
buwdmxU95ruoMu+6WePgnDuxs3c62PX05hpydbzG13wFdbA36/UqgGTRYrUMlVTIQMlcTq0Hahe3
tE0sXGzAAs4mo0MoOEQT+9HBxL6XkzF5cDKJjvF0bPoh27iF5f5u4+ZBXH7MoOBCBLtA4VfhG+2O
LJ7PxdqO7GfhI9BySA9sf3pMAp+4jceWdPdwxH2cgSUN5fzKp3QFrOvCAH9Q1gI2UGYnrNe1WAKf
a+8RXWOa6GYceIu0F/F0sgjYUBpkXN5MSPMEk6gG0ey94VxmwWw8qbc09n0+SSbQxfNA3yn8Br57
bm0hlKCy7wT9C0Al4nYvd9++PNyTyUWiHbmN7aI2qg33iA6gsgvuqkb8MVkaGwYgxS2XmGuipO12
k9rP+RgBzEzz2J+pDLDeWF5g8xz9+f3TJ5Dnibu/bDdtnCcYHmtoLcCKUvLtyQQZf/M6V2mWoM8T
q5RytTwwQTzRYT3w35ZnWa0f32xEXFYn4Bl5CJ5HO7bJuF1EnATNCxEkL0TQvLZlzfiuaFkBc6hw
PkimA/wyHIiBfzSCHDCggGpkxggi5yus23IAJmzL6polrXlNDPC8TFiX284uIHmmPgoOirt+W7YG
/UufCYlwAcZe5nUdsHQAbJXTt7ZY8LRh9ZR+zwd0VMdOp0WCZ5g+O8SQ50IGkbBMJtSuhyiYck5V
xZzUtAGT7uyJgX6/feYuk4MAKYL2P6H26DRxIWzND0EcX7l3Z8asYevxYkVrljgJvEjmVqVRwgKG
ytj78jSZBjlHgRzB2BO0ToKY6AArKojlwVkVSnGH/cpKWKacthIA/P5U00IScLNkG+ycQ1kmZUnv
cYiW62Ug+DiusRpU6/DEjQKJeNT6CTKNQVaD4A12H1q7BwRHLuJme7TmcZNk1m8MirU7yvnCViRU
5ysbVJp1zmCGFWXOnEKY4GRKvpCqke6Ue7v9q4kjO/rzCLUlKam0ubv/6/Hh85e30X+Nsjjp7Q6I
nRew3cuyTtVMNAwDi2d8l0qL0GzlQLGXyXRB6WwDycWOmyiuYrCSAznQKGOd2ywQdnWgE1Ea1dQZ
fCC52FNTTdF+fj+pBKjWa9K8zqExr4wGlOH94+F8mz+D5cUcmGiTsmqlbxCN3rlmajaQBZxEjMoO
0EmrrKJauUmWk/GKbH8dH+OiMBXLn0zZnkea2AaHWenmBez4eepmz0GUTWFHBCr8jIopT/zEvqmp
p8GPIe68rFmxk6mFraPb4XfjlR3SOOmLhG/ne8x4jxUT+gWWiObopE+MhkLGcaNMJ80v04i6oYW5
wgYX3AXLaeN6hRcNZWegUA1ojpnbmA3L9pzS4jRSllW73Tp9zHcbVnhgnVHO5R+nHH5R2bAVtlSB
lh1GZbOLapdRHsVRlgUZqXOSw6eaTuyzrIJCL0iO6UM24wV5Y66oThUoTsItDFNoV6qsbIFyLBde
x7DMVrI1jDnp7i1k6XD4sGcnd7LmG2672inwlsyZolBZWfPSDGqJ0LTMJDPynOjf+htszmW5A60/
jfKQcwdSHUA7zBLaA1Rxkcv1LFwcPlMtmTDBKdTzTQyCh8dus2+jTJIBZHRr2a0orYAxqpGnWgVC
sqEcA5y47LkMr9V30Ybc7RAnb3mR+tNizwoBhx1JppxHgizus4eYQObNg4wV5YHWJhUauuqK6FJq
ag5zxfveHLqzDmjiGn9SloRBAjj/qTUU5sDR3rbcUjdlCl+iEZS7HPImk7yXtga8kNz9hAJUXsp6
EnFwsrcWA0enxAIDP8HisTrZAMNiCX4NHMGgH4vQx1RMRphi021jBUITt9wgWxApOA5O8DWbpuZ5
RKm1ehiguD+d6zKOo1BjQVJ7vSOiXDTFzgGCwLe2c7RTutJJKmR/MN6copAsCsk1wLFMwM7NHNEG
DauyxpPhdX5FPKGTAxzmQ8tW5FEt35Unl68Jd77UXPT8ULqtAeEkGBm/S2FTkAa5VyatGyGDiZGV
NERlp63EzJeH4X3nlvO8lMzuxSOHGexy+cDqEr81wOjDKQElxxWgOiJhmzYbEh7DN6H/ivplU0RZ
5Ywt5sqddtEy+8cdQl+7ZHgjtUc0dE25JzsrTi+8jhwOW6R661ZzSdJI1o2hIvq6zdzeHgMVWI6D
RLXZXFqlYyoAAbIjGxZg0aOtKo1PLdOY23d9hvJs2VEbQJhcVgxHhDVZxVsnbLamLYrQcQbxcCSB
j4pEm8aJxdFmX8Xc5YyphhuMRVaw2+5w7Me3s61YcPQ8+33k1UeLw9tJLqRb1RZq4AWXSqJyRq0I
xeVURBhxQ5nlez1RSjreUYcDUV4mTSwzqP8qXcKFCpTJjiAZCoyoaaeBN7sI3UUakLxFoiNy/jE1
0XoQh+Xz/Po2igd7/cQ/D6kRXa6O4zGOV6DWI84pPZxWQQVPNrs4olS1CwUx1D0c+r9ggoweMJAN
CXANFBva5EJrvPaHPmylJLBS4vwScO6hyhJtVfCtoMNwmk25tDQ82sdmOhmn1ZW+xuRhk+WR6u4t
TBYo7ha2a+jaEiRofkowmU2vEohsPZlc+YJ6HS2Xi5sV9QnYS0LQzmE9XrkA4euCt/ZxTndBHuPH
u9dX6oCvVklM7ZVK6tTKGN8e+NvEmVsyv1wnFLCz/vdIO12UNV4ufzx/AxH8Onp+GolY8NGf399G
m2yPAqsVyejr3Y/e+eXu8fV59Od59HQ+fzx//De05WxxSs+P30afnl9GX59fzqOHp0/Ptgzr6Bz5
rYF+AkQTiVcGoPQFOuHCIpLRNtrQ/LegU8VlTiO5SKyg8iYO/o48edsjRZLUY8po3iWykymZ2HdN
Xom0pNRdkyzKoiaJQkzKgoVPrCbhPqpz+mnApOruHVro0DgkuntaEHhts1la5iVq3UXClN38693n
h6fPtIdTnsRO7AQFxTOYM+wmAa9C3pdqF0gKW++8AFuMU3etlJLkt3VUeS1SazqpKXtktb/exl6V
CFPKx5UybRc5TwcpfLx7g1X0dbR7/N5Hfx0JSmtURbWE9xhGlbe/A4KytlOfnaJ9rfmka0JbO7Cf
hcpFHsB4+ej77cBK9WkA/e3vgsC4g3WpnkAuMwr7w7dMU1NPiNXUm054OCOCOSMrWwkjebKc2yEu
OuCUejNVQjtpZHP0G3EQjDr3IzJju1LaFysK7O87/QKNT6uYTGCkiVSsaLcsT9SdSqDQVia8vys0
vwZvfEGxq1BHMxgqeJtvMbGfkDpdZEhgcND0NoedM8kyZ8xlHYHOfOCb2g0Voxpf3kZ1zQO5WVR5
FlzcLBVM6v14y4+yqZk73fARYntrQ09Ad7RB7IPqquPUBqOOBv9OF5Pjxm14KkDvhj9mC9Ii3iSZ
W+5Fqo94sW+h55Vt3CApcOpWX368PtzDgTO7+wFygpy7VWqNWVFWWhuNGafCTCJO5xy3kg/1C3I2
tg68Vxph98AuSnZkemR5qkyPIPWzlXGVEzBT2GlgLSerycR63tAIP/yGQ6DYoc0QpzVcTbXFQSNd
jTS+AaXJ6CT41caxrckgLBi4UHNJk5kQrjeR214VfGtNP9poEiGhtRMnO/Nlrsgf386/xTpY07fH
89/nl9+Ts/FrJP7n4e3+C3W+77q0ObYVn6keWczox+f/T0VuCyN0on66ezuP8uePpF2Nbk9SgV4k
Xd2aakqAo6Xnw/7SGYq5ixdRorvjwDMcMRlyM0FojrEls9LM3H4B9YfvtXFvh17ETRQKbAAlXaGm
rw7y+HeR/I6lrxyNDS6OXzeCRJLaJ8QLMBxC80IRDsY5MMnkll5dSHO7EfS5TH0z3+btFbxIQLso
0zZw+Ywk8WYVCmYH2IOK8pDToSQR38A0H9v91Yg0diFJypcwQxzK7sxi3xSpRr1PTSmGoFS8d8dA
liLlm8gdBYMil+b0YjkmQdlbbDqYH6mh88qGc9oP8fZw/xflkd2VbQoRbfEEhtHRLO4Yj1pPabqH
hY/06v0HNzqXlqj5kAcGuyd6pw4NRTsLiMkLYb0IhBweKIYBJEYA7/RAIzL2R/zlRmkYYDq0hdmB
Bk69G8VlRuYrVHSbGlWTAnW+9BbTchc7dd+jfTRY4o+gKkZFkVWISMyW8wV9ElQEyhqHepcesFPn
O91AjD1wOScol2PTc1hBLwG3TCBGwVrY7j4mPHRzq2jc0Ky6bowTSvueXPAB85cOvxiTdlpDsxZ+
f3fwq81FmuXM7ZUujiPmObIvrxX2eq5CPXWS6ZrUX/REcMOW66FwY68pqIwjDOXkNUJm8eJmEu4U
nBiLv/3Zqi6L/nx8ePrr14kO3VHvNqPOguv700dUFPznlNGvw5vUv5z5vkFNOXc/JjtCNzlAjPzo
fQgmFFhvgt+h48V6rwuXKW15c+oSXkAtBRa7fDZRrn6XHpEvD58/O6JPs4CVv3PidgzHrzhmGPue
ZzxgX8rh/wVsJAV1vcmSKG5h9uCbgIhr80lMoYiwRggnONUyhlOKUR4BmLBwuZ6sfYwjJhGUxrDl
nWhgb1r4y8vb/fgXkwCQsjS3ZAMYLuUoQggqDrlKxK3DUEj4xifQGD/dWXdVSAha4FbnKrIZKDhs
iTEBtmI4mdC24UylvDK7WLWwPtBKHz7PYfM8ed+X8k0HLQyFiDabxQdm35YNOFZ+oG44B4IjyTQR
cFJcUSw1po1ZAUdwypTKJDSXlA23M4kYuOVqSlWL+X1u6OB4HUUtFvHMCt3ZIbjIJlMzmIuNmBJF
jgBf+GCV6tcKlGcirPQDFmYWxAQRa3I88/lEko7dPcHm/Wy691lSIaMNnIrBd4WrANXgZhz5fLcg
CU2/28tYwKya0PDFekLTT4kOZzkc3lcE/WGmve+8r0EMHZDwQrBej4leF4uc4icSmO1rbyGjF2hw
IeO7PIjsVqjgaxd6jCnyUwGQCNCiyBWgMTrBIblZGPNnSgcMsbrvJiar0Ti/Gvt22/4Gj0mcl9Qr
qrHMp1Z82wG+mBDTA+ELckGgwFhjEs6ck3adBt1qHujW6XxMa5QXEhU7+Rp3J/fIZfLI/WQlI3Ki
5vO1XFPXzybBjFgTCLeDPlwwIl9OA3GkBgExp/XJy/hXi3hMjAFOizFVqx+lk5qRyuj9KpGOeH2l
ZV0MzX5JPT/9FlfNz2biVsJftDvvpdsuSV/8HlURfr1lgPqs0O725GJOMB2PshgxmQ7QwJkeCHwf
RAC2rNhZPogIu8RKh9NkwTJhY/FyZ4DgUbjG154d4MwmdYY/AF3SS6AjKCOZBF4eq+zYOrgO0+X/
+3Aq3udVm1S67g6p/D1SrLnNd7mkEMYX3WIVsZcqo4OT7erL0FcwqWhaqwoB6p8GXIYifnw4P70Z
QxGJUxG38miXhB/dtb43YhizNTFYbpqtFcqyrxvZbnlGvr3oYhZ3+N3m5YENjqjmHEOsYNkWG0Wf
OzqilEWVQ9BdvTpNvXx/cxwekfqOTObzlRllGiOWmcqW/t2qk8j4bziXOgjHcCjeRjvcHObGmWOA
QYdK9sfUSEDKcxyXmPM2I21AqqhWcW+rCBbJwFL97JFDFuEOXJc4Gn8sbLC+t2lzOLNZhhAaq9x7
e9wvvwwtxGc19MfaZG0ZMGA1SSirbQPfX0SZdRs9pQmNFw37DgV+tjGnG4G4CoXejhW8fh+kSTCO
5E9oolAcY4zZy+q4DHhNqjbEvH99DtIUTNI7jmJQN4Ke+IjNt0sy8QfKUzJ+5qY87hr6WRLL2B2s
IZjnqCFbcEgqMoCMeiPHUhYzBS0Y/bKgsbgpis62Ep+go/jk7Sv5w/3L8+vzp7dR+uPb+eW3w+jz
9/PrG/VSlJ4qVtO2qT/j0n/LrmYnx1KzA7VMUJqHkNGOm/bfsAOwxHrX0JBg0OILWptZKgnIP7B2
vwFZMV9fIYNjpUk5dkhzLmJqUnToTUlezHRYe1fogL3I8ZlxEVFRXl0yXB7/iAwTQV4JG9vRKdOS
4Acm8mZNBnnq8IVisHSyUQ2sk4a6jrPwaHkQLCz4jlQtOqJDvl9b4WQ6+HpqpuMwgK2IPPhe/6tv
uQwNMFtPbqb0KgYkkAdQYjEdBx3JRb4KhErrVoEO1uEt4ejp48vzw0cruoZIQRITnaO9joYdsizU
nRpIbdzxaTUPaDAXp0/QB87o6jeuNyVrQZ1cTefUEO9Eu612EW6KxmZUcGiIqCIz/rwSYmVelQUr
pB36hpB+JkoFdPIKhBIj7cWKPgb0wgnbaoV57hGWk2cPVB6vBNhMDTsAywq9ZCmRqFyxyAb3FHV0
e6XVhqmN+z01T3Ysce1HenTgLaNHW4Ece6BI7N2uh7uv3y5aPaLqcDF3r3+d36zQLM7830Viz2S7
raOc3ZZu6IDeDdhm01e45SxLsEYnyPm+it1IHBfc+ywQowGToMDYCz6jgxdicuYhPLd/3MMjGByO
6Tf2KGZ1mtCKGOLaW16zjAX0GG23tcsDLsDowNtmUeU4Ldr4qxUkcbIh7eBBW89AiG14aR9tEVxv
aGnZlSnX68AQbJt3XMKB7EqTexKJvgm0PrSrYK6XsZo8gcAzaaXeXGjjeUwlfq1PMGQECH5KgVHu
RiAoEsduE5+59lWUhG0t9PlaPeKIatqG4h9oMuXGewhF2uiO6oWEmT5tD8EcspoOdM2svL1CcNhI
uhNFU28x59pMy662rGq244E7yZ4YjlQzULikDNBVsT4xC5jbDakkaifBbo6Yndxj3ofyOHa2GBvZ
1ts9z+jR76lS70xsLuc4r+jdBc5hkfICvjaJ9S68Wl4xJysrkIP1NSZ4uawsDmCcgLaQPJJk1sXs
aDqruNMk8JUaWwd8hLrUv+ioCJCCxcQLl3IUE9/O548joXJrjOT5/svT8+Pz5x/Ds1zYC005crY6
C40CqQlE7gL/aV1uVY0KbYTOBe/7rCxXPhtTDgcs1juCBn24eBX73S3iJmiRZVAQHjv9/Mr1U695
1AdlhV3KCBdTgm6BVv7WhdkFJekcvMMVqw1wE1H24Ky6wgUXvSy9YvuN8jYf4oZc4YD3Gdbz66Vi
LLgxFckhXTqcEbeCaq2W044/m0+Fr8NhClBmYKPRN28kVQ7bXVSUx2vDmUYH1saZ8VIHP/BFGVTF
fWOEXekJoS8Z6M3GrZO2Y+iYmKenDnrtXt6gggPwzXxNh3s1yARfzOZ0eCiHavFPqAImPAZRnMRs
NaZz65pkAhW7NqZlpVmpn8Vt2PlvRcUL0twtfny+/2sknr+/3J/9e35gzA6w5OFoabz+qJ+tbUAK
lJssuVAOgRcp/sZcini2CYQ04/BxDZXgRhtBnL8+v50xWQf5OsLQSRvtHUjBShTWTL99ff1M8qty
0V9+0RytksaWiGF7UO3yPkBA234VP17fzl9H5dMo/vLw7V+jVzQo+vRwb5ga6uPxVxD5ABbP9mNQ
f3r9v8qepLmNncf7/ApXTnNIXuIliT1VPlDdlNRPvbkXLb50KY6eo3qxlLLk+pL59QNw6eYCyp5D
FgFo7gQBEAAJtPzuIA+PwGc+Vubhet6vvz/sn0LfkXgZwLcsP46fN5vDw/rn5uxu/5zchQp5jVTQ
bv/KlqECPJxA3r2sf0LTgm0n8b0QVqBjr9blltuf291vpyCtHMm7n3nUmqud+qIPvX/TfA/nIapc
eHL31yvy59lkD4S7vXUdJ1HdpJirZGxdkcc8Y3bGKJOsBLEDWDcGs5BakEGJQnANbNq4ojHQ/RvF
NLpkdZ3MudsJwpN26LGvAygSvkSxTJfFfx8f9jsdokqUKMnFe8LkI+sKP64ZnBDGDY+Cu/6ZCtyr
IZdXN9T1tiKDc+fy0rTSDXDnPVqFKJtcvSZjw6vm+ubrJSNaUmefP5NX3QqvI2WITwFFvtnYH/FZ
YaepSgLKVt7QwsYcRLfQC6rlws9ni5ctmG7cTwKBl8oV64DA3GkefX84wVqcuZkURgWIWV0DEupF
QEWX4XfwdRE1ZHLEimN0lpKiU9s7U+JGVZTVzQh/RYwWtCUhqDYgg0WU+8l0dVa/fDsILjEMgbot
ci1dIvZqkiGYrG0UZd0MH4jHqC+XSs/FdNWVS9ZdXOeZCPEyrt5MFBZh1o3I/q3cKWVJcSjckkUo
0IX94jzC5fbCbnEn9qGfe3uU+kKRT0V2VGwSAytM8r8dRU6vrMiyiMPPUDwDYNKyd8woQe3aPz+t
d8B2nva77XH/bKl7upknyPpVxUw/TVar16eGBSNB/sWQuQiuvHU0WNO1cp/HVWFncVGgbpTAUVGh
WvdWw3gyyudxklFyf8yW1jmgAOYRhKBuRlv2tZur+bP3Zh14jgSj+bKOmc9Lpouz4/P6AeO5PW5S
N0b58EPqcKCrWQt0QKB7b2Mj4jbLVjYIpLwq4sgd6sJ85sDATTmrmhG3g/UN/LipGHkWyw3RWMEZ
GvaKzg0EriXGxU8CBdcNlfesR2d1S7enOVnbkEZB59Xxp6q3dZdmLK7y8ClxoXpuMkjaZZNKU0Vz
KkOKoJKXBl65mH/hnntYJeVBrTGPirZMzeBnUZ40DTrAeJz6kG6ccRqKTfe6o3GySbTN2KTzbZQu
FRu3ZC00z2t4L7TBfylJ2gQbYmtR2okJxJ0YqE51UYUEgjopqDu2Ok0yK8YXAfJMiZoqdRdgFfkm
u15Pbu1EJFlhX8qKmzWZPoHiS/IST1+6aCciW/CUmde3oMvIg8mUzyMWTXm3wDx4MibC8oJgaRKz
BlhAjbfnNZmvDHCgD9unG8hyF92YOnsBc9mZIQAKAIdknSyhDamPqnnUVkmzsjBXbilXKPBj0nxR
u0cbqODKqcDswlXQ60EgZ8LoKHy9hiL/HsUX9i83aALqy0Zi2I3zlScwuICxgiM0EEhNg0YPRyMC
xqkUZEHdkjVNRaOIsTDR1Hj8LVDUZZzTbPytnzyfX9nwu7ZoLH1haTYmULjtsoGQIseHIWTkDblt
kWjBKvrCA5FhqWUyrt2l2+OK6ARy1FShIcqTVH5ocbmLEPl9kXNnULHJpgATWs846va+kBAVQm2/
6ZCACIpgywMIVXO81V65+KHh6PQUVauyCV09AcWcV05kVY9z3/CIXUAiAV6o2ZidsP2KpRXGoDeD
yAZB3muYlFFj8W/MtDaur0KzLtH0PI4FQ7Lt4XQCEeW7Zs5cMce3olfO9wMUU7Em+MxIFwcSSlO0
LF0w8bhH6lxB+t+g8L0M1J3jGli61k+fbglTKYYoUE7GYbyL0vebi9YPP6znYGqHYyqACO+sffA0
qZtiUtkvo2tkePNrimKEilkXzNgnqHB/0E68qvWyJ/GHqsg+xvNYHMHDCTxICHVx8+XLp9AKa+Ox
h9L10GVLe1ZRfxyz5iNf4t95E6o9q4EyVPccvg2d4xJlshqEaA+/pMALpJo3t+9ejv9c91GEeaM5
m2GoOcmQBbpakANwspNSIz5sXr7vz/6xOq9FQjw/7bYI0Cxw1yiQaB9pTHdmBJaY0CsrQB6wM+8I
ZDRN0rjilAQsP8YUqZgssw9VVtgZr3JzhJ3gySYr7cYLAH2cOjRCNDiBh20b8y+Ur+60nQAjHZnt
UCAxCMY5wrOxStduKjU6KegkmeAFeuR8Jf8Zlog2WPizaKxg9BQVm1Fc8pMHMG/QocmkMnR556zF
3/ML57cVAiUhAZFFIK9un2zyehHw/5PkHX09JjJY5oHNKdstWFEQjyeQdE2GY5YcGUWEaw00YSCy
O65zkrZxSUU1AwnlhjuphOcJyACF4cCHsoT70xIRsUI3SLxu86qM3N/dxAqDLiMQWRHWzaqRlTFQ
ketuJLmQbTH7XoSpcAJan/ooyJMiXk5pvhglsJSMucff8pAifXkRy/AsHlomp8sSGpBqwdmsKxe4
eehshYKqLfGZhTDe2/gm0kslOUDpyLYBj6anEvP/B67vBeEb2ndqPUdFzIJimCeD9aibMiCUm4Fb
8EMfXbfvtof99fXnmw/n70w0VM8Fn7+6/Gp/2GO+hjHmu+8W5tq8WHEwF0FMuDQrctzGBZJ6OUQ0
J3KI6PXgENGBJg4Rdcg4JJ9PdIm653JIbgJjdXP5JVjwTcBV3CngDcNwc0W/HGQ38mtoGEA4xLXY
XQc6cX4RXD/n8o1uAyWitdw+6xqoKHQTfxH6kErLZ+Kv7EZo8Gca7M2JRtDPe5oUVLYFq4eXdJXn
gRaeewtvViTXHS049eg20AqMiARp3UwQqcERxzRGbmUSA+pqG3hYrieqCtbQjzn2JKsqSVPzIkFj
JoyndN34mgKVOljjkwjTXcbUp0neJpRqaI2D83ilxjVtNUsCZxzStM2YjvGI00DC7TyJnEx3WvMq
uoV1d2sZSaUvzObh5Xl7/ONnl8fDzmw//gZF+w4D1rrwKaYS0cO84hdVkk+ow6nBJyJ4rCvRKpY0
u3hw+NXFU3wxUr5847ZL+swlkURS9mxl8MMIw1pcBjdVYr5g6ptgNcRSUHQxSt62VCFkSY0Uwuoi
Za7xyC2iZNbzX+iMJzwSc+h9KwIZy5UQnSI7BsMjOoHqxlCACg8J0mDD69J6gBWEYLRPyfsxo/sg
5olMpLzC1IryTdRX0LKf7z4evm13H18Om+en/ffNB/nKuRHJ2g9LDVuEzhvXkzRFVqxojtHTsLJk
0AqalfVUacHiMgm4l2uiFQuEpw9tZmP0Lgi8y2HUBvpAsci7tCZjq4ATTlyrdA/s6mSSM0xNS31q
Bo0nGPfOWY2ydhlVXRIvb8+tsGbWgYKILqSBsrp80lNYjQFUnUxe+1qbSPoi3m2f1h92j+8oIhT3
u3rKzt2KXIKLz7THJkX7mQwsdClv3x1+rM+tVi1gqGHUCjgxVm6DQNOPFSpQOCy6iiW1N2YaLuLA
YF2SbwWZ08bqVYbvgcJushkhEgEDbkG/Y1W6kpHhDg+dWzZB+NmhTgQ6QtsmZK4vpIhjqTqZuR7U
UA28kxnHK6zh23foYfp9/5/d+z/rp/X7n/v191/b3fvD+p8NlL/9/h795B/xdHn/7dc/7+SBM9s8
7zY/xdvImx3ePg8Hj5EF8my72x6365/b/10j1niYBu+kgNNEM2D6uT3UiEKvM2SaffNJLqxJ8fLZ
oDSPykA7NDrcjd7r0D1Z+zufopLXFcZgy/wP6nbdgmU8i0wmL6FL80iQoPLOhWCKiC+wbqPCcnOH
Exbt1dJI+vzn13F/9oAPM+yfzyRfNryQBTGM6ISZST8s8IUPh51CAn3SehYl5ZRXQYT/ydTKUmAA
fdLKCv3uYSRhrx57DQ+2hIUaPytLn3pWln4JGJ7qk4LwCIeyX66CW5qKQrX05bX9YW8mci51FdVk
fH5xjTnnnhxE3qapR41Av+niH2L222YK0h3R8EBadr0MkswvbJK2+kV2DJXUa7l8+fZz+/Dh382f
swexrB/xRdc/3mqurEhtCYv9JcUjqrk8iin3nB5bxfaT6LofGWkeU2PWVnN+8fnz+Q3x5YDEvvr+
Zi/HH5vdcfuwPm6+n/Gd6Dmwm7P/bI8/ztjhsH/YClS8Pq69oYiizJvsCQGLpiDvs4tPcPytzi/N
/HX97p4kmHkriID/1HnS1TUnmAC/SzwOBWM5ZcCn53p6RyKeAcXHg9+PETVX0ZhK0KuRjb+/ImJT
cNtVUUHTirpdVMhiPPKKKWUTbeDSjkrXjIKv8I2RcPn51JgH9+sBKQb7LaV0bL4kuBvm/WjazB8R
9CvXszJdH36EJgVEeW8lTTNGjAM9f3MnAZO899s+bg5Hv7IqurzwS5Zg6QZHI2kozFcqs286LV2S
x88oZTN+4c+6hPuLSsEV9/Lqb84/xcnYw0xE3e6IBvdkP70YTv7lysNn8ZVXWBb75WQJ7ESM6038
8a2ymNr1CDYfcxnAIMZT4MsLn1ppBT4QFnbNLykUlB5GglZw8svANxT4klitdUYZCjWyAUlzVPji
SDOpzm+oA31ROlqMSyBWQyeWKSZLEUvc9zPY/vphx5VptuwvSoDJEBwfrMsnFnKxGCfkjpAI777L
xQcWZ8Qw2DHxT2qNeO1DdeAAa3s75UWYVKYSoXqCOH/TCOjp2uuG2PwIPfVZTEwcwC47HvPQN2Px
r7+OWVozYt/pwz6ICNUDImjJc6IiCRfn0Svfnuq6QRIuJruiZMxFMXZMriRBaIo1OlCpje4uF2YW
O4fG6p/covunX8+bw8FSc/uZHaeWf4EWP+4LD3Z95bOq9N5vLcCmPiO/r5s+nWC13n3fP53lL0/f
Ns9nk81u8+xo4Zo15PioTUmpWXE1muisYwRGiQHuRElc8AbYIIroa96Bwqv376TBl7kxiqhcEXWj
BtWBPvtq/T2h1lHfRAyD9CY61JPDPRM8X7nEmgr8z+235/Xzn7Pn/ctxuyOEsTQZkUxfwKvIlwSU
J8ucC5KQIGPg/HfdfBr/cLFqkQyGLECiTtZx6utBiRpK8GR6izA8B0hHsWGE9zJXhbnfbs/PT/Y3
KLpZRZ3q8wlFYBiSQW873aleDHKLmlLKjm2kFA8vDU00kGU7ShVN3Y6CZE2Z0TTLz59uuohX6oaH
K0/9gaCcRfU1vng6RyyW0VMMbl+q9KCXPxbyVSfZJKv4Kh+Ig1IGOBrlMQ8Wl87E6BSsr6H6Dbp5
PmKcMSjhB/GuxWH7uFsfX543Zw8/Ng//bnePRoyUTKZm3I5VlvOyj68xIaiN5csGI3GGEfO+9yhE
TsPbq083X6x7iyKPWbVym0PfcsiSYZ9j6o26oYm1X+cbxkQ3eZTk2AbxoO1YD2oaZHfS5llazyZp
WDfieQQnT0Xd+qLHPauANp/YybYwqtXpSN80kOoxvaExwjpgFAT+PMIbuErEYZqLySRJeR7A5rzp
2iYxnXg0apzkMfxVwShDEwy+UFSxFexZJRnv8jYbcdOwL+9QWeoXjAkgdayLg3LAgo+hX12Ulcto
Kp3dKj52KNATErMwyrRCZZqYPe3LACYg3kRv/MtdUIa7KIKTm+Rc0fkXl1iqzjR1lzRtZ4mnjv6P
ir/Ob+zBgYnx0eraqXDABPKOSBJWLZwLM4diRPoTAM6WNyP7l+GOBQy8t4GYZVPh964VAxZ9XGRk
50GqFDkUK246JCIU4/Jc+D0eIyCe2ELrvTwxHSjIsETJCKVKBqmVpAZZlobT7QMplyAXYIp+eY9g
97cy2/SjrKAiDJrMWqQIEmZOpgIy88H3AdZMYdt6CExw6TdnFP1NNCdgWB+62U3uE2NLG4j03spC
PiCUluDwBsJLYRRNrR8iQBdTZVfMdE1esqpiK8kdTKmgLqIEmAGISYJgQCFDAVZkhipLkAjHslgU
wq1s6rnI/iWTqAPfnZj+FwInMsazUjgyuD7dIvN9HFddA6qbxXXrRVI0qTFXSBrZyfARVPIKWLFA
+UbNzT/rl5/Hs4f97rh9fMHHhp/k/eP6ebOG4/F/N/9jiPTiHv6ed9loBbM85BjvEVAXelah67lx
89+ja7TmiW9pjmTSDUW9TpslZIpxi8SM8kIMS0GGytBscG2PFypDofjEepLKVWeM+p15oKWFZbXH
3z1zI/227FjCKL1HX54BkFR3KGsbVWRlYr1ehQH9GAkMp7q1XmEN630yj+vC3z0T3jRwThfj2Fzo
5jddI85xMwyoQHNK765uQq9/n39xQBigJLPeGasW0zYUqbPKcc+UGOJvXff2qFaG0HbjFJ+7tAOW
eiLhVGQ+eqpjP6LZgpl5yQQo5qWZx7eGreXE2qKrVj4hZ68XKD150HY10FK2gP563u6O/4onc74/
bQ6PvuebkDVnYtQtQVCC0cGbvmuVOQgwUW8KYmHa3yh/DVLctQlvbq/6NaXUD6+Eq6EVwuVDNUU8
cED7Cq5yho+3hV38LQov+6Ah12cj9HnpeFXBB3TKIiwB/oAoPCqU+4uamOBg96av7c/Nh+P2SUn+
B0H6IOHP/tTIuuyY4AGGcYBtxJ3USz1WH2OBTKgGZQ2iKn149iTxglVj4zifxCMM2E1K+06P5+LC
PWvRgIxxzkSpIiGxiOe9xcTg/2Us/BIOQ8zDkVmFoiuSKJaRnmRTjol7apnF0+RZsvmg2KGcjXFF
GWvMg9rFiDZhNPLKH9FxIXJntLn8RLDx7vKCunGV/SuLxM4EIL14VAy+lcrBrEHGhfCqi0or4deb
145MDo1GzO2DZgnx5tvL4yO67SS7w/H55cl+jSVjk0REwlWGT40B7F2G5Ozefvp9PgyPSSdzGwUX
kulbqiEqXEbOmzvmMl5JEGSYWOHEOu5LQjcpapEwIV3BJM9g6Zp14W/K3tOfAqOa5aDS5EmDp7rT
UoE9XV9UM8vV6k2TY4+TDOfyRwhj5TzpSrly9eUanB65LV82PK+d1PayOMQLOYOyGOG3xSK37ETC
eFQkmK/XtNvYcJgSOXzWtnJo7nlFJVEf2tVZ6raEVwVsJeY8D9FPnKRZLN2vTEhvCmgw4snogfjt
5X9RYJUZ9cRylBHHpyjqlFHLTqwbNekgmaTADvx50phTxQtu09YhQbYG7hwrKp7HQWbtjOY868qJ
cPv2WzWn/fXdD99QiXyQy523AezuApFETng5nt6JrDb9vh0E+l/YMnYUiUZJrG+Wllh0jJeLfGAR
oDhZerVTsVvgwIoEomgxtQE1ThKfiHQZbnFiKm/PbeDQJaeOIdkJOWfS9CsosyJuUzprtMdonIN3
KlPpKZUPiM6K/a/D+7N0//Dvyy95fk3Xu0dTFmWY+RsO2MLKbWGB8Qxt+dBViRRKRduYCmBdjBs0
1LW4YxvYj+S74hgioKjEJhAlwWhmllhuUFFlGSsSkd0U86g3rKa36OIORA0QOOKC0vbE4Mu6ROhp
nwXo1AjK6BYQDL6/iAfkfeYvd7yTvUYCbQFTwHQihsG/lyjbnm8ctxnnpTwKpOEafdiGA+6/D7+2
O/Rrgy48vRw3vzfwn83x4a+//jJfsMbUJqJI8YwFEaZcVvhmm8plQhm3sQTsgXdgoGm24UvuSSI6
b7ELD5AvFhIDbLxY2LEtqqZFbUWlS6homMNlRJwEL322phDBU1E/WJ3y0Nc4fOLmlnrEzhwrWM0Y
ayFP0v5qdOjkYCc1DpCx9RltLqljWcGCJQ2lnWmF9v+xTvptIoLSgcWMUzYx8yhY8C7PDNVeMElB
MMCE0A9z0rV5zXkM20Hah4ljV57qhDkLd+a/Upz7vj6uz1COe8ALHis3h5qYUBYSJeu8gq+pBS9R
MizMeX9KSCN5JwQlEGeqlsjzY3GYQD/cdkSgfHJ8MyGtvQGpopbiQM4qG/S7qO0wk6m/kAyCUx+D
aBgowCILJT5EHL8jAuZFw0TonJUCgRw8u8/uaAHHl/pdJTS7E/MrMzuBkI4pLKnBwGuFPFrJtzu0
FoLuFMPi9m1leVHK7luhdXNDoz2Nhe6XU5pGW1bGzr4ikN0iaaZoNqzfQKZSHKH9ySVXZJnItici
PqrYIcG8LripBaXQxb1C0DfGtV1GqjRZtMNUKjTndk43ZVMi++wQJrxROx6boyWSTQt6542+vMHp
rqHXkT/GRlFKw8XcI4ZoVHGewZ4G9Zvsq1efVnncihQhYWfVPbaMcsJIq74hl7OzsmgtROgfPoFC
Q6dAhht7TZVSi7caF7A1BuhgociSwtv6QzPVjpHrhQ7eFXNf56ysp4W/KDRCm22cCZLlj+BQgdmV
D6I6GdgsHA9ZMDRaXR3jux/iO/v6XpUVHNJROhO5cZOi86a1hSpGXK5T8skqtUslgb9yrPuoepXD
JnZJMZEX0CeTiXVHL8dIbhCZRdls17CuaZeGgV8be+WU84OujqXiAkw8UWten0SYT14Nt58u11s6
DYOjqTxx9hjNepXY2M/C3h2mNEYYN3WY0Br0EzZyFKuTmHfFNErOL2+uxL2Uq1UP1TPM/0+tE0Od
FwmUE2Wb4waTVseqpDAHPylsnCdc/L7+QgoXttjncTFfLPRpZJSpum2Qb+0pDPqwKnu/4H7myzLm
V4Gy4tEk8IHIBbuMzWgZpU2lI3Hv5BxQPTPzW49txMtrTLJNSez44rBYUZ+W13Q6FIMi9Hyapmi9
yxiXwo1XVeKNuM8R9+K0xlCyU7c4ogxxcIel4Cwhuy+HR9iKAwKYfHYK1aoTTWjzhcxjDuIc0YYe
7d4C9IKivX7Nm7tmczii+oNafYSPb6wfN0aCCmydYfURjR3eaLLAtkVUwvhSbNjOHReJFbJS8J1z
rVngtVhRKRYdyAIt8wVqCrOmMUvSgNkTUdLM6xmsnAL7TA40S8ZyMjbjOnVHmCoptM0oTDNG9ff1
Tpr3G05TsohqicsoZ3bMsrQs1nCSw0Ekd7v9FhrS00cNSK1CMIMK5Ru4OZXABvhqvwzsCG96DXph
4PKK+f8AdR5drbHxAQA=
--===============3803383556026000315==--

