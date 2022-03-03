Content-Type: multipart/mixed; boundary="===============8893834266620507467=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 484/10468] drivers/gpu/drm/dp/drm_dp_mst_topology.c:1583 __topology_ref_save() warn: statement has no effect 3
Date: Thu, 03 Mar 2022 20:53:51 +0800
Message-ID: <202203032023.oAalNRbw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8893834266620507467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   91265a6da44d13296bdb5b3fbafa19d06be462f2
commit: adb9d5a2cc77e8aefe98fe4c11656c5b7025c248 [484/10468] drm/dp: Move D=
isplayPort helpers into separate helper module
:::::: branch date: 4 hours ago
:::::: commit date: 6 weeks ago
config: nds32-randconfig-m031-20220303 (https://download.01.org/0day-ci/arc=
hive/20220303/202203032023.oAalNRbw-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/dp/drm_dp_mst_topology.c:1583 __topology_ref_save() warn: s=
tatement has no effect 3

vim +1583 drivers/gpu/drm/dp/drm_dp_mst_topology.c

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1576  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1577  static noinline void
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1578  __topology_ref_save(struct drm_dp_mst_topology_mgr *mgr,
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1579  		    struct drm_dp_mst_topology_ref_history *history,
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1580  		    enum drm_dp_mst_topology_ref_type type)
ebcc0e6b509108b drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-01-1=
0  1581  {
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1582  	struct drm_dp_mst_topology_ref_entry *entry =3D NULL;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0 @1583  	depot_stack_handle_t backtrace;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1584  	ulong stack_entries[STACK_DEPTH];
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1585  	uint n;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1586  	int i;
ebcc0e6b509108b drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-01-1=
0  1587  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1588  	n =3D stack_trace_save(stack_entries, ARRAY_SIZE(stack_entries), =
1);
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1589  	backtrace =3D stack_depot_save(stack_entries, n, GFP_KERNEL);
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1590  	if (!backtrace)
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1591  		return;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1592  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1593  	/* Try to find an existing entry for this backtrace */
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1594  	for (i =3D 0; i < history->len; i++) {
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1595  		if (history->entries[i].backtrace =3D=3D backtrace) {
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1596  			entry =3D &history->entries[i];
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1597  			break;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1598  		}
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c Dave Airlie 2014-06-0=
5  1599  	}
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c Dave Airlie 2014-06-0=
5  1600  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1601  	/* Otherwise add one */
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1602  	if (!entry) {
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1603  		struct drm_dp_mst_topology_ref_entry *new;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1604  		int new_len =3D history->len + 1;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1605  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1606  		new =3D krealloc(history->entries, sizeof(*new) * new_len,
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1607  			       GFP_KERNEL);
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1608  		if (!new)
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1609  			return;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1610  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1611  		entry =3D &new[history->len];
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1612  		history->len =3D new_len;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1613  		history->entries =3D new;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1614  =

12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1615  		entry->backtrace =3D backtrace;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1616  		entry->type =3D type;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1617  		entry->count =3D 0;
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c Dave Airlie 2014-06-0=
5  1618  	}
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1619  	entry->count++;
12a280c72868571 drivers/gpu/drm/drm_dp_mst_topology.c Lyude Paul  2019-06-2=
0  1620  	entry->ts_nsec =3D ktime_get_ns();
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c Dave Airlie 2014-06-0=
5  1621  }
ad7f8a1f9ced7f0 drivers/gpu/drm/drm_dp_mst_topology.c Dave Airlie 2014-06-0=
5  1622  =


:::::: The code at line 1583 was first introduced by commit
:::::: 12a280c7286857119cf0d88c487f695e3a1c0912 drm/dp_mst: Add topology re=
f history tracking for debugging

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Lyude Paul <lyude@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8893834266620507467==--

