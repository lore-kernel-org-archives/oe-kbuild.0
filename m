Content-Type: multipart/mixed; boundary="===============0454699338178926836=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:petrm_soft_counters 11/11] net/core/dev.c:8555 netdev_offload_xstats_get_stats() error: we previously assumed 'stats' could be null (see line 8551)
Date: Sun, 12 Dec 2021 03:20:13 +0800
Message-ID: <202112120312.3pnqwOGk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0454699338178926836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Petr Machata <petrm@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw petrm_soft_counters
head:   a88cf58e4f95bb2bf8142e1c9e2c853e20d17298
commit: a88cf58e4f95bb2bf8142e1c9e2c853e20d17298 [11/11] wip
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: microblaze-randconfig-m031-20211210 (https://download.01.org/0day-c=
i/archive/20211212/202112120312.3pnqwOGk-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/core/dev.c:8555 netdev_offload_xstats_get_stats() error: we previously =
assumed 'stats' could be null (see line 8551)

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:91 current_thread_info() error: u=
ninitialized symbol 'sp'.
net/core/dev.c:6922 napi_disable() error: uninitialized symbol 'new'.

vim +/stats +8555 net/core/dev.c

38ca0aa04554a9 Petr Machata 2021-12-09  8530  =

453f3cd9e64f05 Petr Machata 2021-10-29  8531  	struct netdev_notifier_offlo=
ad_xstats_rd report_delta =3D {};
453f3cd9e64f05 Petr Machata 2021-10-29  8532  	struct netdev_notifier_offlo=
ad_xstats_info info =3D {
453f3cd9e64f05 Petr Machata 2021-10-29  8533  		.info.dev =3D dev,
453f3cd9e64f05 Petr Machata 2021-10-29  8534  		.info.extack =3D extack,
453f3cd9e64f05 Petr Machata 2021-10-29  8535  		.cmd =3D NETDEV_OFFLOAD_XST=
ATS_CMD_REPORT_DELTA,
a88cf58e4f95bb Petr Machata 2021-12-10  8536  		.type =3D type,
a88cf58e4f95bb Petr Machata 2021-12-10  8537  		.report_delta =3D &report_d=
elta,
453f3cd9e64f05 Petr Machata 2021-10-29  8538  	};
38ca0aa04554a9 Petr Machata 2021-12-09  8539  	struct rtnl_link_stats64 *st=
ats;
453f3cd9e64f05 Petr Machata 2021-10-29  8540  	int rc;
453f3cd9e64f05 Petr Machata 2021-10-29  8541  =

38ca0aa04554a9 Petr Machata 2021-12-09  8542  	stats =3D netdev_offload_xst=
ats_get_ptr(dev, type);
a88cf58e4f95bb Petr Machata 2021-12-10  8543  	WARN_ON(!stats);
d35d00a6d28ff7 Petr Machata 2021-11-12  8544  =

453f3cd9e64f05 Petr Machata 2021-10-29  8545  	rc =3D call_netdevice_notifi=
ers_info(NETDEV_OFFLOAD_XSTATS_CMD,
453f3cd9e64f05 Petr Machata 2021-10-29  8546  					   &info.info);
453f3cd9e64f05 Petr Machata 2021-10-29  8547  =

453f3cd9e64f05 Petr Machata 2021-10-29  8548  	/* Cache whatever we got, ev=
en if there was an error, otherwise the
453f3cd9e64f05 Petr Machata 2021-10-29  8549  	 * successful stats retrieva=
ls would get lost.
453f3cd9e64f05 Petr Machata 2021-10-29  8550  	 */
0839ffb5b56fb6 Petr Machata 2021-11-26 @8551  	if (stats)
38ca0aa04554a9 Petr Machata 2021-12-09  8552  		netdev_link_stats64_add(sta=
ts, &report_delta.stats);
38ca0aa04554a9 Petr Machata 2021-12-09  8553  =

38ca0aa04554a9 Petr Machata 2021-12-09  8554  	if (p_stats)
38ca0aa04554a9 Petr Machata 2021-12-09 @8555  		*p_stats =3D *stats;
38ca0aa04554a9 Petr Machata 2021-12-09  8556  	*p_used =3D report_delta.use=
d;
453f3cd9e64f05 Petr Machata 2021-10-29  8557  =

453f3cd9e64f05 Petr Machata 2021-10-29  8558  	return notifier_to_errno(rc);
a8a72b09197b26 Petr Machata 2021-10-22  8559  }
a88cf58e4f95bb Petr Machata 2021-12-10  8560  =


:::::: The code at line 8555 was first introduced by commit
:::::: 38ca0aa04554a994a5ab769f0c07b37484b5f4c9 wip

:::::: TO: Petr Machata <petrm@nvidia.com>
:::::: CC: Petr Machata <petrm@nvidia.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0454699338178926836==--

