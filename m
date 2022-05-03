Content-Type: multipart/mixed; boundary="===============8006252036371351738=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/addac/ad74413r.c:283:27: warning: Parameter 'bits' can be declared with const [constParameter]
Date: Tue, 03 May 2022 16:07:44 +0800
Message-ID: <202205031644.Q0JvdZLg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8006252036371351738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cosmin Tanislav <demonsingur@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: fea251b6a5dbdf8ba8af64abcd013d66ab6b05ee iio: addac: add AD74413R d=
river
date:   5 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout fea251b6a5dbdf8ba8af64abcd013d66ab6b05ee
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iio/addac/ad74413r.c:283:27: warning: Parameter 'bits' can be de=
clared with const [constParameter]
              unsigned long *bits)
                             ^

vim +/bits +283 drivers/iio/addac/ad74413r.c

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  280  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  281  static void ad74413r_gpio_s=
et_multiple(struct gpio_chip *chip,
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  282  				       unsigned long *m=
ask,
fea251b6a5dbdf Cosmin Tanislav 2021-12-05 @283  				       unsigned long *b=
its)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  284  {
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  285  	struct ad74413r_state *st =
=3D gpiochip_get_data(chip);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  286  	unsigned long real_mask =
=3D 0;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  287  	unsigned long real_bits =
=3D 0;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  288  	unsigned int offset =3D 0;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  289  	int ret;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  290  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  291  	for_each_set_bit_from(offs=
et, mask, AD74413R_CHANNEL_MAX) {
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  292  		unsigned int real_offset =
=3D st->gpo_gpio_offsets[offset];
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  293  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  294  		ret =3D ad74413r_set_gpo_=
config(st, real_offset,
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  295  			AD74413R_GPO_CONFIG_LOGI=
C_PARALLEL);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  296  		if (ret)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  297  			return;
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  298  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  299  		real_mask |=3D BIT(real_o=
ffset);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  300  		if (*bits & offset)
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  301  			real_bits |=3D BIT(real_=
offset);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  302  	}
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  303  =

fea251b6a5dbdf Cosmin Tanislav 2021-12-05  304  	regmap_update_bits(st->reg=
map, AD74413R_REG_GPO_PAR_DATA,
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  305  			   real_mask, real_bits);
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  306  }
fea251b6a5dbdf Cosmin Tanislav 2021-12-05  307  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8006252036371351738==--

