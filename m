Content-Type: multipart/mixed; boundary="===============7360813983396485358=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9601 mlxsw_sp_rif_vlan_configure() error: uninitialized symbol 'mac_profile'.
Date: Sun, 14 Aug 2022 15:35:46 +0800
Message-ID: <202208141513.9JvHsm8O-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7360813983396485358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Amit Cohen <amcohen@nvidia.com>
CC: Petr Machata <petrm@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: 662761d8987dc232e85fc35b529f80e01fd4fc71 mlxsw: Add support for VLA=
N RIFs
date:   6 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 weeks ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220814/202208141513.9JvHsm8O-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9601 mlxsw_sp_rif_vla=
n_configure() error: uninitialized symbol 'mac_profile'.

Old smatch warnings:
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:8462 mlxsw_sp_rif_mac=
_profile_replace() error: uninitialized symbol 'mac_profile'.
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9346 mlxsw_sp_rif_sub=
port_configure() error: uninitialized symbol 'mac_profile'.
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9433 mlxsw_sp_rif_fid=
_configure() error: uninitialized symbol 'mac_profile'.

vim +/mac_profile +9601 drivers/net/ethernet/mellanox/mlxsw/spectrum_router=
.c

662761d8987dc23 Amit Cohen 2022-07-04  9588  =

