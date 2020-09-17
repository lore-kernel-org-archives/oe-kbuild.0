Content-Type: multipart/mixed; boundary="===============8004260994190066088=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:4452:9: warning: Identical condition 'err', second condition is always false
Date: Fri, 18 Sep 2020 06:57:17 +0800
Message-ID: <202009180608.499KeDaP%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8004260994190066088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ido Schimmel <idosch@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4cbffc461ec91287c4cb1d0e27b01b988d0b8fba
commit: ee5a0448e72b0857260e04f68126b2bfa27c154e mlxsw: spectrum_router: Se=
t hardware flags for routes
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:4452:9: warning: I=
dentical condition 'err', second condition is always false [identicalCondit=
ionAfterEarlyExit]
    return err;
           ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:4447:6: note: firs=
t condition
    if (err)
        ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:4452:9: note: seco=
nd condition
    return err;
           ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dee5a0448e72b0857260e04f68126b2bfa27c154e
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout ee5a0448e72b0857260e04f68126b2bfa27c154e
vim +/err +4452 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c

61c503f976b5449 Jiri Pirko   2016-07-04  4440  =

61c503f976b5449 Jiri Pirko   2016-07-04  4441  static int mlxsw_sp_fib_entr=
y_op(struct mlxsw_sp *mlxsw_sp,
61c503f976b5449 Jiri Pirko   2016-07-04  4442  				 struct mlxsw_sp_fib_ent=
ry *fib_entry,
61c503f976b5449 Jiri Pirko   2016-07-04  4443  				 enum mlxsw_reg_ralue_op=
 op)
61c503f976b5449 Jiri Pirko   2016-07-04  4444  {
9dbf4d76d07d3b5 Ido Schimmel 2017-07-18  4445  	int err =3D __mlxsw_sp_fib_=
entry_op(mlxsw_sp, fib_entry, op);
013b20f953ab011 Ido Schimmel 2017-02-08  4446  =

ee5a0448e72b085 Ido Schimmel 2020-01-14  4447  	if (err)
ee5a0448e72b085 Ido Schimmel 2020-01-14  4448  		return err;
ee5a0448e72b085 Ido Schimmel 2020-01-14  4449  =

ee5a0448e72b085 Ido Schimmel 2020-01-14  4450  	mlxsw_sp_fib_entry_hw_flags=
_refresh(mlxsw_sp, fib_entry, op);
9dbf4d76d07d3b5 Ido Schimmel 2017-07-18  4451  =

013b20f953ab011 Ido Schimmel 2017-02-08 @4452  	return err;
61c503f976b5449 Jiri Pirko   2016-07-04  4453  }
61c503f976b5449 Jiri Pirko   2016-07-04  4454  =


:::::: The code at line 4452 was first introduced by commit
:::::: 013b20f953ab011ffb5d203a07b981bad16342f4 mlxsw: spectrum_router: Mor=
e accurately set offload flag

:::::: TO: Ido Schimmel <idosch@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8004260994190066088==--

