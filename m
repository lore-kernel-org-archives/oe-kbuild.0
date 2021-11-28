Content-Type: multipart/mixed; boundary="===============4256050901900514669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [driver-core:driver-core-next 1/3] fs/kernfs/dir.c:1331 __kernfs_remove() warn: variable dereferenced before check 'kn' (see line 1324)
Date: Mon, 29 Nov 2021 01:56:04 +0800
Message-ID: <202111290125.Pssa2QMU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4256050901900514669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: devel(a)driverdev.osuosl.org
CC: linux-kernel(a)vger.kernel.org
TO: Minchan Kim <minchan@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.=
git driver-core-next
head:   2043727c2882928a10161ddee52b196b7db402fd
commit: 393c3714081a53795bbff0e985d24146def6f57f [1/3] kernfs: switch globa=
l kernfs_rwsem lock to per-fs lock
:::::: branch date: 32 hours ago
:::::: commit date: 4 days ago
config: nios2-randconfig-m031-20211128 (https://download.01.org/0day-ci/arc=
hive/20211129/202111290125.Pssa2QMU-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/kernfs/dir.c:1331 __kernfs_remove() warn: variable dereferenced before c=
heck 'kn' (see line 1324)

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:71 current_thread_info() error: uninit=
ialized symbol 'sp'.

vim +/kn +1331 fs/kernfs/dir.c

d35258ef702cca Tejun Heo          2014-02-03  1319  =

988cd7afb3f375 Tejun Heo          2014-02-03  1320  static void __kernfs_re=
move(struct kernfs_node *kn)
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1321  {
35beab0635f3cd Tejun Heo          2014-02-03  1322  	struct kernfs_node *po=
s;
35beab0635f3cd Tejun Heo          2014-02-03  1323  =

393c3714081a53 Minchan Kim        2021-11-18 @1324  	lockdep_assert_held_wr=
ite(&kernfs_root(kn)->kernfs_rwsem);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1325  =

6b0afc2a21726b Tejun Heo          2014-02-03  1326  	/*
6b0afc2a21726b Tejun Heo          2014-02-03  1327  	 * Short-circuit if no=
n-root @kn has already finished removal.
6b0afc2a21726b Tejun Heo          2014-02-03  1328  	 * This is for kernfs_=
remove_self() which plays with active ref
6b0afc2a21726b Tejun Heo          2014-02-03  1329  	 * after removal.
6b0afc2a21726b Tejun Heo          2014-02-03  1330  	 */
6b0afc2a21726b Tejun Heo          2014-02-03 @1331  	if (!kn || (kn->parent=
 && RB_EMPTY_NODE(&kn->rb)))
ce9b499c9f58d7 Greg Kroah-Hartman 2014-01-13  1332  		return;
ce9b499c9f58d7 Greg Kroah-Hartman 2014-01-13  1333  =

c637b8acbe079e Tejun Heo          2013-12-11  1334  	pr_debug("kernfs %s: r=
emoving\n", kn->name);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1335  =

81c173cb5e87fb Tejun Heo          2014-02-03  1336  	/* prevent any new usa=
ge under @kn by deactivating all nodes */
35beab0635f3cd Tejun Heo          2014-02-03  1337  	pos =3D NULL;
35beab0635f3cd Tejun Heo          2014-02-03  1338  	while ((pos =3D kernfs=
_next_descendant_post(pos, kn)))
81c173cb5e87fb Tejun Heo          2014-02-03  1339  		if (kernfs_active(pos=
))
81c173cb5e87fb Tejun Heo          2014-02-03  1340  			atomic_add(KN_DEACTI=
VATED_BIAS, &pos->active);
35beab0635f3cd Tejun Heo          2014-02-03  1341  =

35beab0635f3cd Tejun Heo          2014-02-03  1342  	/* deactivate and unli=
nk the subtree node-by-node */
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1343  	do {
35beab0635f3cd Tejun Heo          2014-02-03  1344  		pos =3D kernfs_leftmo=
st_descendant(kn);
35beab0635f3cd Tejun Heo          2014-02-03  1345  =

35beab0635f3cd Tejun Heo          2014-02-03  1346  		/*
7ba0273b2f34a5 Ian Kent           2021-07-16  1347  		 * kernfs_drain() dro=
ps kernfs_rwsem temporarily and @pos's
81c173cb5e87fb Tejun Heo          2014-02-03  1348  		 * base ref could hav=
e been put by someone else by the time
81c173cb5e87fb Tejun Heo          2014-02-03  1349  		 * the function retur=
ns.  Make sure it doesn't go away
81c173cb5e87fb Tejun Heo          2014-02-03  1350  		 * underneath us.
35beab0635f3cd Tejun Heo          2014-02-03  1351  		 */
35beab0635f3cd Tejun Heo          2014-02-03  1352  		kernfs_get(pos);
35beab0635f3cd Tejun Heo          2014-02-03  1353  =

d35258ef702cca Tejun Heo          2014-02-03  1354  		/*
d35258ef702cca Tejun Heo          2014-02-03  1355  		 * Drain iff @kn was =
activated.  This avoids draining and
d35258ef702cca Tejun Heo          2014-02-03  1356  		 * its lockdep annota=
tions for nodes which have never been
d35258ef702cca Tejun Heo          2014-02-03  1357  		 * activated and allo=
ws embedding kernfs_remove() in create
d35258ef702cca Tejun Heo          2014-02-03  1358  		 * error paths withou=
t worrying about draining.
d35258ef702cca Tejun Heo          2014-02-03  1359  		 */
d35258ef702cca Tejun Heo          2014-02-03  1360  		if (kn->flags & KERNF=
S_ACTIVATED)
81c173cb5e87fb Tejun Heo          2014-02-03  1361  			kernfs_drain(pos);
d35258ef702cca Tejun Heo          2014-02-03  1362  		else
d35258ef702cca Tejun Heo          2014-02-03  1363  			WARN_ON_ONCE(atomic_=
read(&kn->active) !=3D KN_DEACTIVATED_BIAS);
35beab0635f3cd Tejun Heo          2014-02-03  1364  =

35beab0635f3cd Tejun Heo          2014-02-03  1365  		/*
35beab0635f3cd Tejun Heo          2014-02-03  1366  		 * kernfs_unlink_sibl=
ing() succeeds once per node.  Use it
35beab0635f3cd Tejun Heo          2014-02-03  1367  		 * to decide who's re=
sponsible for cleanups.
35beab0635f3cd Tejun Heo          2014-02-03  1368  		 */
35beab0635f3cd Tejun Heo          2014-02-03  1369  		if (!pos->parent || k=
ernfs_unlink_sibling(pos)) {
35beab0635f3cd Tejun Heo          2014-02-03  1370  			struct kernfs_iattrs=
 *ps_iattr =3D
35beab0635f3cd Tejun Heo          2014-02-03  1371  				pos->parent ? pos->=
parent->iattr : NULL;
35beab0635f3cd Tejun Heo          2014-02-03  1372  =

35beab0635f3cd Tejun Heo          2014-02-03  1373  			/* update timestamps=
 on the parent */
35beab0635f3cd Tejun Heo          2014-02-03  1374  			if (ps_iattr) {
05895219627c41 Ondrej Mosnacek    2019-02-22  1375  				ktime_get_real_ts64=
(&ps_iattr->ia_ctime);
05895219627c41 Ondrej Mosnacek    2019-02-22  1376  				ps_iattr->ia_mtime =
=3D ps_iattr->ia_ctime;
35beab0635f3cd Tejun Heo          2014-02-03  1377  			}
35beab0635f3cd Tejun Heo          2014-02-03  1378  =

988cd7afb3f375 Tejun Heo          2014-02-03  1379  			kernfs_put(pos);
35beab0635f3cd Tejun Heo          2014-02-03  1380  		}
35beab0635f3cd Tejun Heo          2014-02-03  1381  =

35beab0635f3cd Tejun Heo          2014-02-03  1382  		kernfs_put(pos);
35beab0635f3cd Tejun Heo          2014-02-03  1383  	} while (pos !=3D kn);
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1384  }
fd7b9f7b9776b1 Tejun Heo          2013-11-28  1385  =


:::::: The code at line 1331 was first introduced by commit
:::::: 6b0afc2a21726b2d6b6aa441af40cafaf5405cc8 kernfs, sysfs, driver-core:=
 implement kernfs_remove_self() and its wrappers

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4256050901900514669==--

