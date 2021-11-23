Content-Type: multipart/mixed; boundary="===============1633472529898264772=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/qca8k.c:1336:4: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 24 Nov 2021 07:11:46 +0800
Message-ID: <202111240705.c9SRBRSA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1633472529898264772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ansuel Smith <ansuelsmth@gmail.com>
CC: Matthew Hagan <mnhagan88@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   136057256686de39cc3a07c2e39ef6bc43003ff6
commit: 6c43809bf1bee76c434e365a26546a92a5fbec14 net: dsa: qca8k: add suppo=
rt for sgmii falling edge
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-c007-20211028 (https://download.01.org/0day-ci/ar=
chive/20211124/202111240705.c9SRBRSA-lkp(a)intel.com/config.gz)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db756=
8a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6c43809bf1bee76c434e365a26546a92a5fbec14
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6c43809bf1bee76c434e365a26546a92a5fbec14
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca8k.c:461:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/net/dsa/qca8k.c:461:2: note: Taking false branch
           if (ret)
           ^
   drivers/net/dsa/qca8k.c:465:8: note: Calling 'qca8k_busy_wait'
           ret =3D qca8k_busy_wait(priv, QCA8K_REG_VTU_FUNC1, QCA8K_VTU_FUN=
C1_BUSY);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/net/dsa/qca8k.c:291:2: note: 'val' declared without an initial v=
alue
           u32 val;
           ^~~~~~~
   drivers/net/dsa/qca8k.c:293:8: note: '__sleep_us' is equal to 0
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                 ^
   include/linux/iopoll.h:42:17: note: expanded from macro 'read_poll_timeo=
ut'
           might_sleep_if((__sleep_us) !=3D 0); \
                          ^~~~~~~~~~~~
   include/linux/kernel.h:183:39: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                         ^~~~
   drivers/net/dsa/qca8k.c:293:8: note: Taking false branch
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                 ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:35: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                     ^
   drivers/net/dsa/qca8k.c:293:8: note: Loop condition is false.  Exiting l=
oop
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                 ^
   include/linux/iopoll.h:42:2: note: expanded from macro 'read_poll_timeou=
t'
           might_sleep_if((__sleep_us) !=3D 0); \
           ^
   include/linux/kernel.h:183:30: note: expanded from macro 'might_sleep_if'
   #define might_sleep_if(cond) do { if (cond) might_sleep(); } while (0)
                                ^
   drivers/net/dsa/qca8k.c:293:8: note: Left side of '&&' is false
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                 ^
   include/linux/iopoll.h:43:24: note: expanded from macro 'read_poll_timeo=
ut'
           if (sleep_before_read && __sleep_us) \
                                 ^
   drivers/net/dsa/qca8k.c:293:8: note: Loop condition is true.  Entering l=
oop body
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                 ^
   include/linux/iopoll.h:45:2: note: expanded from macro 'read_poll_timeou=
