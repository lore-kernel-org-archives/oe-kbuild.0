Content-Type: multipart/mixed; boundary="===============3785946599350914716=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 4/5] iio: accel: bma400: Add separate channel for step counter
Date: Sun, 20 Mar 2022 12:21:57 +0800
Message-ID: <202203201202.2ntrQ6KC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3785946599350914716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220319181023.8090-5-jagathjog1996@gmail.com>
References: <20220319181023.8090-5-jagathjog1996@gmail.com>
TO: Jagath Jog J <jagathjog1996@gmail.com>
TO: dan(a)dlrobertson.com
TO: jic23(a)kernel.org
TO: andy.shevchenko(a)gmail.com
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Jagath,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.17-rc8]
[cannot apply to jic23-iio/togreg next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jagath-Jog-J/iio-accel-bma=
400-Add-support-for-buffer-and-step/20220320-021114
base:    09688c0166e76ce2fb85e86b9d99be8b0084cdf9
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20220=
320/202203201202.2ntrQ6KC-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/3b579e3178a37ce190fc99801=
4d0613e053b384b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jagath-Jog-J/iio-accel-bma400-Add-=
support-for-buffer-and-step/20220320-021114
        git checkout 3b579e3178a37ce190fc998014d0613e053b384b
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iio/accel/bma400_core.c:834:42: sparse: sparse: dubious: x & !y
   drivers/iio/accel/bma400_core.c:945:13: sparse: sparse: restricted __le1=
6 degrades to integer

vim +834 drivers/iio/accel/bma400_core.c

465c811f1f201a Dan Robertson 2019-12-20  792  =

465c811f1f201a Dan Robertson 2019-12-20  793  static int bma400_write_raw(s=
truct iio_dev *indio_dev,
465c811f1f201a Dan Robertson 2019-12-20  794  			    struct iio_chan_spec c=
onst *chan, int val, int val2,
465c811f1f201a Dan Robertson 2019-12-20  795  			    long mask)
465c811f1f201a Dan Robertson 2019-12-20  796  {
465c811f1f201a Dan Robertson 2019-12-20  797  	struct bma400_data *data =3D=
 iio_priv(indio_dev);
465c811f1f201a Dan Robertson 2019-12-20  798  	int ret;
465c811f1f201a Dan Robertson 2019-12-20  799  =

465c811f1f201a Dan Robertson 2019-12-20  800  	switch (mask) {
465c811f1f201a Dan Robertson 2019-12-20  801  	case IIO_CHAN_INFO_SAMP_FREQ:
465c811f1f201a Dan Robertson 2019-12-20  802  		/*
465c811f1f201a Dan Robertson 2019-12-20  803  		 * The sample frequency is =
readonly for the temperature
465c811f1f201a Dan Robertson 2019-12-20  804  		 * register and a fixed val=
ue in low-power mode.
465c811f1f201a Dan Robertson 2019-12-20  805  		 */
465c811f1f201a Dan Robertson 2019-12-20  806  		if (chan->type !=3D IIO_ACC=
EL)
465c811f1f201a Dan Robertson 2019-12-20  807  			return -EINVAL;
465c811f1f201a Dan Robertson 2019-12-20  808  =

465c811f1f201a Dan Robertson 2019-12-20  809  		mutex_lock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  810  		ret =3D bma400_set_accel_ou=
tput_data_rate(data, val, val2);
465c811f1f201a Dan Robertson 2019-12-20  811  		mutex_unlock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  812  		return ret;
465c811f1f201a Dan Robertson 2019-12-20  813  	case IIO_CHAN_INFO_SCALE:
98496ccdf0dd88 Dan Carpenter 2020-01-16  814  		if (val !=3D 0 ||
98496ccdf0dd88 Dan Carpenter 2020-01-16  815  		    val2 < BMA400_SCALE_MIN=
 || val2 > BMA400_SCALE_MAX)
465c811f1f201a Dan Robertson 2019-12-20  816  			return -EINVAL;
465c811f1f201a Dan Robertson 2019-12-20  817  =

465c811f1f201a Dan Robertson 2019-12-20  818  		mutex_lock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  819  		ret =3D bma400_set_accel_sc=
ale(data, val2);
465c811f1f201a Dan Robertson 2019-12-20  820  		mutex_unlock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  821  		return ret;
465c811f1f201a Dan Robertson 2019-12-20  822  	case IIO_CHAN_INFO_OVERSAMPL=
ING_RATIO:
465c811f1f201a Dan Robertson 2019-12-20  823  		mutex_lock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  824  		ret =3D bma400_set_accel_ov=
ersampling_ratio(data, val);
465c811f1f201a Dan Robertson 2019-12-20  825  		mutex_unlock(&data->mutex);
465c811f1f201a Dan Robertson 2019-12-20  826  		return ret;
3b579e3178a37c Jagath Jog J  2022-03-19  827  	case IIO_CHAN_INFO_ENABLE:
3b579e3178a37c Jagath Jog J  2022-03-19  828  		if (data->steps_enabled =3D=
=3D val)
3b579e3178a37c Jagath Jog J  2022-03-19  829  			return 0;
3b579e3178a37c Jagath Jog J  2022-03-19  830  =

3b579e3178a37c Jagath Jog J  2022-03-19  831  		mutex_lock(&data->mutex);
3b579e3178a37c Jagath Jog J  2022-03-19  832  		ret =3D regmap_update_bits(=
data->regmap, BMA400_INT_CONFIG1_REG,
3b579e3178a37c Jagath Jog J  2022-03-19  833  					 BMA400_STEP_INT_MSK,
3b579e3178a37c Jagath Jog J  2022-03-19 @834  					 FIELD_PREP(BMA400_STEP_=
INT_MSK, !!val));
3b579e3178a37c Jagath Jog J  2022-03-19  835  		mutex_unlock(&data->mutex);
3b579e3178a37c Jagath Jog J  2022-03-19  836  		data->steps_enabled =3D val;
3b579e3178a37c Jagath Jog J  2022-03-19  837  		return ret;
465c811f1f201a Dan Robertson 2019-12-20  838  	default:
465c811f1f201a Dan Robertson 2019-12-20  839  		return -EINVAL;
465c811f1f201a Dan Robertson 2019-12-20  840  	}
465c811f1f201a Dan Robertson 2019-12-20  841  }
465c811f1f201a Dan Robertson 2019-12-20  842  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3785946599350914716==--

