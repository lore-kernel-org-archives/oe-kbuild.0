Content-Type: multipart/mixed; boundary="===============6402106979624851642=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2370:4: warning: Assignment of function parameter has no effect outside the function.
Date: Fri, 04 Sep 2020 16:04:30 +0800
Message-ID: <202009041627.sxIwwm8i%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6402106979624851642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Paul Blakey <paulb@mellanox.com>
CC: Saeed Mahameed <saeedm@mellanox.com>
CC: Mark Bloch <markb@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   59126901f200f5fc907153468b03c64e0081b6e6
commit: 34b13cb3eaa5ad205f4497da6420262da4940b9e net/mlx5: Accumulate level=
s for chains prio namespaces
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   In file included from drivers/net/ethernet/mellanox/mlx5/core/main.c:
>> drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h:59:27: warning: Boolean=
 result is used in bitwise operation. Clarify expression with parentheses. =
[clarifyCondition]
    return ((eqe->owner & 1) ^ !!(eq->cons_index & eq->nent)) ? NULL : eqe;
                             ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:527:6: warning: Variable =
'err' is reassigned a value before the old one has been used. [redundantAss=
ignment]
    err =3D mlx5_core_get_caps(dev, MLX5_CAP_GENERAL);
        ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:519:0: note: Variable 'er=
r' is reassigned a value before the old one has been used.
    int err =3D -ENOMEM;
   ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:527:6: note: Variable 'er=
r' is reassigned a value before the old one has been used.
    err =3D mlx5_core_get_caps(dev, MLX5_CAP_GENERAL);
        ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:421:8: warning: Local var=
iable set_hca_cap shadows outer function [shadowFunction]
    void *set_hca_cap;
          ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:588:12: note: Shadowed de=
claration
   static int set_hca_cap(struct mlx5_core_dev *dev)
              ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:421:8: note: Shadow varia=
ble
    void *set_hca_cap;
          ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:459:8: warning: Local var=
iable set_hca_cap shadows outer function [shadowFunction]
    void *set_hca_cap;
          ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:588:12: note: Shadowed de=
claration
   static int set_hca_cap(struct mlx5_core_dev *dev)
              ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:459:8: note: Shadow varia=
ble
    void *set_hca_cap;
          ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:521:8: warning: Local var=
iable set_hca_cap shadows outer function [shadowFunction]
    void *set_hca_cap;
          ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:588:12: note: Shadowed de=
claration
   static int set_hca_cap(struct mlx5_core_dev *dev)
              ^
   drivers/net/ethernet/mellanox/mlx5/core/main.c:521:8: note: Shadow varia=
ble
    void *set_hca_cap;
          ^
>> drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h:59:27: warning: Boolean=
 result is used in bitwise operation. Clarify expression with parentheses. =
[clarifyCondition]
    return ((eqe->owner & 1) ^ !!(eq->cons_index & eq->nent)) ? NULL : eqe;
                             ^
>> drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:2370:4: warning: Assig=
nment of function parameter has no effect outside the function. [uselessAss=
ignmentArg]
      acc_level =3D acc_level_ns;
      ^
>> drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1244:26: warning: Eith=
er the condition 'if(dest&&dest[i].type!=3DMLX5_FLOW_DESTINATION_TYPE_FLOW_=
TABLE)' is redundant or there is pointer arithmetic with NULL pointer. [nul=
lPointerArithmeticRedundantCheck]
     rule =3D alloc_rule(dest + i);
                            ^
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1252:6: note: Assuming=
 that condition 'if(dest&&dest[i].type!=3DMLX5_FLOW_DESTINATION_TYPE_FLOW_T=
ABLE)' is not redundant
     if (dest &&
        ^
   drivers/net/ethernet/mellanox/mlx5/core/fs_core.c:1244:26: note: Null po=
inter addition
     rule =3D alloc_rule(dest + i);
                            ^
>> drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h:59:27: warning: Boolean=
 result is used in bitwise operation. Clarify expression with parentheses. =
[clarifyCondition]
    return ((eqe->owner & 1) ^ !!(eq->cons_index & eq->nent)) ? NULL : eqe;
                             ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D34b13cb3eaa5ad205f4497da6420262da4940b9e
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 34b13cb3eaa5ad205f4497da6420262da4940b9e
vim +2370 drivers/net/ethernet/mellanox/mlx5/core/fs_core.c

655227edae4ca42 Maor Gottlieb 2016-01-11  2355  =

655227edae4ca42 Maor Gottlieb 2016-01-11  2356  static void set_prio_attrs_=
in_prio(struct fs_prio *prio, int acc_level)
655227edae4ca42 Maor Gottlieb 2016-01-11  2357  {
655227edae4ca42 Maor Gottlieb 2016-01-11  2358  	struct mlx5_flow_namespace=
 *ns;
655227edae4ca42 Maor Gottlieb 2016-01-11  2359  	int acc_level_ns =3D acc_l=
evel;
655227edae4ca42 Maor Gottlieb 2016-01-11  2360  =

655227edae4ca42 Maor Gottlieb 2016-01-11  2361  	prio->start_level =3D acc_=
level;
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2362  	fs_for_each_ns(ns, prio) {
a257b94a18f7eb6 Maor Gottlieb 2016-04-29  2363  		/* This updates start_lev=
el and num_levels of ns's priority descendants */
655227edae4ca42 Maor Gottlieb 2016-01-11  2364  		acc_level_ns =3D set_prio=
_attrs_in_ns(ns, acc_level);
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2365  =

34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2366  		/* If this a prio with ch=
ains, and we can jump from one chain
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2367  		 * (namepsace) to another=
, so we accumulate the levels
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2368  		 */
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2369  		if (prio->node.type =3D=
=3D FS_TYPE_PRIO_CHAINS)
34b13cb3eaa5ad2 Paul Blakey   2019-11-12 @2370  			acc_level =3D acc_level_=
ns;
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2371  	}
34b13cb3eaa5ad2 Paul Blakey   2019-11-12  2372  =

a257b94a18f7eb6 Maor Gottlieb 2016-04-29  2373  	if (!prio->num_levels)
a257b94a18f7eb6 Maor Gottlieb 2016-04-29  2374  		prio->num_levels =3D acc_=
level_ns - prio->start_level;
a257b94a18f7eb6 Maor Gottlieb 2016-04-29  2375  	WARN_ON(prio->num_levels <=
 acc_level_ns - prio->start_level);
655227edae4ca42 Maor Gottlieb 2016-01-11  2376  }
655227edae4ca42 Maor Gottlieb 2016-01-11  2377  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6402106979624851642==--

