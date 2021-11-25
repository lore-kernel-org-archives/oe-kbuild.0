Content-Type: multipart/mixed; boundary="===============6998703659800319553=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3051/3376] drivers/net/dsa/qca8k.c:2315:44: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Thu, 25 Nov 2021 11:29:16 +0800
Message-ID: <202111251127.5Nwjk3kr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6998703659800319553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ansuel Smith <ansuelsmth@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4b74e088fef6ce8cc513f935ce236c38bdf5f67b
commit: def975307c01191b6f0170048c3724b0ed3348af [3051/3376] net: dsa: qca8=
k: add LAG support
:::::: branch date: 22 hours ago
:::::: commit date: 2 days ago
compiler: mips-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/core/net-sysfs.c:822:8: warning: snprintf format string requires 2 p=
arameters but only 1 is given. [wrongPrintfScanfArgNum]
    len =3D snprintf(buf, PAGE_SIZE, "%*pbn", cpumask_pr_args(mask));
          ^
>> net/mptcp/options.c:590:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D map_size;
     ^
   net/mptcp/options.c:866:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D opt_size;
     ^
>> drivers/net/dsa/qca8k.c:2315:44: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
        !val << QCA8K_REG_GOL_TRUNK_SHIFT(id) |
                                              ^
   drivers/net/dsa/qca8k.c:2353:61: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
         !delete << QCA8K_REG_GOL_TRUNK_ID_MEM_ID_SHIFT(id, i) |
                                                               ^
>> drivers/net/veth.c:1509:18: warning: Boolean result is used in bitwise o=
peration. Clarify expression with parentheses. [clarifyCondition]
    if ((!!old_prog ^ !!prog) && peer)
                    ^
>> drivers/net/veth.c:146:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
       ^
   drivers/net/veth.c:154:5: warning: %u in format string (no. 1) requires =
'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType=
_uint]
       snprintf(p, ETH_GSTRING_LEN,
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
--===============6998703659800319553==--

