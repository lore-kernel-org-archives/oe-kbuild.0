Content-Type: multipart/mixed; boundary="===============2560010682774273972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tobetter-linux:odroid-5.13.y 94/95] drivers/hwmon/pwm-fan.c:218:9: warning: %u in format string (no. 1) requires 'unsigned int' but the argument type is 'signed int'. [invalidPrintfArgType_uint]
Date: Wed, 30 Jun 2021 17:55:35 +0800
Message-ID: <202106301730.TS0aUra9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2560010682774273972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.13.y
head:   710bf4eba39225487edc126ffcca61ee80b80631
commit: 17ef58010ec970e3397a97cefc11f893a17eb95d [94/95] ODROID-HC4: hwmon:=
 (pwm-fan): fix to add 'pwm1_enable' to set PWM fan mode
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: csky-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


vim +218 drivers/hwmon/pwm-fan.c

17ef58010ec970 Dongjin Kim 2021-06-30  212  =

17ef58010ec970 Dongjin Kim 2021-06-30  213  static ssize_t enable_show(stru=
ct device *dev, struct device_attribute *attr,
17ef58010ec970 Dongjin Kim 2021-06-30  214  		char *buf)
17ef58010ec970 Dongjin Kim 2021-06-30  215  {
17ef58010ec970 Dongjin Kim 2021-06-30  216  	struct pwm_fan_ctx *ctx =3D de=
v_get_drvdata(dev);
17ef58010ec970 Dongjin Kim 2021-06-30  217  =

17ef58010ec970 Dongjin Kim 2021-06-30 @218  	return sprintf(buf, "%u\n", ct=
x->enable);
17ef58010ec970 Dongjin Kim 2021-06-30  219  }
17ef58010ec970 Dongjin Kim 2021-06-30  220  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2560010682774273972==--

