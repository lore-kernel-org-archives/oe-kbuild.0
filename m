Content-Type: multipart/mixed; boundary="===============4091743783159527675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [v10 1/1] thermal: mediatek: add another get_temp ops for thermal sensors
Date: Fri, 20 May 2022 05:03:07 +0800
Message-ID: <202205200443.U6vUaBpX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4091743783159527675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220519101044.16765-1-james.lo@mediatek.com>
References: <20220519101044.16765-1-james.lo@mediatek.com>
TO: James Lo <james.lo@mediatek.com>
TO: "Rafael J . Wysocki" <rafael@kernel.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: linux-pm(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-mediatek(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Project_Global_Chrome_Upstream_Group(a)mediatek.com
CC: Fan Chen <fan.chen@mediatek.com>
CC: Louis Yu <louis.yu@mediatek.com>
CC: Michael Kao <michael.kao@mediatek.com>
CC: "Hsin-Yi Wang" <hsinyi@chromium.org>
CC: Ben Tseng <ben.tseng@mediatek.com>
CC: James Lo <james.lo@mediatek.com>

Hi James,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on v5.18-rc7 next-20220519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Lo/thermal-med=
iatek-add-another-get_temp-ops-for-thermal-sensors/20220519-181307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm-randconfig-m031-20220519 (https://download.01.org/0day-ci/archi=
ve/20220520/202205200443.U6vUaBpX-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/mtk_thermal.c:1137 mtk_thermal_probe() error: uninitialized=
 symbol 'tzdev'.

vim +/tzdev +1137 drivers/thermal/mtk_thermal.c

89945047b1666c Henry Yen                2020-04-30  1016  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1017  static int mtk_th=
ermal_probe(struct platform_device *pdev)
a92db1c8089e82 Sascha Hauer             2015-11-30  1018  {
bd9403943d7d19 Michael Kao              2019-02-01  1019  	int ret, i, ctrl=
_id;
a92db1c8089e82 Sascha Hauer             2015-11-30  1020  	struct device_no=
de *auxadc, *apmixedsys, *np =3D pdev->dev.of_node;
a92db1c8089e82 Sascha Hauer             2015-11-30  1021  	struct mtk_therm=
al *mt;
a92db1c8089e82 Sascha Hauer             2015-11-30  1022  	struct resource =
*res;
a92db1c8089e82 Sascha Hauer             2015-11-30  1023  	u64 auxadc_phys_=
base, apmixed_phys_base;
1f6b0889d0ea03 Axel Lin                 2016-09-07  1024  	struct thermal_z=
one_device *tzdev;
89945047b1666c Henry Yen                2020-04-30  1025  	void __iomem *ap=
mixed_base, *auxadc_base;
107e3978035dbd James Lo                 2022-05-19  1026  	struct mtk_therm=
al_bank *tz;
a92db1c8089e82 Sascha Hauer             2015-11-30  1027  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1028  	mt =3D devm_kzal=
loc(&pdev->dev, sizeof(*mt), GFP_KERNEL);
a92db1c8089e82 Sascha Hauer             2015-11-30  1029  	if (!mt)
a92db1c8089e82 Sascha Hauer             2015-11-30  1030  		return -ENOMEM;
a92db1c8089e82 Sascha Hauer             2015-11-30  1031  =

9efc58dfa14a20 Ryder Lee                2018-04-16  1032  	mt->conf =3D of_=
device_get_match_data(&pdev->dev);
b7cf0053738c54 dawei.chien(a)mediatek.com 2016-08-18  1033  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1034  	mt->clk_peri_the=
rm =3D devm_clk_get(&pdev->dev, "therm");
a92db1c8089e82 Sascha Hauer             2015-11-30  1035  	if (IS_ERR(mt->c=
lk_peri_therm))
a92db1c8089e82 Sascha Hauer             2015-11-30  1036  		return PTR_ERR(=
mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer             2015-11-30  1037  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1038  	mt->clk_auxadc =
=3D devm_clk_get(&pdev->dev, "auxadc");
a92db1c8089e82 Sascha Hauer             2015-11-30  1039  	if (IS_ERR(mt->c=
lk_auxadc))
a92db1c8089e82 Sascha Hauer             2015-11-30  1040  		return PTR_ERR(=
mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1041  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1042  	res =3D platform=
_get_resource(pdev, IORESOURCE_MEM, 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1043  	mt->thermal_base=
 =3D devm_ioremap_resource(&pdev->dev, res);
a92db1c8089e82 Sascha Hauer             2015-11-30  1044  	if (IS_ERR(mt->t=
hermal_base))
a92db1c8089e82 Sascha Hauer             2015-11-30  1045  		return PTR_ERR(=
mt->thermal_base);
a92db1c8089e82 Sascha Hauer             2015-11-30  1046  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1047  	ret =3D mtk_ther=
mal_get_calibration_data(&pdev->dev, mt);
a92db1c8089e82 Sascha Hauer             2015-11-30  1048  	if (ret)
a92db1c8089e82 Sascha Hauer             2015-11-30  1049  		return ret;
a92db1c8089e82 Sascha Hauer             2015-11-30  1050  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1051  	mutex_init(&mt->=
lock);
a92db1c8089e82 Sascha Hauer             2015-11-30  1052  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1053  	mt->dev =3D &pde=
v->dev;
a92db1c8089e82 Sascha Hauer             2015-11-30  1054  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1055  	auxadc =3D of_pa=
rse_phandle(np, "mediatek,auxadc", 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1056  	if (!auxadc) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1057  		dev_err(&pdev->=
dev, "missing auxadc node\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1058  		return -ENODEV;
a92db1c8089e82 Sascha Hauer             2015-11-30  1059  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1060  =

89945047b1666c Henry Yen                2020-04-30  1061  	auxadc_base =3D =
of_iomap(auxadc, 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1062  	auxadc_phys_base=
 =3D of_get_phys_base(auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1063  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1064  	of_node_put(auxa=
dc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1065  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1066  	if (auxadc_phys_=
base =3D=3D OF_BAD_ADDR) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1067  		dev_err(&pdev->=
dev, "Can't get auxadc phys address\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1068  		return -EINVAL;
a92db1c8089e82 Sascha Hauer             2015-11-30  1069  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1070  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1071  	apmixedsys =3D o=
f_parse_phandle(np, "mediatek,apmixedsys", 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1072  	if (!apmixedsys)=
 {
a92db1c8089e82 Sascha Hauer             2015-11-30  1073  		dev_err(&pdev->=
dev, "missing apmixedsys node\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1074  		return -ENODEV;
a92db1c8089e82 Sascha Hauer             2015-11-30  1075  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1076  =

89945047b1666c Henry Yen                2020-04-30  1077  	apmixed_base =3D=
 of_iomap(apmixedsys, 0);
a92db1c8089e82 Sascha Hauer             2015-11-30  1078  	apmixed_phys_bas=
e =3D of_get_phys_base(apmixedsys);
a92db1c8089e82 Sascha Hauer             2015-11-30  1079  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1080  	of_node_put(apmi=
xedsys);
a92db1c8089e82 Sascha Hauer             2015-11-30  1081  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1082  	if (apmixed_phys=
_base =3D=3D OF_BAD_ADDR) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1083  		dev_err(&pdev->=
dev, "Can't get auxadc phys address\n");
a92db1c8089e82 Sascha Hauer             2015-11-30  1084  		return -EINVAL;
a92db1c8089e82 Sascha Hauer             2015-11-30  1085  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1086  =

703456ba76e944 Fabien Parent            2020-10-21  1087  	ret =3D device_r=
eset_optional(&pdev->dev);
6760f3f74e72d6 Louis Yu                 2017-08-01  1088  	if (ret)
6760f3f74e72d6 Louis Yu                 2017-08-01  1089  		return ret;
6760f3f74e72d6 Louis Yu                 2017-08-01  1090  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1091  	ret =3D clk_prep=
are_enable(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1092  	if (ret) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1093  		dev_err(&pdev->=
dev, "Can't enable auxadc clk: %d\n", ret);
a92db1c8089e82 Sascha Hauer             2015-11-30  1094  		return ret;
a92db1c8089e82 Sascha Hauer             2015-11-30  1095  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1096  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1097  	ret =3D clk_prep=
are_enable(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer             2015-11-30  1098  	if (ret) {
a92db1c8089e82 Sascha Hauer             2015-11-30  1099  		dev_err(&pdev->=
dev, "Can't enable peri clk: %d\n", ret);
a92db1c8089e82 Sascha Hauer             2015-11-30  1100  		goto err_disabl=
e_clk_auxadc;
a92db1c8089e82 Sascha Hauer             2015-11-30  1101  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1102  =

89945047b1666c Henry Yen                2020-04-30  1103  	if (mt->conf->ve=
rsion =3D=3D MTK_THERMAL_V2) {
89945047b1666c Henry Yen                2020-04-30  1104  		mtk_thermal_tur=
n_on_buffer(apmixed_base);
89945047b1666c Henry Yen                2020-04-30  1105  		mtk_thermal_rel=
ease_periodic_ts(mt, auxadc_base);
89945047b1666c Henry Yen                2020-04-30  1106  	}
89945047b1666c Henry Yen                2020-04-30  1107  =

bd9403943d7d19 Michael Kao              2019-02-01  1108  	for (ctrl_id =3D=
 0; ctrl_id < mt->conf->num_controller ; ctrl_id++)
b7cf0053738c54 dawei.chien(a)mediatek.com 2016-08-18  1109  		for (i =3D 0;=
 i < mt->conf->num_banks; i++)
eb4fc33eb26807 Eduardo Valentin         2016-02-18  1110  			mtk_thermal_in=
it_bank(mt, i, apmixed_phys_base,
bd9403943d7d19 Michael Kao              2019-02-01  1111  					      auxadc=
_phys_base, ctrl_id);
a92db1c8089e82 Sascha Hauer             2015-11-30  1112  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1113  	platform_set_drv=
data(pdev, mt);
a92db1c8089e82 Sascha Hauer             2015-11-30  1114  =

107e3978035dbd James Lo                 2022-05-19  1115  	for (i =3D 0; i =
< mt->conf->num_sensors + 1; i++) {
107e3978035dbd James Lo                 2022-05-19  1116  		tz =3D devm_kma=
lloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
107e3978035dbd James Lo                 2022-05-19  1117  		if (!tz)
107e3978035dbd James Lo                 2022-05-19  1118  			return -ENOMEM;
107e3978035dbd James Lo                 2022-05-19  1119  =

107e3978035dbd James Lo                 2022-05-19  1120  		tz->mt =3D mt;
107e3978035dbd James Lo                 2022-05-19  1121  		tz->id =3D i;
107e3978035dbd James Lo                 2022-05-19  1122  =

107e3978035dbd James Lo                 2022-05-19  1123  		tzdev =3D devm_=
thermal_zone_of_sensor_register(
107e3978035dbd James Lo                 2022-05-19  1124  						&pdev->dev,=
 i, tz, (i =3D=3D 0) ?
107e3978035dbd James Lo                 2022-05-19  1125  						&mtk_therma=
l_ops :
107e3978035dbd James Lo                 2022-05-19  1126  						&mtk_therma=
l_sensor_ops);
107e3978035dbd James Lo                 2022-05-19  1127  =

1f6b0889d0ea03 Axel Lin                 2016-09-07  1128  		if (IS_ERR(tzde=
v)) {
1f6b0889d0ea03 Axel Lin                 2016-09-07  1129  			ret =3D PTR_ER=
R(tzdev);
107e3978035dbd James Lo                 2022-05-19  1130  			dev_err(&pdev-=
>dev,
107e3978035dbd James Lo                 2022-05-19  1131  				"Error: Faile=
d to register thermal zone %d, ret =3D %d\n",
107e3978035dbd James Lo                 2022-05-19  1132  				i, ret);
1f6b0889d0ea03 Axel Lin                 2016-09-07  1133  			goto err_disab=
le_clk_peri_therm;
1f6b0889d0ea03 Axel Lin                 2016-09-07  1134  		}
107e3978035dbd James Lo                 2022-05-19  1135  	}
a92db1c8089e82 Sascha Hauer             2015-11-30  1136  =

24e21d9f40ec3f Frank Wunderlich         2021-06-08 @1137  	ret =3D devm_the=
rmal_add_hwmon_sysfs(tzdev);
24e21d9f40ec3f Frank Wunderlich         2021-06-08  1138  	if (ret)
24e21d9f40ec3f Frank Wunderlich         2021-06-08  1139  		dev_warn(&pdev-=
>dev, "error in thermal_add_hwmon_sysfs");
24e21d9f40ec3f Frank Wunderlich         2021-06-08  1140  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1141  	return 0;
a92db1c8089e82 Sascha Hauer             2015-11-30  1142  =

1f6b0889d0ea03 Axel Lin                 2016-09-07  1143  err_disable_clk_p=
eri_therm:
1f6b0889d0ea03 Axel Lin                 2016-09-07  1144  	clk_disable_unpr=
epare(mt->clk_peri_therm);
a92db1c8089e82 Sascha Hauer             2015-11-30  1145  err_disable_clk_a=
uxadc:
a92db1c8089e82 Sascha Hauer             2015-11-30  1146  	clk_disable_unpr=
epare(mt->clk_auxadc);
a92db1c8089e82 Sascha Hauer             2015-11-30  1147  =

a92db1c8089e82 Sascha Hauer             2015-11-30  1148  	return ret;
a92db1c8089e82 Sascha Hauer             2015-11-30  1149  }
a92db1c8089e82 Sascha Hauer             2015-11-30  1150  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4091743783159527675==--

