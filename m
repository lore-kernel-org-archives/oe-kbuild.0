Content-Type: multipart/mixed; boundary="===============5169969139964593155=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/dma/idxd/sysfs.c:429 engine_group_id_store() warn: possible spectre second half. 'engine->group'
Date: Sun, 09 Jan 2022 05:19:22 +0800
Message-ID: <202201090410.6kYbyif6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5169969139964593155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Jiang <dave.jiang@intel.com>
CC: Vinod Koul <vkoul@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d1587f7bfe9a0f97a75d42ac1489aeda551106bc
commit: defe49f96012ca91e8e673cb95b5c30b4a3735e8 dmaengine: idxd: fix group=
 conf_dev lifetime
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m031-20220107 (https://download.01.org/0day-ci/ar=
chive/20220109/202201090410.6kYbyif6-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma/idxd/sysfs.c:429 engine_group_id_store() warn: possible spectre=
 second half.  'engine->group'
drivers/dma/idxd/sysfs.c:867 wq_group_id_store() warn: possible spectre sec=
ond half.  'group'

Old smatch warnings:
drivers/dma/idxd/sysfs.c:428 engine_group_id_store() warn: potential spectr=
e issue 'idxd->groups' [r] (local cap)
drivers/dma/idxd/sysfs.c:862 wq_group_id_store() warn: potential spectre is=
sue 'idxd->groups' [r] (local cap)

vim +429 drivers/dma/idxd/sysfs.c

c52ca478233c172 Dave Jiang 2020-01-21  394  =

c52ca478233c172 Dave Jiang 2020-01-21  395  static ssize_t engine_group_id_=
store(struct device *dev,
c52ca478233c172 Dave Jiang 2020-01-21  396  				     struct device_attribut=
e *attr,
c52ca478233c172 Dave Jiang 2020-01-21  397  				     const char *buf, size_=
t count)
c52ca478233c172 Dave Jiang 2020-01-21  398  {
c52ca478233c172 Dave Jiang 2020-01-21  399  	struct idxd_engine *engine =3D
c52ca478233c172 Dave Jiang 2020-01-21  400  		container_of(dev, struct idxd=
_engine, conf_dev);
c52ca478233c172 Dave Jiang 2020-01-21  401  	struct idxd_device *idxd =3D e=
ngine->idxd;
c52ca478233c172 Dave Jiang 2020-01-21  402  	long id;
c52ca478233c172 Dave Jiang 2020-01-21  403  	int rc;
f7b280c63881371 YueHaibing 2020-02-11  404  	struct idxd_group *prevg;
c52ca478233c172 Dave Jiang 2020-01-21  405  =

c52ca478233c172 Dave Jiang 2020-01-21  406  	rc =3D kstrtol(buf, 10, &id);
c52ca478233c172 Dave Jiang 2020-01-21  407  	if (rc < 0)
c52ca478233c172 Dave Jiang 2020-01-21  408  		return -EINVAL;
c52ca478233c172 Dave Jiang 2020-01-21  409  =

c52ca478233c172 Dave Jiang 2020-01-21  410  	if (!test_bit(IDXD_FLAG_CONFIG=
URABLE, &idxd->flags))
c52ca478233c172 Dave Jiang 2020-01-21  411  		return -EPERM;
c52ca478233c172 Dave Jiang 2020-01-21  412  =

c52ca478233c172 Dave Jiang 2020-01-21  413  	if (id > idxd->max_groups - 1 =
|| id < -1)
c52ca478233c172 Dave Jiang 2020-01-21  414  		return -EINVAL;
c52ca478233c172 Dave Jiang 2020-01-21  415  =

c52ca478233c172 Dave Jiang 2020-01-21  416  	if (id =3D=3D -1) {
c52ca478233c172 Dave Jiang 2020-01-21  417  		if (engine->group) {
c52ca478233c172 Dave Jiang 2020-01-21  418  			engine->group->num_engines--;
c52ca478233c172 Dave Jiang 2020-01-21  419  			engine->group =3D NULL;
c52ca478233c172 Dave Jiang 2020-01-21  420  		}
c52ca478233c172 Dave Jiang 2020-01-21  421  		return count;
c52ca478233c172 Dave Jiang 2020-01-21  422  	}
c52ca478233c172 Dave Jiang 2020-01-21  423  =

c52ca478233c172 Dave Jiang 2020-01-21  424  	prevg =3D engine->group;
c52ca478233c172 Dave Jiang 2020-01-21  425  =

c52ca478233c172 Dave Jiang 2020-01-21  426  	if (prevg)
c52ca478233c172 Dave Jiang 2020-01-21  427  		prevg->num_engines--;
defe49f96012ca9 Dave Jiang 2021-04-15  428  	engine->group =3D idxd->groups=
[id];
c52ca478233c172 Dave Jiang 2020-01-21 @429  	engine->group->num_engines++;
c52ca478233c172 Dave Jiang 2020-01-21  430  =

c52ca478233c172 Dave Jiang 2020-01-21  431  	return count;
c52ca478233c172 Dave Jiang 2020-01-21  432  }
c52ca478233c172 Dave Jiang 2020-01-21  433  =


:::::: The code at line 429 was first introduced by commit
:::::: c52ca478233c172b2d322b5241d6279a8661cbba dmaengine: idxd: add config=
uration component of driver

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5169969139964593155==--

