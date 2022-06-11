Content-Type: multipart/mixed; boundary="===============5411247947529018830=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/adc/ad_sigma_delta.c:493 ad_sd_trigger_handler() error: uninitialized symbol 'status_pos'.
Date: Sun, 12 Jun 2022 02:25:04 +0800
Message-ID: <202206120236.tXGHViuz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5411247947529018830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Tachici <alexandru.tachici@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0885eacdc81f920c3e0554d5615e69a66504a28d
commit: 8bea9af887de4c99a95f93f2ce400ef63e8b4e9b iio: adc: ad_sigma_delta: =
Add sequencer support
date:   10 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 10 weeks ago
config: parisc-randconfig-m031-20220608 (https://download.01.org/0day-ci/ar=
chive/20220612/202206120236.tXGHViuz-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/adc/ad_sigma_delta.c:493 ad_sd_trigger_handler() error: uniniti=
alized symbol 'status_pos'.

vim +/status_pos +493 drivers/iio/adc/ad_sigma_delta.c

af3008485ea037 Lars-Peter Clausen 2012-08-10  431  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  432  static irqreturn_t ad_sd=
_trigger_handler(int irq, void *p)
af3008485ea037 Lars-Peter Clausen 2012-08-10  433  {
af3008485ea037 Lars-Peter Clausen 2012-08-10  434  	struct iio_poll_func *p=
f =3D p;
af3008485ea037 Lars-Peter Clausen 2012-08-10  435  	struct iio_dev *indio_d=
ev =3D pf->indio_dev;
af3008485ea037 Lars-Peter Clausen 2012-08-10  436  	struct ad_sigma_delta *=
sigma_delta =3D iio_device_get_drvdata(indio_dev);
0fb6ee8d0b5e90 Lars-Peter Clausen 2020-11-24  437  	uint8_t *data =3D sigma=
_delta->rx_buf;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  438  	unsigned int transfer_s=
ize;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  439  	unsigned int sample_siz=
e;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  440  	unsigned int sample_pos;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  441  	unsigned int status_pos;
af3008485ea037 Lars-Peter Clausen 2012-08-10  442  	unsigned int reg_size;
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  443  	unsigned int data_reg;
af3008485ea037 Lars-Peter Clausen 2012-08-10  444  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  445  	reg_size =3D indio_dev-=
>channels[0].scan_type.realbits +
af3008485ea037 Lars-Peter Clausen 2012-08-10  446  			indio_dev->channels[0=
].scan_type.shift;
af3008485ea037 Lars-Peter Clausen 2012-08-10  447  	reg_size =3D DIV_ROUND_=
UP(reg_size, 8);
af3008485ea037 Lars-Peter Clausen 2012-08-10  448  =

f0aef2d0186431 Lars-Peter Clausen 2018-11-13  449  	if (sigma_delta->info->=
data_reg !=3D 0)
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  450  		data_reg =3D sigma_del=
ta->info->data_reg;
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  451  	else
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  452  		data_reg =3D AD_SD_REG=
_DATA;
f0aef2d0186431 Lars-Peter Clausen 2018-11-13  453  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  454  	/* Status word will be =
appended to the sample during transfer */
8bea9af887de4c Lars-Peter Clausen 2022-03-22  455  	if (sigma_delta->status=
_appended)
8bea9af887de4c Lars-Peter Clausen 2022-03-22  456  		transfer_size =3D reg_=
size + 1;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  457  	else
8bea9af887de4c Lars-Peter Clausen 2022-03-22  458  		transfer_size =3D reg_=
size;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  459  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  460  	switch (reg_size) {
af3008485ea037 Lars-Peter Clausen 2012-08-10  461  	case 4:
af3008485ea037 Lars-Peter Clausen 2012-08-10  462  	case 2:
af3008485ea037 Lars-Peter Clausen 2012-08-10  463  	case 1:
8bea9af887de4c Lars-Peter Clausen 2022-03-22  464  		status_pos =3D reg_siz=
e;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  465  		ad_sd_read_reg_raw(sig=
ma_delta, data_reg, transfer_size, &data[0]);
af3008485ea037 Lars-Peter Clausen 2012-08-10  466  		break;
af3008485ea037 Lars-Peter Clausen 2012-08-10  467  	case 3:
8bea9af887de4c Lars-Peter Clausen 2022-03-22  468  		/*
8bea9af887de4c Lars-Peter Clausen 2022-03-22  469  		 * Data array after tr=
ansfer will look like (if status is appended):
8bea9af887de4c Lars-Peter Clausen 2022-03-22  470  		 * data[] =3D { [0][sa=
mple][sample][sample][status] }
8bea9af887de4c Lars-Peter Clausen 2022-03-22  471  		 * Keeping the first b=
yte 0 shifts the status postion by 1 byte to the right.
8bea9af887de4c Lars-Peter Clausen 2022-03-22  472  		 */
8bea9af887de4c Lars-Peter Clausen 2022-03-22  473  		status_pos =3D reg_siz=
e + 1;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  474  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  475  		/* We store 24 bit sam=
ples in a 32 bit word. Keep the upper
af3008485ea037 Lars-Peter Clausen 2012-08-10  476  		 * byte set to zero. */
8bea9af887de4c Lars-Peter Clausen 2022-03-22  477  		ad_sd_read_reg_raw(sig=
ma_delta, data_reg, transfer_size, &data[1]);
af3008485ea037 Lars-Peter Clausen 2012-08-10  478  		break;
af3008485ea037 Lars-Peter Clausen 2012-08-10  479  	}
af3008485ea037 Lars-Peter Clausen 2012-08-10  480  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  481  	/*
8bea9af887de4c Lars-Peter Clausen 2022-03-22  482  	 * For devices sampling=
 only one channel at
8bea9af887de4c Lars-Peter Clausen 2022-03-22  483  	 * once, there is no ne=
ed for sample number tracking.
8bea9af887de4c Lars-Peter Clausen 2022-03-22  484  	 */
8bea9af887de4c Lars-Peter Clausen 2022-03-22  485  	if (sigma_delta->active=
_slots =3D=3D 1) {
a1be505f49cacb Lars-Peter Clausen 2013-09-19  486  		iio_push_to_buffers_wi=
th_timestamp(indio_dev, data, pf->timestamp);
8bea9af887de4c Lars-Peter Clausen 2022-03-22  487  		goto irq_handled;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  488  	}
8bea9af887de4c Lars-Peter Clausen 2022-03-22  489  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  490  	if (sigma_delta->status=
_appended) {
8bea9af887de4c Lars-Peter Clausen 2022-03-22  491  		u8 converted_channel;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  492  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22 @493  		converted_channel =3D =
data[status_pos] & sigma_delta->info->status_ch_mask;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  494  		if (converted_channel =
!=3D sigma_delta->slots[sigma_delta->current_slot]) {
8bea9af887de4c Lars-Peter Clausen 2022-03-22  495  			/*
8bea9af887de4c Lars-Peter Clausen 2022-03-22  496  			 * Desync occurred du=
ring continuous sampling of multiple channels.
8bea9af887de4c Lars-Peter Clausen 2022-03-22  497  			 * Drop this incomple=
te sample and start from first channel again.
8bea9af887de4c Lars-Peter Clausen 2022-03-22  498  			 */
8bea9af887de4c Lars-Peter Clausen 2022-03-22  499  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  500  			sigma_delta->current_=
slot =3D 0;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  501  			goto irq_handled;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  502  		}
8bea9af887de4c Lars-Peter Clausen 2022-03-22  503  	}
8bea9af887de4c Lars-Peter Clausen 2022-03-22  504  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  505  	sample_size =3D indio_d=
ev->channels[0].scan_type.storagebits / 8;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  506  	sample_pos =3D sample_s=
ize * sigma_delta->current_slot;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  507  	memcpy(&sigma_delta->sa=
mples_buf[sample_pos], data, sample_size);
8bea9af887de4c Lars-Peter Clausen 2022-03-22  508  	sigma_delta->current_sl=
ot++;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  509  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  510  	if (sigma_delta->curren=
t_slot =3D=3D sigma_delta->active_slots) {
8bea9af887de4c Lars-Peter Clausen 2022-03-22  511  		sigma_delta->current_s=
lot =3D 0;
8bea9af887de4c Lars-Peter Clausen 2022-03-22  512  		iio_push_to_buffers_wi=
th_timestamp(indio_dev, sigma_delta->samples_buf,
8bea9af887de4c Lars-Peter Clausen 2022-03-22  513  						   pf->timestamp);
8bea9af887de4c Lars-Peter Clausen 2022-03-22  514  	}
af3008485ea037 Lars-Peter Clausen 2012-08-10  515  =

8bea9af887de4c Lars-Peter Clausen 2022-03-22  516  irq_handled:
af3008485ea037 Lars-Peter Clausen 2012-08-10  517  	iio_trigger_notify_done=
(indio_dev->trig);
af3008485ea037 Lars-Peter Clausen 2012-08-10  518  	sigma_delta->irq_dis =
=3D false;
af3008485ea037 Lars-Peter Clausen 2012-08-10  519  	enable_irq(sigma_delta-=
>spi->irq);
af3008485ea037 Lars-Peter Clausen 2012-08-10  520  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  521  	return IRQ_HANDLED;
af3008485ea037 Lars-Peter Clausen 2012-08-10  522  }
af3008485ea037 Lars-Peter Clausen 2012-08-10  523  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5411247947529018830==--

