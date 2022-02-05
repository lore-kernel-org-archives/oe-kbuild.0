Content-Type: multipart/mixed; boundary="===============8767992527271058669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/qca8k.c:2315:44: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Sat, 05 Feb 2022 19:05:14 +0800
Message-ID: <202202051718.R4W0KGUN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8767992527271058669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ansuel Smith <ansuelsmth@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0457e5153e0e8420134f60921349099e907264ca
commit: def975307c01191b6f0170048c3724b0ed3348af net: dsa: qca8k: add LAG s=
upport
date:   2 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 2 months ago
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/dev.c:1596:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(UP) N(DOWN) N(REBOOT) N(CHANGE) N(REGISTER) N(UNREGISTER)
    ^
   net/core/dev.c:1597:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(CHANGEMTU) N(CHANGEADDR) N(GOING_DOWN) N(CHANGENAME) N(FEAT_CHANGE)
    ^
   net/core/dev.c:1598:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(BONDING_FAILOVER) N(PRE_UP) N(PRE_TYPE_CHANGE) N(POST_TYPE_CHANGE)
    ^
   net/core/dev.c:1599:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(POST_INIT) N(RELEASE) N(NOTIFY_PEERS) N(JOIN) N(CHANGEUPPER)
    ^
   net/core/dev.c:1600:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(RESEND_IGMP) N(PRECHANGEMTU) N(CHANGEINFODATA) N(BONDING_INFO)
    ^
   net/core/dev.c:1601:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(PRECHANGEUPPER) N(CHANGELOWERSTATE) N(UDP_TUNNEL_PUSH_INFO)
    ^
   net/core/dev.c:1602:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(UDP_TUNNEL_DROP_INFO) N(CHANGE_TX_QUEUE_LEN)
    ^
   net/core/dev.c:1603:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(CVLAN_FILTER_PUSH_INFO) N(CVLAN_FILTER_DROP_INFO)
    ^
   net/core/dev.c:1604:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(SVLAN_FILTER_PUSH_INFO) N(SVLAN_FILTER_DROP_INFO)
    ^
   net/core/dev.c:1605:2: warning: Returning an integer in a function with =
pointer return type is not portable. [CastIntegerToAddressAtReturn]
    N(PRE_CHANGEADDR)
    ^
>> net/core/dev.c:6718:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &upper->list;
    ^
   net/core/dev.c:6735:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &upper->list;
    ^
   net/core/dev.c:6753:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &upper->list;
    ^
   net/core/dev.c:6917:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &lower->list;
    ^
   net/core/dev.c:6959:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &lower->list;
    ^
   net/core/dev.c:6975:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &lower->list;
    ^
   net/core/dev.c:7086:2: warning: Address of local auto-variable assigned =
to a function parameter. [autoVariables]
    *iter =3D &lower->list;
    ^
>> net/ipv4/tcp_input.c:3465:2: warning: Non-boolean value returned from fu=
nction returning bool [returnNonBoolInBooleanFunction]
    return flag & FLAG_DATA_ACKED;
    ^
>> drivers/net/dsa/qca8k.c:2315:44: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
        !val << QCA8K_REG_GOL_TRUNK_SHIFT(id) |
                                              ^
   drivers/net/dsa/qca8k.c:2353:61: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
         !delete << QCA8K_REG_GOL_TRUNK_ID_MEM_ID_SHIFT(id, i) |
                                                               ^
