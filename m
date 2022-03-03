Content-Type: multipart/mixed; boundary="===============4983251297191396277=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_dp_mst_topology.c:1571 __topology_ref_save() warn: statement has no effect 3
Date: Thu, 03 Mar 2022 21:04:13 +0800
Message-ID: <202203032036.XPhglia0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4983251297191396277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bibby Hsieh <bibby.hsieh@mediatek.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Marek Szyprowski <m.szyprowski@samsung.com>
CC: "Hsin-Yi Wang" <hsinyi@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5859a2b1991101d6b978f3feb5325dad39421f29
commit: 5a7b95fb993ec399c8a685552aa6a8fc995c40bd i2c: core: support bus reg=
ulator controlling in adapter
date:   9 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 9 months ago
config: nds32-randconfig-m031-20220303 (https://download.01.org/0day-ci/arc=
hive/20220303/202203032036.XPhglia0-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_dp_mst_topology.c:1571 __topology_ref_save() warn: stat=
ement has no effect 3

vim +1571 drivers/gpu/drm/drm_dp_mst_topology.c

12a280c7286857 Lyude Paul  2019-06-20  1564  =

12a280c7286857 Lyude Paul  2019-06-20  1565  static noinline void
12a280c7286857 Lyude Paul  2019-06-20  1566  __topology_ref_save(struct drm=
_dp_mst_topology_mgr *mgr,
12a280c7286857 Lyude Paul  2019-06-20  1567  		    struct drm_dp_mst_topolo=
gy_ref_history *history,
12a280c7286857 Lyude Paul  2019-06-20  1568  		    enum drm_dp_mst_topology=
_ref_type type)
ebcc0e6b509108 Lyude Paul  2019-01-10  1569  {
12a280c7286857 Lyude Paul  2019-06-20  1570  	struct drm_dp_mst_topology_re=
f_entry *entry =3D NULL;
12a280c7286857 Lyude Paul  2019-06-20 @1571  	depot_stack_handle_t backtrac=
e;
12a280c7286857 Lyude Paul  2019-06-20  1572  	ulong stack_entries[STACK_DEP=
TH];
12a280c7286857 Lyude Paul  2019-06-20  1573  	uint n;
12a280c7286857 Lyude Paul  2019-06-20  1574  	int i;
ebcc0e6b509108 Lyude Paul  2019-01-10  1575  =

12a280c7286857 Lyude Paul  2019-06-20  1576  	n =3D stack_trace_save(stack_=
entries, ARRAY_SIZE(stack_entries), 1);
12a280c7286857 Lyude Paul  2019-06-20  1577  	backtrace =3D stack_depot_sav=
e(stack_entries, n, GFP_KERNEL);
12a280c7286857 Lyude Paul  2019-06-20  1578  	if (!backtrace)
12a280c7286857 Lyude Paul  2019-06-20  1579  		return;
12a280c7286857 Lyude Paul  2019-06-20  1580  =

12a280c7286857 Lyude Paul  2019-06-20  1581  	/* Try to find an existing en=
try for this backtrace */
12a280c7286857 Lyude Paul  2019-06-20  1582  	for (i =3D 0; i < history->le=
n; i++) {
12a280c7286857 Lyude Paul  2019-06-20  1583  		if (history->entries[i].back=
trace =3D=3D backtrace) {
12a280c7286857 Lyude Paul  2019-06-20  1584  			entry =3D &history->entries=
[i];
12a280c7286857 Lyude Paul  2019-06-20  1585  			break;
12a280c7286857 Lyude Paul  2019-06-20  1586  		}
ad7f8a1f9ced7f Dave Airlie 2014-06-05  1587  	}
ad7f8a1f9ced7f Dave Airlie 2014-06-05  1588  =

12a280c7286857 Lyude Paul  2019-06-20  1589  	/* Otherwise add one */
12a280c7286857 Lyude Paul  2019-06-20  1590  	if (!entry) {
12a280c7286857 Lyude Paul  2019-06-20  1591  		struct drm_dp_mst_topology_r=
ef_entry *new;
12a280c7286857 Lyude Paul  2019-06-20  1592  		int new_len =3D history->len=
 + 1;
12a280c7286857 Lyude Paul  2019-06-20  1593  =

12a280c7286857 Lyude Paul  2019-06-20  1594  		new =3D krealloc(history->en=
tries, sizeof(*new) * new_len,
12a280c7286857 Lyude Paul  2019-06-20  1595  			       GFP_KERNEL);
12a280c7286857 Lyude Paul  2019-06-20  1596  		if (!new)
12a280c7286857 Lyude Paul  2019-06-20  1597  			return;
12a280c7286857 Lyude Paul  2019-06-20  1598  =

12a280c7286857 Lyude Paul  2019-06-20  1599  		entry =3D &new[history->len];
12a280c7286857 Lyude Paul  2019-06-20  1600  		history->len =3D new_len;
12a280c7286857 Lyude Paul  2019-06-20  1601  		history->entries =3D new;
12a280c7286857 Lyude Paul  2019-06-20  1602  =

12a280c7286857 Lyude Paul  2019-06-20  1603  		entry->backtrace =3D backtra=
ce;
12a280c7286857 Lyude Paul  2019-06-20  1604  		entry->type =3D type;
12a280c7286857 Lyude Paul  2019-06-20  1605  		entry->count =3D 0;
ad7f8a1f9ced7f Dave Airlie 2014-06-05  1606  	}
12a280c7286857 Lyude Paul  2019-06-20  1607  	entry->count++;
12a280c7286857 Lyude Paul  2019-06-20  1608  	entry->ts_nsec =3D ktime_get_=
ns();
ad7f8a1f9ced7f Dave Airlie 2014-06-05  1609  }
ad7f8a1f9ced7f Dave Airlie 2014-06-05  1610  =


:::::: The code at line 1571 was first introduced by commit
:::::: 12a280c7286857119cf0d88c487f695e3a1c0912 drm/dp_mst: Add topology re=
f history tracking for debugging

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4983251297191396277==--

