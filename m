Content-Type: multipart/mixed; boundary="===============6926248475048156541=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:mdev-lifetime 14/14] drivers/vfio/mdev/mdev_core.c:152:6-25: atomic_dec_and_test variation before object free at line 206.
Date: Tue, 12 Jul 2022 08:23:41 +0800
Message-ID: <202207120849.HZLcpDXA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6926248475048156541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git mdev-lifetime
head:   03b6aa0be2bb8ac3cd69a3078a27d454a5f948f4
commit: 03b6aa0be2bb8ac3cd69a3078a27d454a5f948f4 [14/14] vfio/mdev: add mde=
v available instance checking to the core
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: nios2-randconfig-c023-20220710 (https://download.01.org/0day-ci/arc=
hive/20220712/202207120849.HZLcpDXA-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/vfio/mdev/mdev_core.c:152:6-25: atomic_dec_and_test variation be=
fore object free at line 206.

vim +152 drivers/vfio/mdev/mdev_core.c

7b96953bc640b6 Kirti Wankhede  2016-11-17  133  =

417fd5bf242d76 Jason Gunthorpe 2021-04-06  134  int mdev_device_create(stru=
ct mdev_type *type, const guid_t *uuid)
7b96953bc640b6 Kirti Wankhede  2016-11-17  135  {
7b96953bc640b6 Kirti Wankhede  2016-11-17  136  	int ret;
002fe996f67f4f Alex Williamson 2018-05-15  137  	struct mdev_device *mdev, =
*tmp;
a9f8111d0b5f44 Jason Gunthorpe 2021-04-06  138  	struct mdev_parent *parent=
 =3D type->parent;
6b42f491e17ce1 Jason Gunthorpe 2022-04-11  139  	struct mdev_driver *drv =
=3D parent->mdev_driver;
7b96953bc640b6 Kirti Wankhede  2016-11-17  140  =

002fe996f67f4f Alex Williamson 2018-05-15  141  	mutex_lock(&mdev_list_lock=
);
7b96953bc640b6 Kirti Wankhede  2016-11-17  142  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  143  	/* Check for duplicate */
002fe996f67f4f Alex Williamson 2018-05-15  144  	list_for_each_entry(tmp, &=
mdev_list, next) {
278bca7f318e6a Andy Shevchenko 2019-01-10  145  		if (guid_equal(&tmp->uuid=
, uuid)) {
002fe996f67f4f Alex Williamson 2018-05-15  146  			mutex_unlock(&mdev_list_=
lock);
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  147  			return -EEXIST;
002fe996f67f4f Alex Williamson 2018-05-15  148  		}
7b96953bc640b6 Kirti Wankhede  2016-11-17  149  	}
7b96953bc640b6 Kirti Wankhede  2016-11-17  150  =

03b6aa0be2bb8a Jason Gunthorpe 2022-07-08  151  	if (!drv->get_available) {
03b6aa0be2bb8a Jason Gunthorpe 2022-07-08 @152  		if (atomic_dec_and_test(&=
parent->available_instances)) {
03b6aa0be2bb8a Jason Gunthorpe 2022-07-08  153  			mutex_unlock(&mdev_list_=
lock);
03b6aa0be2bb8a Jason Gunthorpe 2022-07-08  154  			return -EUSERS;
03b6aa0be2bb8a Jason Gunthorpe 2022-07-08  155  		}
03b6aa0be2bb8a Jason Gunthorpe 2022-07-08  156  	}
03b6aa0be2bb8a Jason Gunthorpe 2022-07-08  157  =

7b96953bc640b6 Kirti Wankhede  2016-11-17  158  	mdev =3D kzalloc(sizeof(*m=
dev), GFP_KERNEL);
7b96953bc640b6 Kirti Wankhede  2016-11-17  159  	if (!mdev) {
002fe996f67f4f Alex Williamson 2018-05-15  160  		mutex_unlock(&mdev_list_l=
ock);
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  161  		return -ENOMEM;
7b96953bc640b6 Kirti Wankhede  2016-11-17  162  	}
7b96953bc640b6 Kirti Wankhede  2016-11-17  163  =

fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  164  	device_initialize(&mdev->d=
ev);
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  165  	mdev->dev.parent  =3D pare=
nt->dev;
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  166  	mdev->dev.bus =3D &mdev_bu=
s_type;
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  167  	mdev->dev.release =3D mdev=
_device_release;
2aa72ec97ce9eb Jason Gunthorpe 2022-04-11  168  	mdev->dev.groups =3D mdev_=
device_groups;
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  169  	mdev->type =3D type;
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  170  	/* Pairs with the put in m=
dev_device_release() */
fbea43239074e1 Jason Gunthorpe 2021-04-06  171  	kobject_get(&type->kobj);
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  172  =

278bca7f318e6a Andy Shevchenko 2019-01-10  173  	guid_copy(&mdev->uuid, uui=
d);
002fe996f67f4f Alex Williamson 2018-05-15  174  	list_add(&mdev->next, &mde=
v_list);
002fe996f67f4f Alex Williamson 2018-05-15  175  	mutex_unlock(&mdev_list_lo=
ck);
002fe996f67f4f Alex Williamson 2018-05-15  176  =

18d731242d5c67 Jason Gunthorpe 2021-04-06  177  	ret =3D dev_set_name(&mdev=
->dev, "%pUl", uuid);
18d731242d5c67 Jason Gunthorpe 2021-04-06  178  	if (ret)
18d731242d5c67 Jason Gunthorpe 2021-04-06  179  		goto out_put_device;
7b96953bc640b6 Kirti Wankhede  2016-11-17  180  =

5715c4dd66a315 Parav Pandit    2019-06-06  181  	/* Check if parent unregis=
tration has started */
5715c4dd66a315 Parav Pandit    2019-06-06  182  	if (!down_read_trylock(&pa=
rent->unreg_sem)) {
5715c4dd66a315 Parav Pandit    2019-06-06  183  		ret =3D -ENODEV;
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  184  		goto out_put_device;
5715c4dd66a315 Parav Pandit    2019-06-06  185  	}
5715c4dd66a315 Parav Pandit    2019-06-06  186  =

522ecce08ab20b Parav Pandit    2019-06-06  187  	ret =3D device_add(&mdev->=
dev);
7b96953bc640b6 Kirti Wankhede  2016-11-17  188  	if (ret)
6c7f98b334a32d Jason Gunthorpe 2022-04-11  189  		goto out_unlock;
7b96953bc640b6 Kirti Wankhede  2016-11-17  190  =

88a21f265ce50a Jason Gunthorpe 2021-06-17  191  	ret =3D device_driver_atta=
ch(&drv->driver, &mdev->dev);
88a21f265ce50a Jason Gunthorpe 2021-06-17  192  	if (ret)
88a21f265ce50a Jason Gunthorpe 2021-06-17  193  		goto out_del;
88a21f265ce50a Jason Gunthorpe 2021-06-17  194  =

417fd5bf242d76 Jason Gunthorpe 2021-04-06  195  	ret =3D mdev_create_sysfs_=
files(mdev);
522ecce08ab20b Parav Pandit    2019-06-06  196  	if (ret)
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  197  		goto out_del;
7b96953bc640b6 Kirti Wankhede  2016-11-17  198  =

002fe996f67f4f Alex Williamson 2018-05-15  199  	mdev->active =3D true;
7b96953bc640b6 Kirti Wankhede  2016-11-17  200  	dev_dbg(&mdev->dev, "MDEV:=
 created\n");
5715c4dd66a315 Parav Pandit    2019-06-06  201  	up_read(&parent->unreg_sem=
);
7b96953bc640b6 Kirti Wankhede  2016-11-17  202  =

002fe996f67f4f Alex Williamson 2018-05-15  203  	return 0;
7b96953bc640b6 Kirti Wankhede  2016-11-17  204  =

fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  205  out_del:
522ecce08ab20b Parav Pandit    2019-06-06 @206  	device_del(&mdev->dev);
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  207  out_unlock:
5715c4dd66a315 Parav Pandit    2019-06-06  208  	up_read(&parent->unreg_sem=
);
fbd0e2b0c3d0b2 Jason Gunthorpe 2021-04-06  209  out_put_device:
522ecce08ab20b Parav Pandit    2019-06-06  210  	put_device(&mdev->dev);
7b96953bc640b6 Kirti Wankhede  2016-11-17  211  	return ret;
7b96953bc640b6 Kirti Wankhede  2016-11-17  212  }
7b96953bc640b6 Kirti Wankhede  2016-11-17  213  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6926248475048156541==--

