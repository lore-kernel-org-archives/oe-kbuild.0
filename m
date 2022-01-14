Content-Type: multipart/mixed; boundary="===============2826015487755139558=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [vishal-tiering:tiering-0.8 40/44] mm/migrate.c:1251 migrate_page_unmap() warn: bitwise AND condition is false here
Date: Sat, 15 Jan 2022 06:20:38 +0800
Message-ID: <202201150628.3CmMh36C-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2826015487755139558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huang Ying <ying.huang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/tiering.git =
tiering-0.8
head:   d58c7b0e1a99a2ec17f2910a310835bafc50b4d1
commit: 02ac43a74241ef7a62c51f3da6c07672254504a3 [40/44] mm/migrate_pages: =
split unmap_and_move() to _unmap() and _move()
:::::: branch date: 2 days ago
:::::: commit date: 10 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20115/202201150628.3CmMh36C-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/migrate.c:1251 migrate_page_unmap() warn: bitwise AND condition is false=
 here

vim +1251 mm/migrate.c

02ac43a74241ef7 Huang Ying         2021-08-16  1216  =

02ac43a74241ef7 Huang Ying         2021-08-16  1217  /* Obtain the lock on =
page, remove all ptes. */
02ac43a74241ef7 Huang Ying         2021-08-16  1218  static int migrate_pag=
e_unmap(new_page_t get_new_page, free_page_t put_new_page,
ef2a5153b4d2c48 Geert Uytterhoeven 2015-04-14  1219  			      unsigned long=
 private, struct page *page,
02ac43a74241ef7 Huang Ying         2021-08-16  1220  			      struct page *=
*newpagep, int force,
02ac43a74241ef7 Huang Ying         2021-08-16  1221  			      enum migrate_=
mode mode, enum migrate_reason reason,
dd4ae78a21fc05d Yang Shi           2020-12-14  1222  			      struct list_h=
ead *ret)
0dabec93de633a8 Minchan Kim        2011-10-31  1223  {
02ac43a74241ef7 Huang Ying         2021-08-16  1224  	int rc =3D MIGRATEPAG=
E_UNMAP;
74d4a5797b89048 Yang Shi           2019-11-30  1225  	struct page *newpage =
=3D NULL;
0dabec93de633a8 Minchan Kim        2011-10-31  1226  =

94723aafb9e7641 Michal Hocko       2018-04-10  1227  	if (!thp_migration_su=
pported() && PageTransHuge(page))
d532e2e57e3c53c Yang Shi           2020-12-14  1228  		return -ENOSYS;
94723aafb9e7641 Michal Hocko       2018-04-10  1229  =

0dabec93de633a8 Minchan Kim        2011-10-31  1230  	if (page_count(page) =
=3D=3D 1) {
0dabec93de633a8 Minchan Kim        2011-10-31  1231  		/* page was freed fr=
om under us. So we are done. */
c6c919eb90e021f Minchan Kim        2016-07-26  1232  		ClearPageActive(page=
);
c6c919eb90e021f Minchan Kim        2016-07-26  1233  		ClearPageUnevictable=
(page);
bda807d4445414e Minchan Kim        2016-07-26  1234  		if (unlikely(__PageM=
ovable(page))) {
bda807d4445414e Minchan Kim        2016-07-26  1235  			lock_page(page);
bda807d4445414e Minchan Kim        2016-07-26  1236  			if (!PageMovable(pa=
ge))
bda807d4445414e Minchan Kim        2016-07-26  1237  				__ClearPageIsolate=
d(page);
bda807d4445414e Minchan Kim        2016-07-26  1238  			unlock_page(page);
bda807d4445414e Minchan Kim        2016-07-26  1239  		}
02ac43a74241ef7 Huang Ying         2021-08-16  1240  		list_del(&page->lru);
02ac43a74241ef7 Huang Ying         2021-08-16  1241  		migrate_page_done(pa=
ge, reason);
02ac43a74241ef7 Huang Ying         2021-08-16  1242  		return MIGRATEPAGE_S=
UCCESS;
0dabec93de633a8 Minchan Kim        2011-10-31  1243  	}
0dabec93de633a8 Minchan Kim        2011-10-31  1244  =

74d4a5797b89048 Yang Shi           2019-11-30  1245  	newpage =3D get_new_p=
age(page, private);
74d4a5797b89048 Yang Shi           2019-11-30  1246  	if (!newpage)
74d4a5797b89048 Yang Shi           2019-11-30  1247  		return -ENOMEM;
02ac43a74241ef7 Huang Ying         2021-08-16  1248  =

8f16510e9b49b98 Huang Ying         2020-09-27  1249  	/* TODO: check whethe=
r Ksm pages can be demoted? */
8f16510e9b49b98 Huang Ying         2020-09-27  1250  	if (reason =3D=3D MR_=
DEMOTION &&
8f16510e9b49b98 Huang Ying         2020-09-27 @1251  	    sysctl_numa_balan=
cing_mode & NUMA_BALANCING_MEMORY_TIERING &&
8f16510e9b49b98 Huang Ying         2020-09-27  1252  	    sysctl_numa_balan=
cing_scan_demoted &&
8f16510e9b49b98 Huang Ying         2020-09-27  1253  	    !PageKsm(page)) {
8f16510e9b49b98 Huang Ying         2020-09-27  1254  		set_page_demoted(new=
page);
8f16510e9b49b98 Huang Ying         2020-09-27  1255  	}
74d4a5797b89048 Yang Shi           2019-11-30  1256  =

02ac43a74241ef7 Huang Ying         2021-08-16  1257  	*newpagep =3D newpage;
02ac43a74241ef7 Huang Ying         2021-08-16  1258  =

02ac43a74241ef7 Huang Ying         2021-08-16  1259  	rc =3D __migrate_page=
_unmap(page, newpage, force, mode);
02ac43a74241ef7 Huang Ying         2021-08-16  1260  	if (rc =3D=3D MIGRATE=
PAGE_UNMAP)
02ac43a74241ef7 Huang Ying         2021-08-16  1261  		return rc;
02ac43a74241ef7 Huang Ying         2021-08-16  1262  =

02ac43a74241ef7 Huang Ying         2021-08-16  1263  	/*
02ac43a74241ef7 Huang Ying         2021-08-16  1264  	 * A page that has no=
t been migrated will have kept its
02ac43a74241ef7 Huang Ying         2021-08-16  1265  	 * references and be =
restored.
02ac43a74241ef7 Huang Ying         2021-08-16  1266  	 */
02ac43a74241ef7 Huang Ying         2021-08-16  1267  	/* restore the page t=
o right list. */
02ac43a74241ef7 Huang Ying         2021-08-16  1268  	if (rc !=3D -EAGAIN)
02ac43a74241ef7 Huang Ying         2021-08-16  1269  		list_move_tail(&page=
->lru, ret);
02ac43a74241ef7 Huang Ying         2021-08-16  1270  =

02ac43a74241ef7 Huang Ying         2021-08-16  1271  	if (put_new_page)
02ac43a74241ef7 Huang Ying         2021-08-16  1272  		put_new_page(newpage=
, private);
02ac43a74241ef7 Huang Ying         2021-08-16  1273  	else
02ac43a74241ef7 Huang Ying         2021-08-16  1274  		put_page(newpage);
02ac43a74241ef7 Huang Ying         2021-08-16  1275  =

02ac43a74241ef7 Huang Ying         2021-08-16  1276  	return rc;
02ac43a74241ef7 Huang Ying         2021-08-16  1277  }
02ac43a74241ef7 Huang Ying         2021-08-16  1278  =


:::::: The code at line 1251 was first introduced by commit
:::::: 8f16510e9b49b9822f08eb95892fffa2dd9b2910 memory tiering: measure whe=
ther demoted pages are hot

:::::: TO: Huang Ying <ying.huang@intel.com>
:::::: CC: Huang Ying <ying.huang@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2826015487755139558==--

