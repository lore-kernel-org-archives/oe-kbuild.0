Content-Type: multipart/mixed; boundary="===============3132871694257895660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:2192:15: warning: Variable 'want_tagging' is reassigned a value before the old one has been used.
Date: Tue, 22 Sep 2020 09:24:03 +0800
Message-ID: <202009220949.yfZIYSgA%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3132871694257895660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   98477740630f270aecf648f1d6a9dbc6027d4ff1
commit: 2cafa72e516f61b6d82c2416b4f5963fb48fd9ce net: dsa: sja1105: add a n=
ew best_effort_vlan_filtering devlink parameter
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/net/dsa/sja1105/sja1105_main.c:1762:32: warning: Variable 'other=
_priv->expect_dsa_8021q' is reassigned a value before the old one has been =
used. [redundantAssignment]
     other_priv->expect_dsa_8021q =3D false;
                                  ^
   drivers/net/dsa/sja1105/sja1105_main.c:1758:32: note: Variable 'other_pr=
iv->expect_dsa_8021q' is reassigned a value before the old one has been use=
d.
     other_priv->expect_dsa_8021q =3D true;
                                  ^
   drivers/net/dsa/sja1105/sja1105_main.c:1762:32: note: Variable 'other_pr=
iv->expect_dsa_8021q' is reassigned a value before the old one has been use=
d.
     other_priv->expect_dsa_8021q =3D false;
                                  ^
   drivers/net/dsa/sja1105/sja1105_main.c:1770:26: warning: Variable 'priv-=
>expect_dsa_8021q' is reassigned a value before the old one has been used. =
[redundantAssignment]
     priv->expect_dsa_8021q =3D false;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1766:26: note: Variable 'priv->ex=
pect_dsa_8021q' is reassigned a value before the old one has been used.
     priv->expect_dsa_8021q =3D true;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1770:26: note: Variable 'priv->ex=
pect_dsa_8021q' is reassigned a value before the old one has been used.
     priv->expect_dsa_8021q =3D false;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1800:32: warning: Variable 'other=
_priv->expect_dsa_8021q' is reassigned a value before the old one has been =
used. [redundantAssignment]
     other_priv->expect_dsa_8021q =3D false;
                                  ^
   drivers/net/dsa/sja1105/sja1105_main.c:1797:32: note: Variable 'other_pr=
iv->expect_dsa_8021q' is reassigned a value before the old one has been use=
d.
     other_priv->expect_dsa_8021q =3D true;
                                  ^
   drivers/net/dsa/sja1105/sja1105_main.c:1800:32: note: Variable 'other_pr=
iv->expect_dsa_8021q' is reassigned a value before the old one has been use=
d.
     other_priv->expect_dsa_8021q =3D false;
                                  ^
   drivers/net/dsa/sja1105/sja1105_main.c:1805:26: warning: Variable 'priv-=
>expect_dsa_8021q' is reassigned a value before the old one has been used. =
[redundantAssignment]
     priv->expect_dsa_8021q =3D false;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1802:26: note: Variable 'priv->ex=
pect_dsa_8021q' is reassigned a value before the old one has been used.
     priv->expect_dsa_8021q =3D true;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1805:26: note: Variable 'priv->ex=
pect_dsa_8021q' is reassigned a value before the old one has been used.
     priv->expect_dsa_8021q =3D false;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1817:26: warning: Variable 'priv-=
>expect_dsa_8021q' is reassigned a value before the old one has been used. =
[redundantAssignment]
     priv->expect_dsa_8021q =3D false;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1815:26: note: Variable 'priv->ex=
pect_dsa_8021q' is reassigned a value before the old one has been used.
     priv->expect_dsa_8021q =3D true;
                            ^
   drivers/net/dsa/sja1105/sja1105_main.c:1817:26: note: Variable 'priv->ex=
pect_dsa_8021q' is reassigned a value before the old one has been used.
     priv->expect_dsa_8021q =3D false;
                            ^
>> drivers/net/dsa/sja1105/sja1105_main.c:2192:15: warning: Variable 'want_=
tagging' is reassigned a value before the old one has been used. [redundant=
Assignment]
    want_tagging =3D priv->best_effort_vlan_filtering || !enabled;
                 ^
   drivers/net/dsa/sja1105/sja1105_main.c:2177:15: note: Variable 'want_tag=
