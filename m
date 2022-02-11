Content-Type: multipart/mixed; boundary="===============4017522740095790916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/dfs_cache.c:1382 __refresh_tcon() warn: passing a valid pointer to 'PTR_ERR'
Date: Sat, 12 Feb 2022 06:46:12 +0800
Message-ID: <202202120615.vNPjJ9hn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4017522740095790916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paulo Alcantara <pc@cjr.nz>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1baf68e1383f6ed93eb9cff2866d46562607a43
commit: c88f7dcd6d6429197fc2fd87b54a894ffcd48e8e cifs: support nested dfs l=
inks over reconnect
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-m031-20220211 (https://download.01.org/0day-ci/archi=
ve/20220212/202202120615.vNPjJ9hn-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/cifs/dfs_cache.c:1382 __refresh_tcon() warn: passing a valid pointer to =
'PTR_ERR'

Old smatch warnings:
arch/arc/include/asm/thread_info.h:65 current_thread_info() error: uninitia=
lized symbol 'sp'.
fs/cifs/dfs_cache.c:509 copy_ref_data() warn: passing a valid pointer to 'P=
TR_ERR'

vim +/PTR_ERR +1382 fs/cifs/dfs_cache.c

5072010ccf05929 Paulo Alcantara (SUSE  2019-03-19  1365) =

b62366181a5e947 Paulo Alcantara        2021-07-16  1366  /* Refresh dfs ref=
erral of tcon and mark it for reconnect if needed */
c88f7dcd6d64291 Paulo Alcantara        2021-11-03  1367  static int __refre=
sh_tcon(const char *path, struct cifs_ses **sessions, struct cifs_tcon *tco=
n,
c88f7dcd6d64291 Paulo Alcantara        2021-11-03  1368  			  bool force_re=
fresh)
b62366181a5e947 Paulo Alcantara        2021-07-16  1369  {
b62366181a5e947 Paulo Alcantara        2021-07-16  1370  	struct cifs_ses *=
ses;
1023e90b733acd1 Paulo Alcantara        2021-06-08  1371  	struct cache_entr=
y *ce;
1023e90b733acd1 Paulo Alcantara        2021-06-08  1372  	struct dfs_info3_=
param *refs =3D NULL;
1023e90b733acd1 Paulo Alcantara        2021-06-08  1373  	int numrefs =3D 0;
1023e90b733acd1 Paulo Alcantara        2021-06-08  1374  	bool needs_refres=
h =3D false;
b62366181a5e947 Paulo Alcantara        2021-07-16  1375  	struct dfs_cache_=
tgt_list tl =3D DFS_CACHE_TGT_LIST_INIT(tl);
c9f711039905910 Paulo Alcantara        2021-06-04  1376  	int rc =3D 0;
b62366181a5e947 Paulo Alcantara        2021-07-16  1377  	unsigned int xid;
1023e90b733acd1 Paulo Alcantara        2021-06-08  1378  =

c9f711039905910 Paulo Alcantara        2021-06-04  1379  	ses =3D find_ipc_=
from_server_path(sessions, path);
b62366181a5e947 Paulo Alcantara        2021-07-16  1380  	if (IS_ERR(ses)) {
b62366181a5e947 Paulo Alcantara        2021-07-16  1381  		cifs_dbg(FYI, "%=
s: could not find ipc session\n", __func__);
b62366181a5e947 Paulo Alcantara        2021-07-16 @1382  		return PTR_ERR(s=
es);
b62366181a5e947 Paulo Alcantara        2021-07-16  1383  	}
1023e90b733acd1 Paulo Alcantara        2021-06-08  1384  =

1023e90b733acd1 Paulo Alcantara        2021-06-08  1385  	down_read(&htable=
_rw_lock);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1386  	ce =3D lookup_cac=
he_entry(path);
b62366181a5e947 Paulo Alcantara        2021-07-16  1387  	needs_refresh =3D=
 force_refresh || IS_ERR(ce) || cache_entry_expired(ce);
b62366181a5e947 Paulo Alcantara        2021-07-16  1388  	if (!IS_ERR(ce)) {
b62366181a5e947 Paulo Alcantara        2021-07-16  1389  		rc =3D get_targe=
ts(ce, &tl);
b62366181a5e947 Paulo Alcantara        2021-07-16  1390  		if (rc)
b62366181a5e947 Paulo Alcantara        2021-07-16  1391  			cifs_dbg(FYI, "=
%s: could not get dfs targets: %d\n", __func__, rc);
b62366181a5e947 Paulo Alcantara        2021-07-16  1392  	}
1023e90b733acd1 Paulo Alcantara        2021-06-08  1393  	up_read(&htable_r=
w_lock);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1394  =

b62366181a5e947 Paulo Alcantara        2021-07-16  1395  	if (!needs_refres=
h) {
b62366181a5e947 Paulo Alcantara        2021-07-16  1396  		rc =3D 0;
b62366181a5e947 Paulo Alcantara        2021-07-16  1397  		goto out;
b62366181a5e947 Paulo Alcantara        2021-07-16  1398  	}
1023e90b733acd1 Paulo Alcantara        2021-06-08  1399  =

c9f711039905910 Paulo Alcantara        2021-06-04  1400  	xid =3D get_xid();
1023e90b733acd1 Paulo Alcantara        2021-06-08  1401  	rc =3D get_dfs_re=
ferral(xid, ses, path, &refs, &numrefs);
c9f711039905910 Paulo Alcantara        2021-06-04  1402  	free_xid(xid);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1403  =

1023e90b733acd1 Paulo Alcantara        2021-06-08  1404  	/* Create or upda=
te a cache entry with the new referral */
1023e90b733acd1 Paulo Alcantara        2021-06-08  1405  	if (!rc) {
b62366181a5e947 Paulo Alcantara        2021-07-16  1406  		dump_refs(refs, =
numrefs);
b62366181a5e947 Paulo Alcantara        2021-07-16  1407  =

1023e90b733acd1 Paulo Alcantara        2021-06-08  1408  		down_write(&htab=
le_rw_lock);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1409  		ce =3D lookup_ca=
che_entry(path);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1410  		if (IS_ERR(ce))
1023e90b733acd1 Paulo Alcantara        2021-06-08  1411  			add_cache_entry=
_locked(refs, numrefs);
b62366181a5e947 Paulo Alcantara        2021-07-16  1412  		else if (force_r=
efresh || cache_entry_expired(ce))
1023e90b733acd1 Paulo Alcantara        2021-06-08  1413  			update_cache_en=
try_locked(ce, refs, numrefs);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1414  		up_write(&htable=
_rw_lock);
b62366181a5e947 Paulo Alcantara        2021-07-16  1415  =

b62366181a5e947 Paulo Alcantara        2021-07-16  1416  		mark_for_reconne=
ct_if_needed(tcon, &tl, refs, numrefs);
345c1a4a9e09dc5 Paulo Alcantara (SUSE  2019-12-04  1417) 	}
1023e90b733acd1 Paulo Alcantara        2021-06-08  1418  =

b62366181a5e947 Paulo Alcantara        2021-07-16  1419  out:
b62366181a5e947 Paulo Alcantara        2021-07-16  1420  	dfs_cache_free_tg=
ts(&tl);
1023e90b733acd1 Paulo Alcantara        2021-06-08  1421  	free_dfs_info_arr=
ay(refs, numrefs);
b62366181a5e947 Paulo Alcantara        2021-07-16  1422  	return rc;
b62366181a5e947 Paulo Alcantara        2021-07-16  1423  }
b62366181a5e947 Paulo Alcantara        2021-07-16  1424  =


:::::: The code at line 1382 was first introduced by commit
:::::: b62366181a5e9473e9c10e98f400049491c55876 cifs: support share failove=
r when remounting

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4017522740095790916==--

