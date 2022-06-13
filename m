Content-Type: multipart/mixed; boundary="===============0512247151352909096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 473/2566] drivers/iio/accel/bma400_core.c:1091 bma400_activity_event_en() error: uninitialized symbol 'field_value'.
Date: Tue, 14 Jun 2022 03:11:16 +0800
Message-ID: <202206140359.xjWBGkEY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0512247151352909096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jagath Jog J <jagathjog1996@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6d0c806803170f120f8cb97b321de7bd89d3a791
commit: 296d0a4a13be9e03b5eccc33d7ef5980ccd2b4c3 [473/2566] iio: accel: bma=
400: Add support for activity and inactivity events
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021-20220613 (https://download.01.org/0day-ci/arch=
ive/20220614/202206140359.xjWBGkEY-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/accel/bma400_core.c:1091 bma400_activity_event_en() error: unin=
itialized symbol 'field_value'.

vim +/field_value +1091 drivers/iio/accel/bma400_core.c

e6391ddd68c56a Jagath Jog J 2022-05-05  1044  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1045  static int bma400_activity_ev=
ent_en(struct bma400_data *data,
296d0a4a13be9e Jagath Jog J 2022-05-05  1046  				    enum iio_event_direct=
ion dir,
296d0a4a13be9e Jagath Jog J 2022-05-05  1047  				    int state)
296d0a4a13be9e Jagath Jog J 2022-05-05  1048  {
296d0a4a13be9e Jagath Jog J 2022-05-05  1049  	int ret, reg, msk, value, fi=
eld_value;
296d0a4a13be9e Jagath Jog J 2022-05-05  1050  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1051  	switch (dir) {
296d0a4a13be9e Jagath Jog J 2022-05-05  1052  	case IIO_EV_DIR_RISING:
296d0a4a13be9e Jagath Jog J 2022-05-05  1053  		reg =3D BMA400_GEN1INT_CONF=
IG0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1054  		msk =3D BMA400_INT_GEN1_MSK;
296d0a4a13be9e Jagath Jog J 2022-05-05  1055  		value =3D 2;
296d0a4a13be9e Jagath Jog J 2022-05-05  1056  		set_mask_bits(&field_value,=
 BMA400_INT_GEN1_MSK,
296d0a4a13be9e Jagath Jog J 2022-05-05  1057  			      FIELD_PREP(BMA400_IN=
T_GEN1_MSK, state));
296d0a4a13be9e Jagath Jog J 2022-05-05  1058  		break;
296d0a4a13be9e Jagath Jog J 2022-05-05  1059  	case IIO_EV_DIR_FALLING:
296d0a4a13be9e Jagath Jog J 2022-05-05  1060  		reg =3D BMA400_GEN2INT_CONF=
IG0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1061  		msk =3D BMA400_INT_GEN2_MSK;
296d0a4a13be9e Jagath Jog J 2022-05-05  1062  		value =3D 0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1063  		set_mask_bits(&field_value,=
 BMA400_INT_GEN2_MSK,
296d0a4a13be9e Jagath Jog J 2022-05-05  1064  			      FIELD_PREP(BMA400_IN=
T_GEN2_MSK, state));
296d0a4a13be9e Jagath Jog J 2022-05-05  1065  		break;
296d0a4a13be9e Jagath Jog J 2022-05-05  1066  	default:
296d0a4a13be9e Jagath Jog J 2022-05-05  1067  		return -EINVAL;
296d0a4a13be9e Jagath Jog J 2022-05-05  1068  	}
296d0a4a13be9e Jagath Jog J 2022-05-05  1069  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1070  	/* Enabling all axis for int=
errupt evaluation */
296d0a4a13be9e Jagath Jog J 2022-05-05  1071  	ret =3D regmap_write(data->r=
egmap, reg, 0xF8);
296d0a4a13be9e Jagath Jog J 2022-05-05  1072  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1073  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1074  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1075  	/* OR combination of all axi=
s for interrupt evaluation */
296d0a4a13be9e Jagath Jog J 2022-05-05  1076  	ret =3D regmap_write(data->r=
egmap, reg + BMA400_GEN_CONFIG1_OFF, value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1077  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1078  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1079  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1080  	/* Initial value to avoid in=
terrupts while enabling*/
296d0a4a13be9e Jagath Jog J 2022-05-05  1081  	ret =3D regmap_write(data->r=
egmap, reg + BMA400_GEN_CONFIG2_OFF, 0x0A);
296d0a4a13be9e Jagath Jog J 2022-05-05  1082  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1083  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1084  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1085  	/* Initial duration value to=
 avoid interrupts while enabling*/
296d0a4a13be9e Jagath Jog J 2022-05-05  1086  	ret =3D regmap_write(data->r=
egmap, reg + BMA400_GEN_CONFIG31_OFF, 0x0F);
296d0a4a13be9e Jagath Jog J 2022-05-05  1087  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1088  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1089  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1090  	ret =3D regmap_update_bits(d=
ata->regmap, BMA400_INT1_MAP_REG, msk,
296d0a4a13be9e Jagath Jog J 2022-05-05 @1091  				 field_value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1092  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1093  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1094  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1095  	ret =3D regmap_update_bits(d=
ata->regmap, BMA400_INT_CONFIG0_REG, msk,
296d0a4a13be9e Jagath Jog J 2022-05-05  1096  				 field_value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1097  	if (ret)
296d0a4a13be9e Jagath Jog J 2022-05-05  1098  		return ret;
296d0a4a13be9e Jagath Jog J 2022-05-05  1099  =

296d0a4a13be9e Jagath Jog J 2022-05-05  1100  	set_mask_bits(&data->generic=
_event_en, msk, field_value);
296d0a4a13be9e Jagath Jog J 2022-05-05  1101  	return 0;
296d0a4a13be9e Jagath Jog J 2022-05-05  1102  }
296d0a4a13be9e Jagath Jog J 2022-05-05  1103  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0512247151352909096==--

