Content-Type: multipart/mixed; boundary="===============7121347125335850270=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media:tegrav8 2/23] drivers/media/i2c/tc358840.c:360:2: warning: Non-boolean value returned from function returning bool
Date: Thu, 17 Dec 2020 13:42:29 +0800
Message-ID: <202012171325.7DTBct72-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7121347125335850270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git tegrav8
head:   e069df6e39593935c52d172c2566f50e3f6b8da7
commit: 5cd91c9c90f8d9c3492f2ed766b5fec496cde3d3 [2/23] tc358840: add Toshi=
ba tc358840 HDMI-to-CSI bridge.
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/media/i2c/tc358840.c:360:2: warning: Non-boolean value returned =
from function returning bool [returnNonBoolInBooleanFunction]
    return i2c_rd8(sd, SYS_STATUS) & MASK_S_HDMI;
    ^
>> drivers/media/i2c/tc358840.c:1321:22: warning: Local variable fps shadow=
s outer function [shadowFunction]
    u32 frame_interval, fps;
                        ^
   drivers/media/i2c/tc358840.c:405:28: note: Shadowed declaration
   static inline unsigned int fps(const struct v4l2_bt_timings *t)
                              ^
   drivers/media/i2c/tc358840.c:1321:22: note: Shadow variable
    u32 frame_interval, fps;
                        ^

vim +360 drivers/media/i2c/tc358840.c

5cd91c9c90f8d9c Hans Verkuil 2020-02-21  357  =

5cd91c9c90f8d9c Hans Verkuil 2020-02-21  358  static inline bool is_hdmi(st=
ruct v4l2_subdev *sd)
5cd91c9c90f8d9c Hans Verkuil 2020-02-21  359  {
5cd91c9c90f8d9c Hans Verkuil 2020-02-21 @360  	return i2c_rd8(sd, SYS_STATU=
S) & MASK_S_HDMI;
5cd91c9c90f8d9c Hans Verkuil 2020-02-21  361  }
5cd91c9c90f8d9c Hans Verkuil 2020-02-21  362  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7121347125335850270==--

