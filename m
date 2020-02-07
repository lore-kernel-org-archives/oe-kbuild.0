Content-Type: multipart/mixed; boundary="===============7221134148217020366=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [iio:testing 16/16] drivers/iio/light/vcnl4000.c:153 vcnl4200_set_power_state() warn: ignoring unreachable code.
Date: Fri, 07 Feb 2020 06:34:48 +0300
Message-ID: <20200207033448.GM24804@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7221134148217020366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "Guido G=C3=BCnther" <agx@sigxcpu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   ce08fb79f9c866d1fe6dba977a32954cdc444059
commit: ce08fb79f9c866d1fe6dba977a32954cdc444059 [16/16] iio: vcnl4000: Ena=
ble runtime pm for vcnl4200/4040

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/light/vcnl4000.c:153 vcnl4200_set_power_state() warn: ignoring =
unreachable code.

# https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=
=3Dce08fb79f9c866d1fe6dba977a32954cdc444059
git remote add iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o.git
git remote update iio
git checkout ce08fb79f9c866d1fe6dba977a32954cdc444059
vim +153 drivers/iio/light/vcnl4000.c

be38866fbb97f0e Tomas Novotny 2018-07-25  142  =

ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  143  static int vcnl4200_set=
_power_state(struct vcnl4000_data *data, bool on)
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  144  {
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  145  	u16 val =3D on ? 0 /* =
power on */ : 1 /* shut down */;
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  146  	int ret;
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  147  =

ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  148  	ret =3D i2c_smbus_writ=
e_word_data(data->client, VCNL4200_AL_CONF, val);
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  149  	if (ret < 0)
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  150  		return ret;
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  151  =

ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  152  	return i2c_smbus_write=
_word_data(data->client, VCNL4200_PS_CONF1, val);

ret =3D =


ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03 @153  	if (ret < 0)
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  154  		return ret;
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  155  =

ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  156  	if (on) {
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  157  		/* Wait@least one =
integration cycle before fetching data */
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  158  		data->vcnl4200_al.las=
t_measurement =3D ktime_get();
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  159  		data->vcnl4200_ps.las=
t_measurement =3D ktime_get();
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  160  	}
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  161  =

ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  162  	return 0;
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  163  }
ce08fb79f9c866d Guido G=C3=BCnther 2020-02-03  164  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7221134148217020366==--

