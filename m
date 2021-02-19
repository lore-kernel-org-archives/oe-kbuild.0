Content-Type: multipart/mixed; boundary="===============0048655087068941916=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6371/11791] drivers/hwmon/pmbus/max16601.c:279:14: warning: Redundant condition: If 'ret < 0', the comparison 'ret < 11' is always true.
Date: Fri, 19 Feb 2021 11:21:58 +0800
Message-ID: <202102191151.DCIOl0Wt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0048655087068941916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Guenter Roeck <linux@roeck-us.net>
CC: Alex Qiu <xqiu@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ff90dfd2579b2c7bc1f0baa0cb99c918c6c1ec64
commit: 66102281f94afdf1f41cf6147c7ddce73a8e75f2 [6371/11791] hwmon: (pmbus=
/max16601) Add support for MAX16508
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
compiler: m68k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hwmon/pmbus/max16601.c:279:14: warning: Redundant condition: If =
'ret < 0', the comparison 'ret < 11' is always true. [redundantCondition]
    if (ret < 0 || ret < 11)
                ^

vim +279 drivers/hwmon/pmbus/max16601.c

66102281f94afd Guenter Roeck 2021-01-25  270  =

66102281f94afd Guenter Roeck 2021-01-25  271  static int max16601_get_id(st=
ruct i2c_client *client)
2138f8853a00b2 Guenter Roeck 2019-12-14  272  {
2138f8853a00b2 Guenter Roeck 2019-12-14  273  	struct device *dev =3D &clie=
nt->dev;
2138f8853a00b2 Guenter Roeck 2019-12-14  274  	u8 buf[I2C_SMBUS_BLOCK_MAX +=
 1];
66102281f94afd Guenter Roeck 2021-01-25  275  	enum chips id;
2138f8853a00b2 Guenter Roeck 2019-12-14  276  	int ret;
2138f8853a00b2 Guenter Roeck 2019-12-14  277  =

2138f8853a00b2 Guenter Roeck 2019-12-14  278  	ret =3D i2c_smbus_read_block=
_data(client, PMBUS_IC_DEVICE_ID, buf);
66102281f94afd Guenter Roeck 2021-01-25 @279  	if (ret < 0 || ret < 11)
2138f8853a00b2 Guenter Roeck 2019-12-14  280  		return -ENODEV;
2138f8853a00b2 Guenter Roeck 2019-12-14  281  =

66102281f94afd Guenter Roeck 2021-01-25  282  	/*
66102281f94afd Guenter Roeck 2021-01-25  283  	 * PMBUS_IC_DEVICE_ID is exp=
ected to return "MAX16601y.xx"
66102281f94afd Guenter Roeck 2021-01-25  284  	 * or "MAX16500y.xx".
66102281f94afd Guenter Roeck 2021-01-25  285  	 */
66102281f94afd Guenter Roeck 2021-01-25  286  	if (!strncmp(buf, "MAX16500"=
, 8)) {
66102281f94afd Guenter Roeck 2021-01-25  287  		id =3D max16508;
66102281f94afd Guenter Roeck 2021-01-25  288  	} else if (!strncmp(buf, "MA=
X16601", 8)) {
66102281f94afd Guenter Roeck 2021-01-25  289  		id =3D max16601;
66102281f94afd Guenter Roeck 2021-01-25  290  	} else {
2138f8853a00b2 Guenter Roeck 2019-12-14  291  		buf[ret] =3D '\0';
2138f8853a00b2 Guenter Roeck 2019-12-14  292  		dev_err(dev, "Unsupported c=
hip '%s'\n", buf);
2138f8853a00b2 Guenter Roeck 2019-12-14  293  		return -ENODEV;
2138f8853a00b2 Guenter Roeck 2019-12-14  294  	}
66102281f94afd Guenter Roeck 2021-01-25  295  	return id;
66102281f94afd Guenter Roeck 2021-01-25  296  }
66102281f94afd Guenter Roeck 2021-01-25  297  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============0048655087068941916==--

