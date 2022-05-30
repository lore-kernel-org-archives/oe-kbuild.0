Content-Type: multipart/mixed; boundary="===============7579779634180525181=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/ingenic-adc.c:657 ingenic_adc_read_chan_info_raw() error: uninitialized symbol 'cmd'.
Date: Tue, 31 May 2022 07:41:18 +0800
Message-ID: <202205310732.x3FWXYVl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7579779634180525181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Branchereau <cbranchereau@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Paul Cercueil <paul@crapouillou.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8ab2afa23bd197df47819a87f0265c0ac95c5b6a
commit: b9e9bdd425a3c99e15f5dfd465bef936130b7491 iio/adc: ingenic: add JZ47=
60 support to the sadc driver
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-m031-20220530 (https://download.01.org/0day-ci/arc=
hive/20220531/202205310732.x3FWXYVl-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/adc/ingenic-adc.c:657 ingenic_adc_read_chan_info_raw() error: u=
ninitialized symbol 'cmd'.

vim +/cmd +657 drivers/iio/adc/ingenic-adc.c

1a78daea107ddb Artur Rojek            2019-02-04  627  =

1a99dc467943c0 Artur Rojek            2020-07-19  628  static int ingenic_a=
dc_read_chan_info_raw(struct iio_dev *iio_dev,
1a78daea107ddb Artur Rojek            2019-02-04  629  					  struct iio_ch=
an_spec const *chan,
a515d648850546 Artur Rojek            2019-07-27  630  					  int *val)
1a78daea107ddb Artur Rojek            2019-02-04  631  {
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  632  	int cmd, ret, engin=
e =3D (chan->channel =3D=3D INGENIC_ADC_BATTERY);
1a99dc467943c0 Artur Rojek            2020-07-19  633  	struct ingenic_adc =
*adc =3D iio_priv(iio_dev);
1a99dc467943c0 Artur Rojek            2020-07-19  634  =

1a99dc467943c0 Artur Rojek            2020-07-19  635  	ret =3D clk_enable(=
adc->clk);
1a99dc467943c0 Artur Rojek            2020-07-19  636  	if (ret) {
1a99dc467943c0 Artur Rojek            2020-07-19  637  		dev_err(iio_dev->d=
ev.parent, "Failed to enable clock: %d\n",
1a99dc467943c0 Artur Rojek            2020-07-19  638  			ret);
1a99dc467943c0 Artur Rojek            2020-07-19  639  		return ret;
1a99dc467943c0 Artur Rojek            2020-07-19  640  	}
1a78daea107ddb Artur Rojek            2019-02-04  641  =

b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  642  	/* We cannot sample=
 the aux channels in parallel. */
a515d648850546 Artur Rojek            2019-07-27  643  	mutex_lock(&adc->au=
x_lock);
9c5eb724f96f8d Christophe Branchereau 2021-07-26  644  	if (adc->soc_data->=
has_aux_md && engine =3D=3D 0) {
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  645  		switch (chan->chan=
nel) {
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  646  		case INGENIC_ADC_A=
UX0:
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  647  			cmd =3D 0;
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  648  			break;
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  649  		case INGENIC_ADC_A=
UX:
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  650  			cmd =3D 1;
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  651  			break;
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  652  		case INGENIC_ADC_A=
UX2:
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  653  			cmd =3D 2;
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  654  			break;
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  655  		}
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  656  =

b9e9bdd425a3c9 Christophe Branchereau 2021-07-26 @657  		ingenic_adc_set_co=
nfig(adc, JZ_ADC_REG_CFG_AUX_MD, cmd);
1a78daea107ddb Artur Rojek            2019-02-04  658  	}
1a78daea107ddb Artur Rojek            2019-02-04  659  =

a515d648850546 Artur Rojek            2019-07-27  660  	ret =3D ingenic_adc=
_capture(adc, engine);
a515d648850546 Artur Rojek            2019-07-27  661  	if (ret)
a515d648850546 Artur Rojek            2019-07-27  662  		goto out;
a515d648850546 Artur Rojek            2019-07-27  663  =

1a78daea107ddb Artur Rojek            2019-02-04  664  	switch (chan->chann=
el) {
b9e9bdd425a3c9 Christophe Branchereau 2021-07-26  665  	case INGENIC_ADC_AU=
X0:
1a78daea107ddb Artur Rojek            2019-02-04  666  	case INGENIC_ADC_AU=
X:
a515d648850546 Artur Rojek            2019-07-27  667  	case INGENIC_ADC_AU=
X2:
1a78daea107ddb Artur Rojek            2019-02-04  668  		*val =3D readw(adc=
->base + JZ_ADC_REG_ADSDAT);
1a78daea107ddb Artur Rojek            2019-02-04  669  		break;
1a78daea107ddb Artur Rojek            2019-02-04  670  	case INGENIC_ADC_BA=
TTERY:
1a78daea107ddb Artur Rojek            2019-02-04  671  		*val =3D readw(adc=
->base + JZ_ADC_REG_ADBDAT);
1a78daea107ddb Artur Rojek            2019-02-04  672  		break;
1a78daea107ddb Artur Rojek            2019-02-04  673  	}
1a78daea107ddb Artur Rojek            2019-02-04  674  =

a515d648850546 Artur Rojek            2019-07-27  675  	ret =3D IIO_VAL_INT;
a515d648850546 Artur Rojek            2019-07-27  676  out:
a515d648850546 Artur Rojek            2019-07-27  677  	mutex_unlock(&adc->=
aux_lock);
1a99dc467943c0 Artur Rojek            2020-07-19  678  	clk_disable(adc->cl=
k);
1a78daea107ddb Artur Rojek            2019-02-04  679  =

a515d648850546 Artur Rojek            2019-07-27  680  	return ret;
a515d648850546 Artur Rojek            2019-07-27  681  }
a515d648850546 Artur Rojek            2019-07-27  682  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7579779634180525181==--

