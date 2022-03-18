Content-Type: multipart/mixed; boundary="===============7576034712451890192=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 19 Mar 2022 02:16:32 +0800
Message-ID: <202203190247.dEZtfdcm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7576034712451890192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Martin Kepplinger <martin.kepplinger@puri.sm>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Pavel Machek <pavel@ucw.cz>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   551acdc3c3d2b6bc97f11e31dcf960bc36343bfc
commit: e8c0882685f9152f0d729664a12bcbe749cb7736 media: i2c: add driver for=
 the SK Hynix Hi-846 8M pixel camera
date:   5 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220319/202203190247.dEZtfdcm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c0882685f9152f0d729664a12bcbe749cb7736
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c0882685f9152f0d729664a12bcbe749cb7736
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/soc/qcom/qmi_encdec.c:332:4: warning: Value stored to 'rc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                           rc =3D qmi_encode_basic_elem(&opt_flag_value, bu=
f_src,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/soc/qcom/qmi_encdec.c:332:4: note: Value stored to 'rc' is never=
 read
                           rc =3D qmi_encode_basic_elem(&opt_flag_value, bu=
f_src,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/accessibility/speakup/speakup_apollo.c:147:3: warning: Value sto=
red to 'jiffy_delta_val' is never read [clang-analyzer-deadcode.DeadStores]
                   jiffy_delta_val =3D jiffy_delta->u.n.value;
                   ^                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:147:3: note: Value stored=
 to 'jiffy_delta_val' is never read
                   jiffy_delta_val =3D jiffy_delta->u.n.value;
                   ^                 ~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:148:3: warning: Value sto=
red to 'full_time_val' is never read [clang-analyzer-deadcode.DeadStores]
                   full_time_val =3D full_time->u.n.value;
                   ^               ~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:148:3: note: Value stored=
 to 'full_time_val' is never read
                   full_time_val =3D full_time->u.n.value;
                   ^               ~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:149:3: warning: Value sto=
red to 'delay_time_val' is never read [clang-analyzer-deadcode.DeadStores]
                   delay_time_val =3D delay_time->u.n.value;
                   ^                ~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_apollo.c:149:3: note: Value stored=
 to 'delay_time_val' is never read
                   delay_time_val =3D delay_time->u.n.value;
                   ^                ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/media/i2c/ccs-pll.c:93:15: warning: Value stored to 's' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
                   const char *s =3D pll_string(br->which);
                               ^   ~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/ccs-pll.c:93:15: note: Value stored to 's' during its =
initialization is never read
                   const char *s =3D pll_string(br->which);
                               ^   ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1494:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(&hi846->sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/hi846.c:1764:2: warning: Value stored to 'tgt_fps' is =
never read [clang-analyzer-deadcode.DeadStores]
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1764:2: note: Value stored to 'tgt_fps' is nev=
er read
           tgt_fps =3D hi846->cur_mode->fps;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: warning: Value stored to 'client' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/hi846.c:1805:21: note: Value stored to 'client' during=
 its initialization is never read
           struct i2c_client *client =3D v4l2_get_subdevdata(sd);
                              ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/i2c/imx258.c:781:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx258.c:781:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (6 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   lib/zstd/decompress.c:1557:4: warning: Value stored to 'remainingSize' i=
s never read [clang-analyzer-deadcode.DeadStores]
                           remainingSize -=3D 4;
                           ^                ~
   lib/zstd/decompress.c:1557:4: note: Value stored to 'remainingSize' is n=
ever read
                           remainingSize -=3D 4;
                           ^                ~
   Suppressed 11 warnings (6 in non-user code, 5 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (5 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/client +1494 drivers/media/i2c/hi846.c

e8c0882685f915 Martin Kepplinger 2021-09-06  1491  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1492  static int hi846_set_vid=
eo_mode(struct hi846 *hi846, int fps)
e8c0882685f915 Martin Kepplinger 2021-09-06  1493  {
e8c0882685f915 Martin Kepplinger 2021-09-06 @1494  	struct i2c_client *clie=
nt =3D v4l2_get_subdevdata(&hi846->sd);
e8c0882685f915 Martin Kepplinger 2021-09-06  1495  	u64 frame_length;
e8c0882685f915 Martin Kepplinger 2021-09-06  1496  	int ret =3D 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1497  	int dummy_lines;
e8c0882685f915 Martin Kepplinger 2021-09-06  1498  	u64 link_freq =3D hi846=
_get_link_freq(hi846);
e8c0882685f915 Martin Kepplinger 2021-09-06  1499  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1500  	dev_dbg(&client->dev, "=
%s: link freq: %llu\n", __func__,
e8c0882685f915 Martin Kepplinger 2021-09-06  1501  		hi846_get_link_freq(hi=
846));
e8c0882685f915 Martin Kepplinger 2021-09-06  1502  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1503  	do_div(link_freq, fps);
e8c0882685f915 Martin Kepplinger 2021-09-06  1504  	frame_length =3D link_f=
req;
e8c0882685f915 Martin Kepplinger 2021-09-06  1505  	do_div(frame_length, HI=
846_LINE_LENGTH);
e8c0882685f915 Martin Kepplinger 2021-09-06  1506  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1507  	dummy_lines =3D (frame_=
length > hi846->cur_mode->frame_len) ?
e8c0882685f915 Martin Kepplinger 2021-09-06  1508  			(frame_length - hi846=
->cur_mode->frame_len) : 0;
e8c0882685f915 Martin Kepplinger 2021-09-06  1509  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1510  	frame_length =3D hi846-=
>cur_mode->frame_len + dummy_lines;
e8c0882685f915 Martin Kepplinger 2021-09-06  1511  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1512  	dev_dbg(&client->dev, "=
%s: frame length calculated: %llu\n", __func__,
e8c0882685f915 Martin Kepplinger 2021-09-06  1513  		frame_length);
e8c0882685f915 Martin Kepplinger 2021-09-06  1514  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1515  	hi846_write_reg_16(hi84=
6, HI846_REG_FLL, frame_length & 0xFFFF, &ret);
e8c0882685f915 Martin Kepplinger 2021-09-06  1516  	hi846_write_reg_16(hi84=
6, HI846_REG_LLP,
e8c0882685f915 Martin Kepplinger 2021-09-06  1517  			   HI846_LINE_LENGTH =
& 0xFFFF, &ret);
e8c0882685f915 Martin Kepplinger 2021-09-06  1518  =

e8c0882685f915 Martin Kepplinger 2021-09-06  1519  	return ret;
e8c0882685f915 Martin Kepplinger 2021-09-06  1520  }
e8c0882685f915 Martin Kepplinger 2021-09-06  1521  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7576034712451890192==--