662761d8987dc23 Amit Cohen 2022-07-04  9589  static int mlxsw_sp_rif_vlan_c=
onfigure(struct mlxsw_sp_rif *rif, u16 efid,
662761d8987dc23 Amit Cohen 2022-07-04  9590  				       struct netlink_ext_=
ack *extack)
662761d8987dc23 Amit Cohen 2022-07-04  9591  {
662761d8987dc23 Amit Cohen 2022-07-04  9592  	u16 vid =3D mlxsw_sp_fid_8021=
q_vid(rif->fid);
662761d8987dc23 Amit Cohen 2022-07-04  9593  	struct mlxsw_sp *mlxsw_sp =3D=
 rif->mlxsw_sp;
662761d8987dc23 Amit Cohen 2022-07-04  9594  	u8 mac_profile;
662761d8987dc23 Amit Cohen 2022-07-04  9595  	int err;
662761d8987dc23 Amit Cohen 2022-07-04  9596  =

662761d8987dc23 Amit Cohen 2022-07-04  9597  	err =3D mlxsw_sp_rif_mac_prof=
ile_get(mlxsw_sp, rif->addr,
662761d8987dc23 Amit Cohen 2022-07-04  9598  					   &mac_profile, extack);
662761d8987dc23 Amit Cohen 2022-07-04  9599  	if (err)
662761d8987dc23 Amit Cohen 2022-07-04  9600  		return err;
662761d8987dc23 Amit Cohen 2022-07-04 @9601  	rif->mac_profile_id =3D mac_p=
rofile;
662761d8987dc23 Amit Cohen 2022-07-04  9602  =

662761d8987dc23 Amit Cohen 2022-07-04  9603  	err =3D mlxsw_sp_rif_vlan_op(=
rif, vid, efid, true);
662761d8987dc23 Amit Cohen 2022-07-04  9604  	if (err)
662761d8987dc23 Amit Cohen 2022-07-04  9605  		goto err_rif_vlan_fid_op;
662761d8987dc23 Amit Cohen 2022-07-04  9606  =

662761d8987dc23 Amit Cohen 2022-07-04  9607  	err =3D mlxsw_sp_fid_flood_se=
t(rif->fid, MLXSW_SP_FLOOD_TYPE_MC,
662761d8987dc23 Amit Cohen 2022-07-04  9608  				     mlxsw_sp_router_port(=
mlxsw_sp), true);
662761d8987dc23 Amit Cohen 2022-07-04  9609  	if (err)
662761d8987dc23 Amit Cohen 2022-07-04  9610  		goto err_fid_mc_flood_set;
662761d8987dc23 Amit Cohen 2022-07-04  9611  =

662761d8987dc23 Amit Cohen 2022-07-04  9612  	err =3D mlxsw_sp_fid_flood_se=
t(rif->fid, MLXSW_SP_FLOOD_TYPE_BC,
662761d8987dc23 Amit Cohen 2022-07-04  9613  				     mlxsw_sp_router_port(=
mlxsw_sp), true);
662761d8987dc23 Amit Cohen 2022-07-04  9614  	if (err)
662761d8987dc23 Amit Cohen 2022-07-04  9615  		goto err_fid_bc_flood_set;
662761d8987dc23 Amit Cohen 2022-07-04  9616  =

662761d8987dc23 Amit Cohen 2022-07-04  9617  	err =3D mlxsw_sp_rif_fdb_op(r=
if->mlxsw_sp, rif->dev->dev_addr,
662761d8987dc23 Amit Cohen 2022-07-04  9618  				  mlxsw_sp_fid_index(rif->=
fid), true);
662761d8987dc23 Amit Cohen 2022-07-04  9619  	if (err)
662761d8987dc23 Amit Cohen 2022-07-04  9620  		goto err_rif_fdb_op;
662761d8987dc23 Amit Cohen 2022-07-04  9621  =

662761d8987dc23 Amit Cohen 2022-07-04  9622  	err =3D mlxsw_sp_fid_rif_set(=
rif->fid, rif);
662761d8987dc23 Amit Cohen 2022-07-04  9623  	if (err)
662761d8987dc23 Amit Cohen 2022-07-04  9624  		goto err_fid_rif_set;
662761d8987dc23 Amit Cohen 2022-07-04  9625  =

662761d8987dc23 Amit Cohen 2022-07-04  9626  	return 0;
662761d8987dc23 Amit Cohen 2022-07-04  9627  =

662761d8987dc23 Amit Cohen 2022-07-04  9628  err_fid_rif_set:
662761d8987dc23 Amit Cohen 2022-07-04  9629  	mlxsw_sp_rif_fdb_op(rif->mlxs=
w_sp, rif->dev->dev_addr,
662761d8987dc23 Amit Cohen 2022-07-04  9630  			    mlxsw_sp_fid_index(rif-=
>fid), false);
662761d8987dc23 Amit Cohen 2022-07-04  9631  err_rif_fdb_op:
662761d8987dc23 Amit Cohen 2022-07-04  9632  	mlxsw_sp_fid_flood_set(rif->f=
id, MLXSW_SP_FLOOD_TYPE_BC,
662761d8987dc23 Amit Cohen 2022-07-04  9633  			       mlxsw_sp_router_port=
(mlxsw_sp), false);
662761d8987dc23 Amit Cohen 2022-07-04  9634  err_fid_bc_flood_set:
662761d8987dc23 Amit Cohen 2022-07-04  9635  	mlxsw_sp_fid_flood_set(rif->f=
id, MLXSW_SP_FLOOD_TYPE_MC,
662761d8987dc23 Amit Cohen 2022-07-04  9636  			       mlxsw_sp_router_port=
(mlxsw_sp), false);
662761d8987dc23 Amit Cohen 2022-07-04  9637  err_fid_mc_flood_set:
662761d8987dc23 Amit Cohen 2022-07-04  9638  	mlxsw_sp_rif_vlan_op(rif, vid=
, 0, false);
662761d8987dc23 Amit Cohen 2022-07-04  9639  err_rif_vlan_fid_op:
662761d8987dc23 Amit Cohen 2022-07-04  9640  	mlxsw_sp_rif_mac_profile_put(=
mlxsw_sp, mac_profile);
662761d8987dc23 Amit Cohen 2022-07-04  9641  	return err;
662761d8987dc23 Amit Cohen 2022-07-04  9642  }
662761d8987dc23 Amit Cohen 2022-07-04  9643  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7360813983396485358==--