t'
           for (;;) { \
           ^
   drivers/net/dsa/qca8k.c:293:26: note: Calling 'qca8k_read'
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                                   ^
   include/linux/iopoll.h:46:11: note: expanded from macro 'read_poll_timeo=
ut'
                   (val) =3D op(args); \
                           ^~~~~~~~
   drivers/net/dsa/qca8k.c:163:6: note: Assuming 'ret' is < 0
           if (ret < 0)
               ^~~~~~~
   drivers/net/dsa/qca8k.c:163:2: note: Taking true branch
           if (ret < 0)
           ^
   drivers/net/dsa/qca8k.c:164:3: note: Control jumps to line 169
                   goto exit;
                   ^
   drivers/net/dsa/qca8k.c:170:2: note: Returning without writing to '*val'
           return ret;
           ^
   drivers/net/dsa/qca8k.c:293:26: note: Returning from 'qca8k_read'
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                                   ^
   include/linux/iopoll.h:46:11: note: expanded from macro 'read_poll_timeo=
ut'
                   (val) =3D op(args); \
                           ^~~~~~~~
   drivers/net/dsa/qca8k.c:293:50: note: The left operand of '&' is a garba=
ge value
           ret =3D read_poll_timeout(qca8k_read, ret1, !(val & mask),
                                                           ^
   include/linux/iopoll.h:47:7: note: expanded from macro 'read_poll_timeou=
t'
                   if (cond) \
                       ^~~~
   drivers/net/dsa/qca8k.c:906:11: warning: The left operand of '!=3D' is a=
 garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           if (mode !=3D PHY_INTERFACE_MODE_RGMII_ID &&
               ~~~~ ^
   drivers/net/dsa/qca8k.c:895:2: note: 'mode' declared without an initial =
value
           phy_interface_t mode;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca8k.c:905:2: note: Calling 'of_get_phy_mode'
           of_get_phy_mode(port_dn, &mode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/of_net.h:23:2: note: Returning without writing to '*interf=
ace'
           return -ENODEV;
           ^
   drivers/net/dsa/qca8k.c:905:2: note: Returning from 'of_get_phy_mode'
           of_get_phy_mode(port_dn, &mode);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca8k.c:906:11: note: The left operand of '!=3D' is a ga=
rbage value
           if (mode !=3D PHY_INTERFACE_MODE_RGMII_ID &&
               ~~~~ ^
>> drivers/net/dsa/qca8k.c:1336:4: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                           ret =3D qca8k_rmw(priv, reg,
                           ^     ~~~~~~~~~~~~~~~~~~~~
   drivers/net/dsa/qca8k.c:1336:4: note: Value stored to 'ret' is never read
                           ret =3D qca8k_rmw(priv, reg,
                           ^     ~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   kernel/rseq.c:86:6: warning: Value stored to 'cpu_id' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           u32 cpu_id =3D raw_smp_processor_id();
               ^~~~~~
   kernel/rseq.c:86:6: note: Value stored to 'cpu_id' during its initializa=
tion is never read
           u32 cpu_id =3D raw_smp_processor_id();
               ^~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/w1/slaves/w1_therm.c:159:8: warning: Excessive padding in 'struc=
t w1_therm_family_converter' (12 padding bytes, where 4 is optimal). =

   Optimal fields order: =

   f, =

   convert, =

   get_conversion_time, =

   set_resolution, =

   get_resolution, =

   write_data, =

   reserved, =

   broken, =

   bulk_read, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct w1_therm_family_converter {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:159:8: note: Excessive padding in 'struct w=
1_therm_family_converter' (12 padding bytes, where 4 is optimal). Optimal f=
ields order: f, convert, get_conversion_time, set_resolution, get_resolutio=
n, write_data, reserved, broken, bulk_read, consider reordering the fields =
or adding explicit padding members
   struct w1_therm_family_converter {
   ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:1252:5: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1252:5: note: Value stored to 'ret' is neve=
r read
                                   ret =3D -EIO;
                                   ^     ~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:1799:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(p_args, buf);
           ^~~~~~
   drivers/w1/slaves/w1_therm.c:2090:22: warning: The right operand of '=3D=
=3D' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2067:6: note: Assuming the condition is fal=
se
           if (w1_reset_bus(sl->master))
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2067:2: note: Taking false branch
           if (w1_reset_bus(sl->master))
           ^
   drivers/w1/slaves/w1_therm.c:2077:6: note: Assuming 'ack' is equal to W1=
_42_SUCCESS_CONFIRM_BYTE
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2077:2: note: Taking false branch
           if (ack !=3D W1_42_SUCCESS_CONFIRM_BYTE)
           ^
   drivers/w1/slaves/w1_therm.c:2081:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i <=3D 64; i++) {
           ^
   drivers/w1/slaves/w1_therm.c:2082:7: note: Assuming the condition is fal=
se
                   if (w1_reset_bus(sl->master))
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2082:3: note: Taking false branch
                   if (w1_reset_bus(sl->master))
                   ^
   drivers/w1/slaves/w1_therm.c:2088:7: note: Assuming field 'family' is no=
t equal to W1_42_FINISHED_BYTE
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/w1/slaves/w1_therm.c:2088:3: note: Taking false branch
                   if (reg_num->family =3D=3D W1_42_FINISHED_BYTE)
                   ^
   drivers/w1/slaves/w1_therm.c:2090:22: note: The right operand of '=3D=3D=
' is a garbage value
                   if (sl->reg_num.id =3D=3D reg_num->id)
                                      ^  ~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/mtd/devices/phram.c:231:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(str, val);
           ^~~~~~

vim +/ret +1336 drivers/net/dsa/qca8k.c

6b93fb46480a9c John Crispin      2016-09-15  1210  =

9bb2289f90e671 Michal Vok=C3=A1=C4=8D      2018-05-23  1211  static void
b3591c2a366167 Jonathan McDowell 2020-06-20  1212  qca8k_phylink_mac_config=
(struct dsa_switch *ds, int port, unsigned int mode,
b3591c2a366167 Jonathan McDowell 2020-06-20  1213  			 const struct phylink=
_link_state *state)
9bb2289f90e671 Michal Vok=C3=A1=C4=8D      2018-05-23  1214  {
9bb2289f90e671 Michal Vok=C3=A1=C4=8D      2018-05-23  1215  	struct qca8k_=
priv *priv =3D ds->priv;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1216  	u32 reg, val;
9fe99de01440d9 Yang Yingliang    2021-05-29  1217  	int ret;
9bb2289f90e671 Michal Vok=C3=A1=C4=8D      2018-05-23  1218  =

b3591c2a366167 Jonathan McDowell 2020-06-20  1219  	switch (port) {
b3591c2a366167 Jonathan McDowell 2020-06-20  1220  	case 0: /* 1st CPU port=
 */
b3591c2a366167 Jonathan McDowell 2020-06-20  1221  		if (state->interface !=
=3D PHY_INTERFACE_MODE_RGMII &&
b3591c2a366167 Jonathan McDowell 2020-06-20  1222  		    state->interface !=
=3D PHY_INTERFACE_MODE_RGMII_ID &&
e4b9977cee1583 Ansuel Smith      2021-05-14  1223  		    state->interface !=
=3D PHY_INTERFACE_MODE_RGMII_TXID &&
e4b9977cee1583 Ansuel Smith      2021-05-14  1224  		    state->interface !=
=3D PHY_INTERFACE_MODE_RGMII_RXID &&
b3591c2a366167 Jonathan McDowell 2020-06-20  1225  		    state->interface !=
=3D PHY_INTERFACE_MODE_SGMII)
b3591c2a366167 Jonathan McDowell 2020-06-20  1226  			return;
b3591c2a366167 Jonathan McDowell 2020-06-20  1227  =

b3591c2a366167 Jonathan McDowell 2020-06-20  1228  		reg =3D QCA8K_REG_PORT=
0_PAD_CTRL;
b3591c2a366167 Jonathan McDowell 2020-06-20  1229  		break;
b3591c2a366167 Jonathan McDowell 2020-06-20  1230  	case 1:
b3591c2a366167 Jonathan McDowell 2020-06-20  1231  	case 2:
b3591c2a366167 Jonathan McDowell 2020-06-20  1232  	case 3:
b3591c2a366167 Jonathan McDowell 2020-06-20  1233  	case 4:
b3591c2a366167 Jonathan McDowell 2020-06-20  1234  	case 5:
b3591c2a366167 Jonathan McDowell 2020-06-20  1235  		/* Internal PHY, nothi=
ng to do */
b3591c2a366167 Jonathan McDowell 2020-06-20  1236  		return;
b3591c2a366167 Jonathan McDowell 2020-06-20  1237  	case 6: /* 2nd CPU port=
 / external PHY */
b3591c2a366167 Jonathan McDowell 2020-06-20  1238  		if (state->interface !=
=3D PHY_INTERFACE_MODE_RGMII &&
b3591c2a366167 Jonathan McDowell 2020-06-20  1239  		    state->interface !=
=3D PHY_INTERFACE_MODE_RGMII_ID &&
e4b9977cee1583 Ansuel Smith      2021-05-14  1240  		    state->interface !=
=3D PHY_INTERFACE_MODE_RGMII_TXID &&
e4b9977cee1583 Ansuel Smith      2021-05-14  1241  		    state->interface !=
=3D PHY_INTERFACE_MODE_RGMII_RXID &&
b3591c2a366167 Jonathan McDowell 2020-06-20  1242  		    state->interface !=
=3D PHY_INTERFACE_MODE_SGMII &&
b3591c2a366167 Jonathan McDowell 2020-06-20  1243  		    state->interface !=
=3D PHY_INTERFACE_MODE_1000BASEX)
b3591c2a366167 Jonathan McDowell 2020-06-20  1244  			return;
b3591c2a366167 Jonathan McDowell 2020-06-20  1245  =

b3591c2a366167 Jonathan McDowell 2020-06-20  1246  		reg =3D QCA8K_REG_PORT=
6_PAD_CTRL;
b3591c2a366167 Jonathan McDowell 2020-06-20  1247  		break;
b3591c2a366167 Jonathan McDowell 2020-06-20  1248  	default:
b3591c2a366167 Jonathan McDowell 2020-06-20  1249  		dev_err(ds->dev, "%s: =
unsupported port: %i\n", __func__, port);
9bb2289f90e671 Michal Vok=C3=A1=C4=8D      2018-05-23  1250  		return;
b3591c2a366167 Jonathan McDowell 2020-06-20  1251  	}
9bb2289f90e671 Michal Vok=C3=A1=C4=8D      2018-05-23  1252  =

b3591c2a366167 Jonathan McDowell 2020-06-20  1253  	if (port !=3D 6 && phyl=
ink_autoneg_inband(mode)) {
b3591c2a366167 Jonathan McDowell 2020-06-20  1254  		dev_err(ds->dev, "%s: =
in-band negotiation unsupported\n",
b3591c2a366167 Jonathan McDowell 2020-06-20  1255  			__func__);
b3591c2a366167 Jonathan McDowell 2020-06-20  1256  		return;
b3591c2a366167 Jonathan McDowell 2020-06-20  1257  	}
b3591c2a366167 Jonathan McDowell 2020-06-20  1258  =

b3591c2a366167 Jonathan McDowell 2020-06-20  1259  	switch (state->interfac=
e) {
b3591c2a366167 Jonathan McDowell 2020-06-20  1260  	case PHY_INTERFACE_MODE=
_RGMII:
b3591c2a366167 Jonathan McDowell 2020-06-20  1261  		/* RGMII mode means no=
 delay so don't enable the delay */
b3591c2a366167 Jonathan McDowell 2020-06-20  1262  		qca8k_write(priv, reg,=
 QCA8K_PORT_PAD_RGMII_EN);
b3591c2a366167 Jonathan McDowell 2020-06-20  1263  		break;
b3591c2a366167 Jonathan McDowell 2020-06-20  1264  	case PHY_INTERFACE_MODE=
_RGMII_ID:
e4b9977cee1583 Ansuel Smith      2021-05-14  1265  	case PHY_INTERFACE_MODE=
_RGMII_TXID:
e4b9977cee1583 Ansuel Smith      2021-05-14  1266  	case PHY_INTERFACE_MODE=
_RGMII_RXID:
b3591c2a366167 Jonathan McDowell 2020-06-20  1267  		/* RGMII_ID needs inte=
rnal delay. This is enabled through
b3591c2a366167 Jonathan McDowell 2020-06-20  1268  		 * PORT5_PAD_CTRL for =
all ports, rather than individual port
b3591c2a366167 Jonathan McDowell 2020-06-20  1269  		 * registers
b3591c2a366167 Jonathan McDowell 2020-06-20  1270  		 */
b3591c2a366167 Jonathan McDowell 2020-06-20  1271  		qca8k_write(priv, reg,
b3591c2a366167 Jonathan McDowell 2020-06-20  1272  			    QCA8K_PORT_PAD_RG=
MII_EN |
e4b9977cee1583 Ansuel Smith      2021-05-14  1273  			    QCA8K_PORT_PAD_RG=
MII_TX_DELAY(priv->rgmii_tx_delay) |
e4b9977cee1583 Ansuel Smith      2021-05-14  1274  			    QCA8K_PORT_PAD_RG=
MII_RX_DELAY(priv->rgmii_rx_delay) |
e4b9977cee1583 Ansuel Smith      2021-05-14  1275  			    QCA8K_PORT_PAD_RG=
MII_TX_DELAY_EN |
e4b9977cee1583 Ansuel Smith      2021-05-14  1276  			    QCA8K_PORT_PAD_RG=
MII_RX_DELAY_EN);
5bf9ff3b9fb5ec Ansuel Smith      2021-05-14  1277  		/* QCA8337 requires to=
 set rgmii rx delay */
5bf9ff3b9fb5ec Ansuel Smith      2021-05-14  1278  		if (priv->switch_id =
=3D=3D QCA8K_ID_QCA8337)
b3591c2a366167 Jonathan McDowell 2020-06-20  1279  			qca8k_write(priv, QCA=
8K_REG_PORT5_PAD_CTRL,
b3591c2a366167 Jonathan McDowell 2020-06-20  1280  				    QCA8K_PORT_PAD_R=
GMII_RX_DELAY_EN);
b3591c2a366167 Jonathan McDowell 2020-06-20  1281  		break;
b3591c2a366167 Jonathan McDowell 2020-06-20  1282  	case PHY_INTERFACE_MODE=
_SGMII:
b3591c2a366167 Jonathan McDowell 2020-06-20  1283  	case PHY_INTERFACE_MODE=
_1000BASEX:
b3591c2a366167 Jonathan McDowell 2020-06-20  1284  		/* Enable SGMII on the=
 port */
b3591c2a366167 Jonathan McDowell 2020-06-20  1285  		qca8k_write(priv, reg,=
 QCA8K_PORT_PAD_SGMII_EN);
f6dadd559886f8 Jonathan McDowell 2020-06-20  1286  =

f6dadd559886f8 Jonathan McDowell 2020-06-20  1287  		/* Enable/disable SerD=
es auto-negotiation as necessary */
9fe99de01440d9 Yang Yingliang    2021-05-29  1288  		ret =3D qca8k_read(pri=
v, QCA8K_REG_PWS, &val);
9fe99de01440d9 Yang Yingliang    2021-05-29  1289  		if (ret)
9fe99de01440d9 Yang Yingliang    2021-05-29  1290  			return;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1291  		if (phylink_autoneg_in=
band(mode))
f6dadd559886f8 Jonathan McDowell 2020-06-20  1292  			val &=3D ~QCA8K_PWS_S=
ERDES_AEN_DIS;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1293  		else
f6dadd559886f8 Jonathan McDowell 2020-06-20  1294  			val |=3D QCA8K_PWS_SE=
RDES_AEN_DIS;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1295  		qca8k_write(priv, QCA8=
K_REG_PWS, val);
f6dadd559886f8 Jonathan McDowell 2020-06-20  1296  =

f6dadd559886f8 Jonathan McDowell 2020-06-20  1297  		/* Configure the SGMII=
 parameters */
9fe99de01440d9 Yang Yingliang    2021-05-29  1298  		ret =3D qca8k_read(pri=
v, QCA8K_REG_SGMII_CTRL, &val);
9fe99de01440d9 Yang Yingliang    2021-05-29  1299  		if (ret)
9fe99de01440d9 Yang Yingliang    2021-05-29  1300  			return;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1301  =

f6dadd559886f8 Jonathan McDowell 2020-06-20  1302  		val |=3D QCA8K_SGMII_E=
N_PLL | QCA8K_SGMII_EN_RX |
f6dadd559886f8 Jonathan McDowell 2020-06-20  1303  			QCA8K_SGMII_EN_TX | Q=
CA8K_SGMII_EN_SD;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1304  =

f6dadd559886f8 Jonathan McDowell 2020-06-20  1305  		if (dsa_is_cpu_port(ds=
, port)) {
f6dadd559886f8 Jonathan McDowell 2020-06-20  1306  			/* CPU port, we're ta=
lking to the CPU MAC, be a PHY */
f6dadd559886f8 Jonathan McDowell 2020-06-20  1307  			val &=3D ~QCA8K_SGMII=
_MODE_CTRL_MASK;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1308  			val |=3D QCA8K_SGMII_=
MODE_CTRL_PHY;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1309  		} else if (state->inte=
rface =3D=3D PHY_INTERFACE_MODE_SGMII) {
f6dadd559886f8 Jonathan McDowell 2020-06-20  1310  			val &=3D ~QCA8K_SGMII=
_MODE_CTRL_MASK;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1311  			val |=3D QCA8K_SGMII_=
MODE_CTRL_MAC;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1312  		} else if (state->inte=
rface =3D=3D PHY_INTERFACE_MODE_1000BASEX) {
f6dadd559886f8 Jonathan McDowell 2020-06-20  1313  			val &=3D ~QCA8K_SGMII=
_MODE_CTRL_MASK;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1314  			val |=3D QCA8K_SGMII_=
MODE_CTRL_BASEX;
f6dadd559886f8 Jonathan McDowell 2020-06-20  1315  		}
f6dadd559886f8 Jonathan McDowell 2020-06-20  1316  =

f6dadd559886f8 Jonathan McDowell 2020-06-20  1317  		qca8k_write(priv, QCA8=
K_REG_SGMII_CTRL, val);
6c43809bf1bee7 Ansuel Smith      2021-10-14  1318  =

6c43809bf1bee7 Ansuel Smith      2021-10-14  1319  		/* For qca8327/qca8328=
/qca8334/qca8338 sgmii is unique and
6c43809bf1bee7 Ansuel Smith      2021-10-14  1320  		 * falling edge is set=
 writing in the PORT0 PAD reg
6c43809bf1bee7 Ansuel Smith      2021-10-14  1321  		 */
6c43809bf1bee7 Ansuel Smith      2021-10-14  1322  		if (priv->switch_id =
=3D=3D QCA8K_ID_QCA8327 ||
6c43809bf1bee7 Ansuel Smith      2021-10-14  1323  		    priv->switch_id =
=3D=3D QCA8K_ID_QCA8337)
6c43809bf1bee7 Ansuel Smith      2021-10-14  1324  			reg =3D QCA8K_REG_POR=
T0_PAD_CTRL;
6c43809bf1bee7 Ansuel Smith      2021-10-14  1325  =

6c43809bf1bee7 Ansuel Smith      2021-10-14  1326  		val =3D 0;
6c43809bf1bee7 Ansuel Smith      2021-10-14  1327  =

6c43809bf1bee7 Ansuel Smith      2021-10-14  1328  		/* SGMII Clock phase c=
onfiguration */
6c43809bf1bee7 Ansuel Smith      2021-10-14  1329  		if (priv->sgmii_rx_clk=
_falling_edge)
6c43809bf1bee7 Ansuel Smith      2021-10-14  1330  			val |=3D QCA8K_PORT0_=
PAD_SGMII_RXCLK_FALLING_EDGE;
6c43809bf1bee7 Ansuel Smith      2021-10-14  1331  =

6c43809bf1bee7 Ansuel Smith      2021-10-14  1332  		if (priv->sgmii_tx_clk=
_falling_edge)
6c43809bf1bee7 Ansuel Smith      2021-10-14  1333  			val |=3D QCA8K_PORT0_=
PAD_SGMII_TXCLK_FALLING_EDGE;
6c43809bf1bee7 Ansuel Smith      2021-10-14  1334  =

6c43809bf1bee7 Ansuel Smith      2021-10-14  1335  		if (val)
6c43809bf1bee7 Ansuel Smith      2021-10-14 @1336  			ret =3D qca8k_rmw(pri=
v, reg,
6c43809bf1bee7 Ansuel Smith      2021-10-14  1337  					QCA8K_PORT0_PAD_SGM=
II_RXCLK_FALLING_EDGE |
6c43809bf1bee7 Ansuel Smith      2021-10-14  1338  					QCA8K_PORT0_PAD_SGM=
II_TXCLK_FALLING_EDGE,
6c43809bf1bee7 Ansuel Smith      2021-10-14  1339  					val);
b3591c2a366167 Jonathan McDowell 2020-06-20  1340  		break;
b3591c2a366167 Jonathan McDowell 2020-06-20  1341  	default:
b3591c2a366167 Jonathan McDowell 2020-06-20  1342  		dev_err(ds->dev, "xMII=
 mode %s not supported for port %d\n",
b3591c2a366167 Jonathan McDowell 2020-06-20  1343  			phy_modes(state->inte=
rface), port);
b3591c2a366167 Jonathan McDowell 2020-06-20  1344  		return;
b3591c2a366167 Jonathan McDowell 2020-06-20  1345  	}
b3591c2a366167 Jonathan McDowell 2020-06-20  1346  }
b3591c2a366167 Jonathan McDowell 2020-06-20  1347  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1633472529898264772==--