ging' is reassigned a value before the old one has been used.
    want_tagging =3D (state =3D=3D SJA1105_VLAN_UNAWARE ||
                 ^
   drivers/net/dsa/sja1105/sja1105_main.c:2192:15: note: Variable 'want_tag=
ging' is reassigned a value before the old one has been used.
    want_tagging =3D priv->best_effort_vlan_filtering || !enabled;
                 ^
>> drivers/net/ethernet/broadcom/cnic.c:1763:39: warning: Variable 'ictx->x=
storm_st_context.common.flags' is reassigned a value before the old one has=
 been used. [redundantAssignment]
    ictx->xstorm_st_context.common.flags =3D
                                         ^
   drivers/net/ethernet/broadcom/cnic.c:1761:39: note: Variable 'ictx->xsto=
rm_st_context.common.flags' is reassigned a value before the old one has be=
en used.
    ictx->xstorm_st_context.common.flags =3D
                                         ^
   drivers/net/ethernet/broadcom/cnic.c:1763:39: note: Variable 'ictx->xsto=
rm_st_context.common.flags' is reassigned a value before the old one has be=
en used.
    ictx->xstorm_st_context.common.flags =3D
                                         ^
>> drivers/net/ethernet/broadcom/cnic.c:1930:25: warning: Variable 'kcqe.co=
mpletion_status' is reassigned a value before the old one has been used. [r=
edundantAssignment]
    kcqe.completion_status =3D ISCSI_KCQE_COMPLETION_STATUS_SUCCESS;
                           ^
   drivers/net/ethernet/broadcom/cnic.c:1905:25: note: Variable 'kcqe.compl=
etion_status' is reassigned a value before the old one has been used.
    kcqe.completion_status =3D ISCSI_KCQE_COMPLETION_STATUS_CTX_ALLOC_FAILU=
RE;
                           ^
   drivers/net/ethernet/broadcom/cnic.c:1930:25: note: Variable 'kcqe.compl=
etion_status' is reassigned a value before the old one has been used.
    kcqe.completion_status =3D ISCSI_KCQE_COMPLETION_STATUS_SUCCESS;
                           ^
