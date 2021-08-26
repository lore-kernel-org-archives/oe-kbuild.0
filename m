Content-Type: multipart/mixed; boundary="===============0562452514131819641=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xlnx:master 10/101] drivers/media/i2c/adv7511-v4l2.c:352:2: warning: Non-boolean value returned from function returning bool [returnNonBoolInBooleanFunction]
Date: Thu, 26 Aug 2021 10:58:08 +0800
Message-ID: <202108261058.RqA261Y1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0562452514131819641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Quanyang Wang <quanyang.wang@windriver.com>
CC: Michal Simek <monstr@monstr.eu>

Hi Quanyang,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/Xilinx/linux-xlnx master
head:   45cd0074cdf1ddd710b28848e6a860b442babfcc
commit: bd76b5963aee700d5e6ff0cd29834bfdaf05532e [10/101] media: adv7511-v4=
l2: fix compile error
:::::: branch date: 3 days ago
:::::: commit date: 6 weeks ago
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/i2c/adv7511-v4l2.c:352:2: warning: Non-boolean value retur=
ned from function returning bool [returnNonBoolInBooleanFunction]
    return adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT;
    ^
   drivers/media/i2c/adv7511-v4l2.c:357:2: warning: Non-boolean value retur=
ned from function returning bool [returnNonBoolInBooleanFunction]
    return adv7511_rd(sd, 0x42) & MASK_ADV7511_MSEN_DETECT;
    ^

vim +352 drivers/media/i2c/adv7511-v4l2.c

b4dbad8fe3b604 drivers/media/i2c/adv7511.c Hans Verkuil 2015-06-07  349  =

5a544cce2177fe drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  350  st=
atic inline bool adv7511_have_hotplug(struct v4l2_subdev *sd)
5a544cce2177fe drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  351  {
5a544cce2177fe drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23 @352  	r=
eturn adv7511_rd(sd, 0x42) & MASK_ADV7511_HPD_DETECT;
5a544cce2177fe drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  353  }
5a544cce2177fe drivers/media/i2c/adv7511.c Hans Verkuil 2013-08-23  354  =


:::::: The code at line 352 was first introduced by commit
:::::: 5a544cce2177fe361ba539db9ddaf1eff4e73f81 [media] adv7511: add new vi=
deo encoder

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <m.chehab@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0562452514131819641==--

