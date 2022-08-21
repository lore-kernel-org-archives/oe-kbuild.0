Content-Type: multipart/mixed; boundary="===============4015948445766649758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rtc/rtc-nct3018y.c:112 nct3018y_get_alarm_mode() error: we previously assumed 'alarm_enable' could be null (see line 96)
Date: Sun, 21 Aug 2022 11:56:10 +0800
Message-ID: <202208211110.jFk2KTL5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4015948445766649758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mia Lin <mimi05633@gmail.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   15b3f48a4339e3c16acf18624e2b7f60bc5e9a2c
commit: 5adbaed16cc63542057627642d2414f603f2db69 rtc: Add NCT3018Y real tim=
e clock driver
date:   4 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/arc=
hive/20220821/202208211110.jFk2KTL5-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-nct3018y.c:112 nct3018y_get_alarm_mode() error: we previous=
ly assumed 'alarm_enable' could be null (see line 96)
drivers/rtc/rtc-nct3018y.c:112 nct3018y_get_alarm_mode() error: we previous=
ly assumed 'alarm_flag' could be null (see line 104)

vim +/alarm_enable +112 drivers/rtc/rtc-nct3018y.c

5adbaed16cc635 Mia Lin 2022-07-13   90  =

5adbaed16cc635 Mia Lin 2022-07-13   91  static int nct3018y_get_alarm_mode(=
struct i2c_client *client, unsigned char *alarm_enable,
5adbaed16cc635 Mia Lin 2022-07-13   92  				   unsigned char *alarm_flag)
5adbaed16cc635 Mia Lin 2022-07-13   93  {
5adbaed16cc635 Mia Lin 2022-07-13   94  	int flags;
5adbaed16cc635 Mia Lin 2022-07-13   95  =

5adbaed16cc635 Mia Lin 2022-07-13  @96  	if (alarm_enable) {
5adbaed16cc635 Mia Lin 2022-07-13   97  		dev_dbg(&client->dev, "%s:NCT3018=
Y_REG_CTRL\n", __func__);
5adbaed16cc635 Mia Lin 2022-07-13   98  		flags =3D  i2c_smbus_read_byte_da=
ta(client, NCT3018Y_REG_CTRL);
5adbaed16cc635 Mia Lin 2022-07-13   99  		if (flags < 0)
5adbaed16cc635 Mia Lin 2022-07-13  100  			return flags;
5adbaed16cc635 Mia Lin 2022-07-13  101  		*alarm_enable =3D flags & NCT3018=
Y_BIT_AIE;
5adbaed16cc635 Mia Lin 2022-07-13  102  	}
5adbaed16cc635 Mia Lin 2022-07-13  103  =

5adbaed16cc635 Mia Lin 2022-07-13 @104  	if (alarm_flag) {
5adbaed16cc635 Mia Lin 2022-07-13  105  		dev_dbg(&client->dev, "%s:NCT3018=
Y_REG_ST\n", __func__);
5adbaed16cc635 Mia Lin 2022-07-13  106  		flags =3D  i2c_smbus_read_byte_da=
ta(client, NCT3018Y_REG_ST);
5adbaed16cc635 Mia Lin 2022-07-13  107  		if (flags < 0)
5adbaed16cc635 Mia Lin 2022-07-13  108  			return flags;
5adbaed16cc635 Mia Lin 2022-07-13  109  		*alarm_flag =3D flags & NCT3018Y_=
BIT_AF;
5adbaed16cc635 Mia Lin 2022-07-13  110  	}
5adbaed16cc635 Mia Lin 2022-07-13  111  =

5adbaed16cc635 Mia Lin 2022-07-13 @112  	dev_dbg(&client->dev, "%s:alarm_en=
able:%x alarm_flag:%x\n",
5adbaed16cc635 Mia Lin 2022-07-13  113  		__func__, *alarm_enable, *alarm_f=
lag);
5adbaed16cc635 Mia Lin 2022-07-13  114  =

5adbaed16cc635 Mia Lin 2022-07-13  115  	return 0;
5adbaed16cc635 Mia Lin 2022-07-13  116  }
5adbaed16cc635 Mia Lin 2022-07-13  117  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4015948445766649758==--

