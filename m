Content-Type: multipart/mixed; boundary="===============6771428527203619380=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next: PATCH v3 3/8] net: dsa: switch to device_/fwnode_ APIs
Date: Thu, 28 Jul 2022 15:22:41 +0800
Message-ID: <202207281516.7lNRXIgu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6771428527203619380==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220727064321.2953971-4-mw@semihalf.com>
References: <20220727064321.2953971-4-mw@semihalf.com>
TO: Marcin Wojtas <mw@semihalf.com>
TO: linux-kernel(a)vger.kernel.org
TO: linux-acpi(a)vger.kernel.org
TO: netdev(a)vger.kernel.org
CC: rafael(a)kernel.org
CC: andriy.shevchenko(a)linux.intel.com
CC: sean.wang(a)mediatek.com
CC: Landen.Chao(a)mediatek.com
CC: linus.walleij(a)linaro.org
CC: andrew(a)lunn.ch
CC: vivien.didelot(a)gmail.com
CC: f.fainelli(a)gmail.com
CC: olteanv(a)gmail.com
CC: davem(a)davemloft.net
CC: edumazet(a)google.com
CC: kuba(a)kernel.org
CC: pabeni(a)redhat.com
CC: linux(a)armlinux.org.uk
CC: hkallweit1(a)gmail.com
CC: gjb(a)semihalf.com
CC: mw(a)semihalf.com
CC: jaz(a)semihalf.com
CC: tn(a)semihalf.com
CC: Samer.El-Haj-Mahmoud(a)arm.com
CC: upstream(a)semihalf.com

Hi Marcin,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220726]
[cannot apply to driver-core/driver-core-testing robh/for-next horms-ipvs/m=
aster linus/master v5.19-rc8 v5.19-rc7 v5.19-rc6 v5.19-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcin-Wojtas/DSA-sw=
itch-to-fwnode_-device_/20220727-144515
base:    058affafc65a74cf54499fb578b66ad0b18f939b
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220728=
/202207281516.7lNRXIgu-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/intel-lab-lkp/linux/commit/0cd0cba4df268433a47=
eb7d7e6c4b657dac14cbc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Marcin-Wojtas/DSA-switch-to-fwnode=
_-device_/20220727-144515
        git checkout 0cd0cba4df268433a47eb7d7e6c4b657dac14cbc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/dsa/mt7530.c: In function 'mt7530_setup':
>> drivers/net/dsa/mt7530.c:2254:63: error: passing argument 2 of 'of_get_p=
hy_mode' from incompatible pointer type [-Werror=3Dincompatible-pointer-typ=
es]
    2254 |                                 ret =3D of_get_phy_mode(mac_np, =
&interface);
         |                                                               ^~=
~~~~~~~~
         |                                                               |
         |                                                               in=
t *
   In file included from drivers/net/dsa/mt7530.c:15:
   include/linux/of_net.h:15:69: note: expected 'phy_interface_t *' but arg=
ument is of type 'int *'
      15 | extern int of_get_phy_mode(struct device_node *np, phy_interface=
_t *interface);
         |                                                    ~~~~~~~~~~~~~=
~~~~^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/of_get_phy_mode +2254 drivers/net/dsa/mt7530.c

ba751e28d442557 DENG Qingfang       2021-05-19  2103  =

