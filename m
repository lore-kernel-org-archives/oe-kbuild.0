Content-Type: multipart/mixed; boundary="===============3053307807135925700=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hwmon/scpi-hwmon.c:155 scpi_hwmon_probe() error: uninitialized symbol 'nr_sensors'.
Date: Wed, 08 Dec 2021 10:23:43 +0800
Message-ID: <202112081015.jGFfyKtS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3053307807135925700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

Hi Arnd,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/=
firmware/Kconfig unconditionally
date:   9 weeks ago
:::::: branch date: 26 hours ago
:::::: commit date: 9 weeks ago
config: microblaze-randconfig-m031-20211207 (https://download.01.org/0day-c=
i/archive/20211208/202112081015.jGFfyKtS-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/scpi-hwmon.c:155 scpi_hwmon_probe() error: uninitialized symb=
ol 'nr_sensors'.

vim +/nr_sensors +155 drivers/hwmon/scpi-hwmon.c

ccc9b8263d9042 Carlo Caione     2017-05-30  134  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  135  static int scpi_hwmon_prob=
e(struct platform_device *pdev)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  136  {
ea98b29a05e9c7 Punit Agrawal    2015-05-21  137  	u16 nr_sensors, i;
ccc9b8263d9042 Carlo Caione     2017-05-30  138  	const u32 *scale;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  139  	int num_temp =3D 0, num_v=
olt =3D 0, num_current =3D 0, num_power =3D 0;
fb3b07ef399bd6 Sudeep Holla     2016-01-25  140  	int num_energy =3D 0;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  141  	struct scpi_ops *scpi_ops;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  142  	struct device *hwdev, *de=
v =3D &pdev->dev;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  143  	struct scpi_sensors *scpi=
_sensors;
ccc9b8263d9042 Carlo Caione     2017-05-30  144  	const struct of_device_id=
 *of_id;
d7817ff27b06bf Eduardo Valentin 2016-03-09  145  	int idx, ret;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  146  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  147  	scpi_ops =3D get_scpi_ops=
();
ea98b29a05e9c7 Punit Agrawal    2015-05-21  148  	if (!scpi_ops)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  149  		return -EPROBE_DEFER;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  150  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  151  	ret =3D scpi_ops->sensor_=
get_capability(&nr_sensors);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  152  	if (ret)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  153  		return ret;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  154  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21 @155  	if (!nr_sensors)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  156  		return -ENODEV;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  157  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  158  	scpi_sensors =3D devm_kza=
lloc(dev, sizeof(*scpi_sensors), GFP_KERNEL);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  159  	if (!scpi_sensors)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  160  		return -ENOMEM;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  161  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  162  	scpi_sensors->data =3D de=
vm_kcalloc(dev, nr_sensors,
ea98b29a05e9c7 Punit Agrawal    2015-05-21  163  				   sizeof(*scpi_sensor=
s->data), GFP_KERNEL);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  164  	if (!scpi_sensors->data)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  165  		return -ENOMEM;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  166  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  167  	scpi_sensors->attrs =3D d=
evm_kcalloc(dev, (nr_sensors * 2) + 1,
ea98b29a05e9c7 Punit Agrawal    2015-05-21  168  				   sizeof(*scpi_sensor=
s->attrs), GFP_KERNEL);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  169  	if (!scpi_sensors->attrs)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  170  		return -ENOMEM;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  171  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  172  	scpi_sensors->scpi_ops =
=3D scpi_ops;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  173  =

ccc9b8263d9042 Carlo Caione     2017-05-30  174  	of_id =3D of_match_device=
(scpi_of_match, &pdev->dev);
ccc9b8263d9042 Carlo Caione     2017-05-30  175  	if (!of_id) {
ccc9b8263d9042 Carlo Caione     2017-05-30  176  		dev_err(&pdev->dev, "Una=
ble to initialize scpi-hwmon data\n");
ccc9b8263d9042 Carlo Caione     2017-05-30  177  		return -ENODEV;
ccc9b8263d9042 Carlo Caione     2017-05-30  178  	}
ccc9b8263d9042 Carlo Caione     2017-05-30  179  	scale =3D of_id->data;
ccc9b8263d9042 Carlo Caione     2017-05-30  180  =

cef03d7e66bd70 Sudeep Holla     2015-10-28  181  	for (i =3D 0, idx =3D 0; =
i < nr_sensors; i++) {
cef03d7e66bd70 Sudeep Holla     2015-10-28  182  		struct sensor_data *sens=
or =3D &scpi_sensors->data[idx];
ea98b29a05e9c7 Punit Agrawal    2015-05-21  183  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  184  		ret =3D scpi_ops->sensor=
_get_info(i, &sensor->info);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  185  		if (ret)
ea98b29a05e9c7 Punit Agrawal    2015-05-21  186  			return ret;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  187  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  188  		switch (sensor->info.cla=
ss) {
ea98b29a05e9c7 Punit Agrawal    2015-05-21  189  		case TEMPERATURE:
ea98b29a05e9c7 Punit Agrawal    2015-05-21  190  			snprintf(sensor->input,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  191  				 "temp%d_input", num_t=
emp + 1);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  192  			snprintf(sensor->label,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  193  				 "temp%d_label", num_t=
emp + 1);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  194  			num_temp++;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  195  			break;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  196  		case VOLTAGE:
ea98b29a05e9c7 Punit Agrawal    2015-05-21  197  			snprintf(sensor->input,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  198  				 "in%d_input", num_vol=
t);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  199  			snprintf(sensor->label,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  200  				 "in%d_label", num_vol=
t);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  201  			num_volt++;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  202  			break;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  203  		case CURRENT:
ea98b29a05e9c7 Punit Agrawal    2015-05-21  204  			snprintf(sensor->input,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  205  				 "curr%d_input", num_c=
urrent + 1);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  206  			snprintf(sensor->label,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  207  				 "curr%d_label", num_c=
urrent + 1);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  208  			num_current++;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  209  			break;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  210  		case POWER:
ea98b29a05e9c7 Punit Agrawal    2015-05-21  211  			snprintf(sensor->input,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  212  				 "power%d_input", num_=
power + 1);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  213  			snprintf(sensor->label,=
 sizeof(sensor->input),
ea98b29a05e9c7 Punit Agrawal    2015-05-21  214  				 "power%d_label", num_=
power + 1);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  215  			num_power++;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  216  			break;
fb3b07ef399bd6 Sudeep Holla     2016-01-25  217  		case ENERGY:
fb3b07ef399bd6 Sudeep Holla     2016-01-25  218  			snprintf(sensor->input,=
 sizeof(sensor->input),
fb3b07ef399bd6 Sudeep Holla     2016-01-25  219  				 "energy%d_input", num=
_energy + 1);
fb3b07ef399bd6 Sudeep Holla     2016-01-25  220  			snprintf(sensor->label,=
 sizeof(sensor->input),
fb3b07ef399bd6 Sudeep Holla     2016-01-25  221  				 "energy%d_label", num=
_energy + 1);
fb3b07ef399bd6 Sudeep Holla     2016-01-25  222  			num_energy++;
fb3b07ef399bd6 Sudeep Holla     2016-01-25  223  			break;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  224  		default:
cef03d7e66bd70 Sudeep Holla     2015-10-28  225  			continue;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  226  		}
ea98b29a05e9c7 Punit Agrawal    2015-05-21  227  =

ccc9b8263d9042 Carlo Caione     2017-05-30  228  		sensor->scale =3D scale[=
sensor->info.class];
ccc9b8263d9042 Carlo Caione     2017-05-30  229  =

6a0785aaf025b3 Guenter Roeck    2018-12-10  230  		sensor->dev_attr_input.a=
ttr.mode =3D 0444;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  231  		sensor->dev_attr_input.s=
how =3D scpi_show_sensor;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  232  		sensor->dev_attr_input.a=
ttr.name =3D sensor->input;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  233  =

6a0785aaf025b3 Guenter Roeck    2018-12-10  234  		sensor->dev_attr_label.a=
ttr.mode =3D 0444;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  235  		sensor->dev_attr_label.s=
how =3D scpi_show_label;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  236  		sensor->dev_attr_label.a=
ttr.name =3D sensor->label;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  237  =

cef03d7e66bd70 Sudeep Holla     2015-10-28  238  		scpi_sensors->attrs[idx =
<< 1] =3D &sensor->dev_attr_input.attr;
cef03d7e66bd70 Sudeep Holla     2015-10-28  239  		scpi_sensors->attrs[(idx=
 << 1) + 1] =3D &sensor->dev_attr_label.attr;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  240  =

cef03d7e66bd70 Sudeep Holla     2015-10-28  241  		sysfs_attr_init(scpi_sen=
sors->attrs[idx << 1]);
cef03d7e66bd70 Sudeep Holla     2015-10-28  242  		sysfs_attr_init(scpi_sen=
sors->attrs[(idx << 1) + 1]);
cef03d7e66bd70 Sudeep Holla     2015-10-28  243  		idx++;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  244  	}
ea98b29a05e9c7 Punit Agrawal    2015-05-21  245  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  246  	scpi_sensors->group.attrs=
 =3D scpi_sensors->attrs;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  247  	scpi_sensors->groups[0] =
=3D &scpi_sensors->group;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  248  =

68acc77a2d5197 Punit Agrawal    2015-06-24  249  	platform_set_drvdata(pdev=
, scpi_sensors);
68acc77a2d5197 Punit Agrawal    2015-06-24  250  =

ea98b29a05e9c7 Punit Agrawal    2015-05-21  251  	hwdev =3D devm_hwmon_devi=
ce_register_with_groups(dev,
ea98b29a05e9c7 Punit Agrawal    2015-05-21  252  			"scpi_sensors", scpi_se=
nsors, scpi_sensors->groups);
ea98b29a05e9c7 Punit Agrawal    2015-05-21  253  =

68acc77a2d5197 Punit Agrawal    2015-06-24  254  	if (IS_ERR(hwdev))
68acc77a2d5197 Punit Agrawal    2015-06-24  255  		return PTR_ERR(hwdev);
68acc77a2d5197 Punit Agrawal    2015-06-24  256  =

68acc77a2d5197 Punit Agrawal    2015-06-24  257  	/*
68acc77a2d5197 Punit Agrawal    2015-06-24  258  	 * Register the temperatu=
re sensors with the thermal framework
68acc77a2d5197 Punit Agrawal    2015-06-24  259  	 * to allow their usage i=
n setting up the thermal zones from
68acc77a2d5197 Punit Agrawal    2015-06-24  260  	 * device tree.
68acc77a2d5197 Punit Agrawal    2015-06-24  261  	 *
68acc77a2d5197 Punit Agrawal    2015-06-24  262  	 * NOTE: Not all temperat=
ure sensors maybe used for thermal
68acc77a2d5197 Punit Agrawal    2015-06-24  263  	 * control
68acc77a2d5197 Punit Agrawal    2015-06-24  264  	 */
68acc77a2d5197 Punit Agrawal    2015-06-24  265  	INIT_LIST_HEAD(&scpi_sens=
ors->thermal_zones);
68acc77a2d5197 Punit Agrawal    2015-06-24  266  	for (i =3D 0; i < nr_sens=
ors; i++) {
68acc77a2d5197 Punit Agrawal    2015-06-24  267  		struct sensor_data *sens=
or =3D &scpi_sensors->data[i];
d7817ff27b06bf Eduardo Valentin 2016-03-09  268  		struct thermal_zone_devi=
ce *z;
68acc77a2d5197 Punit Agrawal    2015-06-24  269  		struct scpi_thermal_zone=
 *zone;
68acc77a2d5197 Punit Agrawal    2015-06-24  270  =

68acc77a2d5197 Punit Agrawal    2015-06-24  271  		if (sensor->info.class !=
=3D TEMPERATURE)
68acc77a2d5197 Punit Agrawal    2015-06-24  272  			continue;
68acc77a2d5197 Punit Agrawal    2015-06-24  273  =

68acc77a2d5197 Punit Agrawal    2015-06-24  274  		zone =3D devm_kzalloc(de=
v, sizeof(*zone), GFP_KERNEL);
d7817ff27b06bf Eduardo Valentin 2016-03-09  275  		if (!zone)
d7817ff27b06bf Eduardo Valentin 2016-03-09  276  			return -ENOMEM;
68acc77a2d5197 Punit Agrawal    2015-06-24  277  =

68acc77a2d5197 Punit Agrawal    2015-06-24  278  		zone->sensor_id =3D i;
68acc77a2d5197 Punit Agrawal    2015-06-24  279  		zone->scpi_sensors =3D s=
cpi_sensors;
d7817ff27b06bf Eduardo Valentin 2016-03-09  280  		z =3D devm_thermal_zone_=
of_sensor_register(dev,
d7817ff27b06bf Eduardo Valentin 2016-03-09  281  							 sensor->info.senso=
r_id,
d7817ff27b06bf Eduardo Valentin 2016-03-09  282  							 zone,
d7817ff27b06bf Eduardo Valentin 2016-03-09  283  							 &scpi_sensor_ops);
68acc77a2d5197 Punit Agrawal    2015-06-24  284  		/*
68acc77a2d5197 Punit Agrawal    2015-06-24  285  		 * The call to thermal_z=
one_of_sensor_register returns
68acc77a2d5197 Punit Agrawal    2015-06-24  286  		 * an error for sensors =
that are not associated with
68acc77a2d5197 Punit Agrawal    2015-06-24  287  		 * any thermal zones or =
if the thermal subsystem is
68acc77a2d5197 Punit Agrawal    2015-06-24  288  		 * not configured.
68acc77a2d5197 Punit Agrawal    2015-06-24  289  		 */
3045b5d61a60b6 zhong jiang      2018-09-21  290  		if (IS_ERR(z))
68acc77a2d5197 Punit Agrawal    2015-06-24  291  			devm_kfree(dev, zone);
68acc77a2d5197 Punit Agrawal    2015-06-24  292  	}
68acc77a2d5197 Punit Agrawal    2015-06-24  293  =

68acc77a2d5197 Punit Agrawal    2015-06-24  294  	return 0;
ea98b29a05e9c7 Punit Agrawal    2015-05-21  295  }
ea98b29a05e9c7 Punit Agrawal    2015-05-21  296  =


:::::: The code at line 155 was first introduced by commit
:::::: ea98b29a05e9c70dbe159cbc6254d111059a2bb9 hwmon: Support sensors expo=
rted via ARM SCP interface

:::::: TO: Punit Agrawal <punit.agrawal@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3053307807135925700==--

