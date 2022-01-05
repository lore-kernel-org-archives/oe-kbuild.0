Content-Type: multipart/mixed; boundary="===============2329696499600701689=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/3] iio:frequency:admv1014: add support for ADMV1014
Date: Wed, 05 Jan 2022 14:39:34 +0800
Message-ID: <202201051411.AbahQe1q-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2329696499600701689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220103092201.21576-2-antoniu.miclaus@analog.com>
References: <20220103092201.21576-2-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: jic23(a)kernel.org
TO: robh+dt(a)kernel.org
TO: linux-iio(a)vger.kernel.org
TO: devicetree(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>

Hi Antoniu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.16-rc8]
[cannot apply to jic23-iio/togreg next-20220104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Antoniu-Miclaus/iio-freque=
ncy-admv1014-add-support-for-ADMV1014/20220103-182231
base:    c9e6606c7fe92b50a02ce51dda82586ebdf99b48
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-s032-20220105 (https://download.01.org/0day-ci/ar=
chive/20220105/202201051411.AbahQe1q-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/dc8d9031c5310585cbd4c4d89=
5609e505d5e81e6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Antoniu-Miclaus/iio-frequency-admv=
1014-add-support-for-ADMV1014/20220103-182231
        git checkout dc8d9031c5310585cbd4c4d895609e505d5e81e6
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash drivers/iio/frequency/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iio/frequency/admv1014.c:613:22: sparse: sparse: dubious: x & !y

vim +613 drivers/iio/frequency/admv1014.c

dc8d9031c531058 Antoniu Miclaus 2022-01-03  546  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  547  static int admv1014_init(s=
truct admv1014_state *st)
dc8d9031c531058 Antoniu Miclaus 2022-01-03  548  {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  549  	int ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  550  	unsigned int chip_id, ena=
ble_reg, enable_reg_msk;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  551  	struct spi_device *spi =
=3D st->spi;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  552  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  553  	/* Perform a software res=
et */
dc8d9031c531058 Antoniu Miclaus 2022-01-03  554  	ret =3D __admv1014_spi_up=
date_bits(st, ADMV1014_REG_SPI_CONTROL,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  555  					 ADMV1014_SPI_SOFT_RE=
SET_MSK,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  556  					 FIELD_PREP(ADMV1014_=
SPI_SOFT_RESET_MSK, 1));
dc8d9031c531058 Antoniu Miclaus 2022-01-03  557  	if (ret) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  558  		dev_err(&spi->dev, "ADMV=
1014 SPI software reset failed.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  559  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  560  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  561  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  562  	ret =3D __admv1014_spi_up=
date_bits(st, ADMV1014_REG_SPI_CONTROL,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  563  					 ADMV1014_SPI_SOFT_RE=
SET_MSK,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  564  					 FIELD_PREP(ADMV1014_=
SPI_SOFT_RESET_MSK, 0));
dc8d9031c531058 Antoniu Miclaus 2022-01-03  565  	if (ret) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  566  		dev_err(&spi->dev, "ADMV=
1014 SPI software reset disable failed.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  567  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  568  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  569  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  570  	ret =3D admv1014_spi_writ=
e(st, ADMV1014_REG_VVA_TEMP_COMP, 0x727C);
dc8d9031c531058 Antoniu Miclaus 2022-01-03  571  	if (ret) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  572  		dev_err(&spi->dev, "Writ=
ing default Temperature Compensation value failed.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  573  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  574  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  575  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  576  	ret =3D admv1014_spi_read=
(st, ADMV1014_REG_SPI_CONTROL, &chip_id);
dc8d9031c531058 Antoniu Miclaus 2022-01-03  577  	if (ret)
dc8d9031c531058 Antoniu Miclaus 2022-01-03  578  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  579  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  580  	chip_id =3D (chip_id & AD=
MV1014_CHIP_ID_MSK) >> 4;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  581  	if (chip_id !=3D ADMV1014=
_CHIP_ID) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  582  		dev_err(&spi->dev, "Inva=
lid Chip ID.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  583  		return -EINVAL;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  584  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  585  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  586  	ret =3D __admv1014_spi_up=
date_bits(st, ADMV1014_REG_QUAD,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  587  					 ADMV1014_QUAD_SE_MOD=
E_MSK,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  588  					 FIELD_PREP(ADMV1014_=
QUAD_SE_MODE_MSK,
dc8d9031c531058 Antoniu Miclaus 2022-01-03  589  						    st->quad_se_mode=
));
dc8d9031c531058 Antoniu Miclaus 2022-01-03  590  	if (ret) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  591  		dev_err(&spi->dev, "Writ=
ing Quad SE Mode failed.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  592  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  593  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  594  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  595  	ret =3D admv1014_update_q=
uad_filters(st);
dc8d9031c531058 Antoniu Miclaus 2022-01-03  596  	if (ret) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  597  		dev_err(&spi->dev, "Upda=
te Quad Filters failed.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  598  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  599  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  600  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  601  	ret =3D admv1014_update_v=
cm_settings(st);
dc8d9031c531058 Antoniu Miclaus 2022-01-03  602  	if (ret) {
dc8d9031c531058 Antoniu Miclaus 2022-01-03  603  		dev_err(&spi->dev, "Upda=
te VCM Settings failed.\n");
dc8d9031c531058 Antoniu Miclaus 2022-01-03  604  		return ret;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  605  	}
dc8d9031c531058 Antoniu Miclaus 2022-01-03  606  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  607  	enable_reg_msk =3D ADMV10=
14_P1DB_COMPENSATION_MSK |
dc8d9031c531058 Antoniu Miclaus 2022-01-03  608  			 ADMV1014_IF_AMP_PD_MSK=
 |
dc8d9031c531058 Antoniu Miclaus 2022-01-03  609  			 ADMV1014_BB_AMP_PD_MSK=
 |
dc8d9031c531058 Antoniu Miclaus 2022-01-03  610  			 ADMV1014_DET_EN_MSK;
dc8d9031c531058 Antoniu Miclaus 2022-01-03  611  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  612  	enable_reg =3D FIELD_PREP=
(ADMV1014_P1DB_COMPENSATION_MSK, st->p1db_comp) |
dc8d9031c531058 Antoniu Miclaus 2022-01-03 @613  		     FIELD_PREP(ADMV1014=
_IF_AMP_PD_MSK, !(st->input_mode)) |
dc8d9031c531058 Antoniu Miclaus 2022-01-03  614  		     FIELD_PREP(ADMV1014=
_BB_AMP_PD_MSK, st->input_mode) |
dc8d9031c531058 Antoniu Miclaus 2022-01-03  615  		     FIELD_PREP(ADMV1014=
_DET_EN_MSK, st->det_en);
dc8d9031c531058 Antoniu Miclaus 2022-01-03  616  =

dc8d9031c531058 Antoniu Miclaus 2022-01-03  617  	return __admv1014_spi_upd=
ate_bits(st, ADMV1014_REG_ENABLE, enable_reg_msk, enable_reg);
dc8d9031c531058 Antoniu Miclaus 2022-01-03  618  }
dc8d9031c531058 Antoniu Miclaus 2022-01-03  619  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2329696499600701689==--

