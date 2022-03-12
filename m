Content-Type: multipart/mixed; boundary="===============6620557391591059587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/i2c/hi846.c:1494:21: warning: Value stored to 'client' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 13 Mar 2022 07:58:24 +0800
Message-ID: <202203130710.uJ9Eu1Md-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6620557391591059587==
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
head:   aad611a868d16cdc16a7d4a764cef955293e47e3
commit: e8c0882685f9152f0d729664a12bcbe749cb7736 media: i2c: add driver for=
 the SK Hynix Hi-846 8M pixel camera
date:   5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-c006-20220307 (https://download.01.org/0day-ci/arc=
hive/20220313/202203130710.uJ9Eu1Md-lkp(a)intel.com/config)
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
                                        ^~~~~   ~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: note: Value stor=
ed to 'input' during its initialization is never read
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/misc/habanalabs/common/debugfs.c:858:3: warning: Value stored to=
 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pci_enable_device(hdev->pdev);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/debugfs.c:858:3: note: Value stored to 'r=
c' is never read
                   rc =3D pci_enable_device(hdev->pdev);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   drivers/accessibility/speakup/varhandlers.c:263:4: warning: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insec=
ureAPI.strcpy]
                           strcpy((char *)var->p_val, var_data->u.s.default=
_val);
                           ^~~~~~
   drivers/accessibility/speakup/varhandlers.c:263:4: note: Call to functio=
n 'strcpy' is insecure as it does not provide bounding of the memory buffer=
. Replace unbounded copy functions with analogous functions that support le=
ngth arguments such as 'strlcpy'. CWE-119
                           strcpy((char *)var->p_val, var_data->u.s.default=
_val);
                           ^~~~~~
   drivers/accessibility/speakup/varhandlers.c:266:3: warning: Call to func=
tion 'strcpy' is insecure as it does not provide bounding of the memory buf=
fer. Replace unbounded copy functions with analogous functions that support=
 length arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insec=
ureAPI.strcpy]
                   strcpy((char *)var->p_val, page);
                   ^~~~~~
   drivers/accessibility/speakup/varhandlers.c:266:3: note: Call to functio=
n 'strcpy' is insecure as it does not provide bounding of the memory buffer=
. Replace unbounded copy functions with analogous functions that support le=
ngth arguments such as 'strlcpy'. CWE-119
                   strcpy((char *)var->p_val, page);
                   ^~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/hwmon/lm63.c:1017:17: warning: Value stored to 'dev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   drivers/hwmon/lm63.c:1017:17: note: Value stored to 'dev' during its ini=
tialization is never read
           struct device *dev =3D &client->dev;
                          ^~~   ~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/leds/uleds.c:150:4: warning: Value stored to 'retval' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/leds/uleds.c:150:4: note: Value stored to 'retval' is never read
                           retval =3D copy_to_user(buffer, &udev->brightnes=
s,
                           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/firmware/broadcom/tee_bnxt_fw.c:146:3: warning: Value stored to =
'nbytes' is never read [clang-analyzer-deadcode.DeadStores]
                   nbytes =3D rbytes;
                   ^        ~~~~~~
   drivers/firmware/broadcom/tee_bnxt_fw.c:146:3: note: Value stored to 'nb=
ytes' is never read
                   nbytes =3D rbytes;
                   ^        ~~~~~~
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
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
--===============6620557391591059587==--

