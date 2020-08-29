Content-Type: multipart/mixed; boundary="===============3607091723627997765=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:2180 sja1105_build_subvlans() warn: should '(((1))) << (v->port)' be a 64 bit
Date: Sat, 29 Aug 2020 21:01:35 +0800
Message-ID: <202008292131.sdP47mMU%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3607091723627997765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4d41ead6ead97c3730bbd186a601a64828668f01
commit: 3f01c91aab9276ca48acccd20f6c379cf48a51f9 net: dsa: sja1105: impleme=
nt VLAN retagging for dsa_8021q sub-VLANs
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-m031-20200829 (attached as .config)
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:2180 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2181 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2347 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2348 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:46 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:47 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:48 sja1105_port_allow_traffic() warn=
: should '(((1))) << to' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:188 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:191 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:197 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:202 sja1105_init_mii_settings() warn=
: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:562 sja1105_init_avb_params() warn: =
is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:1154 sja1105_find_static_fdb_entry()=
 warn: should '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1272 sja1105et_fdb_add() warn: shoul=
d '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1274 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1282 sja1105et_fdb_add() warn: shoul=
d '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1368 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1376 sja1105pqrs_fdb_add() warn: sho=
uld '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1381 sja1105pqrs_fdb_add() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1431 sja1105pqrs_fdb_del() warn: sho=
uld '(((1))) << port' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1515 sja1105_fdb_dump() warn: should=
 '((((1))) << port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:1751 sja1105_static_config_reload() =
warn: bitwise AND condition is false here
drivers/net/dsa/sja1105/sja1105_main.c:2105 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2106 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2108 sja1105_build_bridge_vlans() wa=
rn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2127 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2128 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2130 sja1105_build_dsa_8021q_vlans()=
 warn: should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2182 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2183 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2188 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2190 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2206 sja1105_build_subvlans() warn: =
should '(((1))) << (v->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2207 sja1105_build_subvlans() warn: =
should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2356 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2357 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2382 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << upstream' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2383 sja1105_build_crosschip_subvlan=
s() warn: should '(((1))) << (tmp->port)' be a 64 bit type?
drivers/net/dsa/sja1105/sja1105_main.c:2785 sja1105_best_effort_vlan_filter=
ing_set() error: uninitialized symbol 'rc'.
drivers/net/dsa/sja1105/sja1105_main.c:3000 sja1105_mgmt_xmit() warn: shoul=
d '(((1))) << port' be a 64 bit type?

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D3f01c91aab9276ca48acccd20f6c379cf48a51f9
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 3f01c91aab9276ca48acccd20f6c379cf48a51f9
vim +2180 drivers/net/dsa/sja1105/sja1105_main.c