>> drivers/net/ethernet/broadcom/cnic.c:2902:37: warning: Shifting signed 3=
2-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     if (likely(!(kcqe->kcqe_op_flag & KCQE_FLAGS_NEXT))) {
                                       ^
--
>> drivers/net/ethernet/cavium/liquidio/lio_main.c:4280:7: warning: Variabl=
e 'ret' is reassigned a value before the old one has been used. [redundantA=
ssignment]
     ret =3D octeon_init_consoles(octeon_dev);
         ^
   drivers/net/ethernet/cavium/liquidio/lio_main.c:4277:7: note: Variable '=
ret' is reassigned a value before the old one has been used.
     ret =3D octeon_console_send_cmd(octeon_dev, bootcmd, 50);
         ^
   drivers/net/ethernet/cavium/liquidio/lio_main.c:4280:7: note: Variable '=
ret' is reassigned a value before the old one has been used.
     ret =3D octeon_init_consoles(octeon_dev);
         ^
>> drivers/net/ethernet/dec/tulip/tulip.h:132:18: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    CFDD_Sleep =3D (1 << 31),
                    ^
   drivers/net/ethernet/dec/tulip/tulip.h:244:14: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    csr6_sc =3D (1<<31),
                ^
>> drivers/net/ethernet/dec/tulip/tulip_core.c:1246:11: warning: Variable '=
tp->csr0' is reassigned a value before the old one has been used. 'break;' =
missing? [redundantAssignInSwitch]
    tp->csr0 =3D csr0;
             ^
   drivers/net/ethernet/dec/tulip/tulip_core.c:1188:11: note: Variable 'tp-=
>csr0' is reassigned a value before the old one has been used. 'break;' mis=
sing?
    tp->csr0 =3D csr0 =3D 0;
             ^
   drivers/net/ethernet/dec/tulip/tulip_core.c:1246:11: note: Variable 'tp-=
>csr0' is reassigned a value before the old one has been used. 'break;' mis=
sing?
    tp->csr0 =3D csr0;
             ^
>> drivers/net/ethernet/dec/tulip/tulip.h:132:18: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    CFDD_Sleep =3D (1 << 31),
                    ^
   drivers/net/ethernet/dec/tulip/tulip.h:244:14: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    csr6_sc =3D (1<<31),
                ^
>> drivers/net/ethernet/dec/tulip/winbond-840.c:601:31: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
     int dataval =3D (mii_cmd & (1 << i)) ? MDIO_WRITE1 : MDIO_WRITE0;
                                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D2cafa72e516f61b6d82c2416b4f5963fb48fd9ce
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 2cafa72e516f61b6d82c2416b4f5963fb48fd9ce
vim +/want_tagging +2192 drivers/net/dsa/sja1105/sja1105_main.c

6666cebc5e306f4 Vladimir Oltean 2019-05-02  2122  =

070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2123  /* The TPID setting belon=
gs to the General Parameters table,
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2124   * which can only be part=
ially reconfigured@runtime (and not the TPID).
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2125   * So a switch reset is r=
equired.
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2126   */
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2127  static int sja1105_vlan_f=
iltering(struct dsa_switch *ds, int port, bool enabled)
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2128  {
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2129  	struct sja1105_l2_lookup=
_params_entry *l2_lookup_params;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2130  	struct sja1105_general_p=
arams_entry *general_params;
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2131  	struct sja1105_private *=
priv =3D ds->priv;
7f14937facdca1e Vladimir Oltean 2020-05-12  2132  	enum sja1105_vlan_state =
state;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2133  	struct sja1105_table *ta=
ble;
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2134  	struct sja1105_rule *rul=
e;
2cafa72e516f61b Vladimir Oltean 2020-05-12  2135  	bool want_tagging;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2136  	u16 tpid, tpid2;
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2137  	int rc;
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2138  =

dfacc5a23e227ca Vladimir Oltean 2020-05-05  2139  	list_for_each_entry(rule=
, &priv->flow_block.rules, list) {
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2140  		if (rule->type =3D=3D S=
JA1105_RULE_VL) {
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2141  			dev_err(ds->dev,
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2142  				"Cannot change VLAN f=
iltering state while VL rules are active\n");
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2143  			return -EBUSY;
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2144  		}
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2145  	}
dfacc5a23e227ca Vladimir Oltean 2020-05-05  2146  =

070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2147  	if (enabled) {
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2148  		/* Enable VLAN filterin=
g. */
54fa49ee8813875 Vladimir Oltean 2019-12-27  2149  		tpid  =3D ETH_P_8021Q;
54fa49ee8813875 Vladimir Oltean 2019-12-27  2150  		tpid2 =3D ETH_P_8021AD;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2151  	} else {
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2152  		/* Disable VLAN filteri=
ng. */
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2153  		tpid  =3D ETH_P_SJA1105;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2154  		tpid2 =3D ETH_P_SJA1105;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2155  	}
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2156  =

38b5beeae7a4cde Vladimir Oltean 2020-05-12  2157  	for (port =3D 0; port < =
ds->num_ports; port++) {
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2158  		struct sja1105_port *sp=
 =3D &priv->ports[port];
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2159  =

38b5beeae7a4cde Vladimir Oltean 2020-05-12  2160  		if (enabled)
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2161  			sp->xmit_tpid =3D priv=
->info->qinq_tpid;
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2162  		else
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2163  			sp->xmit_tpid =3D ETH_=
P_SJA1105;
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2164  	}
38b5beeae7a4cde Vladimir Oltean 2020-05-12  2165  =

7f14937facdca1e Vladimir Oltean 2020-05-12  2166  	if (!enabled)
7f14937facdca1e Vladimir Oltean 2020-05-12  2167  		state =3D SJA1105_VLAN_=
UNAWARE;
2cafa72e516f61b Vladimir Oltean 2020-05-12  2168  	else if (priv->best_effo=
rt_vlan_filtering)
2cafa72e516f61b Vladimir Oltean 2020-05-12  2169  		state =3D SJA1105_VLAN_=
BEST_EFFORT;
7f14937facdca1e Vladimir Oltean 2020-05-12  2170  	else
7f14937facdca1e Vladimir Oltean 2020-05-12  2171  		state =3D SJA1105_VLAN_=
FILTERING_FULL;
7f14937facdca1e Vladimir Oltean 2020-05-12  2172  =

cfa36b1fff42266 Vladimir Oltean 2020-05-12  2173  	if (priv->vlan_state =3D=
=3D state)
cfa36b1fff42266 Vladimir Oltean 2020-05-12  2174  		return 0;
cfa36b1fff42266 Vladimir Oltean 2020-05-12  2175  =

7f14937facdca1e Vladimir Oltean 2020-05-12  2176  	priv->vlan_state =3D sta=
te;
2cafa72e516f61b Vladimir Oltean 2020-05-12  2177  	want_tagging =3D (state =
=3D=3D SJA1105_VLAN_UNAWARE ||
2cafa72e516f61b Vladimir Oltean 2020-05-12  2178  			state =3D=3D SJA1105_V=
LAN_BEST_EFFORT);
7f14937facdca1e Vladimir Oltean 2020-05-12  2179  =

070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2180  	table =3D &priv->static_=
config.tables[BLK_IDX_GENERAL_PARAMS];
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2181  	general_params =3D table=
->entries;
f9a1a7646c0d835 Vladimir Oltean 2019-06-08  2182  	/* EtherType used to ide=
ntify inner tagged (C-tag) VLAN traffic */
54fa49ee8813875 Vladimir Oltean 2019-12-27  2183  	general_params->tpid =3D=
 tpid;
54fa49ee8813875 Vladimir Oltean 2019-12-27  2184  	/* EtherType used to ide=
ntify outer tagged (S-tag) VLAN traffic */
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2185  	general_params->tpid2 =
=3D tpid2;
42824463d38d273 Vladimir Oltean 2019-06-08  2186  	/* When VLAN filtering i=
s on, we need to at least be able to
42824463d38d273 Vladimir Oltean 2019-06-08  2187  	 * decode management tra=
ffic through the "backup plan".
42824463d38d273 Vladimir Oltean 2019-06-08  2188  	 */
42824463d38d273 Vladimir Oltean 2019-06-08  2189  	general_params->incl_src=
pt1 =3D enabled;
42824463d38d273 Vladimir Oltean 2019-06-08  2190  	general_params->incl_src=
pt0 =3D enabled;
070ca3bb95e2cd3 Vladimir Oltean 2019-06-08  2191  =

2cafa72e516f61b Vladimir Oltean 2020-05-12 @2192  	want_tagging =3D priv->b=
est_effort_vlan_filtering || !enabled;
2cafa72e516f61b Vladimir Oltean 2020-05-12  2193  =

6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2194  	/* VLAN filtering =3D> i=
ndependent VLAN learning.
2cafa72e516f61b Vladimir Oltean 2020-05-12  2195  	 * No VLAN filtering (or=
 best effort) =3D> shared VLAN learning.
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2196  	 *
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2197  	 * In shared VLAN learni=
ng mode, untagged traffic still gets
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2198  	 * pvid-tagged, and the =
FDB table gets populated with entries
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2199  	 * containing the "real"=
 (pvid or from VLAN tag) VLAN ID.
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2200  	 * However the switch pe=
rforms a masked L2 lookup in the FDB,
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2201  	 * effectively only look=
ing up a frame's DMAC (and not VID) for the
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2202  	 * forwarding decision.
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2203  	 *
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2204  	 * This is extremely con=
venient for us, because in modes with
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2205  	 * vlan_filtering=3D0, d=
sa_8021q actually installs unique pvid's into
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2206  	 * each front panel port=
. This is good for identification but breaks
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2207  	 * learning badly - the =
VID of the learnt FDB entry is unique, aka
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2208  	 * no frames coming from=
 any other port are going to have it. So
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2209  	 * for forwarding purpos=
es, this is as though learning was broken
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2210  	 * (all frames get flood=
ed).
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2211  	 */
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2212  	table =3D &priv->static_=
config.tables[BLK_IDX_L2_LOOKUP_PARAMS];
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2213  	l2_lookup_params =3D tab=
le->entries;
2cafa72e516f61b Vladimir Oltean 2020-05-12  2214  	l2_lookup_params->shared=
_learn =3D want_tagging;
6d7c7d948a2e9f8 Vladimir Oltean 2019-08-05  2215  =

2eea1fa82f681b4 Vladimir Oltean 2019-11-12  2216  	rc =3D sja1105_static_co=
nfig_reload(priv, SJA1105_VLAN_FILTERING);
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2217  	if (rc)
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2218  		dev_err(ds->dev, "Faile=
d to change VLAN Ethertype\n");
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2219  =

227d07a07ef1262 Vladimir Oltean 2019-05-05  2220  	/* Switch port identific=
ation based on 802.1Q is only passable
227d07a07ef1262 Vladimir Oltean 2019-05-05  2221  	 * if we are not under a=
 vlan_filtering bridge. So make sure
2cafa72e516f61b Vladimir Oltean 2020-05-12  2222  	 * the two configuration=
s are mutually exclusive (of course, the
2cafa72e516f61b Vladimir Oltean 2020-05-12  2223  	 * user may know better,=
 i.e. best_effort_vlan_filtering).
227d07a07ef1262 Vladimir Oltean 2019-05-05  2224  	 */
2cafa72e516f61b Vladimir Oltean 2020-05-12  2225  	return sja1105_setup_802=
1q_tagging(ds, want_tagging);
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2226  }
6666cebc5e306f4 Vladimir Oltean 2019-05-02  2227  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3132871694257895660==--

