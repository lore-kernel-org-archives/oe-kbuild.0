Content-Type: multipart/mixed; boundary="===============1562980501952019728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7092/7526] drivers/iio/frequency/admv1014.c:703:22: sparse: sparse: dubious: x & !y
Date: Wed, 23 Feb 2022 20:47:03 +0800
Message-ID: <202202231856.8PxjKc1L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1562980501952019728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   196d330d7fb1e7cc0d85641c89ce4602cb36f12e
commit: f4eb9ac7842ff22370e262b8440edada40b1680a [7092/7526] iio: frequency=
: admv1014: add support for ADMV1014
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20220223=
/202202231856.8PxjKc1L-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Df4eb9ac7842ff22370e262b8440edada40b1680a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f4eb9ac7842ff22370e262b8440edada40b1680a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
390 SHELL=3D/bin/bash drivers/iio/frequency/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/iio/frequency/admv1014.c:703:22: sparse: sparse: dubious: x & !y

vim +703 drivers/iio/frequency/admv1014.c

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  608  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  609  static int admv1014_init(st=
ruct admv1014_state *st)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  610  {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  611  	unsigned int chip_id, enab=
le_reg, enable_reg_msk;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  612  	struct spi_device *spi =3D=
 st->spi;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  613  	int ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  614  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  615  	ret =3D regulator_bulk_ena=
ble(ADMV1014_NUM_REGULATORS, st->regulators);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  616  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  617  		dev_err(&spi->dev, "Faile=
d to enable regulators");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  618  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  619  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  620  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  621  	ret =3D devm_add_action_or=
_reset(&spi->dev, admv1014_reg_disable, st->regulators);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  622  	if (ret)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  623  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  624  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  625  	ret =3D clk_prepare_enable=
(st->clkin);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  626  	if (ret)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  627  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  628  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  629  	ret =3D devm_add_action_or=
_reset(&spi->dev, admv1014_clk_disable, st->clkin);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  630  	if (ret)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  631  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  632  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  633  	st->nb.notifier_call =3D a=
dmv1014_freq_change;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  634  	ret =3D devm_clk_notifier_=
register(&spi->dev, st->clkin, &st->nb);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  635  	if (ret)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  636  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  637  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  638  	ret =3D devm_add_action_or=
_reset(&spi->dev, admv1014_powerdown, st);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  639  	if (ret)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  640  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  641  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  642  	/* Perform a software rese=
t */
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  643  	ret =3D __admv1014_spi_upd=
ate_bits(st, ADMV1014_REG_SPI_CONTROL,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  644  					 ADMV1014_SPI_SOFT_RES=
ET_MSK,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  645  					 FIELD_PREP(ADMV1014_S=
PI_SOFT_RESET_MSK, 1));
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  646  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  647  		dev_err(&spi->dev, "ADMV1=
014 SPI software reset failed.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  648  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  649  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  650  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  651  	ret =3D __admv1014_spi_upd=
ate_bits(st, ADMV1014_REG_SPI_CONTROL,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  652  					 ADMV1014_SPI_SOFT_RES=
ET_MSK,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  653  					 FIELD_PREP(ADMV1014_S=
PI_SOFT_RESET_MSK, 0));
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  654  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  655  		dev_err(&spi->dev, "ADMV1=
014 SPI software reset disable failed.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  656  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  657  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  658  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  659  	ret =3D __admv1014_spi_wri=
te(st, ADMV1014_REG_VVA_TEMP_COMP, 0x727C);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  660  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  661  		dev_err(&spi->dev, "Writi=
ng default Temperature Compensation value failed.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  662  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  663  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  664  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  665  	ret =3D __admv1014_spi_rea=
d(st, ADMV1014_REG_SPI_CONTROL, &chip_id);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  666  	if (ret)
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  667  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  668  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  669  	chip_id =3D FIELD_GET(ADMV=
1014_CHIP_ID_MSK, chip_id);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  670  	if (chip_id !=3D ADMV1014_=
CHIP_ID) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  671  		dev_err(&spi->dev, "Inval=
id Chip ID.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  672  		ret =3D -EINVAL;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  673  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  674  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  675  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  676  	ret =3D __admv1014_spi_upd=
ate_bits(st, ADMV1014_REG_QUAD,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  677  					 ADMV1014_QUAD_SE_MODE=
_MSK,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  678  					 FIELD_PREP(ADMV1014_Q=
UAD_SE_MODE_MSK,
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  679  						    st->quad_se_mode)=
);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  680  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  681  		dev_err(&spi->dev, "Writi=
ng Quad SE Mode failed.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  682  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  683  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  684  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  685  	ret =3D admv1014_update_qu=
ad_filters(st);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  686  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  687  		dev_err(&spi->dev, "Updat=
e Quad Filters failed.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  688  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  689  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  690  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  691  	ret =3D admv1014_update_vc=
m_settings(st);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  692  	if (ret) {
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  693  		dev_err(&spi->dev, "Updat=
e VCM Settings failed.\n");
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  694  		return ret;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  695  	}
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  696  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  697  	enable_reg_msk =3D ADMV101=
4_P1DB_COMPENSATION_MSK |
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  698  			 ADMV1014_IF_AMP_PD_MSK |
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  699  			 ADMV1014_BB_AMP_PD_MSK |
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  700  			 ADMV1014_DET_EN_MSK;
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  701  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  702  	enable_reg =3D FIELD_PREP(=
ADMV1014_P1DB_COMPENSATION_MSK, st->p1db_comp ? 3 : 0) |
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15 @703  		     FIELD_PREP(ADMV1014_=
IF_AMP_PD_MSK, !(st->input_mode)) |
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  704  		     FIELD_PREP(ADMV1014_=
BB_AMP_PD_MSK, st->input_mode) |
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  705  		     FIELD_PREP(ADMV1014_=
DET_EN_MSK, st->det_en);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  706  =

f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  707  	return __admv1014_spi_upda=
te_bits(st, ADMV1014_REG_ENABLE, enable_reg_msk, enable_reg);
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  708  }
f4eb9ac7842ff2 Antoniu Miclaus 2022-02-15  709  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1562980501952019728==--

