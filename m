Content-Type: multipart/mixed; boundary="===============3720113876099254568=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:guest-filter 1/28] drivers/thunderbolt/tb.c:1282:37: error: 'struct tb_switch' has no member named 'authorized'
Date: Tue, 28 Jun 2022 23:17:17 +0800
Message-ID: <202206282327.40tEMwsL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3720113876099254568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.co=
m>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://github.com/intel/tdx.git guest-filter
head:   0a555e67b143701a81612d819e693cf5786de418
commit: b2b91a2a02f064fb8dd7fda65b2268a714656b3f [1/28] driver core: Move t=
he "authorized" attribute from USB/Thunderbolt to core
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arc-randconfig-r043-20220627 (https://download.01.org/0day-ci/archi=
ve/20220628/202206282327.40tEMwsL-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b2b91a2a02f064fb8dd7fda65b226=
8a714656b3f
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter
        git checkout b2b91a2a02f064fb8dd7fda65b2268a714656b3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darc SHELL=3D/bin/bash drivers/thunderbolt/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/thunderbolt/tb.c: In function 'tb_handle_hotplug':
>> drivers/thunderbolt/tb.c:1282:37: error: 'struct tb_switch' has no membe=
r named 'authorized'
    1282 |         } else if (!port->port && sw->authorized) {
         |                                     ^~


vim +1282 drivers/thunderbolt/tb.c

d6cc51cd1a4aed Andreas Noever  2014-06-03  1194  =

877e50b358c88b Lee Jones       2021-01-27  1195  /*
d6cc51cd1a4aed Andreas Noever  2014-06-03  1196   * tb_handle_hotplug() - h=
andle hotplug event
d6cc51cd1a4aed Andreas Noever  2014-06-03  1197   *
d6cc51cd1a4aed Andreas Noever  2014-06-03  1198   * Executes on tb->wq.
d6cc51cd1a4aed Andreas Noever  2014-06-03  1199   */
d6cc51cd1a4aed Andreas Noever  2014-06-03  1200  static void tb_handle_hotp=
lug(struct work_struct *work)
d6cc51cd1a4aed Andreas Noever  2014-06-03  1201  {
d6cc51cd1a4aed Andreas Noever  2014-06-03  1202  	struct tb_hotplug_event *=
ev =3D container_of(work, typeof(*ev), work);
d6cc51cd1a4aed Andreas Noever  2014-06-03  1203  	struct tb *tb =3D ev->tb;
9d3cce0b613689 Mika Westerberg 2017-06-06  1204  	struct tb_cm *tcm =3D tb_=
priv(tb);
053596d9e26c86 Andreas Noever  2014-06-03  1205  	struct tb_switch *sw;
053596d9e26c86 Andreas Noever  2014-06-03  1206  	struct tb_port *port;
284652a4a49917 Mika Westerberg 2020-04-09  1207  =

6ac6faee5d7d7d Mika Westerberg 2020-06-05  1208  	/* Bring the domain back =
from sleep if it was suspended */
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1209  	pm_runtime_get_sync(&tb->=
dev);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1210  =

d6cc51cd1a4aed Andreas Noever  2014-06-03  1211  	mutex_lock(&tb->lock);
9d3cce0b613689 Mika Westerberg 2017-06-06  1212  	if (!tcm->hotplug_active)
d6cc51cd1a4aed Andreas Noever  2014-06-03  1213  		goto out; /* during init=
, suspend or shutdown */
d6cc51cd1a4aed Andreas Noever  2014-06-03  1214  =

8f965efd215a09 Mika Westerberg 2019-03-15  1215  	sw =3D tb_switch_find_by_=
route(tb, ev->route);
053596d9e26c86 Andreas Noever  2014-06-03  1216  	if (!sw) {
053596d9e26c86 Andreas Noever  2014-06-03  1217  		tb_warn(tb,
053596d9e26c86 Andreas Noever  2014-06-03  1218  			"hotplug event from non=
 existent switch %llx:%x (unplug: %d)\n",
053596d9e26c86 Andreas Noever  2014-06-03  1219  			ev->route, ev->port, ev=
->unplug);
053596d9e26c86 Andreas Noever  2014-06-03  1220  		goto out;
053596d9e26c86 Andreas Noever  2014-06-03  1221  	}
053596d9e26c86 Andreas Noever  2014-06-03  1222  	if (ev->port > sw->config=
.max_port_number) {
053596d9e26c86 Andreas Noever  2014-06-03  1223  		tb_warn(tb,
053596d9e26c86 Andreas Noever  2014-06-03  1224  			"hotplug event from non=
 existent port %llx:%x (unplug: %d)\n",
053596d9e26c86 Andreas Noever  2014-06-03  1225  			ev->route, ev->port, ev=
->unplug);
8f965efd215a09 Mika Westerberg 2019-03-15  1226  		goto put_sw;
053596d9e26c86 Andreas Noever  2014-06-03  1227  	}
053596d9e26c86 Andreas Noever  2014-06-03  1228  	port =3D &sw->ports[ev->p=
ort];
053596d9e26c86 Andreas Noever  2014-06-03  1229  	if (tb_is_upstream_port(p=
ort)) {
dfe40ca486f60d Mika Westerberg 2019-03-07  1230  		tb_dbg(tb, "hotplug even=
t for upstream port %llx:%x (unplug: %d)\n",
053596d9e26c86 Andreas Noever  2014-06-03  1231  		       ev->route, ev->po=
rt, ev->unplug);
8f965efd215a09 Mika Westerberg 2019-03-15  1232  		goto put_sw;
053596d9e26c86 Andreas Noever  2014-06-03  1233  	}
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1234  =

6ac6faee5d7d7d Mika Westerberg 2020-06-05  1235  	pm_runtime_get_sync(&sw->=
dev);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1236  =

053596d9e26c86 Andreas Noever  2014-06-03  1237  	if (ev->unplug) {
dacb12877d9222 Kranthi Kuntala 2020-03-05  1238  		tb_retimer_remove_all(po=
rt);
dacb12877d9222 Kranthi Kuntala 2020-03-05  1239  =

dfe40ca486f60d Mika Westerberg 2019-03-07  1240  		if (tb_port_has_remote(p=
ort)) {
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1241  			tb_port_dbg(port, "swit=
ch unplugged\n");
aae20bb6b45e06 Lukas Wunner    2016-03-20  1242  			tb_sw_set_unplugged(por=
t->remote->sw);
3364f0c1279571 Andreas Noever  2014-06-03  1243  			tb_free_invalid_tunnels=
(tb);
8afe909b78e16e Mika Westerberg 2019-03-26  1244  			tb_remove_dp_resources(=
port->remote->sw);
cf29b9afb12149 Rajmohan Mani   2019-12-17  1245  			tb_switch_tmu_disable(p=
ort->remote->sw);
de462039178651 Mika Westerberg 2020-04-02  1246  			tb_switch_unconfigure_l=
ink(port->remote->sw);
91c0c12080d0f4 Mika Westerberg 2019-03-21  1247  			tb_switch_lane_bonding_=
disable(port->remote->sw);
bfe778ac49826c Mika Westerberg 2017-06-06  1248  			tb_switch_remove(port->=
remote->sw);
053596d9e26c86 Andreas Noever  2014-06-03  1249  			port->remote =3D NULL;
dfe40ca486f60d Mika Westerberg 2019-03-07  1250  			if (port->dual_link_por=
t)
dfe40ca486f60d Mika Westerberg 2019-03-07  1251  				port->dual_link_port->=
remote =3D NULL;
8afe909b78e16e Mika Westerberg 2019-03-26  1252  			/* Maybe we can create =
another DP tunnel */
8afe909b78e16e Mika Westerberg 2019-03-26  1253  			tb_tunnel_dp(tb);
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1254  		} else if (port->xdomain=
) {
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1255  			struct tb_xdomain *xd =
=3D tb_xdomain_get(port->xdomain);
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1256  =

7ea4cd6b2010ee Mika Westerberg 2018-09-28  1257  			tb_port_dbg(port, "xdom=
ain unplugged\n");
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1258  			/*
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1259  			 * Service drivers are =
unbound during
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1260  			 * tb_xdomain_remove() =
so setting XDomain as
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1261  			 * unplugged here preve=
nts deadlock if they call
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1262  			 * tb_xdomain_disable_p=
aths(). We will tear down
180b0689425c6f Mika Westerberg 2021-01-08  1263  			 * all the tunnels belo=
w.
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1264  			 */
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1265  			xd->is_unplugged =3D tr=
ue;
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1266  			tb_xdomain_remove(xd);
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1267  			port->xdomain =3D NULL;
180b0689425c6f Mika Westerberg 2021-01-08  1268  			__tb_disconnect_xdomain=
_paths(tb, xd, -1, -1, -1, -1);
7ea4cd6b2010ee Mika Westerberg 2018-09-28  1269  			tb_xdomain_put(xd);
284652a4a49917 Mika Westerberg 2020-04-09  1270  			tb_port_unconfigure_xdo=
main(port);
8afe909b78e16e Mika Westerberg 2019-03-26  1271  		} else if (tb_port_is_dp=
out(port) || tb_port_is_dpin(port)) {
8afe909b78e16e Mika Westerberg 2019-03-26  1272  			tb_dp_resource_unavaila=
ble(tb, port);
30a4eca69b76c0 Mika Westerberg 2022-01-07  1273  		} else if (!port->port) {
30a4eca69b76c0 Mika Westerberg 2022-01-07  1274  			tb_sw_dbg(sw, "xHCI dis=
connect request\n");
30a4eca69b76c0 Mika Westerberg 2022-01-07  1275  			tb_switch_xhci_disconne=
ct(sw);
053596d9e26c86 Andreas Noever  2014-06-03  1276  		} else {
62efe699a7f666 Mika Westerberg 2018-09-17  1277  			tb_port_dbg(port,
053596d9e26c86 Andreas Noever  2014-06-03  1278  				   "got unplug event f=
or disconnected port, ignoring\n");
053596d9e26c86 Andreas Noever  2014-06-03  1279  		}
053596d9e26c86 Andreas Noever  2014-06-03  1280  	} else if (port->remote) {
62efe699a7f666 Mika Westerberg 2018-09-17  1281  		tb_port_dbg(port, "got p=
lug event for connected port, ignoring\n");
30a4eca69b76c0 Mika Westerberg 2022-01-07 @1282  	} else if (!port->port &&=
 sw->authorized) {
30a4eca69b76c0 Mika Westerberg 2022-01-07  1283  		tb_sw_dbg(sw, "xHCI conn=
ect request\n");
30a4eca69b76c0 Mika Westerberg 2022-01-07  1284  		tb_switch_xhci_connect(s=
w);
053596d9e26c86 Andreas Noever  2014-06-03  1285  	} else {
344e06430a7234 Mika Westerberg 2017-10-11  1286  		if (tb_port_is_null(port=
)) {
62efe699a7f666 Mika Westerberg 2018-09-17  1287  			tb_port_dbg(port, "hotp=
lug: scanning\n");
053596d9e26c86 Andreas Noever  2014-06-03  1288  			tb_scan_port(port);
99cabbb006f1eb Mika Westerberg 2018-12-30  1289  			if (!port->remote)
62efe699a7f666 Mika Westerberg 2018-09-17  1290  				tb_port_dbg(port, "hot=
plug: no switch found\n");
8afe909b78e16e Mika Westerberg 2019-03-26  1291  		} else if (tb_port_is_dp=
out(port) || tb_port_is_dpin(port)) {
8afe909b78e16e Mika Westerberg 2019-03-26  1292  			tb_dp_resource_availabl=
e(tb, port);
053596d9e26c86 Andreas Noever  2014-06-03  1293  		}
344e06430a7234 Mika Westerberg 2017-10-11  1294  	}
8f965efd215a09 Mika Westerberg 2019-03-15  1295  =

6ac6faee5d7d7d Mika Westerberg 2020-06-05  1296  	pm_runtime_mark_last_busy=
(&sw->dev);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1297  	pm_runtime_put_autosuspen=
d(&sw->dev);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1298  =

8f965efd215a09 Mika Westerberg 2019-03-15  1299  put_sw:
8f965efd215a09 Mika Westerberg 2019-03-15  1300  	tb_switch_put(sw);
d6cc51cd1a4aed Andreas Noever  2014-06-03  1301  out:
d6cc51cd1a4aed Andreas Noever  2014-06-03  1302  	mutex_unlock(&tb->lock);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1303  =

6ac6faee5d7d7d Mika Westerberg 2020-06-05  1304  	pm_runtime_mark_last_busy=
(&tb->dev);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1305  	pm_runtime_put_autosuspen=
d(&tb->dev);
6ac6faee5d7d7d Mika Westerberg 2020-06-05  1306  =

d6cc51cd1a4aed Andreas Noever  2014-06-03  1307  	kfree(ev);
d6cc51cd1a4aed Andreas Noever  2014-06-03  1308  }
d6cc51cd1a4aed Andreas Noever  2014-06-03  1309  =


:::::: The code at line 1282 was first introduced by commit
:::::: 30a4eca69b76c0ed5a2f34dd2a3e195c9bf6bed1 thunderbolt: Add internal x=
HCI connect flows for Thunderbolt 3 devices

:::::: TO: Mika Westerberg <mika.westerberg@linux.intel.com>
:::::: CC: Mika Westerberg <mika.westerberg@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3720113876099254568==--

