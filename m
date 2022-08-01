Content-Type: multipart/mixed; boundary="===============1605506663516947601=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/microchip/lan966x/lan966x_mdb.c:119 lan966x_mdb_ip_add() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 01 Aug 2022 17:49:06 +0800
Message-ID: <202208011734.bXY8KTpR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1605506663516947601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Horatiu Vultur <horatiu.vultur@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3d7cb6b04c3f3115719235cc6866b10326de34cd
commit: 7aacb894b1adf8b0f46e6370417350a6bac20c55 net: lan966x: Extend switc=
hdev with mdb support
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: arc-randconfig-m041-20220731 (https://download.01.org/0day-ci/archi=
ve/20220801/202208011734.bXY8KTpR-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/microchip/lan966x/lan966x_mdb.c:119 lan966x_mdb_ip_add=
() warn: passing a valid pointer to 'PTR_ERR'
drivers/net/ethernet/microchip/lan966x/lan966x_mdb.c:262 lan966x_mdb_l2_add=
() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +119 drivers/net/ethernet/microchip/lan966x/lan966x_mdb.c

7aacb894b1adf8 Horatiu Vultur 2022-01-04  104  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  105  static int lan966x_mdb_ip_ad=
d(struct lan966x_port *port,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  106  			      const struct switch=
dev_obj_port_mdb *mdb,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  107  			      enum macaccess_entr=
y_type type)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  108  {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  109  	bool cpu_port =3D netif_is_=
bridge_master(mdb->obj.orig_dev);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  110  	struct lan966x *lan966x =3D=
 port->lan966x;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  111  	struct lan966x_mdb_entry *m=
db_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  112  	unsigned char mac[ETH_ALEN];
7aacb894b1adf8 Horatiu Vultur 2022-01-04  113  	bool cpu_copy =3D false;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  114  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  115  	mdb_entry =3D lan966x_mdb_e=
ntry_get(lan966x, mdb->addr, mdb->vid);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  116  	if (!mdb_entry) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  117  		mdb_entry =3D lan966x_mdb_=
entry_add(lan966x, mdb);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  118  		if (IS_ERR(mdb_entry))
7aacb894b1adf8 Horatiu Vultur 2022-01-04 @119  			return PTR_ERR(mdb_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  120  	} else {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  121  		lan966x_mdb_encode_mac(mac=
, mdb_entry, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  122  		lan966x_mac_forget(lan966x=
, mac, mdb_entry->vid, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  123  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  124  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  125  	if (cpu_port)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  126  		mdb_entry->cpu_copy++;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  127  	else
7aacb894b1adf8 Horatiu Vultur 2022-01-04  128  		mdb_entry->ports |=3D BIT(=
port->chip_port);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  129  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  130  	/* Copy the frame to CPU on=
ly if the CPU is in the VLAN */
7aacb894b1adf8 Horatiu Vultur 2022-01-04  131  	if (lan966x_vlan_cpu_member=
_cpu_vlan_mask(lan966x, mdb_entry->vid) &&
7aacb894b1adf8 Horatiu Vultur 2022-01-04  132  	    mdb_entry->cpu_copy)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  133  		cpu_copy =3D true;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  134  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  135  	lan966x_mdb_encode_mac(mac,=
 mdb_entry, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  136  	return lan966x_mac_ip_learn=
(lan966x, cpu_copy,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  137  				    mac, mdb_entry->vid,=
 type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  138  }
7aacb894b1adf8 Horatiu Vultur 2022-01-04  139  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  140  static int lan966x_mdb_ip_de=
l(struct lan966x_port *port,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  141  			      const struct switch=
dev_obj_port_mdb *mdb,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  142  			      enum macaccess_entr=
y_type type)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  143  {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  144  	bool cpu_port =3D netif_is_=
bridge_master(mdb->obj.orig_dev);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  145  	struct lan966x *lan966x =3D=
 port->lan966x;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  146  	struct lan966x_mdb_entry *m=
db_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  147  	unsigned char mac[ETH_ALEN];
7aacb894b1adf8 Horatiu Vultur 2022-01-04  148  	u16 ports;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  149  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  150  	mdb_entry =3D lan966x_mdb_e=
ntry_get(lan966x, mdb->addr, mdb->vid);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  151  	if (!mdb_entry)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  152  		return -ENOENT;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  153  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  154  	ports =3D mdb_entry->ports;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  155  	if (cpu_port) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  156  		/* If there are still othe=
r references to the CPU port then
7aacb894b1adf8 Horatiu Vultur 2022-01-04  157  		 * there is no point to de=
lete and add again the same entry
7aacb894b1adf8 Horatiu Vultur 2022-01-04  158  		 */
7aacb894b1adf8 Horatiu Vultur 2022-01-04  159  		mdb_entry->cpu_copy--;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  160  		if (mdb_entry->cpu_copy)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  161  			return 0;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  162  	} else {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  163  		ports &=3D ~BIT(port->chip=
_port);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  164  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  165  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  166  	lan966x_mdb_encode_mac(mac,=
 mdb_entry, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  167  	lan966x_mac_forget(lan966x,=
 mac, mdb_entry->vid, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  168  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  169  	mdb_entry->ports =3D ports;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  170  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  171  	if (!mdb_entry->ports && !m=
db_entry->cpu_copy) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  172  		list_del(&mdb_entry->list);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  173  		kfree(mdb_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  174  		return 0;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  175  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  176  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  177  	lan966x_mdb_encode_mac(mac,=
 mdb_entry, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  178  	return lan966x_mac_ip_learn=
(lan966x, mdb_entry->cpu_copy,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  179  				    mac, mdb_entry->vid,=
 type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  180  }
7aacb894b1adf8 Horatiu Vultur 2022-01-04  181  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  182  static struct lan966x_pgid_e=
ntry *
7aacb894b1adf8 Horatiu Vultur 2022-01-04  183  lan966x_pgid_entry_add(struc=
t lan966x *lan966x, int index, u16 ports)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  184  {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  185  	struct lan966x_pgid_entry *=
pgid_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  186  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  187  	pgid_entry =3D kzalloc(size=
of(*pgid_entry), GFP_KERNEL);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  188  	if (!pgid_entry)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  189  		return ERR_PTR(-ENOMEM);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  190  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  191  	pgid_entry->ports =3D ports;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  192  	pgid_entry->index =3D index;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  193  	refcount_set(&pgid_entry->r=
efcount, 1);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  194  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  195  	list_add_tail(&pgid_entry->=
list, &lan966x->pgid_entries);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  196  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  197  	return pgid_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  198  }
7aacb894b1adf8 Horatiu Vultur 2022-01-04  199  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  200  static struct lan966x_pgid_e=
ntry *
7aacb894b1adf8 Horatiu Vultur 2022-01-04  201  lan966x_pgid_entry_get(struc=
t lan966x *lan966x,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  202  		       struct lan966x_mdb_=
entry *mdb_entry)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  203  {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  204  	struct lan966x_pgid_entry *=
pgid_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  205  	int index;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  206  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  207  	/* Try to find an existing =
pgid that uses the same ports as the
7aacb894b1adf8 Horatiu Vultur 2022-01-04  208  	 * mdb_entry
7aacb894b1adf8 Horatiu Vultur 2022-01-04  209  	 */
7aacb894b1adf8 Horatiu Vultur 2022-01-04  210  	list_for_each_entry(pgid_en=
try, &lan966x->pgid_entries, list) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  211  		if (pgid_entry->ports =3D=
=3D mdb_entry->ports) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  212  			refcount_inc(&pgid_entry-=
>refcount);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  213  			return pgid_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  214  		}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  215  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  216  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  217  	/* Try to find an empty pgi=
d entry and allocate one in case it finds it,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  218  	 * otherwise it means that =
there are no more resources
7aacb894b1adf8 Horatiu Vultur 2022-01-04  219  	 */
7aacb894b1adf8 Horatiu Vultur 2022-01-04  220  	for (index =3D PGID_GP_STAR=
T; index < PGID_GP_END; index++) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  221  		bool used =3D false;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  222  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  223  		list_for_each_entry(pgid_e=
ntry, &lan966x->pgid_entries, list) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  224  			if (pgid_entry->index =3D=
=3D index) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  225  				used =3D true;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  226  				break;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  227  			}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  228  		}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  229  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  230  		if (!used)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  231  			return lan966x_pgid_entry=
_add(lan966x, index,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  232  						      mdb_entry->ports=
);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  233  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  234  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  235  	return ERR_PTR(-ENOSPC);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  236  }
7aacb894b1adf8 Horatiu Vultur 2022-01-04  237  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  238  static void lan966x_pgid_ent=
ry_del(struct lan966x *lan966x,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  239  				   struct lan966x_pgid_e=
ntry *pgid_entry)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  240  {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  241  	if (!refcount_dec_and_test(=
&pgid_entry->refcount))
7aacb894b1adf8 Horatiu Vultur 2022-01-04  242  		return;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  243  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  244  	list_del(&pgid_entry->list);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  245  	kfree(pgid_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  246  }
7aacb894b1adf8 Horatiu Vultur 2022-01-04  247  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  248  static int lan966x_mdb_l2_ad=
d(struct lan966x_port *port,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  249  			      const struct switch=
dev_obj_port_mdb *mdb,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  250  			      enum macaccess_entr=
y_type type)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  251  {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  252  	bool cpu_port =3D netif_is_=
bridge_master(mdb->obj.orig_dev);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  253  	struct lan966x *lan966x =3D=
 port->lan966x;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  254  	struct lan966x_pgid_entry *=
pgid_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  255  	struct lan966x_mdb_entry *m=
db_entry;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  256  	unsigned char mac[ETH_ALEN];
7aacb894b1adf8 Horatiu Vultur 2022-01-04  257  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  258  	mdb_entry =3D lan966x_mdb_e=
ntry_get(lan966x, mdb->addr, mdb->vid);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  259  	if (!mdb_entry) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  260  		mdb_entry =3D lan966x_mdb_=
entry_add(lan966x, mdb);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  261  		if (IS_ERR(mdb_entry))
7aacb894b1adf8 Horatiu Vultur 2022-01-04 @262  			return PTR_ERR(mdb_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  263  	} else {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  264  		lan966x_pgid_entry_del(lan=
966x, mdb_entry->pgid);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  265  		lan966x_mdb_encode_mac(mac=
, mdb_entry, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  266  		lan966x_mac_forget(lan966x=
, mac, mdb_entry->vid, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  267  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  268  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  269  	if (cpu_port) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  270  		mdb_entry->ports |=3D BIT(=
CPU_PORT);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  271  		mdb_entry->cpu_copy++;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  272  	} else {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  273  		mdb_entry->ports |=3D BIT(=
port->chip_port);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  274  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  275  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  276  	pgid_entry =3D lan966x_pgid=
_entry_get(lan966x, mdb_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  277  	if (IS_ERR(pgid_entry)) {
7aacb894b1adf8 Horatiu Vultur 2022-01-04  278  		list_del(&mdb_entry->list);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  279  		kfree(mdb_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  280  		return PTR_ERR(pgid_entry);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  281  	}
7aacb894b1adf8 Horatiu Vultur 2022-01-04  282  	mdb_entry->pgid =3D pgid_en=
try;
7aacb894b1adf8 Horatiu Vultur 2022-01-04  283  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  284  	/* Copy the frame to CPU on=
ly if the CPU is in the VLAN */
7aacb894b1adf8 Horatiu Vultur 2022-01-04  285  	if (!lan966x_vlan_cpu_membe=
r_cpu_vlan_mask(lan966x, mdb_entry->vid) &&
7aacb894b1adf8 Horatiu Vultur 2022-01-04  286  	    mdb_entry->cpu_copy)
7aacb894b1adf8 Horatiu Vultur 2022-01-04  287  		mdb_entry->ports &=3D BIT(=
CPU_PORT);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  288  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  289  	lan_rmw(ANA_PGID_PGID_SET(m=
db_entry->ports),
7aacb894b1adf8 Horatiu Vultur 2022-01-04  290  		ANA_PGID_PGID,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  291  		lan966x, ANA_PGID(pgid_ent=
ry->index));
7aacb894b1adf8 Horatiu Vultur 2022-01-04  292  =

7aacb894b1adf8 Horatiu Vultur 2022-01-04  293  	return lan966x_mac_learn(la=
n966x, pgid_entry->index, mdb_entry->mac,
7aacb894b1adf8 Horatiu Vultur 2022-01-04  294  				 mdb_entry->vid, type);
7aacb894b1adf8 Horatiu Vultur 2022-01-04  295  }
7aacb894b1adf8 Horatiu Vultur 2022-01-04  296  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1605506663516947601==--

