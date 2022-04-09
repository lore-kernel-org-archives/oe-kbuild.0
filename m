Content-Type: multipart/mixed; boundary="===============5319793591220625683=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_word_length_map' can be declared with const [constVariable]
Date: Sat, 09 Apr 2022 13:11:49 +0800
Message-ID: <202204091314.ZzoXXAYo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5319793591220625683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Allen Chen <allen.chen@ite.com.tw>
CC: Robert Foss <robert.foss@linaro.org>
CC: Hermes Wu <hermes.wu@ite.com.tw>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6c7376da23587738ab0e84b8b90b6cc02db5181e
commit: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 drm/bridge: add it6505 dri=
ver
date:   10 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 weeks ago
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b5c84a9edcd418cd055becad6a22439e7c5e3bf8
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/bridge/ite-it6505.c:1330:5: warning: Variable 'audio_wor=
d_length_map' can be declared with const [constVariable]
    u8 audio_word_length_map[] =3D { 0x02, 0x04, 0x03, 0x0B };
       ^
>> drivers/gpu/drm/bridge/ite-it6505.c:1620:56: warning: Parameter 'lane_vo=
ltage_swing' can be declared with const [constParameter]
   static bool it6505_check_max_voltage_swing_reached(u8 *lane_voltage_swin=
g,
                                                          ^

vim +/audio_word_length_map +1330 drivers/gpu/drm/bridge/ite-it6505.c

b5c84a9edcd418 Allen Chen 2022-01-14  1326  =

b5c84a9edcd418 Allen Chen 2022-01-14  1327  static void it6505_setup_audio_=
channel_status(struct it6505 *it6505)
b5c84a9edcd418 Allen Chen 2022-01-14  1328  {
b5c84a9edcd418 Allen Chen 2022-01-14  1329  	enum it6505_audio_sample_rate =
sample_rate =3D it6505->audio.sample_rate;
b5c84a9edcd418 Allen Chen 2022-01-14 @1330  	u8 audio_word_length_map[] =3D=
 { 0x02, 0x04, 0x03, 0x0B };
b5c84a9edcd418 Allen Chen 2022-01-14  1331  =

b5c84a9edcd418 Allen Chen 2022-01-14  1332  	/* Channel Status */
b5c84a9edcd418 Allen Chen 2022-01-14  1333  	it6505_write(it6505, REG_IEC95=
8_STS0, it6505->audio.type << 1);
b5c84a9edcd418 Allen Chen 2022-01-14  1334  	it6505_write(it6505, REG_IEC95=
8_STS1, 0x00);
b5c84a9edcd418 Allen Chen 2022-01-14  1335  	it6505_write(it6505, REG_IEC95=
8_STS2, 0x00);
b5c84a9edcd418 Allen Chen 2022-01-14  1336  	it6505_write(it6505, REG_IEC95=
8_STS3, sample_rate);
b5c84a9edcd418 Allen Chen 2022-01-14  1337  	it6505_write(it6505, REG_IEC95=
8_STS4, (~sample_rate << 4) |
b5c84a9edcd418 Allen Chen 2022-01-14  1338  		     audio_word_length_map[it=
6505->audio.word_length]);
b5c84a9edcd418 Allen Chen 2022-01-14  1339  }
b5c84a9edcd418 Allen Chen 2022-01-14  1340  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5319793591220625683==--

