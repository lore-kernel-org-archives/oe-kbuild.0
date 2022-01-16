Content-Type: multipart/mixed; boundary="===============2260641160246175548=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] staging: pi433: validate max bit_rate based on modulation used
Date: Sun, 16 Jan 2022 23:58:09 +0800
Message-ID: <202201162347.q7kqawfx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2260641160246175548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220116002333.GA23305@mail.google.com>
References: <20220116002333.GA23305@mail.google.com>
TO: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
TO: gregkh(a)linuxfoundation.org
TO: paulo.miguel.almeida.rodenas(a)gmail.com
TO: realwakka(a)gmail.com
CC: linux-staging(a)lists.linux.dev
CC: linux-kernel(a)vger.kernel.org

Hi Paulo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/0day-ci/linux/commits/Paulo-Miguel-Almeida/stagi=
ng-pi433-validate-min-max-bit-rate-settings/20220116-082432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
fa783154524a71ab74e293cd8251155e5971952b
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: m68k-randconfig-m031-20220116 (https://download.01.org/0day-ci/arch=
ive/20220116/202201162347.q7kqawfx-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/pi433/rf69.c:238 rf69_set_bit_rate() warn: impossible condi=
tion '(bit_rate > 300000) =3D> (0-u16max > 300000)'

vim +238 drivers/staging/pi433/rf69.c

874bcba65f9a3a Marcus Wolf          2017-07-16  220  =

31e045ab546fa6 Valentin Vidic       2018-03-14  221  int rf69_set_bit_rate(=
struct spi_device *spi, u16 bit_rate)
874bcba65f9a3a Marcus Wolf          2017-07-16  222  {
874bcba65f9a3a Marcus Wolf          2017-07-16  223  	int retval;
31e045ab546fa6 Valentin Vidic       2018-03-14  224  	u32 bit_rate_reg;
874bcba65f9a3a Marcus Wolf          2017-07-16  225  	u8 msb;
874bcba65f9a3a Marcus Wolf          2017-07-16  226  	u8 lsb;
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  227  	enum modulation mod;
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  228  =

4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  229  	// check if modulatio=
n is configured
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  230  	mod =3D rf69_get_modu=
lation(spi);
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  231  	if (mod =3D=3D UNDEF)=
 {
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  232  		dev_dbg(&spi->dev, "=
setBitRate: modulation is undefined");
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  233  		return -EINVAL;
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  234  	}
874bcba65f9a3a Marcus Wolf          2017-07-16  235  =

874bcba65f9a3a Marcus Wolf          2017-07-16  236  	// check input value
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  237  	if (bit_rate < 1200 ||
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16 @238  	    (mod =3D=3D FSK &=
& bit_rate > 300000) ||
4bbc9e444fd3ba Paulo Miguel Almeida 2022-01-16  239  	    (mod =3D=3D OOK &=
& bit_rate > 32768)) {
874bcba65f9a3a Marcus Wolf          2017-07-16  240  		dev_dbg(&spi->dev, "=
setBitRate: illegal input param");
e221b2b11bdc3f Marcin Ciupak        2017-08-17  241  		return -EINVAL;
874bcba65f9a3a Marcus Wolf          2017-07-16  242  	}
874bcba65f9a3a Marcus Wolf          2017-07-16  243  =

874bcba65f9a3a Marcus Wolf          2017-07-16  244  	// calculate reg sett=
ings
31e045ab546fa6 Valentin Vidic       2018-03-14  245  	bit_rate_reg =3D (F_O=
SC / bit_rate);
874bcba65f9a3a Marcus Wolf          2017-07-16  246  =

31e045ab546fa6 Valentin Vidic       2018-03-14  247  	msb =3D (bit_rate_reg=
 & 0xff00) >> 8;
31e045ab546fa6 Valentin Vidic       2018-03-14  248  	lsb =3D (bit_rate_reg=
 & 0xff);
874bcba65f9a3a Marcus Wolf          2017-07-16  249  =

874bcba65f9a3a Marcus Wolf          2017-07-16  250  	// transmit to RF 69
d7b8943cf44d46 Marcus Wolf          2017-12-04  251  	retval =3D rf69_write=
_reg(spi, REG_BITRATE_MSB, msb);
4a74749a50a8f1 Marcin Ciupak        2017-10-11  252  	if (retval)
4a74749a50a8f1 Marcin Ciupak        2017-10-11  253  		return retval;
d7b8943cf44d46 Marcus Wolf          2017-12-04  254  	retval =3D rf69_write=
_reg(spi, REG_BITRATE_LSB, lsb);
4a74749a50a8f1 Marcin Ciupak        2017-10-11  255  	if (retval)
4a74749a50a8f1 Marcin Ciupak        2017-10-11  256  		return retval;
874bcba65f9a3a Marcus Wolf          2017-07-16  257  =

874bcba65f9a3a Marcus Wolf          2017-07-16  258  	return 0;
874bcba65f9a3a Marcus Wolf          2017-07-16  259  }
874bcba65f9a3a Marcus Wolf          2017-07-16  260  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2260641160246175548==--

