Content-Type: multipart/mixed; boundary="===============5046422611985910322=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/ov5693.c:518:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Wed, 20 Jul 2022 12:15:50 +0800
Message-ID: <202207201216.0JcjE6ek-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5046422611985910322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/ov5693.c:518:13: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Scally <djrscally@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: "Jean-Michel Hautbois" <jeanmichel.hautbois@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: 89aef879cb537061f7a0948210fc00c5f1b5dfb4 media: i2c: Add support fo=
r ov5693 sensor
date:   8 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220720/202207201216.0JcjE6ek-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D89aef879cb537061f7a0948210fc00c5f1b5dfb4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 89aef879cb537061f7a0948210fc00c5f1b5dfb4
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/media/i2c/ov5693.c: In function 'ov5693_get_exposure':
>> drivers/media/i2c/ov5693.c:518:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     518 |         u32 exposure;
         |             ^~~~~~~~
     'ov5693_get_exposure': event 1
       |
       |  518 |         u32 exposure;
       |      |             ^~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/ov5693.c: In function 'ov5693_get_gain':
   drivers/media/i2c/ov5693.c:545:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     545 |         u32 value;
         |             ^~~~~
     'ov5693_get_gain': event 1
       |
       |  545 |         u32 value;
       |      |             ^~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/media/i2c/ov5693.c: In function 'ov5693_detect':
   drivers/media/i2c/ov5693.c:871:13: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         u32 id;
         |             ^~
     'ov5693_detect': event 1
       |
       |  871 |         u32 id;
       |      |             ^~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   In file included from include/linux/kernel.h:17,
                    from include/linux/unaligned/packed_struct.h:4,
                    from include/asm-generic/unaligned.h:9,
                    from ./arch/arm/include/generated/asm/unaligned.h:1,
                    from drivers/media/i2c/ov5693.c:15:
   drivers/media/i2c/ov5693.c: In function 'ov5693_set_fmt':
   include/linux/compiler-gcc.h:42:45: warning: dereference of NULL 'crop' =
[CWE-476] [-Wanalyzer-null-dereference]
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix=
), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/minmax.h:32:27: note: in definition of macro '__cmp_once'
      32 |                 typeof(y) unique_y =3D (y);               \
         |                           ^~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:29: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix=
), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PA=
STE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler-gcc.h:42:37: note: in expansion of macro '__PASTE'
      42 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix=
), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:38:52: note: in expansion of macro '__UNIQUE_ID'
      38 |                 __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(_=
_y), op))
         |                                                    ^~~~~~~~~~~
   include/linux/minmax.h:104:33: note: in expansion of macro '__careful_cm=
p'
     104 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(=
y), <)
         |                                 ^~~~~~~~~~~~~
   include/linux/minmax.h:124:36: note: in expansion of macro 'min_t'
     124 | #define clamp_t(type, val, lo, hi) min_t(type, max_t(type, val, =
lo), hi)
         |                                    ^~~~~
   drivers/media/i2c/ov5693.c:961:17: note: in expansion of macro 'clamp_t'
     961 |         width =3D clamp_t(unsigned int, ALIGN(format->format.wid=
th, 2),
         |                 ^~~~~~~
     'ov5693_set_fmt': events 1-2
       |
       |  942 | static int ov5693_set_fmt(struct v4l2_subdev *sd,
       |      |            ^~~~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'ov5693_set_fmt'
       |......
       |  955 |         crop =3D __ov5693_get_pad_crop(ov5693, state, forma=
t->pad, format->which);
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (2) calling '__ov5693_get_pad_crop' from 'ov=
5693_set_fmt'
       |
       +--> '__ov5693_get_pad_crop': events 3-4
              |
              |  917 | __ov5693_get_pad_crop(struct ov5693_device *ov5693,
              |      | ^~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to '__ov5693_get_pad_crop'
              |......
              |  921 |         switch (which) {
              |      |         ~~~~~~
              |      |         |
              |      |         (4) following 'default:' branch...
              |
            '__ov5693_get_pad_crop': event 5
              |
              |cc1:
              | (5): ...to here
              |
       <------+
       |
     'ov5693_set_fmt': event 6
       |

vim +518 drivers/media/i2c/ov5693.c

89aef879cb5370 Daniel Scally 2021-11-23  515  =

89aef879cb5370 Daniel Scally 2021-11-23  516  static int ov5693_get_exposur=
e(struct ov5693_device *ov5693, s32 *value)
89aef879cb5370 Daniel Scally 2021-11-23  517  {
89aef879cb5370 Daniel Scally 2021-11-23 @518  	u32 exposure;
89aef879cb5370 Daniel Scally 2021-11-23  519  	int ret;
89aef879cb5370 Daniel Scally 2021-11-23  520  =

89aef879cb5370 Daniel Scally 2021-11-23  521  	ret =3D ov5693_read_reg(ov56=
93, OV5693_EXPOSURE_CTRL_REG, &exposure);
89aef879cb5370 Daniel Scally 2021-11-23  522  	if (ret)
89aef879cb5370 Daniel Scally 2021-11-23  523  		return ret;
89aef879cb5370 Daniel Scally 2021-11-23  524  =

89aef879cb5370 Daniel Scally 2021-11-23  525  	/* The lowest 4 bits are uns=
upported fractional bits */
89aef879cb5370 Daniel Scally 2021-11-23  526  	*value =3D exposure >> 4;
89aef879cb5370 Daniel Scally 2021-11-23  527  =

89aef879cb5370 Daniel Scally 2021-11-23  528  	return 0;
89aef879cb5370 Daniel Scally 2021-11-23  529  }
89aef879cb5370 Daniel Scally 2021-11-23  530  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5046422611985910322==--

