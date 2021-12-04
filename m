Content-Type: multipart/mixed; boundary="===============7239348866314714385=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: i2c: Add driver for DW9719 VCM
Date: Sun, 05 Dec 2021 03:34:06 +0800
Message-ID: <202112050308.lEaCEX4U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7239348866314714385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211128232115.38833-1-djrscally@gmail.com>
References: <20211128232115.38833-1-djrscally@gmail.com>
TO: Daniel Scally <djrscally@gmail.com>
TO: linux-media(a)vger.kernel.org
CC: sakari.ailus(a)linux.intel.com
CC: hdegoede(a)redhat.com
CC: laurent.pinchart(a)ideasonboard.com
CC: kieran.bingham(a)ideasonboard.com

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linus/master v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/media-i2c-Ad=
d-driver-for-DW9719-VCM/20211129-072436
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-c001-20211130 (https://download.01.org/0day-ci/arch=
ive/20211205/202112050308.lEaCEX4U-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8bbbe049053a268d99463f6fd=
a429d0af571a27a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/media-i2c-Add-driver=
-for-DW9719-VCM/20211129-072436
        git checkout 8bbbe049053a268d99463f6fda429d0af571a27a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~
   sound/drivers/vx/vx_pcm.c:217:2: note: Taking false branch
           if (! err)
           ^
   sound/drivers/vx/vx_pcm.c:219:2: note: Returning without writing to '*st=
ate'
           return err;
           ^
   sound/drivers/vx/vx_pcm.c:323:6: note: Returning from 'vx_get_pipe_state'
           if (vx_get_pipe_state(chip, pipe, &cur_state) < 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_pcm.c:323:6: note: Assuming the condition is false
           if (vx_get_pipe_state(chip, pipe, &cur_state) < 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_pcm.c:323:2: note: Taking false branch
           if (vx_get_pipe_state(chip, pipe, &cur_state) < 0)
           ^
   sound/drivers/vx/vx_pcm.c:325:12: note: The right operand of '=3D=3D' is=
 a garbage value
           if (state =3D=3D cur_state)
                     ^  ~~~~~~~~~
   sound/drivers/vx/vx_pcm.c:1225:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(pcm->name, chip->card->shortname);
                   ^~~~~~
   sound/drivers/vx/vx_pcm.c:1225:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(pcm->name, chip->card->shortname);
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   sound/drivers/vx/vx_mixer.c:836:55: warning: The left operand of '>>' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           ucontrol->value.integer.value[0] =3D meter[0].vu_level >> METER_=
SHIFT;
                                              ~~~~~~~~~~~~~~~~~ ^
   sound/drivers/vx/vx_mixer.c:835:2: note: Calling 'vx_get_audio_vu_meter'
           vx_get_audio_vu_meter(chip, audio, capture, meter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:367:6: note: Assuming the condition is true
           if (chip->chip_status & VX_STAT_IS_STALE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:367:2: note: Taking true branch
           if (chip->chip_status & VX_STAT_IS_STALE)
           ^
   sound/drivers/vx/vx_mixer.c:368:3: note: Returning without writing to 'i=
nfo->vu_level'
                   return -EBUSY;
                   ^
   sound/drivers/vx/vx_mixer.c:835:2: note: Returning from 'vx_get_audio_vu=
_meter'
           vx_get_audio_vu_meter(chip, audio, capture, meter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:836:55: note: The left operand of '>>' is a =
garbage value
           ucontrol->value.integer.value[0] =3D meter[0].vu_level >> METER_=
SHIFT;
                                              ~~~~~~~~~~~~~~~~~ ^
   sound/drivers/vx/vx_mixer.c:849:57: warning: The left operand of '>>' is=
 a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           ucontrol->value.integer.value[0] =3D meter[0].peak_level >> METE=
R_SHIFT;
                                              ~~~~~~~~~~~~~~~~~~~ ^
   sound/drivers/vx/vx_mixer.c:848:2: note: Calling 'vx_get_audio_vu_meter'
           vx_get_audio_vu_meter(chip, audio, capture, meter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:367:6: note: Assuming the condition is true
           if (chip->chip_status & VX_STAT_IS_STALE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:367:2: note: Taking true branch
           if (chip->chip_status & VX_STAT_IS_STALE)
           ^
   sound/drivers/vx/vx_mixer.c:368:3: note: Returning without writing to 'i=
nfo->peak_level'
                   return -EBUSY;
                   ^
   sound/drivers/vx/vx_mixer.c:848:2: note: Returning from 'vx_get_audio_vu=
_meter'
           vx_get_audio_vu_meter(chip, audio, capture, meter);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:849:57: note: The left operand of '>>' is a =
garbage value
           ucontrol->value.integer.value[0] =3D meter[0].peak_level >> METE=
R_SHIFT;
                                              ~~~~~~~~~~~~~~~~~~~ ^
   sound/drivers/vx/vx_mixer.c:863:35: warning: Assigned value is garbage o=
r undefined [clang-analyzer-core.uninitialized.Assign]
           ucontrol->value.integer.value[0] =3D meter[0].saturated;
                                            ^ ~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:862:2: note: Calling 'vx_get_audio_vu_meter'
           vx_get_audio_vu_meter(chip, audio, 1, meter); /* capture only */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:367:6: note: Assuming the condition is true
           if (chip->chip_status & VX_STAT_IS_STALE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:367:2: note: Taking true branch
           if (chip->chip_status & VX_STAT_IS_STALE)
           ^
   sound/drivers/vx/vx_mixer.c:368:3: note: Returning without writing to 'i=
nfo->saturated'
                   return -EBUSY;
                   ^
   sound/drivers/vx/vx_mixer.c:862:2: note: Returning from 'vx_get_audio_vu=
_meter'
           vx_get_audio_vu_meter(chip, audio, 1, meter); /* capture only */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:863:35: note: Assigned value is garbage or u=
ndefined
           ucontrol->value.integer.value[0] =3D meter[0].saturated;
                                            ^ ~~~~~~~~~~~~~~~~~~
   sound/drivers/vx/vx_mixer.c:906:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, card->driver);
           ^~~~~~
   sound/drivers/vx/vx_mixer.c:906:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(card->mixername, card->driver);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> drivers/media/i2c/dw9719.c:126:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -ENXIO;
                   ^     ~~~~~~
   drivers/media/i2c/dw9719.c:126:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D -ENXIO;
                   ^     ~~~~~~
   drivers/media/i2c/dw9719.c:146:2: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           ret =3D dw9719_i2c_wr8(dw9719->client, DW9719_CONTROL, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/dw9719.c:146:2: note: Value stored to 'ret' is never r=
ead
           ret =3D dw9719_i2c_wr8(dw9719->client, DW9719_CONTROL, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/media/i2c/adv7175.c:416:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7175_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:416:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7175_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:417:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7175_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:417:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7175_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (8 in non-user code, 10 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/i2c/adv7842.c:3499:60: warning: The result of the left shi=
ft is undefined because the left operand is negative [clang-analyzer-core.U=
ndefinedBinaryOperatorResult]
           rev =3D adv_smbus_read_byte_data_check(client, 0xea, false) << 8=
 |
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/media/i2c/adv7842.c:3469:7: note: Calling 'i2c_check_functionali=
ty'
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYT=
E_DATA))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/i2c.h:913:9: note: Assuming the condition is true
           return (func & i2c_get_functionality(adap)) =3D=3D func;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:913:2: note: Returning the value 1, which participat=
es in a condition later
           return (func & i2c_get_functionality(adap)) =3D=3D func;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3469:7: note: Returning from 'i2c_check_func=
tionality'
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYT=
E_DATA))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   drivers/media/i2c/adv7842.c:3469:2: note: Taking false branch
           if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYT=
E_DATA))
           ^
   drivers/media/i2c/adv7842.c:3472:13: note: Assuming 'debug' is < 1
           v4l_dbg(1, debug, client, "detecting adv7842 client on address 0=
x%x\n",
                      ^
   include/media/v4l2-common.h:43:7: note: expanded from macro 'v4l_dbg'
                   if (debug >=3D (level))                                 =
       \
                       ^~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7842.c:3472:2: note: Taking false branch
           v4l_dbg(1, debug, client, "detecting adv7842 client on address 0=
x%x\n",
           ^
   include/media/v4l2-common.h:43:3: note: expanded from macro 'v4l_dbg'
                   if (debug >=3D (level))                                 =
       \
                   ^
   drivers/media/i2c/adv7842.c:3472:2: note: Loop condition is false.  Exit=
ing loop
           v4l_dbg(1, debug, client, "detecting adv7842 client on address 0=
x%x\n",
           ^
   include/media/v4l2-common.h:42:2: note: expanded from macro 'v4l_dbg'
           do {                                                            =
     \
           ^
   drivers/media/i2c/adv7842.c:3475:6: note: Assuming 'pdata' is non-null
           if (!pdata) {
               ^~~~~~
   drivers/media/i2c/adv7842.c:3475:2: note: Taking false branch
           if (!pdata) {
           ^
   drivers/media/i2c/adv7842.c:3481:6: note: Assuming 'state' is non-null
           if (!state)
               ^~~~~~
   drivers/media/i2c/adv7842.c:3481:2: note: Taking false branch
           if (!state)
           ^
   drivers/media/i2c/adv7842.c:3495:23: note: Assuming field 'input' is not=
 equal to ADV7842_SELECT_HDMI_PORT_A
           state->hdmi_port_a =3D pdata->input =3D=3D ADV7842_SELECT_HDMI_P=
ORT_A;

vim +/ret +126 drivers/media/i2c/dw9719.c

8bbbe049053a26 Daniel Scally 2021-11-28  114  =

8bbbe049053a26 Daniel Scally 2021-11-28  115  static int dw9719_detect(stru=
ct dw9719_device *dw9719)
8bbbe049053a26 Daniel Scally 2021-11-28  116  {
8bbbe049053a26 Daniel Scally 2021-11-28  117  	int ret;
8bbbe049053a26 Daniel Scally 2021-11-28  118  	u8 val;
8bbbe049053a26 Daniel Scally 2021-11-28  119  =

8bbbe049053a26 Daniel Scally 2021-11-28  120  	ret =3D dw9719_i2c_rd8(dw971=
9->client, DW9719_INFO, &val);
8bbbe049053a26 Daniel Scally 2021-11-28  121  	if (ret < 0)
8bbbe049053a26 Daniel Scally 2021-11-28  122  		return ret;
8bbbe049053a26 Daniel Scally 2021-11-28  123  =

8bbbe049053a26 Daniel Scally 2021-11-28  124  	if (val !=3D DW9719_ID) {
8bbbe049053a26 Daniel Scally 2021-11-28  125  		dev_err(dw9719->dev, "Faile=
d to detect correct id\n");
8bbbe049053a26 Daniel Scally 2021-11-28 @126  		ret =3D -ENXIO;
8bbbe049053a26 Daniel Scally 2021-11-28  127  	}
8bbbe049053a26 Daniel Scally 2021-11-28  128  =

8bbbe049053a26 Daniel Scally 2021-11-28  129  	return 0;
8bbbe049053a26 Daniel Scally 2021-11-28  130  }
8bbbe049053a26 Daniel Scally 2021-11-28  131  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7239348866314714385==--

