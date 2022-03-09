Content-Type: multipart/mixed; boundary="===============8607975873774147580=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/erofs/zmap.c:394 z_erofs_get_extent_compressedlen() warn: should '1 << lclusterbits' be a 64 bit type?
Date: Wed, 09 Mar 2022 10:24:26 +0800
Message-ID: <202203091002.lJVzsX6e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8607975873774147580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gao Xiang <hsiangkao@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   92f90cc9fe0e7a984ea3d4bf3d120e30ba8a2118
commit: cec6e93beadfd145758af2c0854fcc2abb8170cb erofs: support parsing big=
 pcluster compress indexes
date:   11 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-m021-20220307 (https://download.01.org/0day-ci/arch=
ive/20220309/202203091002.lJVzsX6e-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/erofs/zmap.c:394 z_erofs_get_extent_compressedlen() warn: should '1 << l=
clusterbits' be a 64 bit type?
fs/erofs/zmap.c:423 z_erofs_get_extent_compressedlen() warn: should 'm->com=
pressedlcs << lclusterbits' be a 64 bit type?

vim +394 fs/erofs/zmap.c

152a333a589560 drivers/staging/erofs/zmap.c Gao Xiang 2019-06-24  380  =

cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  381  stat=
ic int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  382  				=
	    unsigned int initial_lcn)
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  383  {
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  384  	str=
uct erofs_inode *const vi =3D EROFS_I(m->inode);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  385  	str=
uct erofs_map_blocks *const map =3D m->map;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  386  	con=
st unsigned int lclusterbits =3D vi->z_logical_clusterbits;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  387  	uns=
igned long lcn;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  388  	int=
 err;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  389  =

cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  390  	DBG=
_BUGON(m->type !=3D Z_EROFS_VLE_CLUSTER_TYPE_PLAIN &&
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  391  		  =
m->type !=3D Z_EROFS_VLE_CLUSTER_TYPE_HEAD);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  392  	if =
(!(map->m_flags & EROFS_MAP_ZIPPED) ||
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  393  	   =
 !(vi->z_advise & Z_EROFS_ADVISE_BIG_PCLUSTER_1)) {
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07 @394  		ma=
p->m_plen =3D 1 << lclusterbits;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  395  		re=
turn 0;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  396  	}
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  397  =

cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  398  	lcn=
 =3D m->lcn + 1;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  399  	if =
(m->compressedlcs)
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  400  		go=
to out;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  401  	if =
(lcn =3D=3D initial_lcn)
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  402  		go=
to err_bonus_cblkcnt;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  403  =

cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  404  	err=
 =3D z_erofs_load_cluster_from_disk(m, lcn);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  405  	if =
(err)
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  406  		re=
turn err;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  407  =

cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  408  	swi=
tch (m->type) {
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  409  	cas=
e Z_EROFS_VLE_CLUSTER_TYPE_NONHEAD:
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  410  		if=
 (m->delta[0] !=3D 1)
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  411  			g=
oto err_bonus_cblkcnt;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  412  		if=
 (m->compressedlcs)
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  413  			b=
reak;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  414  		fa=
llthrough;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  415  	def=
ault:
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  416  		er=
ofs_err(m->inode->i_sb,
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  417  			 =
 "cannot found CBLKCNT @ lcn %lu of nid %llu",
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  418  			 =
 lcn, vi->nid);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  419  		DB=
G_BUGON(1);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  420  		re=
turn -EFSCORRUPTED;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  421  	}
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  422  out:
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07 @423  	map=
->m_plen =3D m->compressedlcs << lclusterbits;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  424  	ret=
urn 0;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  425  err_=
bonus_cblkcnt:
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  426  	ero=
fs_err(m->inode->i_sb,
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  427  		  =
"bogus CBLKCNT @ lcn %lu of nid %llu",
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  428  		  =
lcn, vi->nid);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  429  	DBG=
_BUGON(1);
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  430  	ret=
urn -EFSCORRUPTED;
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  431  }
cec6e93beadfd1 fs/erofs/zmap.c              Gao Xiang 2021-04-07  432  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8607975873774147580==--

