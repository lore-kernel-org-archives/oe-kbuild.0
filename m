Content-Type: multipart/mixed; boundary="===============0987936208251848562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:jiri_devel_xmrouter 11/26] drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:289:55: warning: Either the condition '!fib_entry' is redundant or there is possible null pointer dereference: fib_entry.
Date: Thu, 22 Oct 2020 03:01:55 +0800
Message-ID: <202010220348.IFLKyJob-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0987936208251848562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw jiri_devel_xmrouter
head:   c452ac0a6496122cc1fcd4f54e3fca1631ac6427
commit: a85ae9826ed2a51277b63beae8413410db09ddae [11/26] mlxsw: spectrum_ro=
uter_xm: Implement L-value tracking for M-index
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:289:55: warning=
: Either the condition '!fib_entry' is redundant or there is possible null =
pointer dereference: fib_entry. [nullPointerRedundantCheck]
    struct mlxsw_sp_router_xm_ltable_node *ltable_node =3D fib_entry->ltabl=
e_node;
                                                         ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:293:6: note: As=
suming that condition '!fib_entry' is not redundant
    if (!fib_entry || !fib_entry->ltable_node)
        ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:289:55: note: N=
ull pointer dereference
    struct mlxsw_sp_router_xm_ltable_node *ltable_node =3D fib_entry->ltabl=
e_node;
                                                         ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:291:14: warning=
: Either the condition '!fib_entry' is redundant or there is possible null =
pointer dereference: fib_entry. [nullPointerRedundantCheck]
    u8 lvalue =3D fib_entry->lvalue;
                ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:293:6: note: As=
suming that condition '!fib_entry' is not redundant
    if (!fib_entry || !fib_entry->ltable_node)
        ^
   drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c:291:14: note: N=
ull pointer dereference
    u8 lvalue =3D fib_entry->lvalue;
                ^

vim +289 drivers/net/ethernet/mellanox/mlxsw/spectrum_router_xm.c

a85ae9826ed2a51 Jiri Pirko 2020-07-17  285  =

a85ae9826ed2a51 Jiri Pirko 2020-07-17  286  static void mlxsw_sp_router_xm_=
ml_entry_del(struct mlxsw_sp *mlxsw_sp,
a85ae9826ed2a51 Jiri Pirko 2020-07-17  287  					    struct mlxsw_sp_router=
_xm_fib_entry *fib_entry)
a85ae9826ed2a51 Jiri Pirko 2020-07-17  288  {
a85ae9826ed2a51 Jiri Pirko 2020-07-17 @289  	struct mlxsw_sp_router_xm_ltab=
le_node *ltable_node =3D fib_entry->ltable_node;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  290  	struct mlxsw_sp_router_xm *rou=
ter_xm =3D mlxsw_sp->router->xm;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  291  	u8 lvalue =3D fib_entry->lvalu=
e;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  292  =

a85ae9826ed2a51 Jiri Pirko 2020-07-17  293  	if (!fib_entry || !fib_entry->=
ltable_node)
a85ae9826ed2a51 Jiri Pirko 2020-07-17  294  		return;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  295  =

a85ae9826ed2a51 Jiri Pirko 2020-07-17  296  	ltable_node->lvalue_ref[lvalue=
]--;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  297  	if (lvalue =3D=3D ltable_node-=
>current_lvalue && lvalue &&
a85ae9826ed2a51 Jiri Pirko 2020-07-17  298  	    !ltable_node->lvalue_ref[l=
value]) {
a85ae9826ed2a51 Jiri Pirko 2020-07-17  299  		u8 new_lvalue =3D lvalue - 1;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  300  =

a85ae9826ed2a51 Jiri Pirko 2020-07-17  301  		/* Find the biggest L-value l=
eft out there. */
a85ae9826ed2a51 Jiri Pirko 2020-07-17  302  		while (new_lvalue > 0 && !lta=
ble_node->lvalue_ref[lvalue])
a85ae9826ed2a51 Jiri Pirko 2020-07-17  303  			new_lvalue--;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  304  =

a85ae9826ed2a51 Jiri Pirko 2020-07-17  305  		ltable_node->current_lvalue =
=3D new_lvalue;
a85ae9826ed2a51 Jiri Pirko 2020-07-17  306  		mlxsw_sp_router_xm_ltable_lva=
lue_set(mlxsw_sp, ltable_node);
a85ae9826ed2a51 Jiri Pirko 2020-07-17  307  	}
a85ae9826ed2a51 Jiri Pirko 2020-07-17  308  =

a85ae9826ed2a51 Jiri Pirko 2020-07-17  309  	mlxsw_sp_router_xm_ltable_node=
_put(router_xm, ltable_node);
a85ae9826ed2a51 Jiri Pirko 2020-07-17  310  }
a85ae9826ed2a51 Jiri Pirko 2020-07-17  311  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0987936208251848562==--

