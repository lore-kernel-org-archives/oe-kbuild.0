Content-Type: multipart/mixed; boundary="===============5803740490347254743=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 9/9] iio: accel: bma400: Add support for activity and inactivity events
Date: Tue, 12 Apr 2022 14:44:15 +0800
Message-ID: <202204121411.snZVqiMy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5803740490347254743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411203133.19929-10-jagathjog1996@gmail.com>
References: <20220411203133.19929-10-jagathjog1996@gmail.com>
TO: Jagath Jog J <jagathjog1996@gmail.com>
TO: dan(a)dlrobertson.com
TO: jic23(a)kernel.org
TO: andy.shevchenko(a)gmail.com
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Jagath,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagath-Jog-J/iio-acc=
el-bma400-Add-buffer-step-and-activity-inactivity/20220412-043436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001-20220411 (https://download.01.org/0day-ci/ar=
chive/20220412/202204121411.snZVqiMy-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/accel/bma400_core.c:1154 bma400_read_event_value() warn: imposs=
ible condition '(reg < 0) =3D> (0-255 < 0)'
drivers/iio/accel/bma400_core.c:1202 bma400_write_event_value() warn: impos=
sible condition '(reg < 0) =3D> (0-255 < 0)'

vim +1154 drivers/iio/accel/bma400_core.c

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1141  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1142  static int bma400_read_event=
_value(struct iio_dev *indio_dev,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1143  				   const struct iio_chan=
_spec *chan,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1144  				   enum iio_event_type t=
ype,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1145  				   enum iio_event_direct=
ion dir,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1146  				   enum iio_event_info i=
nfo,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1147  				   int *val, int *val2)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1148  {
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1149  	struct bma400_data *data =
=3D iio_priv(indio_dev);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1150  	int ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1151  	u8 reg, duration[2];
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1152  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1153  	reg =3D get_gen_config_reg(=
dir);
15ee6de45ed7a02 Jagath Jog J 2022-04-12 @1154  	if (reg < 0)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1155  		return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1156  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1157  	*val2 =3D 0;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1158  	switch (info) {
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1159  	case IIO_EV_INFO_VALUE:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1160  		mutex_lock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1161  		ret =3D regmap_read(data->=
regmap, reg + BMA400_GEN_CONFIG2_OFF,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1162  				  val);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1163  		mutex_unlock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1164  		if (ret)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1165  			return ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1166  		return IIO_VAL_INT;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1167  	case IIO_EV_INFO_PERIOD:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1168  		mutex_lock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1169  		ret =3D regmap_bulk_read(d=
ata->regmap,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1170  				       reg + BMA400_GEN_=
CONFIG3_OFF,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1171  				       duration, sizeof(=
duration));
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1172  		mutex_unlock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1173  		if (ret)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1174  			return ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1175  		*val =3D get_unaligned_be1=
6(duration);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1176  		return IIO_VAL_INT;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1177  	case IIO_EV_INFO_HYSTERESIS:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1178  		mutex_lock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1179  		ret =3D regmap_read(data->=
regmap, reg, val);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1180  		mutex_unlock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1181  		if (ret)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1182  			return ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1183  		*val =3D FIELD_GET(BMA400_=
GEN_HYST_MSK, *val);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1184  		return IIO_VAL_INT;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1185  	default:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1186  		return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1187  	}
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1188  }
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1189  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1190  static int bma400_write_even=
t_value(struct iio_dev *indio_dev,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1191  				    const struct iio_cha=
n_spec *chan,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1192  				    enum iio_event_type =
type,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1193  				    enum iio_event_direc=
tion dir,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1194  				    enum iio_event_info =
info,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1195  				    int val, int val2)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1196  {
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1197  	struct bma400_data *data =
=3D iio_priv(indio_dev);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1198  	int ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1199  	u8 reg, duration[2];
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1200  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1201  	reg =3D get_gen_config_reg(=
dir);
15ee6de45ed7a02 Jagath Jog J 2022-04-12 @1202  	if (reg < 0)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1203  		return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1204  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1205  	switch (info) {
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1206  	case IIO_EV_INFO_VALUE:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1207  		if (val < 1 || val > 255)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1208  			return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1209  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1210  		mutex_lock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1211  		ret =3D regmap_write(data-=
>regmap, reg + BMA400_GEN_CONFIG2_OFF,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1212  				   val);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1213  		mutex_unlock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1214  		return ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1215  	case IIO_EV_INFO_PERIOD:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1216  		if (val < 1 || val > 65535)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1217  			return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1218  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1219  		put_unaligned_be16(val, du=
ration);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1220  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1221  		mutex_lock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1222  		ret =3D regmap_bulk_write(=
data->regmap,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1223  					reg + BMA400_GEN_CONFIG=
3_OFF,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1224  					duration, sizeof(durati=
on));
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1225  		mutex_unlock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1226  		return ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1227  	case IIO_EV_INFO_HYSTERESIS:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1228  		if (val < 0 || val > 3)
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1229  			return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1230  =

15ee6de45ed7a02 Jagath Jog J 2022-04-12  1231  		mutex_lock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1232  		ret =3D regmap_update_bits=
(data->regmap, reg,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1233  					 BMA400_GEN_HYST_MSK,
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1234  					 FIELD_PREP(BMA400_GEN_=
HYST_MSK, val));
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1235  		mutex_unlock(&data->mutex);
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1236  		return ret;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1237  	default:
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1238  		return -EINVAL;
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1239  	}
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1240  }
15ee6de45ed7a02 Jagath Jog J 2022-04-12  1241  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5803740490347254743==--

