Content-Type: multipart/mixed; boundary="===============7640145386513282708=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/buffer/kfifo_buf.c:185 iio_kfifo_write() error: uninitialized symbol 'copied'.
Date: Tue, 14 Dec 2021 07:41:17 +0800
Message-ID: <202112140702.m9aabJR1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7640145386513282708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Lars-Peter Clausen" <lars@metafoo.de>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Alexandru Ardelean <alexandru.ardelean@analog.com>
CC: Mihail Chindris <mihail.chindris@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aa50faff4416c869b52dff68a937c84d29e12f4b
commit: 1546d6718dc92b27935931ee4e4c2e9893ef3066 iio: kfifo-buffer: Add out=
put buffer support
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211214/202112140702.m9aabJR1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iio/buffer/kfifo_buf.c:185 iio_kfifo_write() error: uninitialized s=
ymbol 'copied'.

Old smatch warnings:
drivers/iio/buffer/kfifo_buf.c:117 iio_read_kfifo() error: uninitialized sy=
mbol 'copied'.

vim +/copied +185 drivers/iio/buffer/kfifo_buf.c

1546d6718dc92b Lars-Peter Clausen 2021-10-07  169  =

1546d6718dc92b Lars-Peter Clausen 2021-10-07  170  static int iio_kfifo_wri=
te(struct iio_buffer *r, size_t n,
1546d6718dc92b Lars-Peter Clausen 2021-10-07  171  	const char __user *buf)
1546d6718dc92b Lars-Peter Clausen 2021-10-07  172  {
1546d6718dc92b Lars-Peter Clausen 2021-10-07  173  	struct iio_kfifo *kf =
=3D iio_to_kfifo(r);
1546d6718dc92b Lars-Peter Clausen 2021-10-07  174  	int ret, copied;
1546d6718dc92b Lars-Peter Clausen 2021-10-07  175  =

1546d6718dc92b Lars-Peter Clausen 2021-10-07  176  	mutex_lock(&kf->user_lo=
ck);
1546d6718dc92b Lars-Peter Clausen 2021-10-07  177  	if (!kfifo_initialized(=
&kf->kf) || n < kfifo_esize(&kf->kf))
1546d6718dc92b Lars-Peter Clausen 2021-10-07  178  		ret =3D -EINVAL;
1546d6718dc92b Lars-Peter Clausen 2021-10-07  179  	else
1546d6718dc92b Lars-Peter Clausen 2021-10-07  180  		ret =3D kfifo_from_use=
r(&kf->kf, buf, n, &copied);
1546d6718dc92b Lars-Peter Clausen 2021-10-07  181  	mutex_unlock(&kf->user_=
lock);
1546d6718dc92b Lars-Peter Clausen 2021-10-07  182  	if (ret)
1546d6718dc92b Lars-Peter Clausen 2021-10-07  183  		return ret;
1546d6718dc92b Lars-Peter Clausen 2021-10-07  184  =

1546d6718dc92b Lars-Peter Clausen 2021-10-07 @185  	return copied;
1546d6718dc92b Lars-Peter Clausen 2021-10-07  186  }
1546d6718dc92b Lars-Peter Clausen 2021-10-07  187  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7640145386513282708==--

