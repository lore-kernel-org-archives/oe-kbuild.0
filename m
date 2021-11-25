Content-Type: multipart/mixed; boundary="===============5794986600378050305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:petrm_soft_counters 7/8] net/core/dev.c:8395 netdev_offload_xstats_hw_stats_enable() error: uninitialized symbol 'stats'.
Date: Fri, 26 Nov 2021 02:02:25 +0800
Message-ID: <202111260203.hEYHxybc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5794986600378050305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw petrm_soft_counters
head:   59d158395664dab1c1164364d6ee57aaaad44b96
commit: d35d00a6d28ff7a34145438df3a2b39abd00edc3 [7/8] wip
:::::: branch date: =

:::::: commit date: 13 days ago
config: x86_64-randconfig-m001-20211117 (https://download.01.org/0day-ci/ar=
chive/20211126/202111260203.hEYHxybc-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/dev.c:8395 netdev_offload_xstats_hw_stats_enable() error: uninitia=
lized symbol 'stats'.

Old smatch warnings:
net/core/dev.c:6922 napi_disable() error: uninitialized symbol 'new'.

vim +/stats +8395 net/core/dev.c

61bd3857ff2c7da Moni Shoua   2015-02-03  8362  =

453f3cd9e64f05f Petr Machata 2021-10-29  8363  int netdev_offload_xstats_hw=
_stats_enable(struct net_device *dev,
453f3cd9e64f05f Petr Machata 2021-10-29  8364  					  u32 req_hw_stats,
a8a72b09197b260 Petr Machata 2021-10-22  8365  					  struct netlink_ext_ac=
k *extack)
a8a72b09197b260 Petr Machata 2021-10-22  8366  {
a8a72b09197b260 Petr Machata 2021-10-22  8367  	struct netdev_notifier_offl=
oad_xstats_info info =3D {
a8a72b09197b260 Petr Machata 2021-10-22  8368  		.info.dev =3D dev,
a8a72b09197b260 Petr Machata 2021-10-22  8369  		.info.extack =3D extack,
453f3cd9e64f05f Petr Machata 2021-10-29  8370  		.cmd =3D NETDEV_OFFLOAD_XS=
TATS_CMD_ENABLE,
7f3ca7ed5c4b775 Petr Machata 2021-11-03  8371  		.hw_stats =3D req_hw_stats,
a8a72b09197b260 Petr Machata 2021-10-22  8372  	};
453f3cd9e64f05f Petr Machata 2021-10-29  8373  	struct rtnl_link_stats64 *s=
tats;
a8a72b09197b260 Petr Machata 2021-10-22  8374  	int err;
a8a72b09197b260 Petr Machata 2021-10-22  8375  	int rc;
a8a72b09197b260 Petr Machata 2021-10-22  8376  =

d35d00a6d28ff7a Petr Machata 2021-11-12  8377  	if (!dev->offload_hw_stats)=
 {
d35d00a6d28ff7a Petr Machata 2021-11-12  8378  		dev->offload_hw_stats =3D =
kzalloc(sizeof(*dev->offload_hw_stats),
d35d00a6d28ff7a Petr Machata 2021-11-12  8379  						GFP_KERNEL);
d35d00a6d28ff7a Petr Machata 2021-11-12  8380  		if (!dev->offload_hw_stats)
453f3cd9e64f05f Petr Machata 2021-10-29  8381  			return -ENOMEM;
d35d00a6d28ff7a Petr Machata 2021-11-12  8382  	}
453f3cd9e64f05f Petr Machata 2021-10-29  8383  =

453f3cd9e64f05f Petr Machata 2021-10-29  8384  	rc =3D call_netdevice_notif=
iers_info(NETDEV_OFFLOAD_XSTATS_CMD,
a8a72b09197b260 Petr Machata 2021-10-22  8385  					   &info.info);
a8a72b09197b260 Petr Machata 2021-10-22  8386  	err =3D notifier_to_errno(r=
c);
453f3cd9e64f05f Petr Machata 2021-10-29  8387  	if (err)
453f3cd9e64f05f Petr Machata 2021-10-29  8388  		// xxx note we need a way =
to roll back if the notifier chain
453f3cd9e64f05f Petr Machata 2021-10-29  8389  		// fails midway through
453f3cd9e64f05f Petr Machata 2021-10-29  8390  		goto free_stats;
453f3cd9e64f05f Petr Machata 2021-10-29  8391  =

453f3cd9e64f05f Petr Machata 2021-10-29  8392  	return 0;
453f3cd9e64f05f Petr Machata 2021-10-29  8393  =

453f3cd9e64f05f Petr Machata 2021-10-29  8394  free_stats:
453f3cd9e64f05f Petr Machata 2021-10-29 @8395  	kfree(stats);
a8a72b09197b260 Petr Machata 2021-10-22  8396  	return err;
a8a72b09197b260 Petr Machata 2021-10-22  8397  }
453f3cd9e64f05f Petr Machata 2021-10-29  8398  EXPORT_SYMBOL(netdev_offload=
_xstats_hw_stats_enable);
a8a72b09197b260 Petr Machata 2021-10-22  8399  =


:::::: The code at line 8395 was first introduced by commit
:::::: 453f3cd9e64f05fe295e3807e7e9d7bda5d6a9c0 wip

:::::: TO: Petr Machata <petrm@nvidia.com>
:::::: CC: Petr Machata <petrm@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5794986600378050305==--

