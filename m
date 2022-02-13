Content-Type: multipart/mixed; boundary="===============7965584604981739680=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/vdpa_user/vduse_dev.c:1364 vduse_ioctl() error: __copy_from_user() '&__gu_val' too small (4 vs 8)
Date: Sun, 13 Feb 2022 13:14:14 +0800
Message-ID: <202202131320.8XLnq1eR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7965584604981739680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xie Yongji <xieyongji@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b81b1829e7e39f6cebdf6e4d5484eacbceda8554
commit: c8a6153b6c59d95c0e091f053f6f180952ade91e vduse: Introduce VDUSE - v=
DPA Device in Userspace
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: microblaze-randconfig-m031-20220213 (https://download.01.org/0day-c=
i/archive/20220213/202202131320.8XLnq1eR-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:1364 vduse_ioctl() error: __copy_from_us=
er() '&__gu_val' too small (4 vs 8)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.
drivers/vdpa/vdpa_user/vduse_dev.c:1602 vduse_init() warn: missing error co=
de 'ret'

vim +1364 drivers/vdpa/vdpa_user/vduse_dev.c

c8a6153b6c59d9 Xie Yongji 2021-08-31  1347  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1348  static long vduse_ioctl(struct =
file *file, unsigned int cmd,
c8a6153b6c59d9 Xie Yongji 2021-08-31  1349  			unsigned long arg)
c8a6153b6c59d9 Xie Yongji 2021-08-31  1350  {
c8a6153b6c59d9 Xie Yongji 2021-08-31  1351  	int ret;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1352  	void __user *argp =3D (void __=
user *)arg;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1353  	struct vduse_control *control =
=3D file->private_data;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1354  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1355  	mutex_lock(&vduse_lock);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1356  	switch (cmd) {
c8a6153b6c59d9 Xie Yongji 2021-08-31  1357  	case VDUSE_GET_API_VERSION:
c8a6153b6c59d9 Xie Yongji 2021-08-31  1358  		ret =3D put_user(control->api=
_version, (u64 __user *)argp);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1359  		break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1360  	case VDUSE_SET_API_VERSION: {
c8a6153b6c59d9 Xie Yongji 2021-08-31  1361  		u64 api_version;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1362  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1363  		ret =3D -EFAULT;
c8a6153b6c59d9 Xie Yongji 2021-08-31 @1364  		if (get_user(api_version, (u6=
4 __user *)argp))
c8a6153b6c59d9 Xie Yongji 2021-08-31  1365  			break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1366  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1367  		ret =3D -EINVAL;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1368  		if (api_version > VDUSE_API_V=
ERSION)
c8a6153b6c59d9 Xie Yongji 2021-08-31  1369  			break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1370  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1371  		ret =3D 0;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1372  		control->api_version =3D api_=
version;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1373  		break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1374  	}
c8a6153b6c59d9 Xie Yongji 2021-08-31  1375  	case VDUSE_CREATE_DEV: {
c8a6153b6c59d9 Xie Yongji 2021-08-31  1376  		struct vduse_dev_config confi=
g;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1377  		unsigned long size =3D offset=
of(struct vduse_dev_config, config);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1378  		void *buf;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1379  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1380  		ret =3D -EFAULT;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1381  		if (copy_from_user(&config, a=
rgp, size))
c8a6153b6c59d9 Xie Yongji 2021-08-31  1382  			break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1383  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1384  		ret =3D -EINVAL;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1385  		if (vduse_validate_config(&co=
nfig) =3D=3D false)
c8a6153b6c59d9 Xie Yongji 2021-08-31  1386  			break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1387  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1388  		buf =3D vmemdup_user(argp + s=
ize, config.config_size);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1389  		if (IS_ERR(buf)) {
c8a6153b6c59d9 Xie Yongji 2021-08-31  1390  			ret =3D PTR_ERR(buf);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1391  			break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1392  		}
c8a6153b6c59d9 Xie Yongji 2021-08-31  1393  		config.name[VDUSE_NAME_MAX - =
1] =3D '\0';
c8a6153b6c59d9 Xie Yongji 2021-08-31  1394  		ret =3D vduse_create_dev(&con=
fig, buf, control->api_version);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1395  		break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1396  	}
c8a6153b6c59d9 Xie Yongji 2021-08-31  1397  	case VDUSE_DESTROY_DEV: {
c8a6153b6c59d9 Xie Yongji 2021-08-31  1398  		char name[VDUSE_NAME_MAX];
c8a6153b6c59d9 Xie Yongji 2021-08-31  1399  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1400  		ret =3D -EFAULT;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1401  		if (copy_from_user(name, argp=
, VDUSE_NAME_MAX))
c8a6153b6c59d9 Xie Yongji 2021-08-31  1402  			break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1403  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1404  		name[VDUSE_NAME_MAX - 1] =3D =
'\0';
c8a6153b6c59d9 Xie Yongji 2021-08-31  1405  		ret =3D vduse_destroy_dev(nam=
e);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1406  		break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1407  	}
c8a6153b6c59d9 Xie Yongji 2021-08-31  1408  	default:
c8a6153b6c59d9 Xie Yongji 2021-08-31  1409  		ret =3D -EINVAL;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1410  		break;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1411  	}
c8a6153b6c59d9 Xie Yongji 2021-08-31  1412  	mutex_unlock(&vduse_lock);
c8a6153b6c59d9 Xie Yongji 2021-08-31  1413  =

c8a6153b6c59d9 Xie Yongji 2021-08-31  1414  	return ret;
c8a6153b6c59d9 Xie Yongji 2021-08-31  1415  }
c8a6153b6c59d9 Xie Yongji 2021-08-31  1416  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7965584604981739680==--

