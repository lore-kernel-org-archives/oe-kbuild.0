Content-Type: multipart/mixed; boundary="===============4376329022321816941=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:combined_queue 43/101] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:224:54-58: ERROR: invalid reference to the index variable of the iterator on line 213
Date: Tue, 22 Mar 2022 17:14:25 +0800
Message-ID: <202203221746.8Vgl4mPq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4376329022321816941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jiri Pirko <jiri@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>
CC: Vadim Pasternak <vadimp@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   c1e5ded51a9a4bd63e0d6822062e5a1a9f22c125
commit: c52ceadd6badefa7981d0bb2fae995191a145bf8 [43/101] mlxsw: core_linec=
ards: Introduce ops for linecards status change tracking
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
322/202203221746.8Vgl4mPq-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:224:54-58: ERROR: i=
nvalid reference to the index variable of the iterator on line 213

vim +224 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

c52ceadd6badef Jiri Pirko 2022-03-14  201  =

c52ceadd6badef Jiri Pirko 2022-03-14  202  void mlxsw_linecards_event_ops_u=
nregister(struct mlxsw_core *mlxsw_core,
c52ceadd6badef Jiri Pirko 2022-03-14  203  					  struct mlxsw_linecards_ev=
ent_ops *ops,
c52ceadd6badef Jiri Pirko 2022-03-14  204  					  void *priv)
c52ceadd6badef Jiri Pirko 2022-03-14  205  {
c52ceadd6badef Jiri Pirko 2022-03-14  206  	struct mlxsw_linecards *linecar=
ds =3D mlxsw_core_linecards(mlxsw_core);
c52ceadd6badef Jiri Pirko 2022-03-14  207  	struct mlxsw_linecards_event_op=
s_item *item, *tmp;
c52ceadd6badef Jiri Pirko 2022-03-14  208  	bool found =3D false;
c52ceadd6badef Jiri Pirko 2022-03-14  209  =

c52ceadd6badef Jiri Pirko 2022-03-14  210  	if (!linecards)
c52ceadd6badef Jiri Pirko 2022-03-14  211  		return;
c52ceadd6badef Jiri Pirko 2022-03-14  212  	mutex_lock(&linecards->event_op=
s_list_lock);
c52ceadd6badef Jiri Pirko 2022-03-14 @213  	list_for_each_entry_safe(item, =
tmp, &linecards->event_ops_list, list) {
c52ceadd6badef Jiri Pirko 2022-03-14  214  		if (item->event_ops =3D=3D ops=
 && item->priv =3D=3D priv) {
c52ceadd6badef Jiri Pirko 2022-03-14  215  			list_del(&item->list);
c52ceadd6badef Jiri Pirko 2022-03-14  216  			found =3D true;
c52ceadd6badef Jiri Pirko 2022-03-14  217  			break;
c52ceadd6badef Jiri Pirko 2022-03-14  218  		}
c52ceadd6badef Jiri Pirko 2022-03-14  219  	}
c52ceadd6badef Jiri Pirko 2022-03-14  220  	mutex_unlock(&linecards->event_=
ops_list_lock);
c52ceadd6badef Jiri Pirko 2022-03-14  221  =

c52ceadd6badef Jiri Pirko 2022-03-14  222  	if (!found)
c52ceadd6badef Jiri Pirko 2022-03-14  223  		return;
c52ceadd6badef Jiri Pirko 2022-03-14 @224  	mlxsw_linecards_event_ops_unreg=
ister_call(linecards, item);
c52ceadd6badef Jiri Pirko 2022-03-14  225  	kfree(item);
c52ceadd6badef Jiri Pirko 2022-03-14  226  }
c52ceadd6badef Jiri Pirko 2022-03-14  227  EXPORT_SYMBOL(mlxsw_linecards_ev=
ent_ops_unregister);
c52ceadd6badef Jiri Pirko 2022-03-14  228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4376329022321816941==--

