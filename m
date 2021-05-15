Content-Type: multipart/mixed; boundary="===============6736899380248369442=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:3598 mlxsw_sp_nexthop_group_refresh() warn: missing error code 'err'
Date: Sat, 15 May 2021 19:53:43 +0300
Message-ID: <20210515165343.GI1922@kadam>
In-Reply-To: <YJ/tWBNKXrobK9RU@shredder>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6736899380248369442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 15, 2021 at 06:48:40PM +0300, Ido Schimmel wrote:
> On Fri, May 14, 2021 at 05:35:00PM +0300, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git  master
> > head:   315d99318179b9cd5077ccc9f7f26a164c9fa998
> > commit: e3ddfb45bacdc623eedea7f7bf9e7879257471d6 mlxsw: spectrum_router=
: Allow returning errors from mlxsw_sp_nexthop_group_refresh()
> > config: x86_64-randconfig-m031-20210514 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c:3598 mlxsw_sp_nex=
thop_group_refresh() warn: missing error code 'err'
> > =

> > vim +/err +3598 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
> > =

> > e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3555  static int
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3556  mlxsw_sp_nexthop_gr=
oup_refresh(struct mlxsw_sp *mlxsw_sp,
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3557  			       struct ml=
xsw_sp_nexthop_group *nh_grp)
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3558  {
> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3559  	struct mlxsw_sp_ne=
xthop_group_info *nhgi =3D nh_grp->nhgi;
> > eb789980d0aa6c Ido Schimmel       2017-10-22  3560  	u16 ecmp_size, old=
_ecmp_size;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3561  	struct mlxsw_sp_ne=
xthop *nh;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3562  	bool offload_chang=
e =3D false;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3563  	u32 adj_index;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3564  	bool old_adj_index=
_valid;
> > e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3565  	int i, err2, err =
=3D 0;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3566  	u32 old_adj_index;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3567  =

> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3568  	if (!nhgi->gateway=
) {
> > b3e8d1ebad2d04 Ido Schimmel       2017-02-08  3569  		mlxsw_sp_nexthop_=
fib_entries_update(mlxsw_sp, nh_grp);
> > e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3570  		return 0;
> > b3e8d1ebad2d04 Ido Schimmel       2017-02-08  3571  	}
> > b3e8d1ebad2d04 Ido Schimmel       2017-02-08  3572  =

> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3573  	for (i =3D 0; i < =
nhgi->count; i++) {
> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3574  		nh =3D &nhgi->nex=
thops[i];
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3575  =

> > 56b8a9ed276bc1 Petr Machata       2017-07-31  3576  		if (nh->should_of=
fload !=3D nh->offloaded) {
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3577  			offload_change =
=3D true;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3578  			if (nh->should_o=
ffload)
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3579  				nh->update =3D =
1;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3580  		}
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3581  	}
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3582  	if (!offload_chang=
e) {
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3583  		/* Nothing was ad=
ded or removed, so no need to reallocate. Just
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3584  		 * update MAC on =
existing adjacency indexes.
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3585  		 */
> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3586  		err =3D mlxsw_sp_=
nexthop_group_update(mlxsw_sp, nhgi, false);
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3587  		if (err) {
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3588  			dev_warn(mlxsw_s=
p->bus_info->dev, "Failed to update neigh MAC in adjacency table.\n");
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3589  			goto set_trap;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3590  		}
> > e3ddfb45bacdc6 Ido Schimmel       2020-11-17  3591  		return 0;
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3592  	}
> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3593  	mlxsw_sp_nexthop_g=
roup_normalize(nhgi);
> > 7f7a417e6a11d7 Ido Schimmel       2020-11-13  3594  	if (!nhgi->sum_nor=
m_weight)
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3595  		/* No neigh of th=
is group is connected so we just set
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3596  		 * the trap and l=
et everthing flow through kernel.
> > a7ff87acd995e3 Jiri Pirko         2016-07-05  3597  		 */
> > a7ff87acd995e3 Jiri Pirko         2016-07-05 @3598  		goto set_trap;
> > =

> > The comments sort of imply that this is a success path so no error
> > code necessary.  It's sort of hard to be positive though...
> =

> Thanks for the report, Dan. This is indeed a success path. How do you
> suggest to handle it in order to avoid the warning on future smatch
> invocations? I regularly run smatch before submitting patches and I
> would like to keep it error/warning free.
> =


You could move setting the error to within 4 lines of the goto:

		err =3D 0;
		goto set_trap;

This check basically assumes that if you have a cleanup block after
a return 0; then it should return a negative error code.  It finds
quite a few bugs and I'm generally happy with it.  But like this is
open source and all so I'm also always open to different ideas if you
have a way to improve the check.

regards,
dan carpenter

--===============6736899380248369442==--

