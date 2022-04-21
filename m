Content-Type: multipart/mixed; boundary="===============3968990731576243085=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4752/5346] drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:224:54-58: ERROR: invalid reference to the index variable of the iterator on line 213
Date: Thu, 21 Apr 2022 18:55:11 +0800
Message-ID: <202204211839.166u5jNg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3968990731576243085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiri Pirko <jiri@nvidia.com>
CC: Vadim Pasternak <vadimp@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   65eb92e4c9f0a962656f131521f4fbc0d24c9d4c
commit: de28976d2650d3cd962035a9fac5eef3c5b1b379 [4752/5346] mlxsw: core_li=
necards: Introduce ops for linecards status change tracking
:::::: branch date: 4 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
421/202204211839.166u5jNg-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlxsw/core_linecards.c:224:54-58: ERROR: i=
nvalid reference to the index variable of the iterator on line 213

vim +224 drivers/net/ethernet/mellanox/mlxsw/core_linecards.c

de28976d2650d3 Jiri Pirko 2022-04-19  201  =

de28976d2650d3 Jiri Pirko 2022-04-19  202  void mlxsw_linecards_event_ops_u=
nregister(struct mlxsw_core *mlxsw_core,
de28976d2650d3 Jiri Pirko 2022-04-19  203  					  struct mlxsw_linecards_ev=
ent_ops *ops,
de28976d2650d3 Jiri Pirko 2022-04-19  204  					  void *priv)
de28976d2650d3 Jiri Pirko 2022-04-19  205  {
de28976d2650d3 Jiri Pirko 2022-04-19  206  	struct mlxsw_linecards *linecar=
ds =3D mlxsw_core_linecards(mlxsw_core);
de28976d2650d3 Jiri Pirko 2022-04-19  207  	struct mlxsw_linecards_event_op=
s_item *item, *tmp;
de28976d2650d3 Jiri Pirko 2022-04-19  208  	bool found =3D false;
de28976d2650d3 Jiri Pirko 2022-04-19  209  =

de28976d2650d3 Jiri Pirko 2022-04-19  210  	if (!linecards)
de28976d2650d3 Jiri Pirko 2022-04-19  211  		return;
de28976d2650d3 Jiri Pirko 2022-04-19  212  	mutex_lock(&linecards->event_op=
s_list_lock);
de28976d2650d3 Jiri Pirko 2022-04-19 @213  	list_for_each_entry_safe(item, =
tmp, &linecards->event_ops_list, list) {
de28976d2650d3 Jiri Pirko 2022-04-19  214  		if (item->event_ops =3D=3D ops=
 && item->priv =3D=3D priv) {
de28976d2650d3 Jiri Pirko 2022-04-19  215  			list_del(&item->list);
de28976d2650d3 Jiri Pirko 2022-04-19  216  			found =3D true;
de28976d2650d3 Jiri Pirko 2022-04-19  217  			break;
de28976d2650d3 Jiri Pirko 2022-04-19  218  		}
de28976d2650d3 Jiri Pirko 2022-04-19  219  	}
de28976d2650d3 Jiri Pirko 2022-04-19  220  	mutex_unlock(&linecards->event_=
ops_list_lock);
de28976d2650d3 Jiri Pirko 2022-04-19  221  =

de28976d2650d3 Jiri Pirko 2022-04-19  222  	if (!found)
de28976d2650d3 Jiri Pirko 2022-04-19  223  		return;
de28976d2650d3 Jiri Pirko 2022-04-19 @224  	mlxsw_linecards_event_ops_unreg=
ister_call(linecards, item);
de28976d2650d3 Jiri Pirko 2022-04-19  225  	kfree(item);
de28976d2650d3 Jiri Pirko 2022-04-19  226  }
de28976d2650d3 Jiri Pirko 2022-04-19  227  EXPORT_SYMBOL(mlxsw_linecards_ev=
ent_ops_unregister);
de28976d2650d3 Jiri Pirko 2022-04-19  228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3968990731576243085==--

