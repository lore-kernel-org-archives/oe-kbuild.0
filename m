Content-Type: multipart/mixed; boundary="===============1961469115270115096=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 5/9] iio: accel: bma400: Add separate channel for step counter
Date: Tue, 12 Apr 2022 11:14:26 +0800
Message-ID: <202204121105.6gY7K5RD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1961469115270115096==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220411203133.19929-6-jagathjog1996@gmail.com>
References: <20220411203133.19929-6-jagathjog1996@gmail.com>
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
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: openrisc-randconfig-s031-20220411 (https://download.01.org/0day-ci/=
archive/20220412/202204121105.6gY7K5RD-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/24d76bc639c6eedcd5b=
0e0983fbf1a26c81f3a8a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jagath-Jog-J/iio-accel-bma400-Add-=
buffer-step-and-activity-inactivity/20220412-043436
        git checkout 24d76bc639c6eedcd5b0e0983fbf1a26c81f3a8a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Do=
penrisc SHELL=3D/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iio/accel/bma400_core.c:854:42: sparse: sparse: dubious: x & !y

vim +854 drivers/iio/accel/bma400_core.c

465c811f1f201a Dan Robertson 2019-12-20  812  =

465c811f1f201a Dan Robertson 2019-12-20  813  static int bma400_write_raw(s=
truct iio_dev *indio_dev,
465c811f1f201a Dan Robertson 2019-12-20  814  			    struct iio_chan_spec c=
onst *chan, int val, int val2,
465c811f1f201a Dan Robertson 2019-12-20  815  			    long mask)
465c811f1f201a Dan Robertson 2019-12-20  816  {
465c811f1f201a Dan Robertson 2019-12-20  817  	struct bma400_data *data =3D=
 iio_priv(indio_dev);
465c811f1f201a Dan Robertson 2019-12-20  818  	int ret;
465c811f1f201a Dan Robertson 2019-12-20  819  =

465c811f1f201a Dan Robertson 2019-12-20  820  	switch (mask) {
465c811f1f201a Dan Robertson 2019-12-20  821  	case IIO_CHAN_INFO_SAMP_FREQ:
465c811f1f201a Dan Robertson 2019-12-20  822  		/*
465c811f1f201a Dan Robertson 2019-12-20  823  		 * The sample frequency is =
readonly for the temperature
465c811f1f201a Dan Robertson 2019-12-20  824  		 * register and a fixed val=
ue in low-power mode.
465c811f1f201a Dan Robertson 2019-12-20  825  		 */
465c811f1f201a Dan Robertson 2019-12-20  826  		if (chan->type !=3D IIO_ACC=
EL)
465c811f1f201a Dan Robertson 2019-12-20  827  			return -EINVAL;
465c811f1f201a Dan Robertson 2019-12-20  828  =

465c811f1f201a Dan Robertson 2019-12-20  829  		mutex_lock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  830  		ret =3D bma400_set_accel_ou=
tput_data_rate(data, val, val2);
465c811f1f201a Dan Robertson 2019-12-20  831  		mutex_unlock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  832  		return ret;
465c811f1f201a Dan Robertson 2019-12-20  833  	case IIO_CHAN_INFO_SCALE:
98496ccdf0dd88 Dan Carpenter 2020-01-16  834  		if (val !=3D 0 ||
98496ccdf0dd88 Dan Carpenter 2020-01-16  835  		    val2 < BMA400_SCALE_MIN=
 || val2 > BMA400_SCALE_MAX)
465c811f1f201a Dan Robertson 2019-12-20  836  			return -EINVAL;
465c811f1f201a Dan Robertson 2019-12-20  837  =

465c811f1f201a Dan Robertson 2019-12-20  838  		mutex_lock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  839  		ret =3D bma400_set_accel_sc=
ale(data, val2);
465c811f1f201a Dan Robertson 2019-12-20  840  		mutex_unlock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  841  		return ret;
465c811f1f201a Dan Robertson 2019-12-20  842  	case IIO_CHAN_INFO_OVERSAMPL=
ING_RATIO:
465c811f1f201a Dan Robertson 2019-12-20  843  		mutex_lock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  844  		ret =3D bma400_set_accel_ov=
ersampling_ratio(data, val);
465c811f1f201a Dan Robertson 2019-12-20  845  		mutex_unlock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  846  		return ret;
24d76bc639c6ee Jagath Jog J  2022-04-12  847  	case IIO_CHAN_INFO_ENABLE:
24d76bc639c6ee Jagath Jog J  2022-04-12  848  		if (data->steps_enabled =3D=
=3D val)
24d76bc639c6ee Jagath Jog J  2022-04-12  849  			return 0;
24d76bc639c6ee Jagath Jog J  2022-04-12  850  =

24d76bc639c6ee Jagath Jog J  2022-04-12  851  		mutex_lock(&data->mutex);
24d76bc639c6ee Jagath Jog J  2022-04-12  852  		ret =3D regmap_update_bits(=
data->regmap, BMA400_INT_CONFIG1_REG,
24d76bc639c6ee Jagath Jog J  2022-04-12  853  					 BMA400_STEP_INT_MSK,
24d76bc639c6ee Jagath Jog J  2022-04-12 @854  					 FIELD_PREP(BMA400_STEP_=
INT_MSK, !!val));
24d76bc639c6ee Jagath Jog J  2022-04-12  855  		mutex_unlock(&data->mutex);
24d76bc639c6ee Jagath Jog J  2022-04-12  856  		data->steps_enabled =3D val;
24d76bc639c6ee Jagath Jog J  2022-04-12  857  		return ret;
465c811f1f201a Dan Robertson 2019-12-20  858  	default:
465c811f1f201a Dan Robertson 2019-12-20  859  		return -EINVAL;
465c811f1f201a Dan Robertson 2019-12-20  860  	}
465c811f1f201a Dan Robertson 2019-12-20  861  }
465c811f1f201a Dan Robertson 2019-12-20  862  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1961469115270115096==--

