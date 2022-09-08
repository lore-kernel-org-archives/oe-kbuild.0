Content-Type: multipart/mixed; boundary="===============0874294416916774334=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4509/6188] drivers/hwmon/emc2305.c:195 emc2305_set_cur_state() warn: impossible condition '(val > 255) => (0-255 > 255)'
Date: Fri, 09 Sep 2022 07:20:54 +0800
Message-ID: <202209090740.Q3MUf1sT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0874294416916774334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michael Shych <michaelsh@nvidia.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Vadim Pasternak <vadimp@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   47c191411b68a771261be3dc0bd6f68394cef358
commit: e1613d1e468b3bd0d82ec6a5c078cb3f68148425 [4509/6188] hwmon: (emc230=
5) add support for EMC2301/2/3/5 RPM-based PWM Fan Speed Controller.
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: microblaze-randconfig-m041-20220907 (https://download.01.org/0day-c=
i/archive/20220909/202209090740.Q3MUf1sT-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/emc2305.c:195 emc2305_set_cur_state() warn: impossible condit=
ion '(val > 255) =3D> (0-255 > 255)'

vim +195 drivers/hwmon/emc2305.c

e1613d1e468b3b Michael Shych 2022-08-10  175  =

e1613d1e468b3b Michael Shych 2022-08-10  176  static int emc2305_set_cur_st=
ate(struct thermal_cooling_device *cdev, unsigned long state)
e1613d1e468b3b Michael Shych 2022-08-10  177  {
e1613d1e468b3b Michael Shych 2022-08-10  178  	int cdev_idx, ret;
e1613d1e468b3b Michael Shych 2022-08-10  179  	struct emc2305_data *data =
=3D cdev->devdata;
e1613d1e468b3b Michael Shych 2022-08-10  180  	struct i2c_client *client =
=3D data->client;
e1613d1e468b3b Michael Shych 2022-08-10  181  	u8 val, i;
e1613d1e468b3b Michael Shych 2022-08-10  182  =

e1613d1e468b3b Michael Shych 2022-08-10  183  	if (state > data->max_state)
e1613d1e468b3b Michael Shych 2022-08-10  184  		return -EINVAL;
e1613d1e468b3b Michael Shych 2022-08-10  185  =

e1613d1e468b3b Michael Shych 2022-08-10  186  	cdev_idx =3D  emc2305_get_cd=
ev_idx(cdev);
e1613d1e468b3b Michael Shych 2022-08-10  187  	if (cdev_idx < 0)
e1613d1e468b3b Michael Shych 2022-08-10  188  		return cdev_idx;
e1613d1e468b3b Michael Shych 2022-08-10  189  =

e1613d1e468b3b Michael Shych 2022-08-10  190  	/* Save thermal state. */
e1613d1e468b3b Michael Shych 2022-08-10  191  	data->cdev_data[cdev_idx].la=
st_thermal_state =3D state;
e1613d1e468b3b Michael Shych 2022-08-10  192  	state =3D max_t(unsigned lon=
g, state, data->cdev_data[cdev_idx].last_hwmon_state);
e1613d1e468b3b Michael Shych 2022-08-10  193  =

e1613d1e468b3b Michael Shych 2022-08-10  194  	val =3D EMC2305_PWM_STATE2DU=
TY(state, data->max_state, EMC2305_FAN_MAX);
e1613d1e468b3b Michael Shych 2022-08-10 @195  	if (val > EMC2305_FAN_MAX)
e1613d1e468b3b Michael Shych 2022-08-10  196  		return -EINVAL;
e1613d1e468b3b Michael Shych 2022-08-10  197  =

e1613d1e468b3b Michael Shych 2022-08-10  198  	data->cdev_data[cdev_idx].cu=
r_state =3D state;
e1613d1e468b3b Michael Shych 2022-08-10  199  	if (data->pwm_separate) {
e1613d1e468b3b Michael Shych 2022-08-10  200  		ret =3D i2c_smbus_write_byt=
e_data(client, EMC2305_REG_FAN_DRIVE(cdev_idx), val);
e1613d1e468b3b Michael Shych 2022-08-10  201  		if (ret < 0)
e1613d1e468b3b Michael Shych 2022-08-10  202  			return ret;
e1613d1e468b3b Michael Shych 2022-08-10  203  	} else {
e1613d1e468b3b Michael Shych 2022-08-10  204  		/*
e1613d1e468b3b Michael Shych 2022-08-10  205  		 * Set the same PWM value i=
n all channels
e1613d1e468b3b Michael Shych 2022-08-10  206  		 * if common PWM channel is=
 used.
e1613d1e468b3b Michael Shych 2022-08-10  207  		 */
e1613d1e468b3b Michael Shych 2022-08-10  208  		for (i =3D 0; i < data->pwm=
_num; i++) {
e1613d1e468b3b Michael Shych 2022-08-10  209  			ret =3D i2c_smbus_write_by=
te_data(client, EMC2305_REG_FAN_DRIVE(i), val);
e1613d1e468b3b Michael Shych 2022-08-10  210  			if (ret < 0)
e1613d1e468b3b Michael Shych 2022-08-10  211  				return ret;
e1613d1e468b3b Michael Shych 2022-08-10  212  		}
e1613d1e468b3b Michael Shych 2022-08-10  213  	}
e1613d1e468b3b Michael Shych 2022-08-10  214  =

e1613d1e468b3b Michael Shych 2022-08-10  215  	return 0;
e1613d1e468b3b Michael Shych 2022-08-10  216  }
e1613d1e468b3b Michael Shych 2022-08-10  217  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0874294416916774334==--

