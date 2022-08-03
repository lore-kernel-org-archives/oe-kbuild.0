Content-Type: multipart/mixed; boundary="===============1575436304050416627=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:tegrav8 2/7] drivers/media/i2c/tc358840.c:320:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Thu, 04 Aug 2022 04:10:47 +0800
Message-ID: <202208040403.Pyz3NxBi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1575436304050416627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/i2c/tc358840.c:320:13: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git tegrav8
head:   386823032a34ce7926c18033b0ca34de9145a206
commit: f51f9140626da0e72ade6bd437ac2fe13e9b0425 [2/7] tc358840: add Toshib=
a tc358840 HDMI-to-CSI bridge.
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220804/202208040403.Pyz3NxBi-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media=
_tree.git
        git fetch --no-tags hverkuil-media-tree tegrav8
        git checkout f51f9140626da0e72ade6bd437ac2fe13e9b0425
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In function 'i2c_rd16',
       inlined from 'i2c_wr16_and_or' at drivers/media/i2c/tc358840.c:334:2=
1:
>> drivers/media/i2c/tc358840.c:320:13: warning: use of uninitialized value=
 '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     320 |         u16 val;
         |             ^~~
     'enable_audio_block_and_i2s': events 1-2
       |
       | 3332 | static void enable_audio_block_and_i2s(struct v4l2_subdev *=
sd)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'enable_audio_block_and_i2s'
       |......
       | 3335 |         i2c_wr16_and_or(sd, I2S_PUDCTL, 0, 0);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'i2c_wr16_and_or' from 'enable_audio_bl=
ock_and_i2s'
       |
       +--> 'i2c_wr16_and_or': events 3-4
              |
              |  320 |         u16 val;
              |      |             ~~~
              |      |             |
              |      |             (4) use of uninitialized value '<unknown=
>' here
              |......
              |  332 | static void i2c_wr16_and_or(struct v4l2_subdev *sd, =
u16 reg, u16 mask, u16 val)
              |      |             ^~~~~~~~~~~~~~~
              |      |             |
              |      |             (3) entry to 'i2c_wr16_and_or'
              |

vim +320 drivers/media/i2c/tc358840.c

f51f9140626da0e Hans Verkuil 2020-02-21  317  =

f51f9140626da0e Hans Verkuil 2020-02-21  318  static u16 i2c_rd16(struct v4=
l2_subdev *sd, u16 reg)
f51f9140626da0e Hans Verkuil 2020-02-21  319  {
f51f9140626da0e Hans Verkuil 2020-02-21 @320  	u16 val;
f51f9140626da0e Hans Verkuil 2020-02-21  321  =

f51f9140626da0e Hans Verkuil 2020-02-21  322  	i2c_rd(sd, reg, (u8 *)&val, =
2);
f51f9140626da0e Hans Verkuil 2020-02-21  323  =

f51f9140626da0e Hans Verkuil 2020-02-21  324  	return val;
f51f9140626da0e Hans Verkuil 2020-02-21  325  }
f51f9140626da0e Hans Verkuil 2020-02-21  326  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1575436304050416627==--

