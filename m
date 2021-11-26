Content-Type: multipart/mixed; boundary="===============8718805954419034408=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/zdata.c:486 z_erofs_register_collection() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 26 Nov 2021 13:00:29 +0800
Message-ID: <202111261247.8N45b4x5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8718805954419034408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: 9f6cc76e6ff0631a99cd94eab8af137057633a52 erofs: introduce physical =
cluster slab pools
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-m021-20211123 (https://download.01.org/0day-ci/arch=
ive/20211126/202111261247.8N45b4x5-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/erofs/zdata.c:486 z_erofs_register_collection() warn: passing a valid po=
inter to 'PTR_ERR'

Old smatch warnings:
fs/erofs/zdata.c:760 z_erofs_do_read_page() error: we previously assumed 'c=
lt->cl' could be null (see line 677)
fs/erofs/zdata.c:1241 jobqueueset_init() warn: maybe use && instead of &

vim +/PTR_ERR +486 fs/erofs/zdata.c

3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  473=
  =

9e579fc123a0c95 fs/erofs/zdata.c                  Gao Xiang 2019-10-08  474=
  static int z_erofs_register_collection(struct z_erofs_collector *clt,
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  475=
  				       struct inode *inode,
ab47dd2b0819375 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-08-21  476=
  				       struct erofs_map_blocks *map)
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  477=
  {
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  478=
  	struct z_erofs_pcluster *pcl;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  479=
  	struct z_erofs_collection *cl;
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  480=
  	struct erofs_workgroup *grp;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  481=
  	int err;
e5e3abbadf0dbd1 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-09-19  482=
  =

9f6cc76e6ff0631 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  483=
  	/* no available pcluster, let's allocate one */
9f6cc76e6ff0631 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  484=
  	pcl =3D z_erofs_alloc_pcluster(map->m_plen >> PAGE_SHIFT);
9f6cc76e6ff0631 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  485=
  	if (IS_ERR(pcl))
9f6cc76e6ff0631 fs/erofs/zdata.c                  Gao Xiang 2021-04-07 @486=
  		return PTR_ERR(pcl);
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  487=
  =

64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  488=
  	atomic_set(&pcl->obj.refcount, 1);
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  489=
  	pcl->obj.index =3D map->m_pa >> PAGE_SHIFT;
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  490=
  =

97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  491=
  	pcl->length =3D (map->m_llen << Z_EROFS_PCLUSTER_LENGTH_BIT) |
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  492=
  		(map->m_flags & EROFS_MAP_FULL_MAPPED ?
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  493=
  			Z_EROFS_PCLUSTER_FULL_LENGTH : 0);
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  494=
  =

97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  495=
  	if (map->m_flags & EROFS_MAP_ZIPPED)
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  496=
  		pcl->algorithmformat =3D Z_EROFS_COMPRESSION_LZ4;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  497=
  	else
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  498=
  		pcl->algorithmformat =3D Z_EROFS_COMPRESSION_SHIFTED;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  499=
  =

97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  500=
  	/* new pclusters should be claimed as type 1, primary and followed */
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  501=
  	pcl->next =3D clt->owned_head;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  502=
  	clt->mode =3D COLLECT_PRIMARY_FOLLOWED;
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  503=
  =

97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  504=
  	cl =3D z_erofs_primarycollection(pcl);
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  505=
  	cl->pageofs =3D map->m_la & ~PAGE_MASK;
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  506=
  =

23edf3abe7abb1d drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-11-23  507=
  	/*
23edf3abe7abb1d drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-11-23  508=
  	 * lock all primary followed works before visible to others
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  509=
  	 * and mutex_trylock *never* fails for a new pcluster.
23edf3abe7abb1d drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-11-23  510=
  	 */
9f6cc76e6ff0631 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  511=
  	mutex_init(&cl->lock);
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  512=
  	DBG_BUGON(!mutex_trylock(&cl->lock));
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  513=
  =

64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  514=
  	grp =3D erofs_insert_workgroup(inode->i_sb, &pcl->obj);
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  515=
  	if (IS_ERR(grp)) {
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  516=
  		err =3D PTR_ERR(grp);
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  517=
  		goto err_out;
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  518=
  	}
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  519=
  =

64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  520=
  	if (grp !=3D &pcl->obj) {
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  521=
  		clt->pcl =3D container_of(grp, struct z_erofs_pcluster, obj);
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  522=
  		err =3D -EEXIST;
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  523=
  		goto err_out;
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  524=
  	}
bfc4ccb1584129d drivers/staging/erofs/zdata.c     Gao Xiang 2019-08-21  525=
  	/* used to check tail merging loop due to corrupted images */
bfc4ccb1584129d drivers/staging/erofs/zdata.c     Gao Xiang 2019-08-21  526=
  	if (clt->owned_head =3D=3D Z_EROFS_PCLUSTER_TAIL)
bfc4ccb1584129d drivers/staging/erofs/zdata.c     Gao Xiang 2019-08-21  527=
  		clt->tailpcl =3D pcl;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  528=
  	clt->owned_head =3D &pcl->next;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  529=
  	clt->pcl =3D pcl;
97e86a858bc360c drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  530=
  	clt->cl =3D cl;
9e579fc123a0c95 fs/erofs/zdata.c                  Gao Xiang 2019-10-08  531=
  	return 0;
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  532=
  =

64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  533=
  err_out:
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  534=
  	mutex_unlock(&cl->lock);
9f6cc76e6ff0631 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  535=
  	z_erofs_free_pcluster(pcl);
64094a04414f0b2 fs/erofs/zdata.c                  Gao Xiang 2020-02-20  536=
  	return err;
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  537=
  }
3883a79abd02272 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  538=
  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8718805954419034408==--

