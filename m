Content-Type: multipart/mixed; boundary="===============8759455416993294801=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/usb/mixer.c:1510:35: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 26 Jan 2022 14:38:15 +0800
Message-ID: <202201261401.27GGgoYl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8759455416993294801==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Kai-Heng Feng" <kai.heng.feng@canonical.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 69644fca2716699cc6896aff51d37b1e886c94d2 ALSA: usb-audio: Carve out=
 connector value checking into a helper
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220123 (https://download.01.org/0day-ci/archi=
ve/20220126/202201261401.27GGgoYl-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30=
728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D69644fca2716699cc6896aff51d37b1e886c94d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 69644fca2716699cc6896aff51d37b1e886c94d2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   ^
   drivers/gpu/drm/mcde/mcde_display.c:1197:2: note: Returning from 'mcde_d=
rain_pipe'
           mcde_drain_pipe(mcde, MCDE_FIFO_A, MCDE_CHANNEL_0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mcde/mcde_display.c:1206:2: note: Calling 'mcde_configur=
e_extsrc'
           mcde_configure_extsrc(mcde, MCDE_EXTSRC_0, format);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mcde/mcde_display.c:202:2: note: Control jumps to 'case =
MCDE_EXTSRC_0:'  at line 203
           switch (src) {
           ^
   drivers/gpu/drm/mcde/mcde_display.c:206:3: note:  Execution continues on=
 line 250
                   break;
                   ^
   drivers/gpu/drm/mcde/mcde_display.c:254:2: note: Control jumps to the 'd=
efault' case at line 322
           switch (format) {
           ^
   drivers/gpu/drm/mcde/mcde_display.c:325:3: note: Returning without writi=
ng to 'mcde->dpi_output', which participates in a condition later
                   return -EINVAL;
                   ^
   drivers/gpu/drm/mcde/mcde_display.c:1206:2: note: Returning from 'mcde_c=
onfigure_extsrc'
           mcde_configure_extsrc(mcde, MCDE_EXTSRC_0, format);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/mcde/mcde_display.c:1222:6: note: Assuming field 'dpi_ou=
tput' is false
           if (mcde->dpi_output) {
               ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/mcde/mcde_display.c:1222:2: note: Taking false branch
           if (mcde->dpi_output) {
           ^
   drivers/gpu/drm/mcde/mcde_display.c:1254:3: note: 3rd function call argu=
ment is an uninitialized value
                   mcde_configure_dsi_formatter(mcde, MCDE_DSI_FORMATTER_0,
                   ^
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   sound/usb/mixer.c:678:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:678:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:681:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:681:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:684:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:684:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:687:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:687:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:696:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:696:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:699:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:699:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:702:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:702:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:705:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:705:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:711:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, names->name);
                           ^~~~~~
   sound/usb/mixer.c:711:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, names->name);
                           ^~~~~~
>> sound/usb/mixer.c:1510:35: warning: Assigned value is garbage or undefin=
ed [clang-analyzer-core.uninitialized.Assign]
           ucontrol->value.integer.value[0] =3D val;
                                            ^ ~~~
   sound/usb/mixer.c:1503:11: note: 'val' declared without an initial value
           int ret, val;
                    ^~~
   sound/usb/mixer.c:1505:8: note: Calling 'get_connector_value'
           ret =3D get_connector_value(cval, kcontrol->id.name, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:1457:8: note: Assuming the condition is true
           ret =3D snd_usb_lock_shutdown(chip) ? -EIO : 0;
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:1457:8: note: '?' condition is true
   sound/usb/mixer.c:1458:6: note: 'ret' is -5
           if (ret)
               ^~~
   sound/usb/mixer.c:1458:2: note: Taking true branch
           if (ret)
           ^
   sound/usb/mixer.c:1459:3: note: Control jumps to line 1489
                   goto error;
                   ^
   sound/usb/mixer.c:1492:10: note: Assuming field 'ignore_ctl_error' is no=
t equal to 0
                   return filter_error(cval, ret);
                          ^
   sound/usb/mixer.c:130:3: note: expanded from macro 'filter_error'
           ((cval)->head.mixer->ignore_ctl_error ? 0 : (err))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:1492:10: note: '?' condition is true
                   return filter_error(cval, ret);
                          ^
   sound/usb/mixer.c:130:3: note: expanded from macro 'filter_error'
           ((cval)->head.mixer->ignore_ctl_error ? 0 : (err))
            ^
   sound/usb/mixer.c:1492:3: note: Returning without writing to '*val'
                   return filter_error(cval, ret);
                   ^
   sound/usb/mixer.c:1505:8: note: Returning from 'get_connector_value'
           ret =3D get_connector_value(cval, kcontrol->id.name, &val);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:1507:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   sound/usb/mixer.c:1507:2: note: Taking false branch
           if (ret < 0)
           ^
   sound/usb/mixer.c:1510:35: note: Assigned value is garbage or undefined
           ucontrol->value.integer.value[0] =3D val;
                                            ^ ~~~
   sound/usb/mixer.c:2138:3: warning: Value stored to 'len' is never read [=
clang-analyzer-deadcode.DeadStores]
                   len =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch =
+ 1);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/usb/mixer.c:2138:3: note: Value stored to 'len' is never read
                   len =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch =
+ 1);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/usb/mixer.c:2729:3: warning: Value stored to 'len' is never read [=
clang-analyzer-deadcode.DeadStores]
                   len =3D 0;
                   ^     ~
   sound/usb/mixer.c:2729:3: note: Value stored to 'len' is never read
                   len =3D 0;
                   ^     ~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/usb/typec/tps6598x.c:245:9: warning: The left operand of '&' is =
a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           mode =3D TPS_POWER_STATUS_PWROPMODE(pwr_status);
                  ^
   drivers/usb/typec/tps6598x.c:61:45: note: expanded from macro 'TPS_POWER=
_STATUS_PWROPMODE'
   #define TPS_POWER_STATUS_PWROPMODE(p)   (((p) & GENMASK(3, 2)) >> 2)
                                                 ^
   drivers/usb/typec/tps6598x.c:580:6: note: Assuming 'tps' is non-null
           if (!tps)
               ^~~~
   drivers/usb/typec/tps6598x.c:580:2: note: Taking false branch
           if (!tps)
           ^
   drivers/usb/typec/tps6598x.c:583:2: note: Loop condition is false.  Exit=
ing loop
           mutex_init(&tps->lock);
           ^
   include/linux/mutex.h:115:32: note: expanded from macro 'mutex_init'
   #define mutex_init(mutex)                                               \
                                                                           ^
   drivers/usb/typec/tps6598x.c:587:2: note: Taking false branch
           if (IS_ERR(tps->regmap))
           ^
   drivers/usb/typec/tps6598x.c:590:8: note: Calling 'tps6598x_read32'
           ret =3D tps6598x_read32(tps, TPS_REG_VID, &vid);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tps6598x.c:170:9: note: Calling 'tps6598x_block_read'
           return tps6598x_block_read(tps, reg, val, sizeof(u32));
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/typec/tps6598x.c:132:6: note: Taking false branch
           if (WARN_ON(len + 1 > sizeof(data)))
               ^
   include/asm-generic/bug.h:120:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   drivers/usb/typec/tps6598x.c:132:2: note: Taking false branch
           if (WARN_ON(len + 1 > sizeof(data)))
           ^
   drivers/usb/typec/tps6598x.c:135:6: note: Assuming field 'i2c_protocol' =
is 0

vim +1510 sound/usb/mixer.c

69644fca271669 Kai-Heng Feng 2021-03-26  1497  =

69644fca271669 Kai-Heng Feng 2021-03-26  1498  /* get the connectors status=
 and report it as boolean type */
69644fca271669 Kai-Heng Feng 2021-03-26  1499  static int mixer_ctl_connect=
or_get(struct snd_kcontrol *kcontrol,
69644fca271669 Kai-Heng Feng 2021-03-26  1500  				   struct snd_ctl_elem_v=
alue *ucontrol)
69644fca271669 Kai-Heng Feng 2021-03-26  1501  {
69644fca271669 Kai-Heng Feng 2021-03-26  1502  	struct usb_mixer_elem_info =
*cval =3D kcontrol->private_data;
69644fca271669 Kai-Heng Feng 2021-03-26  1503  	int ret, val;
69644fca271669 Kai-Heng Feng 2021-03-26  1504  =

69644fca271669 Kai-Heng Feng 2021-03-26  1505  	ret =3D get_connector_value=
(cval, kcontrol->id.name, &val);
69644fca271669 Kai-Heng Feng 2021-03-26  1506  =

69644fca271669 Kai-Heng Feng 2021-03-26  1507  	if (ret < 0)
69644fca271669 Kai-Heng Feng 2021-03-26  1508  		return ret;
69644fca271669 Kai-Heng Feng 2021-03-26  1509  =

1d38f5d828b455 Jorge Sanjuan 2018-05-11 @1510  	ucontrol->value.integer.val=
ue[0] =3D val;
1d38f5d828b455 Jorge Sanjuan 2018-05-11  1511  	return 0;
1d38f5d828b455 Jorge Sanjuan 2018-05-11  1512  }
1d38f5d828b455 Jorge Sanjuan 2018-05-11  1513  =


:::::: The code at line 1510 was first introduced by commit
:::::: 1d38f5d828b45546e53095a172c77556642a8a04 ALSA: usb-audio: UAC3 Add s=
upport for connector insertion.

:::::: TO: Jorge Sanjuan <jorge.sanjuan@codethink.co.uk>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8759455416993294801==--

