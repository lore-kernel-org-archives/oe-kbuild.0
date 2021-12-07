Content-Type: multipart/mixed; boundary="===============4440219425500302926=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/regulator/scmi-regulator.c:83 scmi_reg_is_enabled() error: uninitialized symbol 'config'.
Date: Tue, 07 Dec 2021 23:30:23 +0800
Message-ID: <202112072321.vfKtSQTV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4440219425500302926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/=
firmware/Kconfig unconditionally
date:   9 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 weeks ago
config: arc-randconfig-m031-20211207 (https://download.01.org/0day-ci/archi=
ve/20211207/202112072321.vfKtSQTV-lkp(a)intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/regulator/scmi-regulator.c:83 scmi_reg_is_enabled() error: uninitia=
lized symbol 'config'.
drivers/regulator/scmi-regulator.c:96 scmi_reg_get_voltage_sel() error: uni=
nitialized symbol 'volt_uV'.
drivers/regulator/scmi-regulator.c:313 scmi_regulator_probe() error: uninit=
ialized symbol 'ph'.

vim +/config +83 drivers/regulator/scmi-regulator.c

0fbeae70ee7ce98 Cristian Marussi 2020-11-23  68  =

0fbeae70ee7ce98 Cristian Marussi 2020-11-23  69  static int scmi_reg_is_ena=
bled(struct regulator_dev *rdev)
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  70  {
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  71  	int ret;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  72  	u32 config;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  73  	struct scmi_regulator *sr=
eg =3D rdev_get_drvdata(rdev);
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  74  =

59046d157d52daf Cristian Marussi 2021-03-16  75  	ret =3D voltage_ops->conf=
ig_get(sreg->ph, sreg->id, &config);
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  76  	if (ret) {
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  77  		dev_err(&sreg->sdev->dev,
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  78  			"Error %d reading regul=
ator %s status.\n",
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  79  			ret, sreg->desc.name);
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  80  		return ret;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  81  	}
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  82  =

0fbeae70ee7ce98 Cristian Marussi 2020-11-23 @83  	return config & SCMI_VOLT=
AGE_ARCH_STATE_ON;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  84  }
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  85  =

0fbeae70ee7ce98 Cristian Marussi 2020-11-23  86  static int scmi_reg_get_vo=
ltage_sel(struct regulator_dev *rdev)
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  87  {
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  88  	int ret;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  89  	s32 volt_uV;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  90  	struct scmi_regulator *sr=
eg =3D rdev_get_drvdata(rdev);
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  91  =

59046d157d52daf Cristian Marussi 2021-03-16  92  	ret =3D voltage_ops->leve=
l_get(sreg->ph, sreg->id, &volt_uV);
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  93  	if (ret)
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  94  		return ret;
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  95  =

0fbeae70ee7ce98 Cristian Marussi 2020-11-23 @96  	return sreg->desc.ops->ma=
p_voltage(rdev, volt_uV, volt_uV);
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  97  }
0fbeae70ee7ce98 Cristian Marussi 2020-11-23  98  =


:::::: The code at line 83 was first introduced by commit
:::::: 0fbeae70ee7ce98e18a47337cd1f205dd88589e9 regulator: add SCMI driver

:::::: TO: Cristian Marussi <cristian.marussi@arm.com>
:::::: CC: Mark Brown <broonie@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4440219425500302926==--

