Content-Type: multipart/mixed; boundary="===============8130684703738186600=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wwan/wwan_core.c:417 wwan_port_fops_open() warn: passing a valid pointer to 'PTR_ERR'
Date: Fri, 26 Nov 2021 09:44:55 +0800
Message-ID: <202111260930.3XUGaCmA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8130684703738186600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Loic Poulain <loic.poulain@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ced7ca3570333998ad2088d5a6275701970e28e
commit: fa588eba632df14d296436995e6bbea0c146ae77 net: Add Qcom WWAN control=
 driver
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-m031-20211123 (https://download.01.org/0day-ci/=
archive/20211126/202111260930.3XUGaCmA-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/wwan/wwan_core.c:417 wwan_port_fops_open() warn: passing a vali=
d pointer to 'PTR_ERR'

Old smatch warnings:
drivers/net/wwan/wwan_core.c:305 wwan_port_txon() warn: test_bit() takes a =
bit number
drivers/net/wwan/wwan_core.c:312 wwan_port_txoff() warn: test_bit() takes a=
 bit number
drivers/net/wwan/wwan_core.c:379 is_write_blocked() warn: test_bit() takes =
a bit number

vim +/PTR_ERR +417 drivers/net/wwan/wwan_core.c

9a44c1cc638876 Loic Poulain 2021-04-16  409  =

9a44c1cc638876 Loic Poulain 2021-04-16  410  static int wwan_port_fops_open=
(struct inode *inode, struct file *file)
9a44c1cc638876 Loic Poulain 2021-04-16  411  {
9a44c1cc638876 Loic Poulain 2021-04-16  412  	struct wwan_port *port;
9a44c1cc638876 Loic Poulain 2021-04-16  413  	int err =3D 0;
9a44c1cc638876 Loic Poulain 2021-04-16  414  =

9a44c1cc638876 Loic Poulain 2021-04-16  415  	port =3D wwan_port_get_by_min=
or(iminor(inode));
9a44c1cc638876 Loic Poulain 2021-04-16  416  	if (IS_ERR(port))
9a44c1cc638876 Loic Poulain 2021-04-16 @417  		return PTR_ERR(port);
9a44c1cc638876 Loic Poulain 2021-04-16  418  =

9a44c1cc638876 Loic Poulain 2021-04-16  419  	file->private_data =3D port;
9a44c1cc638876 Loic Poulain 2021-04-16  420  	stream_open(inode, file);
9a44c1cc638876 Loic Poulain 2021-04-16  421  =

9a44c1cc638876 Loic Poulain 2021-04-16  422  	err =3D wwan_port_op_start(po=
rt);
9a44c1cc638876 Loic Poulain 2021-04-16  423  	if (err)
9a44c1cc638876 Loic Poulain 2021-04-16  424  		put_device(&port->dev);
9a44c1cc638876 Loic Poulain 2021-04-16  425  =

9a44c1cc638876 Loic Poulain 2021-04-16  426  	return err;
9a44c1cc638876 Loic Poulain 2021-04-16  427  }
9a44c1cc638876 Loic Poulain 2021-04-16  428  =


:::::: The code at line 417 was first introduced by commit
:::::: 9a44c1cc63887627284ae232a9626a9f1cd066fc net: Add a WWAN subsystem

:::::: TO: Loic Poulain <loic.poulain@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8130684703738186600==--

