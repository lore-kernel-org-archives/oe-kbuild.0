Content-Type: multipart/mixed; boundary="===============8720301857870526675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nbd168-wireless:mt76 35/100] drivers/net/wireless/mediatek/mt76/mt7615/init.c:36:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Mon, 21 Jun 2021 10:31:53 +0800
Message-ID: <202106211050.fukLd8gC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8720301857870526675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Ryder Lee <ryder.lee@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>

tree:   https://github.com/nbd168/wireless mt76
head:   61a1f99dd1e3c145fce9d601b52e7adb8f37322a
commit: 109e505ad944dc207aaa9ee134b0994be09d291d [35/100] mt76: mt7615: add=
 thermal sensor device support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +36 drivers/net/wireless/mediatek/mt76/mt7615/init.c

04b8e65922f631 Ryder Lee 2019-04-01  17  =

109e505ad944dc Ryder Lee 2021-04-24  18  static ssize_t mt7615_thermal_show=
_temp(struct device *dev,
109e505ad944dc Ryder Lee 2021-04-24  19  					struct device_attribute *attr,
109e505ad944dc Ryder Lee 2021-04-24  20  					char *buf)
109e505ad944dc Ryder Lee 2021-04-24  21  {
109e505ad944dc Ryder Lee 2021-04-24  22  	struct mt7615_dev *mdev =3D dev_g=
et_drvdata(dev);
109e505ad944dc Ryder Lee 2021-04-24  23  	int temperature;
109e505ad944dc Ryder Lee 2021-04-24  24  =

109e505ad944dc Ryder Lee 2021-04-24  25  	if (!mt7615_wait_for_mcu_init(mde=
v))
109e505ad944dc Ryder Lee 2021-04-24  26  		return 0;
109e505ad944dc Ryder Lee 2021-04-24  27  =

109e505ad944dc Ryder Lee 2021-04-24  28  	mt7615_mutex_acquire(mdev);
109e505ad944dc Ryder Lee 2021-04-24  29  	temperature =3D mt7615_mcu_get_te=
mperature(mdev);
109e505ad944dc Ryder Lee 2021-04-24  30  	mt7615_mutex_release(mdev);
109e505ad944dc Ryder Lee 2021-04-24  31  =

109e505ad944dc Ryder Lee 2021-04-24  32  	if (temperature < 0)
109e505ad944dc Ryder Lee 2021-04-24  33  		return temperature;
109e505ad944dc Ryder Lee 2021-04-24  34  =

109e505ad944dc Ryder Lee 2021-04-24  35  	/* display in millidegree celcius=
 */
109e505ad944dc Ryder Lee 2021-04-24 @36  	return sprintf(buf, "%u\n", tempe=
rature * 1000);
109e505ad944dc Ryder Lee 2021-04-24  37  }
109e505ad944dc Ryder Lee 2021-04-24  38  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8720301857870526675==--

