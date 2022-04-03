Content-Type: multipart/mixed; boundary="===============0294231178219038795=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jic23-iio:testing 17/36] drivers/iio/adc/ad_sigma_delta.c:493 ad_sd_trigger_handler() error: uninitialized symbol 'status_pos'.
Date: Sun, 03 Apr 2022 09:03:23 +0800
Message-ID: <202204030858.ZcztrJKW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0294231178219038795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Tachici <alexandru.tachici@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   b09eac38bca896ebe88da75a864c94f3a9ea8492
commit: 60e0ee74d11157dbbfedfc91e56f97a12735d6d3 [17/36] iio: adc: ad_sigma=
_delta: Add sequencer support
:::::: branch date: 8 hours ago
:::::: commit date: 6 days ago
config: nios2-randconfig-m031-20220403 (https://download.01.org/0day-ci/arc=
hive/20220403/202204030858.ZcztrJKW-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
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
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  438  	unsigned int transfer_s=
ize;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  439  	unsigned int sample_siz=
e;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  440  	unsigned int sample_pos;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  441  	unsigned int status_pos;
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

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  454  	/* Status word will be =
appended to the sample during transfer */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  455  	if (sigma_delta->status=
_appended)
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  456  		transfer_size =3D reg_=
size + 1;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  457  	else
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  458  		transfer_size =3D reg_=
size;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  459  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  460  	switch (reg_size) {
af3008485ea037 Lars-Peter Clausen 2012-08-10  461  	case 4:
af3008485ea037 Lars-Peter Clausen 2012-08-10  462  	case 2:
af3008485ea037 Lars-Peter Clausen 2012-08-10  463  	case 1:
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  464  		status_pos =3D reg_siz=
e;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  465  		ad_sd_read_reg_raw(sig=
ma_delta, data_reg, transfer_size, &data[0]);
af3008485ea037 Lars-Peter Clausen 2012-08-10  466  		break;
af3008485ea037 Lars-Peter Clausen 2012-08-10  467  	case 3:
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  468  		/*
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  469  		 * Data array after tr=
ansfer will look like (if status is appended):
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  470  		 * data[] =3D { [0][sa=
mple][sample][sample][status] }
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  471  		 * Keeping the first b=
yte 0 shifts the status postion by 1 byte to the right.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  472  		 */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  473  		status_pos =3D reg_siz=
e + 1;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  474  =

af3008485ea037 Lars-Peter Clausen 2012-08-10  475  		/* We store 24 bit sam=
ples in a 32 bit word. Keep the upper
af3008485ea037 Lars-Peter Clausen 2012-08-10  476  		 * byte set to zero. */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  477  		ad_sd_read_reg_raw(sig=
ma_delta, data_reg, transfer_size, &data[1]);
af3008485ea037 Lars-Peter Clausen 2012-08-10  478  		break;
af3008485ea037 Lars-Peter Clausen 2012-08-10  479  	}
af3008485ea037 Lars-Peter Clausen 2012-08-10  480  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  481  	/*
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  482  	 * For devices sampling=
 only one channel at
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  483  	 * once, there is no ne=
ed for sample number tracking.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  484  	 */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  485  	if (sigma_delta->active=
_slots =3D=3D 1) {
a1be505f49cacb Lars-Peter Clausen 2013-09-19  486  		iio_push_to_buffers_wi=
th_timestamp(indio_dev, data, pf->timestamp);
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  487  		goto irq_handled;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  488  	}
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  489  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  490  	if (sigma_delta->status=
_appended) {
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  491  		u8 converted_channel;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  492  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22 @493  		converted_channel =3D =
data[status_pos] & sigma_delta->info->status_ch_mask;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  494  		if (converted_channel =
!=3D sigma_delta->slots[sigma_delta->current_slot]) {
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  495  			/*
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  496  			 * Desync occurred du=
ring continuous sampling of multiple channels.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  497  			 * Drop this incomple=
te sample and start from first channel again.
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  498  			 */
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  499  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  500  			sigma_delta->current_=
slot =3D 0;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  501  			goto irq_handled;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  502  		}
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  503  	}
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  504  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  505  	sample_size =3D indio_d=
ev->channels[0].scan_type.storagebits / 8;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  506  	sample_pos =3D sample_s=
ize * sigma_delta->current_slot;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  507  	memcpy(&sigma_delta->sa=
mples_buf[sample_pos], data, sample_size);
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  508  	sigma_delta->current_sl=
ot++;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  509  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  510  	if (sigma_delta->curren=
t_slot =3D=3D sigma_delta->active_slots) {
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  511  		sigma_delta->current_s=
lot =3D 0;
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  512  		iio_push_to_buffers_wi=
th_timestamp(indio_dev, sigma_delta->samples_buf,
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  513  						   pf->timestamp);
60e0ee74d11157 Lars-Peter Clausen 2022-03-22  514  	}
af3008485ea037 Lars-Peter Clausen 2012-08-10  515  =

60e0ee74d11157 Lars-Peter Clausen 2022-03-22  516  irq_handled:
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
--===============0294231178219038795==--

