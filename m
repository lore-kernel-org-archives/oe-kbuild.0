Content-Type: multipart/mixed; boundary="===============3383965258756162203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2255/4921] drivers/hwmon/asus_wmi_ec_sensors.c:562 asus_wmi_ec_configure_sensor_setup() error: buffer overflow 'hwmon_attributes' 8 <= 9
Date: Thu, 02 Dec 2021 20:39:59 +0800
Message-ID: <202112022013.afBXgpY7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3383965258756162203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Denis Pauk <pauk.denis@gmail.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Eugene Shalygin <eugene.shalygin@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9606f9efb1cec7f8f5912326f182fbfbcad34382
commit: c04c7f7bfcbe2f11f83a00b624990e4dd8d46d3d [2255/4921] hwmon: (asus_w=
mi_ec_sensors) Support B550 Asus WMI.
:::::: branch date: 6 hours ago
:::::: commit date: 12 days ago
config: x86_64-randconfig-m001-20211201 (https://download.01.org/0day-ci/ar=
chive/20211202/202112022013.afBXgpY7-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/asus_wmi_ec_sensors.c:562 asus_wmi_ec_configure_sensor_setup(=
) error: buffer overflow 'hwmon_attributes' 8 <=3D 9

vim +/hwmon_attributes +562 drivers/hwmon/asus_wmi_ec_sensors.c

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  504  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  505  static int asus_wmi_ec_configur=
e_sensor_setup(struct device *dev,
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  506  					      const enum known_ec_=
sensor *bsi)
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  507  {
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  508  	struct asus_wmi_sensors *senso=
r_data =3D dev_get_drvdata(dev);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  509  	struct asus_wmi_ec_info *ec =
=3D &sensor_data->ec;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  510  	struct hwmon_channel_info *asu=
s_wmi_hwmon_chan;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  511  	const struct hwmon_channel_inf=
o **asus_wmi_ci;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  512  	int nr_count[hwmon_max] =3D {}=
, nr_types =3D 0;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  513  	const struct hwmon_chip_info *=
chip_info;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  514  	const struct ec_sensor_info *s=
i;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  515  	enum hwmon_sensor_types type;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  516  	struct device *hwdev;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  517  	int i, ret;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  518  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  519  	ret =3D asus_wmi_ec_fill_board=
_sensors(ec, bsi);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  520  	if (ret)
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  521  		return ret;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  522  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  523  	if (!sensor_data->ec.nr_sensor=
s)
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  524  		return -ENODEV;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  525  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  526  	for (i =3D 0; i < ec->nr_senso=
rs; i++) {
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  527  		si =3D &known_ec_sensors[ec->=
sensors[i].info_index];
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  528  		if (!nr_count[si->type])
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  529  			nr_types++;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  530  		nr_count[si->type]++;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  531  	}
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  532  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  533  	if (nr_count[hwmon_temp]) {
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  534  		nr_count[hwmon_chip]++;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  535  		nr_types++;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  536  	}
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  537  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  538  	/*
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  539  	 * If we can get values for al=
l the registers in a single query,
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  540  	 * the query will not change f=
rom call to call.
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  541  	 */
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  542  	asus_wmi_ec_make_block_read_qu=
ery(ec);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  543  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  544  	asus_wmi_hwmon_chan =3D devm_k=
calloc(dev, nr_types, sizeof(*asus_wmi_hwmon_chan),
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  545  					   GFP_KERNEL);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  546  	if (!asus_wmi_hwmon_chan)
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  547  		return -ENOMEM;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  548  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  549  	asus_wmi_ci =3D devm_kcalloc(d=
ev, nr_types + 1, sizeof(*asus_wmi_ci), GFP_KERNEL);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  550  	if (!asus_wmi_ci)
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  551  		return -ENOMEM;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  552  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  553  	asus_wmi_ec_chip_info.info =3D=
 asus_wmi_ci;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  554  	chip_info =3D &asus_wmi_ec_chi=
p_info;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  555  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  556  	for (type =3D 0; type < hwmon_=
max; type++) {
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  557  		if (!nr_count[type])
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  558  			continue;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  559  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  560  		ret =3D asus_wmi_hwmon_add_ch=
an_info(asus_wmi_hwmon_chan, dev,
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  561  						   nr_count[type], type,
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16 @562  						   hwmon_attributes[type]=
);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  563  		if (ret)
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  564  			return ret;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  565  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  566  		*asus_wmi_ci++ =3D asus_wmi_h=
wmon_chan++;
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  567  	}
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  568  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  569  	dev_dbg(dev, "board has %d EC =
sensors that span %d registers",
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  570  		ec->nr_sensors, ec->nr_regist=
ers);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  571  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  572  	hwdev =3D devm_hwmon_device_re=
gister_with_info(dev, "asus_wmi_ec_sensors",
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  573  						     sensor_data, chip_in=
fo, NULL);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  574  =

c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  575  	return PTR_ERR_OR_ZERO(hwdev);
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  576  }
c04c7f7bfcbe2f1 Denis Pauk 2021-11-16  577  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3383965258756162203==--

