Content-Type: multipart/mixed; boundary="===============3151310772354775348=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-block:gendisk-lookup 1/19] fs/char_dev.c:508:13: warning: Unsigned variable '--' can't be negative so it is unnecessary to test it.
Date: Tue, 25 Aug 2020 05:44:45 +0800
Message-ID: <202008250536.OxwBBZ43%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3151310772354775348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git gendisk-lookup
head:   fb73c864e566d8e46b8c75caa3a455674548308d
commit: 4d251bf59f5f5e45a4868d2a595a61f8bb2c2dc3 [1/19] char_dev: replace c=
dev_map with an xarray
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   fs/char_dev.c:286:6: warning: Variable 'err' is reassigned a value befor=
e the old one has been used. [redundantAssignment]
    err =3D cdev_add(cdev, MKDEV(cd->major, baseminor), count);
        ^
   fs/char_dev.c:272:0: note: Variable 'err' is reassigned a value before t=
he old one has been used.
    int err =3D -ENOMEM;
   ^
   fs/char_dev.c:286:6: note: Variable 'err' is reassigned a value before t=
he old one has been used.
    err =3D cdev_add(cdev, MKDEV(cd->major, baseminor), count);
        ^
>> fs/char_dev.c:508:13: warning: Unsigned variable '--' can't be negative =
so it is unnecessary to test it. [unsignedPositive]
    while (--i >=3D 0)
               ^

git remote add hch-block git://git.infradead.org/users/hch/block.git
git fetch --no-tags hch-block gendisk-lookup
git checkout 4d251bf59f5f5e45a4868d2a595a61f8bb2c2dc3
vim +508 fs/char_dev.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  474  =

cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  475  /**
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  476   * cdev_add() - add a cha=
r device to the system
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  477   * @p: the cdev structure=
 for the device
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  478   * @dev: the first device=
 number for which this device is responsible
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  479   * @count: the number of =
consecutive minor numbers corresponding to this
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  480   *         device
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  481   *
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  482   * cdev_add() adds the de=
vice represented by @p to the system, making it
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  483   * live immediately.  A n=
egative error code is returned on failure.
cf3e43dbe0cc4a Jonathan Corbet   2006-09-29  484   */
^1da177e4c3f41 Linus Torvalds    2005-04-16  485  int cdev_add(struct cdev =
*p, dev_t dev, unsigned count)
^1da177e4c3f41 Linus Torvalds    2005-04-16  486  {
4d251bf59f5f5e Christoph Hellwig 2020-08-23  487  	unsigned i;
2f0157f13f4280 Dmitry Torokhov   2012-10-21  488  	int error;
2f0157f13f4280 Dmitry Torokhov   2012-10-21  489  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  490  	p->dev =3D dev;
^1da177e4c3f41 Linus Torvalds    2005-04-16  491  	p->count =3D count;
2f0157f13f4280 Dmitry Torokhov   2012-10-21  492  =

a3c751a50fe6bb Miklos Szeredi    2020-05-14  493  	if (WARN_ON(dev =3D=3D W=
HITEOUT_DEV))
a3c751a50fe6bb Miklos Szeredi    2020-05-14  494  		return -EBUSY;
a3c751a50fe6bb Miklos Szeredi    2020-05-14  495  =

4d251bf59f5f5e Christoph Hellwig 2020-08-23  496  	mutex_lock(&chrdevs_lock=
);
4d251bf59f5f5e Christoph Hellwig 2020-08-23  497  	for (i =3D 0; i < count;=
 i++) {
4d251bf59f5f5e Christoph Hellwig 2020-08-23  498  		error =3D xa_insert(&cd=
ev_map, dev + i, p, GFP_KERNEL);
2f0157f13f4280 Dmitry Torokhov   2012-10-21  499  		if (error)
4d251bf59f5f5e Christoph Hellwig 2020-08-23  500  			goto out_unwind;
4d251bf59f5f5e Christoph Hellwig 2020-08-23  501  	}
4d251bf59f5f5e Christoph Hellwig 2020-08-23  502  	mutex_unlock(&chrdevs_lo=
ck);
2f0157f13f4280 Dmitry Torokhov   2012-10-21  503  =

2f0157f13f4280 Dmitry Torokhov   2012-10-21  504  	kobject_get(p->kobj.pare=
nt);
2f0157f13f4280 Dmitry Torokhov   2012-10-21  505  	return 0;
4d251bf59f5f5e Christoph Hellwig 2020-08-23  506  =

4d251bf59f5f5e Christoph Hellwig 2020-08-23  507  out_unwind:
4d251bf59f5f5e Christoph Hellwig 2020-08-23 @508  	while (--i >=3D 0)
4d251bf59f5f5e Christoph Hellwig 2020-08-23  509  		xa_erase(&cdev_map, dev=
 + i);
4d251bf59f5f5e Christoph Hellwig 2020-08-23  510  	mutex_unlock(&chrdevs_lo=
ck);
4d251bf59f5f5e Christoph Hellwig 2020-08-23  511  	return error;
^1da177e4c3f41 Linus Torvalds    2005-04-16  512  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  513  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3151310772354775348==--

