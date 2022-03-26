Content-Type: multipart/mixed; boundary="===============2021178031369286627=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 5/5] iio: accel: bma400: Add step change event
Date: Sun, 27 Mar 2022 06:26:15 +0800
Message-ID: <202203270615.KLDZXbOm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2021178031369286627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220326194146.15549-6-jagathjog1996@gmail.com>
References: <20220326194146.15549-6-jagathjog1996@gmail.com>
TO: Jagath Jog J <jagathjog1996@gmail.com>
TO: dan(a)dlrobertson.com
TO: jic23(a)kernel.org
TO: andy.shevchenko(a)gmail.com
CC: linux-iio(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Jagath,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.17]
[cannot apply to jic23-iio/togreg next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jagath-Jog-J/iio-acc=
el-bma400-Add-support-for-buffer-and-step/20220327-034340
base:    f443e374ae131c168a065ea1748feac6b2e76613
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: parisc-randconfig-c024-20220327 (https://download.01.org/0day-ci/ar=
chive/20220327/202203270615.KLDZXbOm-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iio/accel/bma400_core.c:924:4-10: preceding lock on line 916

vim +924 drivers/iio/accel/bma400_core.c

289ea151b60e04 Jagath Jog J 2022-03-27  905  =

289ea151b60e04 Jagath Jog J 2022-03-27  906  static int bma400_write_event_=
config(struct iio_dev *indio_dev,
289ea151b60e04 Jagath Jog J 2022-03-27  907  				     const struct iio_chan=
_spec *chan,
289ea151b60e04 Jagath Jog J 2022-03-27  908  				     enum iio_event_type t=
ype,
289ea151b60e04 Jagath Jog J 2022-03-27  909  				     enum iio_event_direct=
ion dir, int state)
289ea151b60e04 Jagath Jog J 2022-03-27  910  {
289ea151b60e04 Jagath Jog J 2022-03-27  911  	int ret;
289ea151b60e04 Jagath Jog J 2022-03-27  912  	struct bma400_data *data =3D =
iio_priv(indio_dev);
289ea151b60e04 Jagath Jog J 2022-03-27  913  =

289ea151b60e04 Jagath Jog J 2022-03-27  914  	switch (type) {
289ea151b60e04 Jagath Jog J 2022-03-27  915  	case IIO_EV_TYPE_CHANGE:
289ea151b60e04 Jagath Jog J 2022-03-27 @916  		mutex_lock(&data->mutex);
289ea151b60e04 Jagath Jog J 2022-03-27  917  		if (!data->steps_enabled) {
289ea151b60e04 Jagath Jog J 2022-03-27  918  			ret =3D regmap_update_bits(=
data->regmap,
289ea151b60e04 Jagath Jog J 2022-03-27  919  						 BMA400_INT_CONFIG1_REG,
289ea151b60e04 Jagath Jog J 2022-03-27  920  						 BMA400_STEP_INT_MSK,
289ea151b60e04 Jagath Jog J 2022-03-27  921  						 FIELD_PREP(BMA400_STEP_=
INT_MSK,
289ea151b60e04 Jagath Jog J 2022-03-27  922  							    1));
289ea151b60e04 Jagath Jog J 2022-03-27  923  			if (ret)
289ea151b60e04 Jagath Jog J 2022-03-27 @924  				return ret;
289ea151b60e04 Jagath Jog J 2022-03-27  925  			data->steps_enabled =3D 1;
289ea151b60e04 Jagath Jog J 2022-03-27  926  		}
289ea151b60e04 Jagath Jog J 2022-03-27  927  =

289ea151b60e04 Jagath Jog J 2022-03-27  928  		ret =3D regmap_update_bits(d=
ata->regmap,
289ea151b60e04 Jagath Jog J 2022-03-27  929  					 BMA400_INT12_MAP_REG,
289ea151b60e04 Jagath Jog J 2022-03-27  930  					 BMA400_STEP_INT_MSK,
289ea151b60e04 Jagath Jog J 2022-03-27  931  					 FIELD_PREP(BMA400_STEP_I=
NT_MSK,
289ea151b60e04 Jagath Jog J 2022-03-27  932  						    state));
289ea151b60e04 Jagath Jog J 2022-03-27  933  		mutex_unlock(&data->mutex);
289ea151b60e04 Jagath Jog J 2022-03-27  934  		if (ret)
289ea151b60e04 Jagath Jog J 2022-03-27  935  			return ret;
289ea151b60e04 Jagath Jog J 2022-03-27  936  		data->step_event_en =3D stat=
e;
289ea151b60e04 Jagath Jog J 2022-03-27  937  		return 0;
289ea151b60e04 Jagath Jog J 2022-03-27  938  	default:
289ea151b60e04 Jagath Jog J 2022-03-27  939  		return -EINVAL;
289ea151b60e04 Jagath Jog J 2022-03-27  940  	}
289ea151b60e04 Jagath Jog J 2022-03-27  941  }
289ea151b60e04 Jagath Jog J 2022-03-27  942  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2021178031369286627==--

