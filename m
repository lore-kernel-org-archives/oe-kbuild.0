Content-Type: multipart/mixed; boundary="===============3843044691373246933=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/core.c:915 bypass_show() error: uninitialized symbol 'bypass'.
Date: Tue, 07 Dec 2021 02:10:37 +0800
Message-ID: <202112070226.lmm37w25-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3843044691373246933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: YueHaibing <yuehaibing@huawei.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
commit: a277a2622ca9609de09c18f660f0d10f1ddbb379 regulator: core: Use DEVIC=
E_ATTR_RO macro
date:   6 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-m001-20211206 (https://download.01.org/0day-ci/ar=
chive/20211207/202112070226.lmm37w25-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/regulator/core.c:915 bypass_show() error: uninitialized symbol 'byp=
ass'.

Old smatch warnings:
drivers/regulator/core.c:129 regulator_ops_is_valid() error: we previously =
assumed 'rdev->constraints' could be null (see line 128)
drivers/regulator/core.c:4159 regulator_get_voltage_rdev() error: uninitial=
ized symbol 'bypassed'.

vim +/bypass +915 drivers/regulator/core.c

7ad68e2f970fd8 David Brownell 2008-11-11  902  =

a277a2622ca960 YueHaibing     2021-05-29  903  static ssize_t bypass_show(s=
truct device *dev,
f59c8f9fe68979 Mark Brown     2012-08-31  904  			   struct device_attribut=
e *attr, char *buf)
f59c8f9fe68979 Mark Brown     2012-08-31  905  {
f59c8f9fe68979 Mark Brown     2012-08-31  906  	struct regulator_dev *rdev =
=3D dev_get_drvdata(dev);
f59c8f9fe68979 Mark Brown     2012-08-31  907  	const char *report;
f59c8f9fe68979 Mark Brown     2012-08-31  908  	bool bypass;
f59c8f9fe68979 Mark Brown     2012-08-31  909  	int ret;
f59c8f9fe68979 Mark Brown     2012-08-31  910  =

f59c8f9fe68979 Mark Brown     2012-08-31  911  	ret =3D rdev->desc->ops->ge=
t_bypass(rdev, &bypass);
f59c8f9fe68979 Mark Brown     2012-08-31  912  =

f59c8f9fe68979 Mark Brown     2012-08-31  913  	if (ret !=3D 0)
f59c8f9fe68979 Mark Brown     2012-08-31  914  		report =3D "unknown";
f59c8f9fe68979 Mark Brown     2012-08-31 @915  	else if (bypass)
f59c8f9fe68979 Mark Brown     2012-08-31  916  		report =3D "enabled";
f59c8f9fe68979 Mark Brown     2012-08-31  917  	else
f59c8f9fe68979 Mark Brown     2012-08-31  918  		report =3D "disabled";
f59c8f9fe68979 Mark Brown     2012-08-31  919  =

f59c8f9fe68979 Mark Brown     2012-08-31  920  	return sprintf(buf, "%s\n",=
 report);
f59c8f9fe68979 Mark Brown     2012-08-31  921  }
a277a2622ca960 YueHaibing     2021-05-29  922  static DEVICE_ATTR_RO(bypass=
);
bc558a60b58f63 Mark Brown     2008-10-10  923  =


:::::: The code at line 915 was first introduced by commit
:::::: f59c8f9fe689790248ae7aa7426579982050638c regulator: core: Support by=
pass mode

:::::: TO: Mark Brown <broonie@opensource.wolfsonmicro.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3843044691373246933==--