ec5ae61076d07b Vladimir Oltean 2020-05-12  2135  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2136  static int sja1105_build_s=
ubvlans(struct sja1105_private *priv,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2137  				  u16 subvlan_map[][DS=
A_8021Q_N_SUBVLAN],
3f01c91aab9276 Vladimir Oltean 2020-05-12  2138  				  struct sja1105_vlan_=
lookup_entry *new_vlan,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2139  				  struct sja1105_retag=
ging_entry *new_retagging,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2140  				  int *num_retagging)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2141  {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2142  	struct sja1105_bridge_vla=
n *v;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2143  	int k =3D *num_retagging;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2144  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2145  	if (priv->vlan_state !=3D=
 SJA1105_VLAN_BEST_EFFORT)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2146  		return 0;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2147  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2148  	list_for_each_entry(v, &p=
riv->bridge_vlans, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2149  		int upstream =3D dsa_ups=
tream_port(priv->ds, v->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2150  		int match, subvlan;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2151  		u16 rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2152  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2153  		/* Only sub-VLANs on use=
r ports need to be applied.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2154  		 * Bridge VLANs also inc=
lude VLANs added automatically
3f01c91aab9276 Vladimir Oltean 2020-05-12  2155  		 * by DSA on the CPU por=
t.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2156  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2157  		if (!dsa_is_user_port(pr=
iv->ds, v->port))
3f01c91aab9276 Vladimir Oltean 2020-05-12  2158  			continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2159  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2160  		subvlan =3D sja1105_find=
_subvlan(subvlan_map[v->port],
3f01c91aab9276 Vladimir Oltean 2020-05-12  2161  					       v->vid);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2162  		if (subvlan < 0) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2163  			subvlan =3D sja1105_fin=
d_free_subvlan(subvlan_map[v->port],
3f01c91aab9276 Vladimir Oltean 2020-05-12  2164  							    v->pvid);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2165  			if (subvlan < 0) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2166  				dev_err(priv->ds->dev,=
 "No more free subvlans\n");
3f01c91aab9276 Vladimir Oltean 2020-05-12  2167  				return -ENOSPC;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2168  			}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2169  		}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2170  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2171  		rx_vid =3D dsa_8021q_rx_=
vid_subvlan(priv->ds, v->port, subvlan);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2172  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2173  		/* @v->vid on @v->port n=
eeds to be retagged to @rx_vid
3f01c91aab9276 Vladimir Oltean 2020-05-12  2174  		 * on @upstream. Assume =
@v->vid on @v->port and on
3f01c91aab9276 Vladimir Oltean 2020-05-12  2175  		 * @upstream was already=
 configured by the previous
3f01c91aab9276 Vladimir Oltean 2020-05-12  2176  		 * iteration over bridge=
_vlans.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2177  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2178  		match =3D rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2179  		new_vlan[match].vlanid =
=3D rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12 @2180  		new_vlan[match].vmemb_po=
rt |=3D BIT(v->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12 @2181  		new_vlan[match].vmemb_po=
rt |=3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2182  		new_vlan[match].vlan_bc =
|=3D BIT(v->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2183  		new_vlan[match].vlan_bc =
|=3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2184  		/* The "untagged" flag i=
s set the same as for the
3f01c91aab9276 Vladimir Oltean 2020-05-12  2185  		 * original VLAN
3f01c91aab9276 Vladimir Oltean 2020-05-12  2186  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2187  		if (!v->untagged)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2188  			new_vlan[match].tag_por=
t |=3D BIT(v->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2189  		/* But it's always tagge=
d towards the CPU */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2190  		new_vlan[match].tag_port=
 |=3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2191  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2192  		/* The Retagging Table g=
enerates packet *clones* with
3f01c91aab9276 Vladimir Oltean 2020-05-12  2193  		 * the new VLAN. This is=
 a very odd hardware quirk
3f01c91aab9276 Vladimir Oltean 2020-05-12  2194  		 * which we need to supp=
ress by dropping the original
3f01c91aab9276 Vladimir Oltean 2020-05-12  2195  		 * packet.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2196  		 * Deny egress of the or=
iginal VLAN towards the CPU
3f01c91aab9276 Vladimir Oltean 2020-05-12  2197  		 * port. This will force=
 the switch to drop it, and
3f01c91aab9276 Vladimir Oltean 2020-05-12  2198  		 * we'll see only the re=
tagged packets.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2199  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2200  		match =3D v->vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2201  		new_vlan[match].vlan_bc =
&=3D ~BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2202  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2203  		/* And the retagging its=
elf */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2204  		new_retagging[k].vlan_in=
g =3D v->vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2205  		new_retagging[k].vlan_eg=
r =3D rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2206  		new_retagging[k].ing_por=
t =3D BIT(v->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2207  		new_retagging[k].egr_por=
t =3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2208  		if (k++ =3D=3D SJA1105_M=
AX_RETAGGING_COUNT) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2209  			dev_err(priv->ds->dev, =
"No more retagging rules\n");
3f01c91aab9276 Vladimir Oltean 2020-05-12  2210  			return -ENOSPC;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2211  		}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2212  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2213  		subvlan_map[v->port][sub=
vlan] =3D v->vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2214  	}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2215  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2216  	*num_retagging =3D k;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2217  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2218  	return 0;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2219  }
3f01c91aab9276 Vladimir Oltean 2020-05-12  2220  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2221  /* Sadly, in crosschip sce=
narios where the CPU port is also the link to another
3f01c91aab9276 Vladimir Oltean 2020-05-12  2222   * switch, we should retag=
 backwards (the dsa_8021q vid to the original vid) on
3f01c91aab9276 Vladimir Oltean 2020-05-12  2223   * the CPU port of neighbo=
ur switches.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2224   */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2225  static int
3f01c91aab9276 Vladimir Oltean 2020-05-12  2226  sja1105_build_crosschip_su=
bvlans(struct sja1105_private *priv,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2227  				 struct sja1105_vlan_l=
ookup_entry *new_vlan,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2228  				 struct sja1105_retagg=
ing_entry *new_retagging,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2229  				 int *num_retagging)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2230  {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2231  	struct sja1105_crosschip_=
vlan *tmp, *pos;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2232  	struct dsa_8021q_crosschi=
p_link *c;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2233  	struct sja1105_bridge_vla=
n *v, *w;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2234  	struct list_head crosschi=
p_vlans;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2235  	int k =3D *num_retagging;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2236  	int rc =3D 0;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2237  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2238  	if (priv->vlan_state !=3D=
 SJA1105_VLAN_BEST_EFFORT)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2239  		return 0;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2240  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2241  	INIT_LIST_HEAD(&crosschip=
_vlans);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2242  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2243  	list_for_each_entry(c, &p=
riv->crosschip_links, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2244  		struct sja1105_private *=
other_priv =3D c->other_ds->priv;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2245  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2246  		if (other_priv->vlan_sta=
te =3D=3D SJA1105_VLAN_FILTERING_FULL)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2247  			continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2248  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2249  		/* Crosschip links are a=
lso added to the CPU ports.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2250  		 * Ignore those.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2251  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2252  		if (!dsa_is_user_port(pr=
iv->ds, c->port))
3f01c91aab9276 Vladimir Oltean 2020-05-12  2253  			continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2254  		if (!dsa_is_user_port(c-=
>other_ds, c->other_port))
3f01c91aab9276 Vladimir Oltean 2020-05-12  2255  			continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2256  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2257  		/* Search for VLANs on t=
he remote port */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2258  		list_for_each_entry(v, &=
other_priv->bridge_vlans, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2259  			bool already_added =3D =
false;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2260  			bool we_have_it =3D fal=
se;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2261  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2262  			if (v->port !=3D c->oth=
er_port)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2263  				continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2264  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2265  			/* If @v is a pvid on @=
other_ds, it does not need
3f01c91aab9276 Vladimir Oltean 2020-05-12  2266  			 * re-retagging, becaus=
e its SVL field is 0 and we
3f01c91aab9276 Vladimir Oltean 2020-05-12  2267  			 * already allow that, =
via the dsa_8021q crosschip
3f01c91aab9276 Vladimir Oltean 2020-05-12  2268  			 * links.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2269  			 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2270  			if (v->pvid)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2271  				continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2272  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2273  			/* Search for the VLAN =
on our local port */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2274  			list_for_each_entry(w, =
&priv->bridge_vlans, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2275  				if (w->port =3D=3D c->=
port && w->vid =3D=3D v->vid) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2276  					we_have_it =3D true;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2277  					break;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2278  				}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2279  			}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2280  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2281  			if (!we_have_it)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2282  				continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2283  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2284  			list_for_each_entry(tmp=
, &crosschip_vlans, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2285  				if (tmp->vid =3D=3D v-=
>vid &&
3f01c91aab9276 Vladimir Oltean 2020-05-12  2286  				    tmp->untagged =3D=
=3D v->untagged &&
3f01c91aab9276 Vladimir Oltean 2020-05-12  2287  				    tmp->port =3D=3D c=
->port &&
3f01c91aab9276 Vladimir Oltean 2020-05-12  2288  				    tmp->other_port =
=3D=3D v->port &&
3f01c91aab9276 Vladimir Oltean 2020-05-12  2289  				    tmp->other_ds =3D=
=3D c->other_ds) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2290  					already_added =3D tru=
e;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2291  					break;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2292  				}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2293  			}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2294  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2295  			if (already_added)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2296  				continue;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2297  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2298  			tmp =3D kzalloc(sizeof(=
*tmp), GFP_KERNEL);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2299  			if (!tmp) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2300  				dev_err(priv->ds->dev,=
 "Failed to allocate memory\n");
3f01c91aab9276 Vladimir Oltean 2020-05-12  2301  				rc =3D -ENOMEM;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2302  				goto out;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2303  			}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2304  			tmp->vid =3D v->vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2305  			tmp->port =3D c->port;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2306  			tmp->other_port =3D v->=
port;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2307  			tmp->other_ds =3D c->ot=
her_ds;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2308  			tmp->untagged =3D v->un=
tagged;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2309  			list_add(&tmp->list, &c=
rosschip_vlans);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2310  		}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2311  	}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2312  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2313  	list_for_each_entry(tmp, =
&crosschip_vlans, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2314  		struct sja1105_private *=
other_priv =3D tmp->other_ds->priv;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2315  		int upstream =3D dsa_ups=
tream_port(priv->ds, tmp->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2316  		int match, subvlan;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2317  		u16 rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2318  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2319  		subvlan =3D sja1105_find=
_committed_subvlan(other_priv,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2320  							 tmp->other_port,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2321  							 tmp->vid);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2322  		/* If this happens, it's=
 a bug. The neighbour switch does not
3f01c91aab9276 Vladimir Oltean 2020-05-12  2323  		 * have a subvlan for tm=
p->vid on tmp->other_port, but it
3f01c91aab9276 Vladimir Oltean 2020-05-12  2324  		 * should, since we alre=
ady checked for its vlan_state.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2325  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2326  		if (WARN_ON(subvlan < 0)=
) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2327  			rc =3D -EINVAL;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2328  			goto out;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2329  		}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2330  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2331  		rx_vid =3D dsa_8021q_rx_=
vid_subvlan(tmp->other_ds,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2332  						  tmp->other_port,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2333  						  subvlan);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2334  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2335  		/* The @rx_vid retagged =
from @tmp->vid on
3f01c91aab9276 Vladimir Oltean 2020-05-12  2336  		 * {@tmp->other_ds, @tmp=
->other_port} needs to be
3f01c91aab9276 Vladimir Oltean 2020-05-12  2337  		 * re-retagged to @tmp->=
vid on the way back to us.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2338  		 *
3f01c91aab9276 Vladimir Oltean 2020-05-12  2339  		 * Assume the original @=
tmp->vid is already configured
3f01c91aab9276 Vladimir Oltean 2020-05-12  2340  		 * on this local switch,=
 otherwise we wouldn't be
3f01c91aab9276 Vladimir Oltean 2020-05-12  2341  		 * retagging its subvlan=
 on the other switch in the
3f01c91aab9276 Vladimir Oltean 2020-05-12  2342  		 * first place. We just =
need to add a reverse retagging
3f01c91aab9276 Vladimir Oltean 2020-05-12  2343  		 * rule for @rx_vid and =
install @rx_vid on our ports.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2344  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2345  		match =3D rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2346  		new_vlan[match].vlanid =
=3D rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12 @2347  		new_vlan[match].vmemb_po=
rt |=3D BIT(tmp->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12 @2348  		new_vlan[match].vmemb_po=
rt |=3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2349  		/* The "untagged" flag i=
s set the same as for the
3f01c91aab9276 Vladimir Oltean 2020-05-12  2350  		 * original VLAN. And to=
wards the CPU, it doesn't
3f01c91aab9276 Vladimir Oltean 2020-05-12  2351  		 * really matter, becaus=
e @rx_vid will only receive
3f01c91aab9276 Vladimir Oltean 2020-05-12  2352  		 * traffic on that port.=
 For consistency with other dsa_8021q
3f01c91aab9276 Vladimir Oltean 2020-05-12  2353  		 * VLANs, we'll keep the=
 CPU port tagged.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2354  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2355  		if (!tmp->untagged)
3f01c91aab9276 Vladimir Oltean 2020-05-12  2356  			new_vlan[match].tag_por=
t |=3D BIT(tmp->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2357  		new_vlan[match].tag_port=
 |=3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2358  		/* Deny egress of @rx_vi=
d towards our front-panel port.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2359  		 * This will force the s=
witch to drop it, and we'll see
3f01c91aab9276 Vladimir Oltean 2020-05-12  2360  		 * only the re-retagged =
packets (having the original,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2361  		 * pre-initial-retagging=
, VLAN @tmp->vid).
3f01c91aab9276 Vladimir Oltean 2020-05-12  2362  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2363  		new_vlan[match].vlan_bc =
&=3D ~BIT(tmp->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2364  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2365  		/* On reverse retagging,=
 the same ingress VLAN goes to multiple
3f01c91aab9276 Vladimir Oltean 2020-05-12  2366  		 * ports. So we have an =
opportunity to create composite rules
3f01c91aab9276 Vladimir Oltean 2020-05-12  2367  		 * to not waste the limi=
ted space in the retagging table.
3f01c91aab9276 Vladimir Oltean 2020-05-12  2368  		 */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2369  		k =3D sja1105_find_retag=
ging_entry(new_retagging, *num_retagging,
3f01c91aab9276 Vladimir Oltean 2020-05-12  2370  						 upstream, rx_vid, t=
mp->vid);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2371  		if (k < 0) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2372  			if (*num_retagging =3D=
=3D SJA1105_MAX_RETAGGING_COUNT) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2373  				dev_err(priv->ds->dev,=
 "No more retagging rules\n");
3f01c91aab9276 Vladimir Oltean 2020-05-12  2374  				rc =3D -ENOSPC;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2375  				goto out;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2376  			}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2377  			k =3D (*num_retagging)+=
+;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2378  		}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2379  		/* And the retagging its=
elf */
3f01c91aab9276 Vladimir Oltean 2020-05-12  2380  		new_retagging[k].vlan_in=
g =3D rx_vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2381  		new_retagging[k].vlan_eg=
r =3D tmp->vid;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2382  		new_retagging[k].ing_por=
t =3D BIT(upstream);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2383  		new_retagging[k].egr_por=
t |=3D BIT(tmp->port);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2384  	}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2385  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2386  out:
3f01c91aab9276 Vladimir Oltean 2020-05-12  2387  	list_for_each_entry_safe(=
tmp, pos, &crosschip_vlans, list) {
3f01c91aab9276 Vladimir Oltean 2020-05-12  2388  		list_del(&tmp->list);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2389  		kfree(tmp);
3f01c91aab9276 Vladimir Oltean 2020-05-12  2390  	}
3f01c91aab9276 Vladimir Oltean 2020-05-12  2391  =

3f01c91aab9276 Vladimir Oltean 2020-05-12  2392  	return rc;
3f01c91aab9276 Vladimir Oltean 2020-05-12  2393  }
3f01c91aab9276 Vladimir Oltean 2020-05-12  2394  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3607091723627997765==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3607091723627997765==--

