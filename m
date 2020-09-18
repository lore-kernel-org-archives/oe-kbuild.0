Content-Type: multipart/mixed; boundary="===============7479602491533892211=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:jiri_devel_xmrouter 35/41] drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:278:55: warning: Either the condition '!fib_entry' is redundant or there is possible null pointer dereference: fib_entry.
Date: Fri, 18 Sep 2020 11:58:01 +0800
Message-ID: <202009181155.rytImhh9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7479602491533892211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_xmrouter
head:   a95f3d521b1e9bbc77c40307be176fd19ea723dd
commit: e474e0427362f198d903b58664e4fabb533cd5e6 [35/41] mlxsw: spectrum_ro=
uter_xm: Implement L-value tracking for M-index
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:278:55: warning=
: Either the condition '!fib_entry' is redundant or there is possible null =
pointer dereference: fib_entry. [nullPointerRedundantCheck]
    struct mlxsw_sp_router_xm_ltable_node *ltable_node =3D fib_entry->ltabl=
e_node;
                                                         ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:282:6: note: As=
suming that condition '!fib_entry' is not redundant
    if (!fib_entry || !fib_entry->ltable_node)
        ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:278:55: note: N=
ull pointer dereference
    struct mlxsw_sp_router_xm_ltable_node *ltable_node =3D fib_entry->ltabl=
e_node;
                                                         ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:280:14: warning=
: Either the condition '!fib_entry' is redundant or there is possible null =
pointer dereference: fib_entry. [nullPointerRedundantCheck]
    u8 lvalue =3D fib_entry->lvalue;
                ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:282:6: note: As=
suming that condition '!fib_entry' is not redundant
    if (!fib_entry || !fib_entry->ltable_node)
        ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:280:14: note: N=
ull pointer dereference
    u8 lvalue =3D fib_entry->lvalue;
                ^

# https://github.com/jpirko/linux_mlxsw/commit/e474e0427362f198d903b58664e4=
fabb533cd5e6
git remote add jpirko-mlxsw https://github.com/jpirko/linux_mlxsw
git fetch --no-tags jpirko-mlxsw jiri_devel_xmrouter
git checkout e474e0427362f198d903b58664e4fabb533cd5e6
vim +278 drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c

e474e0427362f19 Jiri Pirko 2020-07-17  274  =

e474e0427362f19 Jiri Pirko 2020-07-17  275  static void mlxsw_sp_router_xm_=
ml_entry_del(struct mlxsw_sp *mlxsw_sp,
e474e0427362f19 Jiri Pirko 2020-07-17  276  					    struct mlxsw_sp_router=
_xm_fib_entry *fib_entry)
e474e0427362f19 Jiri Pirko 2020-07-17  277  {
e474e0427362f19 Jiri Pirko 2020-07-17 @278  	struct mlxsw_sp_router_xm_ltab=
le_node *ltable_node =3D fib_entry->ltable_node;
e474e0427362f19 Jiri Pirko 2020-07-17  279  	struct mlxsw_sp_router_xm *rou=
ter_xm =3D mlxsw_sp->router->xm;
e474e0427362f19 Jiri Pirko 2020-07-17  280  	u8 lvalue =3D fib_entry->lvalu=
e;
e474e0427362f19 Jiri Pirko 2020-07-17  281  =

e474e0427362f19 Jiri Pirko 2020-07-17  282  	if (!fib_entry || !fib_entry->=
ltable_node)
e474e0427362f19 Jiri Pirko 2020-07-17  283  		return;
e474e0427362f19 Jiri Pirko 2020-07-17  284  =

e474e0427362f19 Jiri Pirko 2020-07-17  285  	ltable_node->lvalue_ref[lvalue=
]--;
e474e0427362f19 Jiri Pirko 2020-07-17  286  	if (lvalue =3D=3D ltable_node-=
>current_lvalue && lvalue &&
e474e0427362f19 Jiri Pirko 2020-07-17  287  	    !ltable_node->lvalue_ref[l=
value]) {
e474e0427362f19 Jiri Pirko 2020-07-17  288  		u8 new_lvalue =3D lvalue - 1;
e474e0427362f19 Jiri Pirko 2020-07-17  289  =

e474e0427362f19 Jiri Pirko 2020-07-17  290  		/* Find the biggest L-value l=
eft out there. */
e474e0427362f19 Jiri Pirko 2020-07-17  291  		while (new_lvalue > 0 && !lta=
ble_node->lvalue_ref[lvalue])
e474e0427362f19 Jiri Pirko 2020-07-17  292  			new_lvalue--;
e474e0427362f19 Jiri Pirko 2020-07-17  293  =

e474e0427362f19 Jiri Pirko 2020-07-17  294  		ltable_node->current_lvalue =
=3D new_lvalue;
e474e0427362f19 Jiri Pirko 2020-07-17  295  		mlxsw_sp_router_xm_ltable_lva=
lue_set(mlxsw_sp, ltable_node);
e474e0427362f19 Jiri Pirko 2020-07-17  296  	}
e474e0427362f19 Jiri Pirko 2020-07-17  297  =

e474e0427362f19 Jiri Pirko 2020-07-17  298  	mlxsw_sp_router_xm_ltable_node=
_put(router_xm, ltable_node);
e474e0427362f19 Jiri Pirko 2020-07-17  299  }
e474e0427362f19 Jiri Pirko 2020-07-17  300  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7479602491533892211==--

