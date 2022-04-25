Content-Type: multipart/mixed; boundary="===============4447787222513216531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:493 sja1105_init_l2_forwarding_params() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwarding_params_entry'? 0
Date: Tue, 26 Apr 2022 07:51:03 +0800
Message-ID: <202204260738.0iZ9gCO5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4447787222513216531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: 1bf658eefe38cc26801b5861bbb6dbf3259ba8c1 net: dsa: sja1105: allow t=
he frame buffer size to be customized
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: openrisc-randconfig-m031-20220425 (https://download.01.org/0day-ci/=
archive/20220426/202204260738.0iZ9gCO5-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:493 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:48 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:56 sja1105_can_forward() warn: shoul=
d '((((1))) << to)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:193 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:196 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:202 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:207 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:448 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:449 sja1105_init_l2_forwarding() war=
n: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:634 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:1232 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1350 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1352 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1360 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1446 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1454 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1459 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1509 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1593 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1645 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1647 sja1105_manage_flood_domains() =
warn: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2309 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2310 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2312 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2331 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2332 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2334 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2384 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2385 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2386 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2387 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2392 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2394 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2410 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2411 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2551 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2552 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2560 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2561 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2586 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2587 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:3113 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:3431 sja1105_port_mcast_flood() warn=
: should '(((1))) << to' be a 64 bit type?

vim +493 drivers/net/dsa/sja1105/sja1105_main.c

8aa9ebccae8762 Vladimir Oltean 2019-05-02  469  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  470  static int sja1105_init_l2_=
forwarding_params(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  471  {
1bf658eefe38cc Vladimir Oltean 2021-05-24  472  	struct sja1105_l2_forwardi=
ng_params_entry *l2fwd_params;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  473  	struct sja1105_table *tabl=
e;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  474  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  475  	table =3D &priv->static_co=
nfig.tables[BLK_IDX_L2_FORWARDING_PARAMS];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  476  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  477  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  478  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  479  		table->entry_count =3D 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  480  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  481  =

fd6f2c257b0bc0 Vladimir Oltean 2021-05-24  482  	table->entries =3D kcalloc=
(table->ops->max_entry_count,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  483  				 table->ops->unpacked_e=
ntry_size, GFP_KERNEL);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  484  	if (!table->entries)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  485  		return -ENOMEM;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  486  =

fd6f2c257b0bc0 Vladimir Oltean 2021-05-24  487  	table->entry_count =3D tab=
le->ops->max_entry_count;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  488  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  489  	/* This table only has a s=
ingle entry */
1bf658eefe38cc Vladimir Oltean 2021-05-24  490  	l2fwd_params =3D table->en=
tries;
1bf658eefe38cc Vladimir Oltean 2021-05-24  491  =

1bf658eefe38cc Vladimir Oltean 2021-05-24  492  	/* Disallow dynamic reconf=
iguration of vlan_pmap */
1bf658eefe38cc Vladimir Oltean 2021-05-24 @493  	l2fwd_params->max_dynp =3D=
 0;
1bf658eefe38cc Vladimir Oltean 2021-05-24  494  	/* Use a single memory par=
tition for all ingress queues */
1bf658eefe38cc Vladimir Oltean 2021-05-24  495  	l2fwd_params->part_spc[0] =
=3D priv->info->max_frame_mem;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  496  =

8aa9ebccae8762 Vladimir Oltean 2019-05-02  497  	return 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  498  }
8aa9ebccae8762 Vladimir Oltean 2019-05-02  499  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4447787222513216531==--

