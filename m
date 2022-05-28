Content-Type: multipart/mixed; boundary="===============4034974643280195335=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:for-5.19/drivers 102/107] drivers/block/nbd.c:1563 nbd_open() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 28 May 2022 23:34:21 +0800
Message-ID: <202205282331.vAb2Wesx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4034974643280195335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yu Kuai <yukuai3@huawei.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Hou Tao <houtao1@huawei.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-5.19/drivers
head:   a1a2d8f0162b27e85e7ce0ae6a35c96a490e0559
commit: c55b2b983b0fa012942c3eb16384b2b722caa810 [102/107] nbd: fix race be=
tween nbd_alloc_config() and module removal
:::::: branch date: 3 hours ago
:::::: commit date: 13 hours ago
config: arm-randconfig-m031-20220526 (https://download.01.org/0day-ci/archi=
ve/20220528/202205282331.vAb2Wesx-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/block/nbd.c:1563 nbd_open() warn: passing a valid pointer to 'PTR_E=
RR'
drivers/block/nbd.c:1978 nbd_genl_connect() warn: passing a valid pointer t=
o 'PTR_ERR'

vim +/PTR_ERR +1563 drivers/block/nbd.c

5ea8d10802ec4c Josef Bacik       2017-04-06  1537  =

5ea8d10802ec4c Josef Bacik       2017-04-06  1538  static int nbd_open(stru=
ct block_device *bdev, fmode_t mode)
5ea8d10802ec4c Josef Bacik       2017-04-06  1539  {
5ea8d10802ec4c Josef Bacik       2017-04-06  1540  	struct nbd_device *nbd;
5ea8d10802ec4c Josef Bacik       2017-04-06  1541  	int ret =3D 0;
5ea8d10802ec4c Josef Bacik       2017-04-06  1542  =

5ea8d10802ec4c Josef Bacik       2017-04-06  1543  	mutex_lock(&nbd_index_m=
utex);
5ea8d10802ec4c Josef Bacik       2017-04-06  1544  	nbd =3D bdev->bd_disk->=
private_data;
5ea8d10802ec4c Josef Bacik       2017-04-06  1545  	if (!nbd) {
5ea8d10802ec4c Josef Bacik       2017-04-06  1546  		ret =3D -ENXIO;
5ea8d10802ec4c Josef Bacik       2017-04-06  1547  		goto out;
5ea8d10802ec4c Josef Bacik       2017-04-06  1548  	}
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1549  	if (!refcount_inc_not_z=
ero(&nbd->refs)) {
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1550  		ret =3D -ENXIO;
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1551  		goto out;
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1552  	}
5ea8d10802ec4c Josef Bacik       2017-04-06  1553  	if (!refcount_inc_not_z=
ero(&nbd->config_refs)) {
5ea8d10802ec4c Josef Bacik       2017-04-06  1554  		struct nbd_config *con=
fig;
5ea8d10802ec4c Josef Bacik       2017-04-06  1555  =

5ea8d10802ec4c Josef Bacik       2017-04-06  1556  		mutex_lock(&nbd->confi=
g_lock);
5ea8d10802ec4c Josef Bacik       2017-04-06  1557  		if (refcount_inc_not_z=
ero(&nbd->config_refs)) {
5ea8d10802ec4c Josef Bacik       2017-04-06  1558  			mutex_unlock(&nbd->co=
nfig_lock);
5ea8d10802ec4c Josef Bacik       2017-04-06  1559  			goto out;
5ea8d10802ec4c Josef Bacik       2017-04-06  1560  		}
c55b2b983b0fa0 Yu Kuai           2022-05-21  1561  		config =3D nbd_alloc_c=
onfig();
c55b2b983b0fa0 Yu Kuai           2022-05-21  1562  		if (IS_ERR(config)) {
c55b2b983b0fa0 Yu Kuai           2022-05-21 @1563  			ret =3D PTR_ERR(confi=
g);
5ea8d10802ec4c Josef Bacik       2017-04-06  1564  			mutex_unlock(&nbd->co=
nfig_lock);
5ea8d10802ec4c Josef Bacik       2017-04-06  1565  			goto out;
5ea8d10802ec4c Josef Bacik       2017-04-06  1566  		}
c55b2b983b0fa0 Yu Kuai           2022-05-21  1567  		nbd->config =3D config;
5ea8d10802ec4c Josef Bacik       2017-04-06  1568  		refcount_set(&nbd->con=
fig_refs, 1);
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1569  		refcount_inc(&nbd->ref=
s);
5ea8d10802ec4c Josef Bacik       2017-04-06  1570  		mutex_unlock(&nbd->con=
fig_lock);
1aba169e770911 Josh Triplett     2020-12-17  1571  		if (max_part)
38430f0876fa8b Christoph Hellwig 2020-09-21  1572  			set_bit(GD_NEED_PART_=
SCAN, &bdev->bd_disk->state);
fe1f9e6659ca61 Josef Bacik       2018-05-16  1573  	} else if (nbd_disconne=
cted(nbd->config)) {
1aba169e770911 Josh Triplett     2020-12-17  1574  		if (max_part)
38430f0876fa8b Christoph Hellwig 2020-09-21  1575  			set_bit(GD_NEED_PART_=
SCAN, &bdev->bd_disk->state);
5ea8d10802ec4c Josef Bacik       2017-04-06  1576  	}
5ea8d10802ec4c Josef Bacik       2017-04-06  1577  out:
5ea8d10802ec4c Josef Bacik       2017-04-06  1578  	mutex_unlock(&nbd_index=
_mutex);
5ea8d10802ec4c Josef Bacik       2017-04-06  1579  	return ret;
5ea8d10802ec4c Josef Bacik       2017-04-06  1580  }
5ea8d10802ec4c Josef Bacik       2017-04-06  1581  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4034974643280195335==--

