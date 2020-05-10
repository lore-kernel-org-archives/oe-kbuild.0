Content-Type: multipart/mixed; boundary="===============8977642733867879475=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [iio:togreg 64/74] drivers/iio/light/cm32181.c:296:10: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Sun, 10 May 2020 23:30:08 +0800
Message-ID: <202005102355.9o5WpoKd%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8977642733867879475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hans de Goede <hdegoede@redhat.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
head:   0afb1a3c7fdb813c9889506ded9f2b8d634fca06
commit: 02cdab2a8d55c85967a4be4a084efa9641c56066 [64/74] iio: light: cm3218=
1: Add support for the CM3218
:::::: branch date: 5 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/iio/light/cm32181.c:296:10: warning: %u in format string (no. 1)=
 requires 'unsigned int' but the argument type is 'signed int'. [invalidPri=
ntfArgType_uint]
     len +=3D sprintf(buf + len, "0.%06u ", cm32181->als_it_values[i]);
            ^

# https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=
=3D02cdab2a8d55c85967a4be4a084efa9641c56066
git remote add iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/ii=
o.git
git remote update iio
git checkout 02cdab2a8d55c85967a4be4a084efa9641c56066
vim +296 drivers/iio/light/cm32181.c

971672c0b3ccd1 Kevin Tsai    2013-12-24  277  =

971672c0b3ccd1 Kevin Tsai    2013-12-24  278  /**
971672c0b3ccd1 Kevin Tsai    2013-12-24  279   * cm32181_get_it_available()=
 - Get available ALS IT value
971672c0b3ccd1 Kevin Tsai    2013-12-24  280   * @dev:	pointer of struct de=
vice.
971672c0b3ccd1 Kevin Tsai    2013-12-24  281   * @attr:	pointer of struct d=
evice_attribute.
971672c0b3ccd1 Kevin Tsai    2013-12-24  282   * @buf:	pointer of return st=
ring buffer.
971672c0b3ccd1 Kevin Tsai    2013-12-24  283   *
971672c0b3ccd1 Kevin Tsai    2013-12-24  284   * Display the available inte=
gration time values by millisecond.
971672c0b3ccd1 Kevin Tsai    2013-12-24  285   *
971672c0b3ccd1 Kevin Tsai    2013-12-24  286   * Return: string length.
971672c0b3ccd1 Kevin Tsai    2013-12-24  287   */
971672c0b3ccd1 Kevin Tsai    2013-12-24  288  static ssize_t cm32181_get_it=
_available(struct device *dev,
971672c0b3ccd1 Kevin Tsai    2013-12-24  289  			struct device_attribute *a=
ttr, char *buf)
971672c0b3ccd1 Kevin Tsai    2013-12-24  290  {
02cdab2a8d55c8 Hans de Goede 2020-04-28  291  	struct cm32181_chip *cm32181=
 =3D iio_priv(dev_to_iio_dev(dev));
971672c0b3ccd1 Kevin Tsai    2013-12-24  292  	int i, n, len;
971672c0b3ccd1 Kevin Tsai    2013-12-24  293  =

02cdab2a8d55c8 Hans de Goede 2020-04-28  294  	n =3D cm32181->num_als_it;
971672c0b3ccd1 Kevin Tsai    2013-12-24  295  	for (i =3D 0, len =3D 0; i <=
 n; i++)
02cdab2a8d55c8 Hans de Goede 2020-04-28 @296  		len +=3D sprintf(buf + len,=
 "0.%06u ", cm32181->als_it_values[i]);
971672c0b3ccd1 Kevin Tsai    2013-12-24  297  	return len + sprintf(buf + l=
en, "\n");
971672c0b3ccd1 Kevin Tsai    2013-12-24  298  }
971672c0b3ccd1 Kevin Tsai    2013-12-24  299  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8977642733867879475==--

