Content-Type: multipart/mixed; boundary="===============9036879846239663428=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] thermal: mediatek: add another get_temp ops for thermal sensors
Date: Fri, 22 Jul 2022 05:39:47 +0800
Message-ID: <202207220518.s4Tr2WWY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9036879846239663428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220720181854.547881-5-aouledameur@baylibre.com>
References: <20220720181854.547881-5-aouledameur@baylibre.com>
TO: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
TO: matthias.bgg(a)gmail.com
CC: rafael(a)kernel.org
CC: fparent(a)baylibre.com
CC: amitk(a)kernel.org
CC: daniel.lezcano(a)linaro.org
CC: devicetree(a)vger.kernel.org
CC: krzysztof.kozlowski+dt(a)linaro.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-mediatek(a)lists.infradead.org
CC: linux-pm(a)vger.kernel.org
CC: robh+dt(a)kernel.org
CC: rui.zhang(a)intel.com
CC: "Amjad Ouled-Ameur" <aouledameur@baylibre.com>
CC: default avatarMichael Kao <michael.kao@mediatek.com>
CC: "default avatarHsin-Yi Wang" <hsinyi@chromium.org>

Hi Amjad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on clk/clk-next soc/for-next linus/master v5.19-rc=
7 next-20220721]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amjad-Ouled-Ameur/th=
ermal-mediatek-Add-support-for-MT8365-SoC/20220721-022321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: ia64-randconfig-m041-20220718 (https://download.01.org/0day-ci/arch=
ive/20220722/202207220518.s4Tr2WWY-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/mtk_thermal.c:1223 mtk_thermal_probe() error: uninitialized=
 symbol 'tzdev'.

vim +/tzdev +1223 drivers/thermal/mtk_thermal.c

89945047b1666c Henry Yen                 2020-04-30  1098  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1099  static int mtk_t=
hermal_probe(struct platform_device *pdev)
a92db1c8089e82 Sascha Hauer              2015-11-30  1100  {
bd9403943d7d19 Michael Kao               2019-02-01  1101  	int ret, i, ctr=
l_id;
a92db1c8089e82 Sascha Hauer              2015-11-30  1102  	struct device_n=
ode *auxadc, *apmixedsys, *np =3D pdev->dev.of_node;
a92db1c8089e82 Sascha Hauer              2015-11-30  1103  	struct mtk_ther=
mal *mt;
a92db1c8089e82 Sascha Hauer              2015-11-30  1104  	struct resource=
 *res;
a92db1c8089e82 Sascha Hauer              2015-11-30  1105  	u64 auxadc_phys=
_base, apmixed_phys_base;
1f6b0889d0ea03 Axel Lin                  2016-09-07  1106  	struct thermal_=
zone_device *tzdev;
89945047b1666c Henry Yen                 2020-04-30  1107  	void __iomem *a=
pmixed_base, *auxadc_base;
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1108  	struct mtk_ther=
mal_zone *tz;
a92db1c8089e82 Sascha Hauer              2015-11-30  1109  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1110  	mt =3D devm_kza=
lloc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
a92db1c8089e82 Sascha Hauer              2015-11-30  1111  	if (!mt)
a92db1c8089e82 Sascha Hauer              2015-11-30  1112  		return -ENOMEM;
a92db1c8089e82 Sascha Hauer              2015-11-30  1113  =

9efc58dfa14a20 Ryder Lee                 2018-04-16  1114  	mt->conf =3D of=
_device_get_match_data(&pdev->dev);
b7cf0053738c54 dawei.chien(a)mediatek.com  2016-08-18  1115  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1116  	mt->clk_peri_th=
erm =3D devm_clk_get(&pdev->dev, "therm");
a92db1c8089e82 Sascha Hauer              2015-11-30  1117  	if (IS_ERR(mt->=
clk_peri_therm))
a92db1c8089e82 Sascha Hauer              2015-11-30  1118  		return PTR_ERR=
(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer              2015-11-30  1119  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1120  	mt->clk_auxadc =
=3D devm_clk_get(&pdev->dev, "auxadc");
a92db1c8089e82 Sascha Hauer              2015-11-30  1121  	if (IS_ERR(mt->=
clk_auxadc))
a92db1c8089e82 Sascha Hauer              2015-11-30  1122  		return PTR_ERR=
(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer              2015-11-30  1123  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1124  	res =3D platfor=
m_get_resource(pdev, IORESOURCE_MEM, 0);
a92db1c8089e82 Sascha Hauer              2015-11-30  1125  	mt->thermal_bas=
e =3D devm_ioremap_resource(&pdev->dev, res);
a92db1c8089e82 Sascha Hauer              2015-11-30  1126  	if (IS_ERR(mt->=
thermal_base))
a92db1c8089e82 Sascha Hauer              2015-11-30  1127  		return PTR_ERR=
(mt->thermal_base);
a92db1c8089e82 Sascha Hauer              2015-11-30  1128  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1129  	ret =3D mtk_the=
rmal_get_calibration_data(&pdev->dev, mt);
a92db1c8089e82 Sascha Hauer              2015-11-30  1130  	if (ret)
a92db1c8089e82 Sascha Hauer              2015-11-30  1131  		return ret;
a92db1c8089e82 Sascha Hauer              2015-11-30  1132  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1133  	mutex_init(&mt-=
>lock);
a92db1c8089e82 Sascha Hauer              2015-11-30  1134  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1135  	mt->dev =3D &pd=
ev->dev;
a92db1c8089e82 Sascha Hauer              2015-11-30  1136  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1137  	auxadc =3D of_p=
arse_phandle(np, "mediatek,auxadc", 0);
a92db1c8089e82 Sascha Hauer              2015-11-30  1138  	if (!auxadc) {
a92db1c8089e82 Sascha Hauer              2015-11-30  1139  		dev_err(&pdev-=
>dev, "missing auxadc node\n");
a92db1c8089e82 Sascha Hauer              2015-11-30  1140  		return -ENODEV;
a92db1c8089e82 Sascha Hauer              2015-11-30  1141  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1142  =

89945047b1666c Henry Yen                 2020-04-30  1143  	auxadc_base =3D=
 of_iomap(auxadc, 0);
a92db1c8089e82 Sascha Hauer              2015-11-30  1144  	auxadc_phys_bas=
e =3D of_get_phys_base(auxadc);
a92db1c8089e82 Sascha Hauer              2015-11-30  1145  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1146  	of_node_put(aux=
adc);
a92db1c8089e82 Sascha Hauer              2015-11-30  1147  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1148  	if (auxadc_phys=
_base =3D=3D OF_BAD_ADDR) {
a92db1c8089e82 Sascha Hauer              2015-11-30  1149  		dev_err(&pdev-=
>dev, "Can't get auxadc phys address\n");
a92db1c8089e82 Sascha Hauer              2015-11-30  1150  		return -EINVAL;
a92db1c8089e82 Sascha Hauer              2015-11-30  1151  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1152  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1153  	apmixedsys =3D =
of_parse_phandle(np, "mediatek,apmixedsys", 0);
a92db1c8089e82 Sascha Hauer              2015-11-30  1154  	if (!apmixedsys=
) {
a92db1c8089e82 Sascha Hauer              2015-11-30  1155  		dev_err(&pdev-=
>dev, "missing apmixedsys node\n");
a92db1c8089e82 Sascha Hauer              2015-11-30  1156  		return -ENODEV;
a92db1c8089e82 Sascha Hauer              2015-11-30  1157  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1158  =

89945047b1666c Henry Yen                 2020-04-30  1159  	apmixed_base =
=3D of_iomap(apmixedsys, 0);
a92db1c8089e82 Sascha Hauer              2015-11-30  1160  	apmixed_phys_ba=
se =3D of_get_phys_base(apmixedsys);
a92db1c8089e82 Sascha Hauer              2015-11-30  1161  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1162  	of_node_put(apm=
ixedsys);
a92db1c8089e82 Sascha Hauer              2015-11-30  1163  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1164  	if (apmixed_phy=
s_base =3D=3D OF_BAD_ADDR) {
a92db1c8089e82 Sascha Hauer              2015-11-30  1165  		dev_err(&pdev-=
>dev, "Can't get auxadc phys address\n");
a92db1c8089e82 Sascha Hauer              2015-11-30  1166  		return -EINVAL;
a92db1c8089e82 Sascha Hauer              2015-11-30  1167  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1168  =

703456ba76e944 Fabien Parent             2020-10-21  1169  	ret =3D device_=
reset_optional(&pdev->dev);
6760f3f74e72d6 Louis Yu                  2017-08-01  1170  	if (ret)
6760f3f74e72d6 Louis Yu                  2017-08-01  1171  		return ret;
6760f3f74e72d6 Louis Yu                  2017-08-01  1172  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1173  	ret =3D clk_pre=
pare_enable(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer              2015-11-30  1174  	if (ret) {
a92db1c8089e82 Sascha Hauer              2015-11-30  1175  		dev_err(&pdev-=
>dev, "Can't enable auxadc clk: %d\n", ret);
a92db1c8089e82 Sascha Hauer              2015-11-30  1176  		return ret;
a92db1c8089e82 Sascha Hauer              2015-11-30  1177  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1178  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1179  	ret =3D clk_pre=
pare_enable(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer              2015-11-30  1180  	if (ret) {
a92db1c8089e82 Sascha Hauer              2015-11-30  1181  		dev_err(&pdev-=
>dev, "Can't enable peri clk: %d\n", ret);
a92db1c8089e82 Sascha Hauer              2015-11-30  1182  		goto err_disab=
le_clk_auxadc;
a92db1c8089e82 Sascha Hauer              2015-11-30  1183  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1184  =

b91b391dd49f5d Markus Schneider-Pargmann 2022-07-20  1185  	mtk_thermal_tur=
n_on_buffer(mt, apmixed_base);
b91b391dd49f5d Markus Schneider-Pargmann 2022-07-20  1186  =

89945047b1666c Henry Yen                 2020-04-30  1187  	if (mt->conf->v=
ersion =3D=3D MTK_THERMAL_V2) {
89945047b1666c Henry Yen                 2020-04-30  1188  		mtk_thermal_re=
lease_periodic_ts(mt, auxadc_base);
89945047b1666c Henry Yen                 2020-04-30  1189  	}
89945047b1666c Henry Yen                 2020-04-30  1190  =

bd9403943d7d19 Michael Kao               2019-02-01  1191  	for (ctrl_id =
=3D 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
b7cf0053738c54 dawei.chien(a)mediatek.com  2016-08-18  1192  		for (i =3D 0=
; i < mt->conf->num_banks; i++)
eb4fc33eb26807 Eduardo Valentin          2016-02-18  1193  			mtk_thermal_i=
nit_bank(mt, i, apmixed_phys_base,
bd9403943d7d19 Michael Kao               2019-02-01  1194  					      auxad=
c_phys_base, ctrl_id);
a92db1c8089e82 Sascha Hauer              2015-11-30  1195  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1196  	platform_set_dr=
vdata(pdev, mt);
a92db1c8089e82 Sascha Hauer              2015-11-30  1197  =

f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1198  	for (i =3D 0; i=
 < mt->conf->num_sensors + 1; i++) {
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1199  		tz =3D kmalloc=
(sizeof(*tz), GFP_KERNEL);
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1200  		if (!tz)
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1201  			return -ENOME=
M;
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1202  =

f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1203  		tz->mt =3D mt;
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1204  		tz->id =3D i;
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1205  =

f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1206  		tzdev =3D devm=
_thermal_zone_of_sensor_register(&pdev->dev, i, tz, (i =3D=3D 0) ?
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1207  							     &mtk=
_thermal_ops :
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1208  							     &mtk=
_thermal_sensor_ops);
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1209  =

1f6b0889d0ea03 Axel Lin                  2016-09-07  1210  		if (IS_ERR(tzd=
ev)) {
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1211  			if (PTR_ERR(t=
zdev) =3D=3D -ENODEV) {
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1212  				dev_warn(&pd=
ev->dev,
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1213  					 "sensor %d=
 not registered in thermal zone in dt\n", i);
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1214  				continue;
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1215  			}
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1216  			if (PTR_ERR(t=
zdev) =3D=3D -EACCES) {
1f6b0889d0ea03 Axel Lin                  2016-09-07  1217  				ret =3D PTR_=
ERR(tzdev);
1f6b0889d0ea03 Axel Lin                  2016-09-07  1218  				goto err_dis=
able_clk_peri_therm;
1f6b0889d0ea03 Axel Lin                  2016-09-07  1219  			}
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1220  		}
f478b3ee651af2 Amjad Ouled-Ameur         2022-07-20  1221  	}
a92db1c8089e82 Sascha Hauer              2015-11-30  1222  =

24e21d9f40ec3f Frank Wunderlich          2021-06-08 @1223  	ret =3D devm_th=
ermal_add_hwmon_sysfs(tzdev);
24e21d9f40ec3f Frank Wunderlich          2021-06-08  1224  	if (ret)
24e21d9f40ec3f Frank Wunderlich          2021-06-08  1225  		dev_warn(&pdev=
->dev, "error in thermal_add_hwmon_sysfs");
24e21d9f40ec3f Frank Wunderlich          2021-06-08  1226  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1227  	return 0;
a92db1c8089e82 Sascha Hauer              2015-11-30  1228  =

1f6b0889d0ea03 Axel Lin                  2016-09-07  1229  err_disable_clk_=
peri_therm:
1f6b0889d0ea03 Axel Lin                  2016-09-07  1230  	clk_disable_unp=
repare(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer              2015-11-30  1231  err_disable_clk_=
auxadc:
a92db1c8089e82 Sascha Hauer              2015-11-30  1232  	clk_disable_unp=
repare(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer              2015-11-30  1233  =

a92db1c8089e82 Sascha Hauer              2015-11-30  1234  	return ret;
a92db1c8089e82 Sascha Hauer              2015-11-30  1235  }
a92db1c8089e82 Sascha Hauer              2015-11-30  1236  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9036879846239663428==--

