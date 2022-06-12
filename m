Content-Type: multipart/mixed; boundary="===============0163008035929211635=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/zdata.c:470 z_erofs_register_pcluster() warn: passing a valid pointer to 'PTR_ERR'
Date: Sun, 12 Jun 2022 22:00:45 +0800
Message-ID: <202206122100.Kko5rzqV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0163008035929211635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7a68065eb9cd194cf03f135c9211eeb2d5c4c0a0
commit: 87ca34a7065db66adbbe882a2be6b04127c26a87 erofs: get rid of `struct =
z_erofs_collection'
date:   12 days ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 days ago
config: xtensa-randconfig-m031-20220611 (https://download.01.org/0day-ci/ar=
chive/20220612/202206122100.Kko5rzqV-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/erofs/zdata.c:470 z_erofs_register_pcluster() warn: passing a valid poin=
ter to 'PTR_ERR'

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: incons=
istent indenting
fs/erofs/zdata.c:1218 jobqueueset_init() warn: maybe use && instead of &

vim +/PTR_ERR +470 fs/erofs/zdata.c

3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  451  =

87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  452 =
 static int z_erofs_register_pcluster(struct z_erofs_decompress_frontend *f=
e,
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  453 =
 				     struct inode *inode,
ab47dd2b081937 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-08-21  454 =
 				     struct erofs_map_blocks *map)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  455 =
 {
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  456 =
 	bool ztailpacking =3D map->m_flags & EROFS_MAP_META;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  457 =
 	struct z_erofs_pcluster *pcl;
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  458 =
 	struct erofs_workgroup *grp;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  459 =
 	int err;
e5e3abbadf0dbd drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-09-19  460  =

8f89926290c4b3 fs/erofs/zdata.c                  Gao Xiang 2021-10-09  461 =
 	if (!(map->m_flags & EROFS_MAP_ENCODED)) {
8f89926290c4b3 fs/erofs/zdata.c                  Gao Xiang 2021-10-09  462 =
 		DBG_BUGON(1);
8f89926290c4b3 fs/erofs/zdata.c                  Gao Xiang 2021-10-09  463 =
 		return -EFSCORRUPTED;
8f89926290c4b3 fs/erofs/zdata.c                  Gao Xiang 2021-10-09  464 =
 	}
8f89926290c4b3 fs/erofs/zdata.c                  Gao Xiang 2021-10-09  465  =

9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  466 =
 	/* no available pcluster, let's allocate one */
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  467 =
 	pcl =3D z_erofs_alloc_pcluster(ztailpacking ? 1 :
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  468 =
 				     map->m_plen >> PAGE_SHIFT);
9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  469 =
 	if (IS_ERR(pcl))
9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07 @470 =
 		return PTR_ERR(pcl);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  471  =

64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  472 =
 	atomic_set(&pcl->obj.refcount, 1);
8f89926290c4b3 fs/erofs/zdata.c                  Gao Xiang 2021-10-09  473 =
 	pcl->algorithmformat =3D map->m_algorithmformat;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  474 =
 	pcl->length =3D (map->m_llen << Z_EROFS_PCLUSTER_LENGTH_BIT) |
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  475 =
 		(map->m_flags & EROFS_MAP_FULL_MAPPED ?
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  476 =
 			Z_EROFS_PCLUSTER_FULL_LENGTH : 0);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  477  =

97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  478 =
 	/* new pclusters should be claimed as type 1, primary and followed */
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  479 =
 	pcl->next =3D fe->owned_head;
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  480 =
 	pcl->pageofs_out =3D map->m_la & ~PAGE_MASK;
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  481 =
 	fe->mode =3D COLLECT_PRIMARY_FOLLOWED;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  482  =

23edf3abe7abb1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-11-23  483 =
 	/*
23edf3abe7abb1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-11-23  484 =
 	 * lock all primary followed works before visible to others
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  485 =
 	 * and mutex_trylock *never* fails for a new pcluster.
23edf3abe7abb1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-11-23  486 =
 	 */
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  487 =
 	mutex_init(&pcl->lock);
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  488 =
 	DBG_BUGON(!mutex_trylock(&pcl->lock));
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  489  =

cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  490 =
 	if (ztailpacking) {
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  491 =
 		pcl->obj.index =3D 0;	/* which indicates ztailpacking */
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  492 =
 		pcl->pageofs_in =3D erofs_blkoff(map->m_pa);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  493 =
 		pcl->tailpacking_size =3D map->m_plen;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  494 =
 	} else {
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  495 =
 		pcl->obj.index =3D map->m_pa >> PAGE_SHIFT;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  496  =

64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  497 =
 		grp =3D erofs_insert_workgroup(inode->i_sb, &pcl->obj);
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  498 =
 		if (IS_ERR(grp)) {
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  499 =
 			err =3D PTR_ERR(grp);
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  500 =
 			goto err_out;
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  501 =
 		}
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  502  =

64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  503 =
 		if (grp !=3D &pcl->obj) {
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  504 =
 			fe->pcl =3D container_of(grp,
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  505 =
 					struct z_erofs_pcluster, obj);
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  506 =
 			err =3D -EEXIST;
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  507 =
 			goto err_out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  508 =
 		}
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  509 =
 	}
bfc4ccb1584129 drivers/staging/erofs/zdata.c     Gao Xiang 2019-08-21  510 =
 	/* used to check tail merging loop due to corrupted images */
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  511 =
 	if (fe->owned_head =3D=3D Z_EROFS_PCLUSTER_TAIL)
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  512 =
 		fe->tailpcl =3D pcl;
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  513 =
 	fe->owned_head =3D &pcl->next;
5c6dcc57e2e505 fs/erofs/zdata.c                  Gao Xiang 2022-03-02  514 =
 	fe->pcl =3D pcl;
9e579fc123a0c9 fs/erofs/zdata.c                  Gao Xiang 2019-10-08  515 =
 	return 0;
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  516  =

64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  517 =
 err_out:
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  518 =
 	mutex_unlock(&pcl->lock);
9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  519 =
 	z_erofs_free_pcluster(pcl);
64094a04414f0b fs/erofs/zdata.c                  Gao Xiang 2020-02-20  520 =
 	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  521 =
 }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  522  =


:::::: The code at line 470 was first introduced by commit
:::::: 9f6cc76e6ff0631a99cd94eab8af137057633a52 erofs: introduce physical c=
luster slab pools

:::::: TO: Gao Xiang <hsiangkao@redhat.com>
:::::: CC: Gao Xiang <hsiangkao@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0163008035929211635==--

