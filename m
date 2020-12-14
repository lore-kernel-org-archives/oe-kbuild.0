Content-Type: multipart/mixed; boundary="===============4510382183583441362=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tobetter-linux:odroid-5.10.y-panfrost 81/88] drivers/hwmon/pwm-fan.c:171:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'.
Date: Mon, 14 Dec 2020 20:29:32 +0800
Message-ID: <202012142029.BNHdgRBv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4510382183583441362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.10.y-panfrost
head:   58cff0e5c8f2a36255e7754fe305bbac25bf6b4f
commit: ffea56b701eb2e83e72c19157f94d91d3ac4419d [81/88] hwmon: (pwm-fan) a=
dd fan pwm1_enable attribute
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +171 drivers/hwmon/pwm-fan.c

ffea56b701eb2e8 Dongjin Kim 2020-11-25  165  =

ffea56b701eb2e8 Dongjin Kim 2020-11-25  166  static ssize_t enable_show(str=
uct device *dev, struct device_attribute *attr,
ffea56b701eb2e8 Dongjin Kim 2020-11-25  167  			   char *buf)
ffea56b701eb2e8 Dongjin Kim 2020-11-25  168  {
ffea56b701eb2e8 Dongjin Kim 2020-11-25  169  	struct pwm_fan_ctx *ctx =3D d=
ev_get_drvdata(dev);
ffea56b701eb2e8 Dongjin Kim 2020-11-25  170  =

ffea56b701eb2e8 Dongjin Kim 2020-11-25 @171  	return sprintf(buf, "%u\n", c=
tx->enable);
ffea56b701eb2e8 Dongjin Kim 2020-11-25  172  }
ffea56b701eb2e8 Dongjin Kim 2020-11-25  173  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4510382183583441362==--