>> drivers/net/dsa/qca8k.c:693:52: warning: Uninitialized variable: val [un=
initvar]
    ret =3D read_poll_timeout(qca8k_mii_read32, ret1, !(val & mask), 0,
                                                      ^

vim +2315 drivers/net/dsa/qca8k.c

def975307c0119 Ansuel Smith 2021-11-23  2287  =

def975307c0119 Ansuel Smith 2021-11-23  2288  static int
def975307c0119 Ansuel Smith 2021-11-23  2289  qca8k_lag_refresh_portmap(str=
uct dsa_switch *ds, int port,
def975307c0119 Ansuel Smith 2021-11-23  2290  			  struct net_device *lag, =
bool delete)
def975307c0119 Ansuel Smith 2021-11-23  2291  {
def975307c0119 Ansuel Smith 2021-11-23  2292  	struct qca8k_priv *priv =3D =
ds->priv;
def975307c0119 Ansuel Smith 2021-11-23  2293  	int ret, id, i;
def975307c0119 Ansuel Smith 2021-11-23  2294  	u32 val;
def975307c0119 Ansuel Smith 2021-11-23  2295  =

def975307c0119 Ansuel Smith 2021-11-23  2296  	id =3D dsa_lag_id(ds->dst, l=
ag);
def975307c0119 Ansuel Smith 2021-11-23  2297  =

def975307c0119 Ansuel Smith 2021-11-23  2298  	/* Read current port member =
*/
def975307c0119 Ansuel Smith 2021-11-23  2299  	ret =3D regmap_read(priv->re=
gmap, QCA8K_REG_GOL_TRUNK_CTRL0, &val);
def975307c0119 Ansuel Smith 2021-11-23  2300  	if (ret)
def975307c0119 Ansuel Smith 2021-11-23  2301  		return ret;
def975307c0119 Ansuel Smith 2021-11-23  2302  =

def975307c0119 Ansuel Smith 2021-11-23  2303  	/* Shift val to the correct =
trunk */
def975307c0119 Ansuel Smith 2021-11-23  2304  	val >>=3D QCA8K_REG_GOL_TRUN=
K_SHIFT(id);
def975307c0119 Ansuel Smith 2021-11-23  2305  	val &=3D QCA8K_REG_GOL_TRUNK=
_MEMBER_MASK;
def975307c0119 Ansuel Smith 2021-11-23  2306  	if (delete)
def975307c0119 Ansuel Smith 2021-11-23  2307  		val &=3D ~BIT(port);
def975307c0119 Ansuel Smith 2021-11-23  2308  	else
def975307c0119 Ansuel Smith 2021-11-23  2309  		val |=3D BIT(port);
def975307c0119 Ansuel Smith 2021-11-23  2310  =

def975307c0119 Ansuel Smith 2021-11-23  2311  	/* Update port member. With =
empty portmap disable trunk */
def975307c0119 Ansuel Smith 2021-11-23  2312  	ret =3D regmap_update_bits(p=
riv->regmap, QCA8K_REG_GOL_TRUNK_CTRL0,
def975307c0119 Ansuel Smith 2021-11-23  2313  				 QCA8K_REG_GOL_TRUNK_MEMB=
ER(id) |
def975307c0119 Ansuel Smith 2021-11-23  2314  				 QCA8K_REG_GOL_TRUNK_EN(i=
d),
def975307c0119 Ansuel Smith 2021-11-23 @2315  				 !val << QCA8K_REG_GOL_TR=
UNK_SHIFT(id) |
def975307c0119 Ansuel Smith 2021-11-23  2316  				 val << QCA8K_REG_GOL_TRU=
NK_SHIFT(id));
def975307c0119 Ansuel Smith 2021-11-23  2317  =

def975307c0119 Ansuel Smith 2021-11-23  2318  	/* Search empty member if ad=
ding or port on deleting */
def975307c0119 Ansuel Smith 2021-11-23  2319  	for (i =3D 0; i < QCA8K_NUM_=
PORTS_FOR_LAG; i++) {
def975307c0119 Ansuel Smith 2021-11-23  2320  		ret =3D regmap_read(priv->r=
egmap, QCA8K_REG_GOL_TRUNK_CTRL(id), &val);
def975307c0119 Ansuel Smith 2021-11-23  2321  		if (ret)
def975307c0119 Ansuel Smith 2021-11-23  2322  			return ret;
def975307c0119 Ansuel Smith 2021-11-23  2323  =

def975307c0119 Ansuel Smith 2021-11-23  2324  		val >>=3D QCA8K_REG_GOL_TRU=
NK_ID_MEM_ID_SHIFT(id, i);
def975307c0119 Ansuel Smith 2021-11-23  2325  		val &=3D QCA8K_REG_GOL_TRUN=
K_ID_MEM_ID_MASK;
def975307c0119 Ansuel Smith 2021-11-23  2326  =

def975307c0119 Ansuel Smith 2021-11-23  2327  		if (delete) {
def975307c0119 Ansuel Smith 2021-11-23  2328  			/* If port flagged to be d=
isabled assume this member is
def975307c0119 Ansuel Smith 2021-11-23  2329  			 * empty
def975307c0119 Ansuel Smith 2021-11-23  2330  			 */
def975307c0119 Ansuel Smith 2021-11-23  2331  			if (val !=3D QCA8K_REG_GOL=
_TRUNK_ID_MEM_ID_EN_MASK)
def975307c0119 Ansuel Smith 2021-11-23  2332  				continue;
def975307c0119 Ansuel Smith 2021-11-23  2333  =

def975307c0119 Ansuel Smith 2021-11-23  2334  			val &=3D QCA8K_REG_GOL_TRU=
NK_ID_MEM_ID_PORT_MASK;
def975307c0119 Ansuel Smith 2021-11-23  2335  			if (val !=3D port)
def975307c0119 Ansuel Smith 2021-11-23  2336  				continue;
def975307c0119 Ansuel Smith 2021-11-23  2337  		} else {
def975307c0119 Ansuel Smith 2021-11-23  2338  			/* If port flagged to be e=
nabled assume this member is
def975307c0119 Ansuel Smith 2021-11-23  2339  			 * already set
def975307c0119 Ansuel Smith 2021-11-23  2340  			 */
def975307c0119 Ansuel Smith 2021-11-23  2341  			if (val =3D=3D QCA8K_REG_G=
OL_TRUNK_ID_MEM_ID_EN_MASK)
def975307c0119 Ansuel Smith 2021-11-23  2342  				continue;
def975307c0119 Ansuel Smith 2021-11-23  2343  		}
def975307c0119 Ansuel Smith 2021-11-23  2344  =

def975307c0119 Ansuel Smith 2021-11-23  2345  		/* We have found the member=
 to add/remove */
def975307c0119 Ansuel Smith 2021-11-23  2346  		break;
def975307c0119 Ansuel Smith 2021-11-23  2347  	}
def975307c0119 Ansuel Smith 2021-11-23  2348  =

def975307c0119 Ansuel Smith 2021-11-23  2349  	/* Set port in the correct p=
ort mask or disable port if in delete mode */
def975307c0119 Ansuel Smith 2021-11-23  2350  	return regmap_update_bits(pr=
iv->regmap, QCA8K_REG_GOL_TRUNK_CTRL(id),
def975307c0119 Ansuel Smith 2021-11-23  2351  				  QCA8K_REG_GOL_TRUNK_ID_=
MEM_ID_EN(id, i) |
def975307c0119 Ansuel Smith 2021-11-23  2352  				  QCA8K_REG_GOL_TRUNK_ID_=
MEM_ID_PORT(id, i),
def975307c0119 Ansuel Smith 2021-11-23  2353  				  !delete << QCA8K_REG_GO=
L_TRUNK_ID_MEM_ID_SHIFT(id, i) |
def975307c0119 Ansuel Smith 2021-11-23  2354  				  port << QCA8K_REG_GOL_T=
RUNK_ID_MEM_ID_SHIFT(id, i));
def975307c0119 Ansuel Smith 2021-11-23  2355  }
def975307c0119 Ansuel Smith 2021-11-23  2356  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8767992527271058669==--

