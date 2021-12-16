Content-Type: multipart/mixed; boundary="===============5228809124178945956=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.4 1721/1768] drivers/pinctrl/core.c:1273 pinctrl_commit_state() error: uninitialized symbol 'ret'.
Date: Thu, 16 Dec 2021 19:41:22 +0800
Message-ID: <202112161957.08UfDn9B-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5228809124178945956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   abafefebd1f1e040eef74e4ab571ea08bf745641
commit: c82e9765704a437b642de708cdf3c06535e07a89 [1721/1768] pinctrl: core:=
 Handling pinmux and pinconf separately
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-m001-20211214 (https://download.01.org/0day-ci/ar=
chive/20211216/202112161957.08UfDn9B-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/pinctrl/core.c:1273 pinctrl_commit_state() error: uninitialized sym=
bol 'ret'.

Old smatch warnings:
drivers/pinctrl/core.c:1295 pinctrl_commit_state() error: uninitialized sym=
bol 'ret'.

vim +/ret +1273 drivers/pinctrl/core.c

036f394dd77f811 Benjamin Gaignard 2019-05-22  1231  =

befe5bdfbb698b3 Linus Walleij     2012-02-09  1232  /**
981ed1bfbc6c466 Florian Fainelli  2017-03-01  1233   * pinctrl_commit_state=
() - select/activate/program a pinctrl state to HW
42fed7ba44e4e8c Patrice Chotard   2013-04-11  1234   * @p: the pinctrl hand=
le for the device that requests configuration
42fed7ba44e4e8c Patrice Chotard   2013-04-11  1235   * @state: the state ha=
ndle to select/activate/program
befe5bdfbb698b3 Linus Walleij     2012-02-09  1236   */
981ed1bfbc6c466 Florian Fainelli  2017-03-01  1237  static int pinctrl_comm=
it_state(struct pinctrl *p, struct pinctrl_state *state)
befe5bdfbb698b3 Linus Walleij     2012-02-09  1238  {
6e5e959dde0d92d Stephen Warren    2012-03-02  1239  	struct pinctrl_setting=
 *setting, *setting2;
50cf7c8ab324de3 Richard Genoud    2013-03-25  1240  	struct pinctrl_state *=
old_state =3D p->state;
6e5e959dde0d92d Stephen Warren    2012-03-02  1241  	int ret;
7ecdb16fe63e5b3 Stephen Warren    2012-03-02  1242  =

6e5e959dde0d92d Stephen Warren    2012-03-02  1243  	if (p->state) {
6e5e959dde0d92d Stephen Warren    2012-03-02  1244  		/*
2243a87d90b42eb Fan Wu            2014-06-09  1245  		 * For each pinmux se=
tting in the old state, forget SW's record
2243a87d90b42eb Fan Wu            2014-06-09  1246  		 * of mux owner for t=
hat pingroup. Any pingroups which are
2243a87d90b42eb Fan Wu            2014-06-09  1247  		 * still owned by the=
 new state will be re-acquired by the call
2243a87d90b42eb Fan Wu            2014-06-09  1248  		 * to pinmux_enable_s=
etting() in the loop below.
6e5e959dde0d92d Stephen Warren    2012-03-02  1249  		 */
6e5e959dde0d92d Stephen Warren    2012-03-02  1250  		list_for_each_entry(s=
etting, &p->state->settings, node) {
1e2082b52072173 Stephen Warren    2012-03-02  1251  			if (setting->type !=
=3D PIN_MAP_TYPE_MUX_GROUP)
1e2082b52072173 Stephen Warren    2012-03-02  1252  				continue;
7ecdb16fe63e5b3 Stephen Warren    2012-03-02  1253  			pinmux_disable_setti=
ng(setting);
befe5bdfbb698b3 Linus Walleij     2012-02-09  1254  		}
57b676f9c1b7cd8 Stephen Warren    2012-03-02  1255  	}
57b676f9c1b7cd8 Stephen Warren    2012-03-02  1256  =

3102a76cfbf9ac4 Richard Genoud    2013-03-25  1257  	p->state =3D NULL;
6e5e959dde0d92d Stephen Warren    2012-03-02  1258  =

c82e9765704a437 Michal Simek      2021-03-10  1259  	/* Apply all the setti=
ngs for the new state - pinmux first */
6e5e959dde0d92d Stephen Warren    2012-03-02  1260  	list_for_each_entry(se=
tting, &state->settings, node) {
1e2082b52072173 Stephen Warren    2012-03-02  1261  		switch (setting->type=
) {
1e2082b52072173 Stephen Warren    2012-03-02  1262  		case PIN_MAP_TYPE_MUX=
_GROUP:
6e5e959dde0d92d Stephen Warren    2012-03-02  1263  			ret =3D pinmux_enabl=
e_setting(setting);
1e2082b52072173 Stephen Warren    2012-03-02  1264  			break;
1e2082b52072173 Stephen Warren    2012-03-02  1265  		case PIN_MAP_TYPE_CON=
FIGS_PIN:
c82e9765704a437 Michal Simek      2021-03-10  1266  		case PIN_MAP_TYPE_CON=
FIGS_GROUP:
c82e9765704a437 Michal Simek      2021-03-10  1267  			break;
c82e9765704a437 Michal Simek      2021-03-10  1268  		default:
c82e9765704a437 Michal Simek      2021-03-10  1269  			ret =3D -EINVAL;
c82e9765704a437 Michal Simek      2021-03-10  1270  			break;
c82e9765704a437 Michal Simek      2021-03-10  1271  		}
c82e9765704a437 Michal Simek      2021-03-10  1272  =

c82e9765704a437 Michal Simek      2021-03-10 @1273  		if (ret < 0)
c82e9765704a437 Michal Simek      2021-03-10  1274  			goto unapply_new_sta=
te;
c82e9765704a437 Michal Simek      2021-03-10  1275  =

c82e9765704a437 Michal Simek      2021-03-10  1276  		/* Do not link hogs (=
circular dependency) */
c82e9765704a437 Michal Simek      2021-03-10  1277  		if (p !=3D setting->p=
ctldev->p)
c82e9765704a437 Michal Simek      2021-03-10  1278  			pinctrl_link_add(set=
ting->pctldev, p->dev);
c82e9765704a437 Michal Simek      2021-03-10  1279  	}
c82e9765704a437 Michal Simek      2021-03-10  1280  =

c82e9765704a437 Michal Simek      2021-03-10  1281  	/* Apply all the setti=
ngs for the new state - pinconf after */
c82e9765704a437 Michal Simek      2021-03-10  1282  	list_for_each_entry(se=
tting, &state->settings, node) {
c82e9765704a437 Michal Simek      2021-03-10  1283  		switch (setting->type=
) {
c82e9765704a437 Michal Simek      2021-03-10  1284  		case PIN_MAP_TYPE_MUX=
_GROUP:
c82e9765704a437 Michal Simek      2021-03-10  1285  			break;
c82e9765704a437 Michal Simek      2021-03-10  1286  		case PIN_MAP_TYPE_CON=
FIGS_PIN:
1e2082b52072173 Stephen Warren    2012-03-02  1287  		case PIN_MAP_TYPE_CON=
FIGS_GROUP:
1e2082b52072173 Stephen Warren    2012-03-02  1288  			ret =3D pinconf_appl=
y_setting(setting);
1e2082b52072173 Stephen Warren    2012-03-02  1289  			break;
1e2082b52072173 Stephen Warren    2012-03-02  1290  		default:
1e2082b52072173 Stephen Warren    2012-03-02  1291  			ret =3D -EINVAL;
1e2082b52072173 Stephen Warren    2012-03-02  1292  			break;
1e2082b52072173 Stephen Warren    2012-03-02  1293  		}
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1294  =

42fed7ba44e4e8c Patrice Chotard   2013-04-11  1295  		if (ret < 0) {
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1296  			goto unapply_new_sta=
te;
6e5e959dde0d92d Stephen Warren    2012-03-02  1297  		}
036f394dd77f811 Benjamin Gaignard 2019-05-22  1298  =

b672a87ae5ab070 Linus Walleij     2019-05-24  1299  		/* Do not link hogs (=
circular dependency) */
b672a87ae5ab070 Linus Walleij     2019-05-24  1300  		if (p !=3D setting->p=
ctldev->p)
036f394dd77f811 Benjamin Gaignard 2019-05-22  1301  			pinctrl_link_add(set=
ting->pctldev, p->dev);
42fed7ba44e4e8c Patrice Chotard   2013-04-11  1302  	}
6e5e959dde0d92d Stephen Warren    2012-03-02  1303  =

3102a76cfbf9ac4 Richard Genoud    2013-03-25  1304  	p->state =3D state;
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1305  =

6e5e959dde0d92d Stephen Warren    2012-03-02  1306  	return 0;
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1307  =

3102a76cfbf9ac4 Richard Genoud    2013-03-25  1308  unapply_new_state:
da58751ca2490d5 Richard Genoud    2013-03-28  1309  	dev_err(p->dev, "Error=
 applying setting, reverse things back\n");
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1310  =

3102a76cfbf9ac4 Richard Genoud    2013-03-25  1311  	list_for_each_entry(se=
tting2, &state->settings, node) {
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1312  		if (&setting2->node =
=3D=3D &setting->node)
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1313  			break;
af6061777131639 Richard Genoud    2013-03-29  1314  		/*
af6061777131639 Richard Genoud    2013-03-29  1315  		 * All we can do here=
 is pinmux_disable_setting.
af6061777131639 Richard Genoud    2013-03-29  1316  		 * That means that so=
me pins are muxed differently now
af6061777131639 Richard Genoud    2013-03-29  1317  		 * than they were bef=
ore applying the setting (We can't
af6061777131639 Richard Genoud    2013-03-29  1318  		 * "unmux a pin"!), b=
ut it's not a big deal since the pins
af6061777131639 Richard Genoud    2013-03-29  1319  		 * are free to be mux=
ed by another apply_setting.
af6061777131639 Richard Genoud    2013-03-29  1320  		 */
af6061777131639 Richard Genoud    2013-03-29  1321  		if (setting2->type =
=3D=3D PIN_MAP_TYPE_MUX_GROUP)
af6061777131639 Richard Genoud    2013-03-29  1322  			pinmux_disable_setti=
ng(setting2);
3102a76cfbf9ac4 Richard Genoud    2013-03-25  1323  	}
8009d5ff00df6ad Richard Genoud    2013-03-28  1324  =

385d94246b05f7c Richard Genoud    2013-03-29  1325  	/* There's no infinite=
 recursive loop here because p->state is NULL */
385d94246b05f7c Richard Genoud    2013-03-29  1326  	if (old_state)
42fed7ba44e4e8c Patrice Chotard   2013-04-11  1327  		pinctrl_select_state(=
p, old_state);
6e5e959dde0d92d Stephen Warren    2012-03-02  1328  =

6e5e959dde0d92d Stephen Warren    2012-03-02  1329  	return ret;
befe5bdfbb698b3 Linus Walleij     2012-02-09  1330  }
981ed1bfbc6c466 Florian Fainelli  2017-03-01  1331  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5228809124178945956==--

