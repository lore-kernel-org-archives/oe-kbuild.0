Content-Type: multipart/mixed; boundary="===============0052145921392542703=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jic23-iio:testing 140/140] drivers/iio/accel/bma400_core.c:1287 bma400_tap_event_en() error: uninitialized symbol 'field_value'.
Date: Mon, 05 Sep 2022 18:26:40 +0800
Message-ID: <202209051814.Y1Dsz1YC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0052145921392542703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jagath Jog J <jagathjog1996@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   feda14587d41ad04b29a693246707583472d2eb9
commit: feda14587d41ad04b29a693246707583472d2eb9 [140/140] iio: accel: bma4=
00: Add support for single and double tap events
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-m021-20220905 (https://download.01.org/0day-ci/arch=
ive/20220905/202209051814.Y1Dsz1YC-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iio/accel/bma400_core.c:1287 bma400_tap_event_en() error: uninitial=
ized symbol 'field_value'.

Old smatch warnings:
drivers/iio/accel/bma400_core.c:1229 bma400_activity_event_en() error: unin=
itialized symbol 'field_value'.

vim +/field_value +1287 drivers/iio/accel/bma400_core.c

3cf122c20bf835 Jagath Jog J 2022-05-05  1241  =

feda14587d41ad Jagath Jog J 2022-08-31  1242  static int bma400_tap_event_e=
n(struct bma400_data *data,
feda14587d41ad Jagath Jog J 2022-08-31  1243  			       enum iio_event_dire=
ction dir, int state)
feda14587d41ad Jagath Jog J 2022-08-31  1244  {
feda14587d41ad Jagath Jog J 2022-08-31  1245  	unsigned int mask, field_val=
ue;
feda14587d41ad Jagath Jog J 2022-08-31  1246  	int ret;
feda14587d41ad Jagath Jog J 2022-08-31  1247  =

feda14587d41ad Jagath Jog J 2022-08-31  1248  	/*
feda14587d41ad Jagath Jog J 2022-08-31  1249  	 * Tap interrupts can be con=
figured only in normal mode.
feda14587d41ad Jagath Jog J 2022-08-31  1250  	 * See table in section 4.3 =
"Power modes - performance modes" of
feda14587d41ad Jagath Jog J 2022-08-31  1251  	 * datasheet v1.2.
feda14587d41ad Jagath Jog J 2022-08-31  1252  	 */
feda14587d41ad Jagath Jog J 2022-08-31  1253  	if (data->power_mode !=3D PO=
WER_MODE_NORMAL)
feda14587d41ad Jagath Jog J 2022-08-31  1254  		return -EINVAL;
feda14587d41ad Jagath Jog J 2022-08-31  1255  =

feda14587d41ad Jagath Jog J 2022-08-31  1256  	/*
feda14587d41ad Jagath Jog J 2022-08-31  1257  	 * Tap interrupts are operat=
ing with a data rate of 200Hz.
feda14587d41ad Jagath Jog J 2022-08-31  1258  	 * See section 4.7 "Tap sens=
ing interrupt" in datasheet v1.2.
feda14587d41ad Jagath Jog J 2022-08-31  1259  	 */
feda14587d41ad Jagath Jog J 2022-08-31  1260  	if (data->sample_freq.hz !=
=3D 200 && state) {
feda14587d41ad Jagath Jog J 2022-08-31  1261  		dev_err(data->dev, "Invalid=
 data rate for tap interrupts.\n");
feda14587d41ad Jagath Jog J 2022-08-31  1262  		return -EINVAL;
feda14587d41ad Jagath Jog J 2022-08-31  1263  	}
feda14587d41ad Jagath Jog J 2022-08-31  1264  =

feda14587d41ad Jagath Jog J 2022-08-31  1265  	ret =3D regmap_update_bits(d=
ata->regmap, BMA400_INT12_MAP_REG,
feda14587d41ad Jagath Jog J 2022-08-31  1266  				 BMA400_S_TAP_MSK,
feda14587d41ad Jagath Jog J 2022-08-31  1267  				 FIELD_PREP(BMA400_S_TAP_=
MSK, state));
feda14587d41ad Jagath Jog J 2022-08-31  1268  	if (ret)
feda14587d41ad Jagath Jog J 2022-08-31  1269  		return ret;
feda14587d41ad Jagath Jog J 2022-08-31  1270  =

feda14587d41ad Jagath Jog J 2022-08-31  1271  	switch (dir) {
feda14587d41ad Jagath Jog J 2022-08-31  1272  	case IIO_EV_DIR_SINGLETAP:
feda14587d41ad Jagath Jog J 2022-08-31  1273  		mask =3D BMA400_S_TAP_MSK;
feda14587d41ad Jagath Jog J 2022-08-31  1274  		set_mask_bits(&field_value,=
 BMA400_S_TAP_MSK,
feda14587d41ad Jagath Jog J 2022-08-31  1275  			      FIELD_PREP(BMA400_S_=
TAP_MSK, state));
feda14587d41ad Jagath Jog J 2022-08-31  1276  		break;
feda14587d41ad Jagath Jog J 2022-08-31  1277  	case IIO_EV_DIR_DOUBLETAP:
feda14587d41ad Jagath Jog J 2022-08-31  1278  		mask =3D BMA400_D_TAP_MSK;
feda14587d41ad Jagath Jog J 2022-08-31  1279  		set_mask_bits(&field_value,=
 BMA400_D_TAP_MSK,
feda14587d41ad Jagath Jog J 2022-08-31  1280  			      FIELD_PREP(BMA400_D_=
TAP_MSK, state));
feda14587d41ad Jagath Jog J 2022-08-31  1281  		break;
feda14587d41ad Jagath Jog J 2022-08-31  1282  	default:
feda14587d41ad Jagath Jog J 2022-08-31  1283  		return -EINVAL;
feda14587d41ad Jagath Jog J 2022-08-31  1284  	}
feda14587d41ad Jagath Jog J 2022-08-31  1285  =

feda14587d41ad Jagath Jog J 2022-08-31  1286  	ret =3D regmap_update_bits(d=
ata->regmap, BMA400_INT_CONFIG1_REG, mask,
feda14587d41ad Jagath Jog J 2022-08-31 @1287  				 field_value);
feda14587d41ad Jagath Jog J 2022-08-31  1288  	if (ret)
feda14587d41ad Jagath Jog J 2022-08-31  1289  		return ret;
feda14587d41ad Jagath Jog J 2022-08-31  1290  =

feda14587d41ad Jagath Jog J 2022-08-31  1291  	set_mask_bits(&data->tap_eve=
nt_en_bitmask, mask, field_value);
feda14587d41ad Jagath Jog J 2022-08-31  1292  =

feda14587d41ad Jagath Jog J 2022-08-31  1293  	return 0;
feda14587d41ad Jagath Jog J 2022-08-31  1294  }
feda14587d41ad Jagath Jog J 2022-08-31  1295  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0052145921392542703==--

