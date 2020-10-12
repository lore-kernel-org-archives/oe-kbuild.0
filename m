Content-Type: multipart/mixed; boundary="===============6518691765422329368=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [iio:testing 18/22] drivers/iio/industrialio-core.c:624:11: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'.
Date: Mon, 12 Oct 2020 11:37:09 +0800
Message-ID: <202010121155.Vj5mlWBm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6518691765422329368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testi=
ng
head:   d655844f7e2122671c513c311b171a8f4b374f49
commit: 0e7a3978a40b26b85820afe9e544f0032103f805 [18/22] iio: core: Fix IIO=
_VAL_FRACTIONAL calculation for negative values
:::::: branch date: 10 hours ago
:::::: commit date: 35 hours ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +624 drivers/iio/industrialio-core.c

dfc57732ad38f9 drivers/iio/industrialio-core.c         Gregor Boirie       =
2016-04-20  591  =

51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  592  static ssize_t __iio_format_value(char *buf, size_t len, u=
nsigned int type,
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  593  				  int size, const int *vals)
1d892719e70e47 drivers/staging/iio/industrialio-core.c Jonathan Cameron    =
2011-05-18  594  {
7985e7c1003bc5 drivers/iio/industrialio-core.c         Lars-Peter Clausen  =
2012-09-14  595  	unsigned long long tmp;
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  596  	int tmp0, tmp1;
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05  597  	s64 tmp2;
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  598  	bool scale_db =3D false;
1d892719e70e47 drivers/staging/iio/industrialio-core.c Jonathan Cameron    =
2011-05-18  599  =

3661f3f5e961f7 drivers/iio/industrialio-core.c         Lars-Peter Clausen  =
2013-10-07  600  	switch (type) {
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  601  	case IIO_VAL_INT:
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  602  		return scnprintf(buf, len, "%d", vals[0]);
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  603  	case IIO_VAL_INT_PLUS_MICRO_DB:
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  604  		scale_db =3D true;
df561f6688fef7 drivers/iio/industrialio-core.c         Gustavo A. R. Silva =
2020-08-23  605  		fallthrough;
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  606  	case IIO_VAL_INT_PLUS_MICRO:
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  607  		if (vals[1] < 0)
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  608  			return scnprintf(buf, len, "-%d.%06u%s", abs(vals[0]),
8f57e4d930d482 drivers/iio/industrialio-core.c         Michal Nazarewicz   =
2016-01-15  609  					-vals[1], scale_db ? " dB" : "");
1d892719e70e47 drivers/staging/iio/industrialio-core.c Jonathan Cameron    =
2011-05-18  610  		else
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  611  			return scnprintf(buf, len, "%d.%06u%s", vals[0], vals[1=
],
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  612  					scale_db ? " dB" : "");
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  613  	case IIO_VAL_INT_PLUS_NANO:
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  614  		if (vals[1] < 0)
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  615  			return scnprintf(buf, len, "-%d.%09u", abs(vals[0]),
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  616  					-vals[1]);
71646e2c7ae4ed drivers/staging/iio/industrialio-core.c Michael Hennerich   =
2011-06-27  617  		else
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  618  			return scnprintf(buf, len, "%d.%09u", vals[0], vals[1]);
7985e7c1003bc5 drivers/iio/industrialio-core.c         Lars-Peter Clausen  =
2012-09-14  619  	case IIO_VAL_FRACTIONAL:
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05  620  		tmp2 =3D div_s64((s64)vals[0] * 1000000000LL, vals[1]);
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  621  		tmp1 =3D vals[1];
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05  622  		tmp0 =3D (int)div_s64_rem(tmp2, 1000000000, &tmp1);
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05  623  		if ((tmp2 < 0) && (tmp0 =3D=3D 0))
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05 @624  			return snprintf(buf, len, "-0.%09u", abs(tmp1));
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05  625  		else
0e7a3978a40b26 drivers/iio/industrialio-core.c         Anand Ashok Dumbre  =
2020-10-05  626  			return snprintf(buf, len, "%d.%09u", tmp0, abs(tmp1));
103d9fb907058e drivers/iio/industrialio-core.c         Lars-Peter Clausen  =
2012-10-16  627  	case IIO_VAL_FRACTIONAL_LOG2:
7fd6592d128704 drivers/iio/industrialio-core.c         Nikolaus Schulz     =
2017-03-24  628  		tmp =3D shift_right((s64)vals[0] * 1000000000LL, vals[1]=
);
7fd6592d128704 drivers/iio/industrialio-core.c         Nikolaus Schulz     =
2017-03-24  629  		tmp0 =3D (int)div_s64_rem(tmp, 1000000000LL, &tmp1);
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  630  		return scnprintf(buf, len, "%d.%09u", tmp0, abs(tmp1));
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  631  	case IIO_VAL_INT_MULTIPLE:
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  632  	{
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  633  		int i;
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  634  		int l =3D 0;
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  635  =

51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  636  		for (i =3D 0; i < size; ++i) {
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  637  			l +=3D scnprintf(&buf[l], len - l, "%d ", vals[i]);
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  638  			if (l >=3D len)
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  639  				break;
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  640  		}
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  641  		return l;
9fbfb4b37ed23f drivers/iio/industrialio-core.c         Srinivas Pandruvada =
2014-04-29  642  	}
8cb3403633146a drivers/iio/industrialio-core.c         Andrea Merello      =
2019-11-20  643  	case IIO_VAL_CHAR:
35a4eeb055c9c3 drivers/iio/industrialio-core.c         Takashi Iwai        =
2020-03-11  644  		return scnprintf(buf, len, "%c", (char)vals[0]);
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  645  	default:
1d892719e70e47 drivers/staging/iio/industrialio-core.c Jonathan Cameron    =
2011-05-18  646  		return 0;
1d892719e70e47 drivers/staging/iio/industrialio-core.c Jonathan Cameron    =
2011-05-18  647  	}
67eedba39ed1ac drivers/iio/industrialio-core.c         Michael Hennerich   =
2012-05-11  648  }
51239600074bc9 drivers/iio/industrialio-core.c         Jonathan Cameron    =
2016-11-08  649  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6518691765422329368==--