b8f126a8d54318b Sean Wang           2017-04-07  2104  static int
b8f126a8d54318b Sean Wang           2017-04-07  2105  mt7530_setup(struct d=
sa_switch *ds)
b8f126a8d54318b Sean Wang           2017-04-07  2106  {
b8f126a8d54318b Sean Wang           2017-04-07  2107  	struct mt7530_priv *=
priv =3D ds->priv;
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2108  	struct device_node *=
dn =3D NULL;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2109  	struct device_n=
ode *phy_node;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2110  	struct device_n=
ode *mac_np;
b8f126a8d54318b Sean Wang           2017-04-07  2111  	struct mt7530_dummy_=
poll p;
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2112  	struct dsa_port *cpu=
_dp;
0cd0cba4df26843 Marcin Wojtas       2022-07-27  2113  	int interface;
ca366d6c889b5d3 Ren=C3=A9 van Dorst      2019-09-02  2114  	u32 id, val;
ca366d6c889b5d3 Ren=C3=A9 van Dorst      2019-09-02  2115  	int ret, i;
b8f126a8d54318b Sean Wang           2017-04-07  2116  =

0abfd494deefdba Vivien Didelot      2017-09-20  2117  	/* The parent node o=
f master netdev which holds the common system
b8f126a8d54318b Sean Wang           2017-04-07  2118  	 * controller also i=
s the container for two GMACs nodes representing
b8f126a8d54318b Sean Wang           2017-04-07  2119  	 * as two netdev ins=
tances.
b8f126a8d54318b Sean Wang           2017-04-07  2120  	 */
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2121  	dsa_switch_for_each_=
cpu_port(cpu_dp, ds) {
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2122  		dn =3D cpu_dp->mast=
er->dev.of_node->parent;
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2123  		/* It doesn't matte=
r which CPU port is found first,
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2124  		 * their masters sh=
ould share the same parent OF node
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2125  		 */
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2126  		break;
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2127  	}
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2128  =

6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2129  	if (!dn) {
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2130  		dev_err(ds->dev, "p=
arent OF node of DSA master not found");
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2131  		return -EINVAL;
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2132  	}
6e19bc26cccdd34 Frank Wunderlich    2022-06-10  2133  =

0b69c54c74bcb60 DENG Qingfang       2021-08-04  2134  	ds->assisted_learnin=
g_on_cpu_port =3D true;
771c8901568dd87 DENG Qingfang       2020-12-11  2135  	ds->mtu_enforcement_=
ingress =3D true;
ddda1ac116c852b Greg Ungerer        2019-01-30  2136  =

ddda1ac116c852b Greg Ungerer        2019-01-30  2137  	if (priv->id =3D=3D =
ID_MT7530) {
b8f126a8d54318b Sean Wang           2017-04-07  2138  		regulator_set_volta=
ge(priv->core_pwr, 1000000, 1000000);
b8f126a8d54318b Sean Wang           2017-04-07  2139  		ret =3D regulator_e=
nable(priv->core_pwr);
b8f126a8d54318b Sean Wang           2017-04-07  2140  		if (ret < 0) {
b8f126a8d54318b Sean Wang           2017-04-07  2141  			dev_err(priv->dev,
b8f126a8d54318b Sean Wang           2017-04-07  2142  				"Failed to enable=
 core power: %d\n", ret);
b8f126a8d54318b Sean Wang           2017-04-07  2143  			return ret;
b8f126a8d54318b Sean Wang           2017-04-07  2144  		}
b8f126a8d54318b Sean Wang           2017-04-07  2145  =

b8f126a8d54318b Sean Wang           2017-04-07  2146  		regulator_set_volta=
ge(priv->io_pwr, 3300000, 3300000);
b8f126a8d54318b Sean Wang           2017-04-07  2147  		ret =3D regulator_e=
nable(priv->io_pwr);
b8f126a8d54318b Sean Wang           2017-04-07  2148  		if (ret < 0) {
b8f126a8d54318b Sean Wang           2017-04-07  2149  			dev_err(priv->dev,=
 "Failed to enable io pwr: %d\n",
b8f126a8d54318b Sean Wang           2017-04-07  2150  				ret);
b8f126a8d54318b Sean Wang           2017-04-07  2151  			return ret;
b8f126a8d54318b Sean Wang           2017-04-07  2152  		}
ddda1ac116c852b Greg Ungerer        2019-01-30  2153  	}
b8f126a8d54318b Sean Wang           2017-04-07  2154  =

b8f126a8d54318b Sean Wang           2017-04-07  2155  	/* Reset whole chip =
through gpio pin or memory-mapped registers for
b8f126a8d54318b Sean Wang           2017-04-07  2156  	 * different type of=
 hardware
b8f126a8d54318b Sean Wang           2017-04-07  2157  	 */
b8f126a8d54318b Sean Wang           2017-04-07  2158  	if (priv->mcm) {
b8f126a8d54318b Sean Wang           2017-04-07  2159  		reset_control_asser=
t(priv->rstc);
b8f126a8d54318b Sean Wang           2017-04-07  2160  		usleep_range(1000, =
1100);
b8f126a8d54318b Sean Wang           2017-04-07  2161  		reset_control_deass=
ert(priv->rstc);
b8f126a8d54318b Sean Wang           2017-04-07  2162  	} else {
b8f126a8d54318b Sean Wang           2017-04-07  2163  		gpiod_set_value_can=
sleep(priv->reset, 0);
b8f126a8d54318b Sean Wang           2017-04-07  2164  		usleep_range(1000, =
1100);
b8f126a8d54318b Sean Wang           2017-04-07  2165  		gpiod_set_value_can=
sleep(priv->reset, 1);
b8f126a8d54318b Sean Wang           2017-04-07  2166  	}
b8f126a8d54318b Sean Wang           2017-04-07  2167  =

b8f126a8d54318b Sean Wang           2017-04-07  2168  	/* Waiting for MT753=
0 got to stable */
b8f126a8d54318b Sean Wang           2017-04-07  2169  	INIT_MT7530_DUMMY_PO=
LL(&p, priv, MT7530_HWTRAP);
b8f126a8d54318b Sean Wang           2017-04-07  2170  	ret =3D readx_poll_t=
imeout(_mt7530_read, &p, val, val !=3D 0,
b8f126a8d54318b Sean Wang           2017-04-07  2171  				 20, 1000000);
b8f126a8d54318b Sean Wang           2017-04-07  2172  	if (ret < 0) {
b8f126a8d54318b Sean Wang           2017-04-07  2173  		dev_err(priv->dev, =
"reset timeout\n");
b8f126a8d54318b Sean Wang           2017-04-07  2174  		return ret;
b8f126a8d54318b Sean Wang           2017-04-07  2175  	}
b8f126a8d54318b Sean Wang           2017-04-07  2176  =

b8f126a8d54318b Sean Wang           2017-04-07  2177  	id =3D mt7530_read(p=
riv, MT7530_CREV);
b8f126a8d54318b Sean Wang           2017-04-07  2178  	id >>=3D CHIP_NAME_S=
HIFT;
b8f126a8d54318b Sean Wang           2017-04-07  2179  	if (id !=3D MT7530_I=
D) {
b8f126a8d54318b Sean Wang           2017-04-07  2180  		dev_err(priv->dev, =
"chip %x can't be supported\n", id);
b8f126a8d54318b Sean Wang           2017-04-07  2181  		return -ENODEV;
b8f126a8d54318b Sean Wang           2017-04-07  2182  	}
b8f126a8d54318b Sean Wang           2017-04-07  2183  =

b8f126a8d54318b Sean Wang           2017-04-07  2184  	/* Reset the switch =
through internal reset */
b8f126a8d54318b Sean Wang           2017-04-07  2185  	mt7530_write(priv, M=
T7530_SYS_CTRL,
b8f126a8d54318b Sean Wang           2017-04-07  2186  		     SYS_CTRL_PHY_R=
ST | SYS_CTRL_SW_RST |
b8f126a8d54318b Sean Wang           2017-04-07  2187  		     SYS_CTRL_REG_R=
ST);
b8f126a8d54318b Sean Wang           2017-04-07  2188  =

b8f126a8d54318b Sean Wang           2017-04-07  2189  	/* Enable Port 6 onl=
y; P5 as GMAC5 which currently is not supported */
b8f126a8d54318b Sean Wang           2017-04-07  2190  	val =3D mt7530_read(=
priv, MT7530_MHWTRAP);
b8f126a8d54318b Sean Wang           2017-04-07  2191  	val &=3D ~MHWTRAP_P6=
_DIS & ~MHWTRAP_PHY_ACCESS;
b8f126a8d54318b Sean Wang           2017-04-07  2192  	val |=3D MHWTRAP_MAN=
UAL;
b8f126a8d54318b Sean Wang           2017-04-07  2193  	mt7530_write(priv, M=
T7530_MHWTRAP, val);
b8f126a8d54318b Sean Wang           2017-04-07  2194  =

ca366d6c889b5d3 Ren=C3=A9 van Dorst      2019-09-02  2195  	priv->p6_interf=
ace =3D PHY_INTERFACE_MODE_NA;
ca366d6c889b5d3 Ren=C3=A9 van Dorst      2019-09-02  2196  =

b8f126a8d54318b Sean Wang           2017-04-07  2197  	/* Enable and reset =
MIB counters */
b8f126a8d54318b Sean Wang           2017-04-07  2198  	mt7530_mib_reset(ds);
b8f126a8d54318b Sean Wang           2017-04-07  2199  =

b8f126a8d54318b Sean Wang           2017-04-07  2200  	for (i =3D 0; i < MT=
7530_NUM_PORTS; i++) {
b8f126a8d54318b Sean Wang           2017-04-07  2201  		/* Disable forwardi=
ng by default on all ports */
b8f126a8d54318b Sean Wang           2017-04-07  2202  		mt7530_rmw(priv, MT=
7530_PCR_P(i), PCR_MATRIX_MASK,
b8f126a8d54318b Sean Wang           2017-04-07  2203  			   PCR_MATRIX_CLR);
b8f126a8d54318b Sean Wang           2017-04-07  2204  =

0b69c54c74bcb60 DENG Qingfang       2021-08-04  2205  		/* Disable learning=
 by default on all ports */
0b69c54c74bcb60 DENG Qingfang       2021-08-04  2206  		mt7530_set(priv, MT=
7530_PSC_P(i), SA_DIS);
0b69c54c74bcb60 DENG Qingfang       2021-08-04  2207  =

0ce0c3cd2239502 Alex Dewar          2020-09-19  2208  		if (dsa_is_cpu_port=
(ds, i)) {
0ce0c3cd2239502 Alex Dewar          2020-09-19  2209  			ret =3D mt753x_cpu=
_port_enable(ds, i);
0ce0c3cd2239502 Alex Dewar          2020-09-19  2210  			if (ret)
0ce0c3cd2239502 Alex Dewar          2020-09-19  2211  				return ret;
5a30833b9a16f8d DENG Qingfang       2021-03-16  2212  		} else {
75104db0cb353ec Andrew Lunn         2019-02-24  2213  			mt7530_port_disabl=
e(ds, i);
6087175b7991a90 DENG Qingfang       2021-08-04  2214  =

6087175b7991a90 DENG Qingfang       2021-08-04  2215  			/* Set default PVI=
D to 0 on all user ports */
6087175b7991a90 DENG Qingfang       2021-08-04  2216  			mt7530_rmw(priv, M=
T7530_PPBV1_P(i), G0_PORT_VID_MASK,
6087175b7991a90 DENG Qingfang       2021-08-04  2217  				   G0_PORT_VID_DE=
F);
5a30833b9a16f8d DENG Qingfang       2021-03-16  2218  		}
e045124e93995fe DENG Qingfang       2020-04-14  2219  		/* Enable consisten=
t egress tag */
e045124e93995fe DENG Qingfang       2020-04-14  2220  		mt7530_rmw(priv, MT=
7530_PVC_P(i), PVC_EG_TAG_MASK,
e045124e93995fe DENG Qingfang       2020-04-14  2221  			   PVC_EG_TAG(MT75=
30_VLAN_EG_CONSISTENT));
b8f126a8d54318b Sean Wang           2017-04-07  2222  	}
b8f126a8d54318b Sean Wang           2017-04-07  2223  =

1ca8a193cade7f4 DENG Qingfang       2021-08-25  2224  	/* Setup VLAN ID 0 f=
or VLAN-unaware bridges */
1ca8a193cade7f4 DENG Qingfang       2021-08-25  2225  	ret =3D mt7530_setup=
_vlan0(priv);
1ca8a193cade7f4 DENG Qingfang       2021-08-25  2226  	if (ret)
1ca8a193cade7f4 DENG Qingfang       2021-08-25  2227  		return ret;
1ca8a193cade7f4 DENG Qingfang       2021-08-25  2228  =

38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2229  	/* Setup port 5=
 */
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2230  	priv->p5_intf_s=
el =3D P5_DISABLED;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2231  	interface =3D P=
HY_INTERFACE_MODE_NA;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2232  =

38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2233  	if (!dsa_is_unu=
sed_port(ds, 5)) {
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2234  		priv->p5_intf_=
sel =3D P5_INTF_SEL_GMAC5;
0cd0cba4df26843 Marcin Wojtas       2022-07-27  2235  		interface =3D fwnod=
e_get_phy_mode(dsa_to_port(ds, 5)->fwnode);
0cd0cba4df26843 Marcin Wojtas       2022-07-27  2236  		if (interface < 0)
0c65b2b90d13c1d Andrew Lunn         2019-11-04  2237  			return ret;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2238  	} else {
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2239  		/* Scan the et=
hernet nodes. look for GMAC1, lookup used phy */
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2240  		for_each_child=
_of_node(dn, mac_np) {
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2241  			if (!of_devic=
e_is_compatible(mac_np,
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2242  						     "medi=
atek,eth-mac"))
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2243  				continue;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2244  =

38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2245  			ret =3D of_pr=
operty_read_u32(mac_np, "reg", &id);
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2246  			if (ret < 0 |=
| id !=3D 1)
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2247  				continue;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2248  =

38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2249  			phy_node =3D =
of_parse_phandle(mac_np, "phy-handle", 0);
0452800f6db4ed0 Chuanhong Guo       2020-04-03  2250  			if (!phy_node)
0452800f6db4ed0 Chuanhong Guo       2020-04-03  2251  				continue;
0452800f6db4ed0 Chuanhong Guo       2020-04-03  2252  =

38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2253  			if (phy_node-=
>parent =3D=3D priv->dev->of_node->parent) {
0c65b2b90d13c1d Andrew Lunn         2019-11-04 @2254  				ret =3D of_get_ph=
y_mode(mac_np, &interface);
8e4efd4706f77d7 Sumera Priyadarsini 2020-08-25  2255  				if (ret && ret !=
=3D -ENODEV) {
8e4efd4706f77d7 Sumera Priyadarsini 2020-08-25  2256  					of_node_put(mac_=
np);
a9e9b091a1c14ec Yang Yingliang      2022-04-28  2257  					of_node_put(phy_=
node);
0c65b2b90d13c1d Andrew Lunn         2019-11-04  2258  					return ret;
8e4efd4706f77d7 Sumera Priyadarsini 2020-08-25  2259  				}
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2260  				id =3D of_md=
io_parse_addr(ds->dev, phy_node);
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2261  				if (id =3D=
=3D 0)
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2262  					priv->p5_in=
tf_sel =3D P5_INTF_SEL_PHY_P0;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2263  				if (id =3D=
=3D 4)
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2264  					priv->p5_in=
tf_sel =3D P5_INTF_SEL_PHY_P4;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2265  			}
8e4efd4706f77d7 Sumera Priyadarsini 2020-08-25  2266  			of_node_put(mac_np=
);
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2267  			of_node_put(p=
hy_node);
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2268  			break;
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2269  		}
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2270  	}
38f790a805609b2 Ren=C3=A9 van Dorst      2019-09-02  2271  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6771428527203619380==--

