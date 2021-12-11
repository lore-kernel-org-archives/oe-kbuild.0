Content-Type: multipart/mixed; boundary="===============4547210122119071016=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:493 sja1105_init_l2_forwarding_params() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwarding_params_entry'? 0
Date: Sat, 11 Dec 2021 09:01:55 +0800
Message-ID: <202112110849.sDdJ2xbC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4547210122119071016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b8a98b6bf66ae35361e987333233d07241642909
commit: 1bf658eefe38cc26801b5861bbb6dbf3259ba8c1 net: dsa: sja1105: allow t=
he frame buffer size to be customized
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112110849.sDdJ2xbC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:493 sja1105_init_l2_forwarding_param=
s() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwardin=
g_params_entry'? 0

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:193 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:196 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:202 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:207 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:634 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0

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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4547210122119071016==--

