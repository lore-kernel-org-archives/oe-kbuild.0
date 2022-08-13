Content-Type: multipart/mixed; boundary="===============8235727223799172445=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show() error: uninitialized symbol 'name'.
Date: Sat, 13 Aug 2022 23:41:48 +0800
Message-ID: <202208132358.sR7CnUAJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8235727223799172445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Joe Simmons-Talbott" <joetalbott@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: 9cf0b618599487f456ef5596dd30b5c162291e3c iio: Use octal permissions=
 and DEVICE_ATTR_{RO,RW}.
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: arc-randconfig-m031-20220811 (https://download.01.org/0day-ci/archi=
ve/20220813/202208132358.sR7CnUAJ-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show() error: =
uninitialized symbol 'name'.
drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show() error: =
uninitialized symbol 'sz'.

vim +/name +1446 drivers/iio/industrialio-core.c

2c3d0c9ffd24d9 Phil Reid           2019-09-19  1403  =

9cf0b618599487 Joe Simmons-Talbott 2022-06-01  1404  static ssize_t current=
_timestamp_clock_show(struct device *dev,
bc2b7dab629a51 Gregor Boirie       2016-03-09  1405  					    struct device=
_attribute *attr,
bc2b7dab629a51 Gregor Boirie       2016-03-09  1406  					    char *buf)
bc2b7dab629a51 Gregor Boirie       2016-03-09  1407  {
bc2b7dab629a51 Gregor Boirie       2016-03-09  1408  	const struct iio_dev =
*indio_dev =3D dev_to_iio_dev(dev);
bc2b7dab629a51 Gregor Boirie       2016-03-09  1409  	const clockid_t clk =
=3D iio_device_get_clock(indio_dev);
bc2b7dab629a51 Gregor Boirie       2016-03-09  1410  	const char *name;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1411  	ssize_t sz;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1412  =

bc2b7dab629a51 Gregor Boirie       2016-03-09  1413  	switch (clk) {
bc2b7dab629a51 Gregor Boirie       2016-03-09  1414  	case CLOCK_REALTIME:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1415  		name =3D "realtime\n=
";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1416  		sz =3D sizeof("realt=
ime\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1417  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1418  	case CLOCK_MONOTONIC:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1419  		name =3D "monotonic\=
n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1420  		sz =3D sizeof("monot=
onic\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1421  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1422  	case CLOCK_MONOTONIC_=
RAW:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1423  		name =3D "monotonic_=
raw\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1424  		sz =3D sizeof("monot=
onic_raw\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1425  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1426  	case CLOCK_REALTIME_C=
OARSE:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1427  		name =3D "realtime_c=
oarse\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1428  		sz =3D sizeof("realt=
ime_coarse\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1429  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1430  	case CLOCK_MONOTONIC_=
COARSE:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1431  		name =3D "monotonic_=
coarse\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1432  		sz =3D sizeof("monot=
onic_coarse\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1433  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1434  	case CLOCK_BOOTTIME:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1435  		name =3D "boottime\n=
";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1436  		sz =3D sizeof("boott=
ime\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1437  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1438  	case CLOCK_TAI:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1439  		name =3D "tai\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1440  		sz =3D sizeof("tai\n=
");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1441  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1442  	default:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1443  		BUG();
bc2b7dab629a51 Gregor Boirie       2016-03-09  1444  	}
bc2b7dab629a51 Gregor Boirie       2016-03-09  1445  =

bc2b7dab629a51 Gregor Boirie       2016-03-09 @1446  	memcpy(buf, name, sz);
bc2b7dab629a51 Gregor Boirie       2016-03-09  1447  	return sz;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1448  }
bc2b7dab629a51 Gregor Boirie       2016-03-09  1449  =


:::::: The code at line 1446 was first introduced by commit
:::::: bc2b7dab629a51e8beb5fda4222c62a23b729f26 iio:core: timestamping cloc=
k selection support

:::::: TO: Gregor Boirie <gregor.boirie@parrot.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8235727223799172445==--

