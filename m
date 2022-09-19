Content-Type: multipart/mixed; boundary="===============5073864452530266301=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/dfs_cache.c:1382 __refresh_tcon() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 19 Sep 2022 10:45:54 +0800
Message-ID: <202209191006.aMlXMZTV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5073864452530266301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paulo Alcantara <pc@cjr.nz>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   521a547ced6477c54b4b0cc206000406c221b4d6
commit: c88f7dcd6d6429197fc2fd87b54a894ffcd48e8e cifs: support nested dfs l=
inks over reconnect
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: csky-randconfig-m041-20220918 (https://download.01.org/0day-ci/arch=
ive/20220919/202209191006.aMlXMZTV-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/cifs/dfs_cache.c:1382 __refresh_tcon() warn: passing a valid pointer to =
'PTR_ERR'

Old smatch warnings:
arch/csky/include/asm/uaccess.h:202 __get_user_fn() error: uninitialized sy=
mbol 'retval'.
fs/cifs/dfs_cache.c:509 copy_ref_data() warn: passing a valid pointer to 'P=
TR_ERR'

vim +/PTR_ERR +1382 fs/cifs/dfs_cache.c

5072010ccf0592 Paulo Alcantara (SUSE  2019-03-19  1365) =

b62366181a5e94 Paulo Alcantara        2021-07-16  1366  /* Refresh dfs refe=
rral of tcon and mark it for reconnect if needed */
c88f7dcd6d6429 Paulo Alcantara        2021-11-03  1367  static int __refres=
h_tcon(const char *path, struct cifs_ses **sessions, struct cifs_tcon *tcon,
c88f7dcd6d6429 Paulo Alcantara        2021-11-03  1368  			  bool force_ref=
resh)
b62366181a5e94 Paulo Alcantara        2021-07-16  1369  {
b62366181a5e94 Paulo Alcantara        2021-07-16  1370  	struct cifs_ses *s=
es;
1023e90b733acd Paulo Alcantara        2021-06-08  1371  	struct cache_entry=
 *ce;
1023e90b733acd Paulo Alcantara        2021-06-08  1372  	struct dfs_info3_p=
aram *refs =3D NULL;
1023e90b733acd Paulo Alcantara        2021-06-08  1373  	int numrefs =3D 0;
1023e90b733acd Paulo Alcantara        2021-06-08  1374  	bool needs_refresh=
 =3D false;
b62366181a5e94 Paulo Alcantara        2021-07-16  1375  	struct dfs_cache_t=
gt_list tl =3D DFS_CACHE_TGT_LIST_INIT(tl);
c9f71103990591 Paulo Alcantara        2021-06-04  1376  	int rc =3D 0;
b62366181a5e94 Paulo Alcantara        2021-07-16  1377  	unsigned int xid;
1023e90b733acd Paulo Alcantara        2021-06-08  1378  =

c9f71103990591 Paulo Alcantara        2021-06-04  1379  	ses =3D find_ipc_f=
rom_server_path(sessions, path);
b62366181a5e94 Paulo Alcantara        2021-07-16  1380  	if (IS_ERR(ses)) {
b62366181a5e94 Paulo Alcantara        2021-07-16  1381  		cifs_dbg(FYI, "%s=
: could not find ipc session\n", __func__);
b62366181a5e94 Paulo Alcantara        2021-07-16 @1382  		return PTR_ERR(se=
s);
b62366181a5e94 Paulo Alcantara        2021-07-16  1383  	}
1023e90b733acd Paulo Alcantara        2021-06-08  1384  =

1023e90b733acd Paulo Alcantara        2021-06-08  1385  	down_read(&htable_=
rw_lock);
1023e90b733acd Paulo Alcantara        2021-06-08  1386  	ce =3D lookup_cach=
e_entry(path);
b62366181a5e94 Paulo Alcantara        2021-07-16  1387  	needs_refresh =3D =
force_refresh || IS_ERR(ce) || cache_entry_expired(ce);
b62366181a5e94 Paulo Alcantara        2021-07-16  1388  	if (!IS_ERR(ce)) {
b62366181a5e94 Paulo Alcantara        2021-07-16  1389  		rc =3D get_target=
s(ce, &tl);
b62366181a5e94 Paulo Alcantara        2021-07-16  1390  		if (rc)
b62366181a5e94 Paulo Alcantara        2021-07-16  1391  			cifs_dbg(FYI, "%=
s: could not get dfs targets: %d\n", __func__, rc);
b62366181a5e94 Paulo Alcantara        2021-07-16  1392  	}
1023e90b733acd Paulo Alcantara        2021-06-08  1393  	up_read(&htable_rw=
_lock);
1023e90b733acd Paulo Alcantara        2021-06-08  1394  =

b62366181a5e94 Paulo Alcantara        2021-07-16  1395  	if (!needs_refresh=
) {
b62366181a5e94 Paulo Alcantara        2021-07-16  1396  		rc =3D 0;
b62366181a5e94 Paulo Alcantara        2021-07-16  1397  		goto out;
b62366181a5e94 Paulo Alcantara        2021-07-16  1398  	}
1023e90b733acd Paulo Alcantara        2021-06-08  1399  =

c9f71103990591 Paulo Alcantara        2021-06-04  1400  	xid =3D get_xid();
1023e90b733acd Paulo Alcantara        2021-06-08  1401  	rc =3D get_dfs_ref=
erral(xid, ses, path, &refs, &numrefs);
c9f71103990591 Paulo Alcantara        2021-06-04  1402  	free_xid(xid);
1023e90b733acd Paulo Alcantara        2021-06-08  1403  =

1023e90b733acd Paulo Alcantara        2021-06-08  1404  	/* Create or updat=
e a cache entry with the new referral */
1023e90b733acd Paulo Alcantara        2021-06-08  1405  	if (!rc) {
b62366181a5e94 Paulo Alcantara        2021-07-16  1406  		dump_refs(refs, n=
umrefs);
b62366181a5e94 Paulo Alcantara        2021-07-16  1407  =

1023e90b733acd Paulo Alcantara        2021-06-08  1408  		down_write(&htabl=
e_rw_lock);
1023e90b733acd Paulo Alcantara        2021-06-08  1409  		ce =3D lookup_cac=
he_entry(path);
1023e90b733acd Paulo Alcantara        2021-06-08  1410  		if (IS_ERR(ce))
1023e90b733acd Paulo Alcantara        2021-06-08  1411  			add_cache_entry_=
locked(refs, numrefs);
b62366181a5e94 Paulo Alcantara        2021-07-16  1412  		else if (force_re=
fresh || cache_entry_expired(ce))
1023e90b733acd Paulo Alcantara        2021-06-08  1413  			update_cache_ent=
ry_locked(ce, refs, numrefs);
1023e90b733acd Paulo Alcantara        2021-06-08  1414  		up_write(&htable_=
rw_lock);
b62366181a5e94 Paulo Alcantara        2021-07-16  1415  =

b62366181a5e94 Paulo Alcantara        2021-07-16  1416  		mark_for_reconnec=
t_if_needed(tcon, &tl, refs, numrefs);
345c1a4a9e09dc Paulo Alcantara (SUSE  2019-12-04  1417) 	}
1023e90b733acd Paulo Alcantara        2021-06-08  1418  =

b62366181a5e94 Paulo Alcantara        2021-07-16  1419  out:
b62366181a5e94 Paulo Alcantara        2021-07-16  1420  	dfs_cache_free_tgt=
s(&tl);
1023e90b733acd Paulo Alcantara        2021-06-08  1421  	free_dfs_info_arra=
y(refs, numrefs);
b62366181a5e94 Paulo Alcantara        2021-07-16  1422  	return rc;
b62366181a5e94 Paulo Alcantara        2021-07-16  1423  }
b62366181a5e94 Paulo Alcantara        2021-07-16  1424  =


:::::: The code at line 1382 was first introduced by commit
:::::: b62366181a5e9473e9c10e98f400049491c55876 cifs: support share failove=
r when remounting

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5073864452530266301==--

