Content-Type: multipart/mixed; boundary="===============7525366799337060729=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2790/4921] drivers/hwmon/asus_wmi_sensors.c:569 asus_wmi_configure_sensor_setup() error: buffer overflow 'hwmon_attributes' 8 <= 9
Date: Thu, 02 Dec 2021 23:22:03 +0800
Message-ID: <202112022332.tw3sZZuo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7525366799337060729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Denis Pauk <pauk.denis@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Ed Brindley <kernel@maidavale.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9606f9efb1cec7f8f5912326f182fbfbcad34382
commit: 9d7d41752e9e9794b1725f85252fc34ab302e679 [2790/4921] hwmon: (asus_w=
mi_sensors) Support X370 Asus WMI.
:::::: branch date: 9 hours ago
:::::: commit date: 8 days ago
config: x86_64-randconfig-m001-20211201 (https://download.01.org/0day-ci/ar=
chive/20211202/202112022332.tw3sZZuo-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/asus_wmi_sensors.c:569 asus_wmi_configure_sensor_setup() erro=
r: buffer overflow 'hwmon_attributes' 8 <=3D 9

vim +/hwmon_attributes +569 drivers/hwmon/asus_wmi_sensors.c

9d7d41752e9e97 Denis Pauk 2021-11-16  502  =

9d7d41752e9e97 Denis Pauk 2021-11-16  503  static int asus_wmi_configure_se=
nsor_setup(struct device *dev,
9d7d41752e9e97 Denis Pauk 2021-11-16  504  					   struct asus_wmi_sensors =
*sensor_data)
9d7d41752e9e97 Denis Pauk 2021-11-16  505  {
9d7d41752e9e97 Denis Pauk 2021-11-16  506  	const struct hwmon_channel_info=
 **ptr_asus_wmi_ci;
9d7d41752e9e97 Denis Pauk 2021-11-16  507  	struct hwmon_channel_info *asus=
_wmi_hwmon_chan;
9d7d41752e9e97 Denis Pauk 2021-11-16  508  	int nr_count[hwmon_max] =3D {},=
 nr_types =3D 0;
9d7d41752e9e97 Denis Pauk 2021-11-16  509  	struct asus_wmi_sensor_info *te=
mp_sensor;
9d7d41752e9e97 Denis Pauk 2021-11-16  510  	const struct hwmon_chip_info *c=
hip_info;
9d7d41752e9e97 Denis Pauk 2021-11-16  511  	enum hwmon_sensor_types type;
9d7d41752e9e97 Denis Pauk 2021-11-16  512  	struct device *hwdev;
9d7d41752e9e97 Denis Pauk 2021-11-16  513  	int i, idx;
9d7d41752e9e97 Denis Pauk 2021-11-16  514  	int err;
9d7d41752e9e97 Denis Pauk 2021-11-16  515  =

9d7d41752e9e97 Denis Pauk 2021-11-16  516  	temp_sensor =3D devm_kcalloc(de=
v, 1, sizeof(*temp_sensor), GFP_KERNEL);
9d7d41752e9e97 Denis Pauk 2021-11-16  517  	if (!temp_sensor)
9d7d41752e9e97 Denis Pauk 2021-11-16  518  		return -ENOMEM;
9d7d41752e9e97 Denis Pauk 2021-11-16  519  =

9d7d41752e9e97 Denis Pauk 2021-11-16  520  	for (i =3D 0; i < sensor_data->=
wmi.sensor_count; i++) {
9d7d41752e9e97 Denis Pauk 2021-11-16  521  		err =3D asus_wmi_sensor_info(i=
, temp_sensor);
9d7d41752e9e97 Denis Pauk 2021-11-16  522  		if (err)
9d7d41752e9e97 Denis Pauk 2021-11-16  523  			return err;
9d7d41752e9e97 Denis Pauk 2021-11-16  524  =

9d7d41752e9e97 Denis Pauk 2021-11-16  525  		switch (temp_sensor->data_type=
) {
9d7d41752e9e97 Denis Pauk 2021-11-16  526  		case TEMPERATURE_C:
9d7d41752e9e97 Denis Pauk 2021-11-16  527  		case VOLTAGE:
9d7d41752e9e97 Denis Pauk 2021-11-16  528  		case CURRENT:
9d7d41752e9e97 Denis Pauk 2021-11-16  529  		case FAN_RPM:
9d7d41752e9e97 Denis Pauk 2021-11-16  530  		case WATER_FLOW:
9d7d41752e9e97 Denis Pauk 2021-11-16  531  			type =3D asus_data_types[temp=
_sensor->data_type];
9d7d41752e9e97 Denis Pauk 2021-11-16  532  			if (!nr_count[type])
9d7d41752e9e97 Denis Pauk 2021-11-16  533  				nr_types++;
9d7d41752e9e97 Denis Pauk 2021-11-16  534  			nr_count[type]++;
9d7d41752e9e97 Denis Pauk 2021-11-16  535  			break;
9d7d41752e9e97 Denis Pauk 2021-11-16  536  		}
9d7d41752e9e97 Denis Pauk 2021-11-16  537  	}
9d7d41752e9e97 Denis Pauk 2021-11-16  538  =

9d7d41752e9e97 Denis Pauk 2021-11-16  539  	if (nr_count[hwmon_temp])
9d7d41752e9e97 Denis Pauk 2021-11-16  540  		nr_count[hwmon_chip]++, nr_typ=
es++;
9d7d41752e9e97 Denis Pauk 2021-11-16  541  =

9d7d41752e9e97 Denis Pauk 2021-11-16  542  	asus_wmi_hwmon_chan =3D devm_kc=
alloc(dev, nr_types,
9d7d41752e9e97 Denis Pauk 2021-11-16  543  					   sizeof(*asus_wmi_hwmon_c=
han),
9d7d41752e9e97 Denis Pauk 2021-11-16  544  					   GFP_KERNEL);
9d7d41752e9e97 Denis Pauk 2021-11-16  545  	if (!asus_wmi_hwmon_chan)
9d7d41752e9e97 Denis Pauk 2021-11-16  546  		return -ENOMEM;
9d7d41752e9e97 Denis Pauk 2021-11-16  547  =

9d7d41752e9e97 Denis Pauk 2021-11-16  548  	ptr_asus_wmi_ci =3D devm_kcallo=
c(dev, nr_types + 1,
9d7d41752e9e97 Denis Pauk 2021-11-16  549  				       sizeof(*ptr_asus_wmi_=
ci), GFP_KERNEL);
9d7d41752e9e97 Denis Pauk 2021-11-16  550  	if (!ptr_asus_wmi_ci)
9d7d41752e9e97 Denis Pauk 2021-11-16  551  		return -ENOMEM;
9d7d41752e9e97 Denis Pauk 2021-11-16  552  =

9d7d41752e9e97 Denis Pauk 2021-11-16  553  	asus_wmi_chip_info.info =3D ptr=
_asus_wmi_ci;
9d7d41752e9e97 Denis Pauk 2021-11-16  554  	chip_info =3D &asus_wmi_chip_in=
fo;
9d7d41752e9e97 Denis Pauk 2021-11-16  555  =

9d7d41752e9e97 Denis Pauk 2021-11-16  556  	sensor_data->wmi.info_by_id =3D=
 devm_kcalloc(dev, sensor_data->wmi.sensor_count,
9d7d41752e9e97 Denis Pauk 2021-11-16  557  						   sizeof(*sensor_data->wm=
i.info_by_id),
9d7d41752e9e97 Denis Pauk 2021-11-16  558  						   GFP_KERNEL);
9d7d41752e9e97 Denis Pauk 2021-11-16  559  =

9d7d41752e9e97 Denis Pauk 2021-11-16  560  	if (!sensor_data->wmi.info_by_i=
d)
9d7d41752e9e97 Denis Pauk 2021-11-16  561  		return -ENOMEM;
9d7d41752e9e97 Denis Pauk 2021-11-16  562  =

9d7d41752e9e97 Denis Pauk 2021-11-16  563  	for (type =3D 0; type < hwmon_m=
ax; type++) {
9d7d41752e9e97 Denis Pauk 2021-11-16  564  		if (!nr_count[type])
9d7d41752e9e97 Denis Pauk 2021-11-16  565  			continue;
9d7d41752e9e97 Denis Pauk 2021-11-16  566  =

9d7d41752e9e97 Denis Pauk 2021-11-16  567  		err =3D asus_wmi_hwmon_add_cha=
n_info(asus_wmi_hwmon_chan, dev,
9d7d41752e9e97 Denis Pauk 2021-11-16  568  						   nr_count[type], type,
9d7d41752e9e97 Denis Pauk 2021-11-16 @569  						   hwmon_attributes[type]);
9d7d41752e9e97 Denis Pauk 2021-11-16  570  		if (err)
9d7d41752e9e97 Denis Pauk 2021-11-16  571  			return err;
9d7d41752e9e97 Denis Pauk 2021-11-16  572  =

9d7d41752e9e97 Denis Pauk 2021-11-16  573  		*ptr_asus_wmi_ci++ =3D asus_wm=
i_hwmon_chan++;
9d7d41752e9e97 Denis Pauk 2021-11-16  574  =

9d7d41752e9e97 Denis Pauk 2021-11-16  575  		sensor_data->wmi.info[type] =
=3D devm_kcalloc(dev,
9d7d41752e9e97 Denis Pauk 2021-11-16  576  							   nr_count[type],
9d7d41752e9e97 Denis Pauk 2021-11-16  577  							   sizeof(*sensor_data->w=
mi.info),
9d7d41752e9e97 Denis Pauk 2021-11-16  578  							   GFP_KERNEL);
9d7d41752e9e97 Denis Pauk 2021-11-16  579  		if (!sensor_data->wmi.info[typ=
e])
9d7d41752e9e97 Denis Pauk 2021-11-16  580  			return -ENOMEM;
9d7d41752e9e97 Denis Pauk 2021-11-16  581  	}
9d7d41752e9e97 Denis Pauk 2021-11-16  582  =

9d7d41752e9e97 Denis Pauk 2021-11-16  583  	for (i =3D sensor_data->wmi.sen=
sor_count - 1; i >=3D 0; i--) {
9d7d41752e9e97 Denis Pauk 2021-11-16  584  		temp_sensor =3D devm_kzalloc(d=
ev, sizeof(*temp_sensor), GFP_KERNEL);
9d7d41752e9e97 Denis Pauk 2021-11-16  585  		if (!temp_sensor)
9d7d41752e9e97 Denis Pauk 2021-11-16  586  			return -ENOMEM;
9d7d41752e9e97 Denis Pauk 2021-11-16  587  =

9d7d41752e9e97 Denis Pauk 2021-11-16  588  		err =3D asus_wmi_sensor_info(i=
, temp_sensor);
9d7d41752e9e97 Denis Pauk 2021-11-16  589  		if (err)
9d7d41752e9e97 Denis Pauk 2021-11-16  590  			continue;
9d7d41752e9e97 Denis Pauk 2021-11-16  591  =

9d7d41752e9e97 Denis Pauk 2021-11-16  592  		switch (temp_sensor->data_type=
) {
9d7d41752e9e97 Denis Pauk 2021-11-16  593  		case TEMPERATURE_C:
9d7d41752e9e97 Denis Pauk 2021-11-16  594  		case VOLTAGE:
9d7d41752e9e97 Denis Pauk 2021-11-16  595  		case CURRENT:
9d7d41752e9e97 Denis Pauk 2021-11-16  596  		case FAN_RPM:
9d7d41752e9e97 Denis Pauk 2021-11-16  597  		case WATER_FLOW:
9d7d41752e9e97 Denis Pauk 2021-11-16  598  			type =3D asus_data_types[temp=
_sensor->data_type];
9d7d41752e9e97 Denis Pauk 2021-11-16  599  			idx =3D --nr_count[type];
9d7d41752e9e97 Denis Pauk 2021-11-16  600  			*(sensor_data->wmi.info[type]=
 + idx) =3D temp_sensor;
9d7d41752e9e97 Denis Pauk 2021-11-16  601  			sensor_data->wmi.info_by_id[i=
] =3D temp_sensor;
9d7d41752e9e97 Denis Pauk 2021-11-16  602  			break;
9d7d41752e9e97 Denis Pauk 2021-11-16  603  		}
9d7d41752e9e97 Denis Pauk 2021-11-16  604  	}
9d7d41752e9e97 Denis Pauk 2021-11-16  605  =

9d7d41752e9e97 Denis Pauk 2021-11-16  606  	dev_dbg(dev, "board has %d sens=
ors",
9d7d41752e9e97 Denis Pauk 2021-11-16  607  		sensor_data->wmi.sensor_count);
9d7d41752e9e97 Denis Pauk 2021-11-16  608  =

9d7d41752e9e97 Denis Pauk 2021-11-16  609  	hwdev =3D devm_hwmon_device_reg=
ister_with_info(dev, "asus_wmi_sensors",
9d7d41752e9e97 Denis Pauk 2021-11-16  610  						     sensor_data, chip_inf=
o, NULL);
9d7d41752e9e97 Denis Pauk 2021-11-16  611  =

9d7d41752e9e97 Denis Pauk 2021-11-16  612  	return PTR_ERR_OR_ZERO(hwdev);
9d7d41752e9e97 Denis Pauk 2021-11-16  613  }
9d7d41752e9e97 Denis Pauk 2021-11-16  614  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7525366799337060729==--

