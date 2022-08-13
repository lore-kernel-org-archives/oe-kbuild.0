Content-Type: multipart/mixed; boundary="===============8319700492279671421=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:8506 mlxsw_sp_rif_mac_profile_replace() error: uninitialized symbol 'mac_profile'.
Date: Sat, 13 Aug 2022 12:31:21 +0800
Message-ID: <202208131218.wU4JTHix-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8319700492279671421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Danielle Ratson <danieller@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: 605d25cd782a67f0c9d871096ee04acfe14f89ca mlxsw: spectrum_router: Ad=
d RIF MAC profiles support
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-m031-20220810 (https://download.01.org/0day-ci/arch=
ive/20220813/202208131218.wU4JTHix-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:8506 mlxsw_sp_rif_mac=
_profile_replace() error: uninitialized symbol 'mac_profile'.
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9281 mlxsw_sp_rif_sub=
port_configure() error: uninitialized symbol 'mac_profile'.
drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:9363 mlxsw_sp_rif_fid=
_configure() error: uninitialized symbol 'mac_profile'.

vim +/mac_profile +8506 drivers/net/ethernet/mellanox/mlxsw/spectrum_router=
.c

605d25cd782a67 Danielle Ratson 2021-10-26  8487  =

605d25cd782a67 Danielle Ratson 2021-10-26  8488  static int
605d25cd782a67 Danielle Ratson 2021-10-26  8489  mlxsw_sp_rif_mac_profile_r=
eplace(struct mlxsw_sp *mlxsw_sp,
605d25cd782a67 Danielle Ratson 2021-10-26  8490  				 struct mlxsw_sp_rif *=
rif,
605d25cd782a67 Danielle Ratson 2021-10-26  8491  				 const char *new_mac,
605d25cd782a67 Danielle Ratson 2021-10-26  8492  				 struct netlink_ext_ac=
k *extack)
605d25cd782a67 Danielle Ratson 2021-10-26  8493  {
605d25cd782a67 Danielle Ratson 2021-10-26  8494  	u8 mac_profile;
605d25cd782a67 Danielle Ratson 2021-10-26  8495  	int err;
605d25cd782a67 Danielle Ratson 2021-10-26  8496  =

605d25cd782a67 Danielle Ratson 2021-10-26  8497  	if (!mlxsw_sp_rif_mac_pro=
file_is_shared(rif))
605d25cd782a67 Danielle Ratson 2021-10-26  8498  		return mlxsw_sp_rif_mac_=
profile_edit(rif, new_mac);
605d25cd782a67 Danielle Ratson 2021-10-26  8499  =

605d25cd782a67 Danielle Ratson 2021-10-26  8500  	err =3D mlxsw_sp_rif_mac_=
profile_get(mlxsw_sp, new_mac,
605d25cd782a67 Danielle Ratson 2021-10-26  8501  					   &mac_profile, exta=
ck);
605d25cd782a67 Danielle Ratson 2021-10-26  8502  	if (err)
605d25cd782a67 Danielle Ratson 2021-10-26  8503  		return err;
605d25cd782a67 Danielle Ratson 2021-10-26  8504  =

605d25cd782a67 Danielle Ratson 2021-10-26  8505  	mlxsw_sp_rif_mac_profile_=
put(mlxsw_sp, rif->mac_profile_id);
605d25cd782a67 Danielle Ratson 2021-10-26 @8506  	rif->mac_profile_id =3D m=
ac_profile;
605d25cd782a67 Danielle Ratson 2021-10-26  8507  	return 0;
605d25cd782a67 Danielle Ratson 2021-10-26  8508  }
605d25cd782a67 Danielle Ratson 2021-10-26  8509  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8319700492279671421==--

