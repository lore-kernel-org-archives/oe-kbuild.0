Content-Type: multipart/mixed; boundary="===============0841403817313531045=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119 [...
Date: Mon, 20 Jun 2022 13:17:42 +0800
Message-ID: <202206201317.F4APgcLD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0841403817313531045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: sound/dri=
vers/serial-generic.c:303:2: warning: Call to function 'strcpy' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Kaehn <kaehndan@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 542350509499fed057a2a56921a383888a6f4fd3 ALSA: Add generic serial M=
IDI driver using serial bus API
date:   6 weeks ago
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
config: arm-randconfig-c002-20220619 (https://download.01.org/0day-ci/archi=
ve/20220620/202206201317.F4APgcLD-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 916887=
16ba49942051dccdf7b9c4f81a7ec8feaf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D542350509499fed057a2a56921a383888a6f4fd3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 542350509499fed057a2a56921a383888a6f4fd3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   drivers/base/regmap/regcache-rbtree.c:293:3: note: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11
                   memset(present + BITS_TO_LONGS(rbnode->blklen), 0,
                   ^~~~~~
   drivers/base/regmap/regcache-rbtree.c:302:3: warning: Call to function '=
memmove' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memmove_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memmove(blk + offset * map->cache_word_size,
                   ^~~~~~~
   drivers/base/regmap/regcache-rbtree.c:302:3: note: Call to function 'mem=
move' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memmove_s' in case of C11
                   memmove(blk + offset * map->cache_word_size,
                   ^~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   29 warnings generated.
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/base/regmap/regmap-debugfs.c:31:9: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(NULL, 0, "%x", max_val);
                  ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:31:9: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(NULL, 0, "%x", max_val);
                  ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:50:8: warning: Call to function 'sn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'snprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", name);
                 ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:50:8: note: Call to function 'snpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'snprintf_s' in case of C11
           ret =3D snprintf(buf, PAGE_SIZE, "%s\n", name);
                 ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:251:4: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           snprintf(buf + buf_pos, count - buf_pos, "%.*x: =
",
                           ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:251:4: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                           snprintf(buf + buf_pos, count - buf_pos, "%.*x: =
",
                           ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:258:5: warning: Call to function 's=
nprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'snprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   snprintf(buf + buf_pos, count - buf_pos,
                                   ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:258:5: note: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11
                                   snprintf(buf + buf_pos, count - buf_pos,
                                   ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:261:5: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(buf + buf_pos, 'X',
                                   ^~~~~~
   drivers/base/regmap/regmap-debugfs.c:261:5: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
                                   memset(buf + buf_pos, 'X',
                                   ^~~~~~
   drivers/base/regmap/regmap-debugfs.c:402:15: warning: Call to function '=
snprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'snprintf_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   entry_len =3D snprintf(entry, PAGE_SIZE, "%x-%x\n",
                               ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:402:15: note: Call to function 'snp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'snprintf_s' in case of C11
                   entry_len =3D snprintf(entry, PAGE_SIZE, "%x-%x\n",
                               ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:407:4: warning: Call to function 'm=
emcpy' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memcpy_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(buf + buf_pos, entry, entry_len);
                           ^~~~~~
   drivers/base/regmap/regmap-debugfs.c:407:4: note: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(buf + buf_pos, entry, entry_len);
                           ^~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/base/regmap/regmap-debugfs.c:657:6: note: Assuming field 'debugf=
s' is non-null
           if (map->debugfs) {
               ^~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:657:2: note: Taking true branch
           if (map->debugfs) {
           ^
   drivers/base/regmap/regmap-debugfs.c:660:3: note: Calling 'regmap_debugf=
s_free_dump_cache'
                   regmap_debugfs_free_dump_cache(map);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:71:2: note: Loop condition is true.=
  Entering loop body
           while (!list_empty(&map->debugfs_off_cache)) {
           ^
   drivers/base/regmap/regmap-debugfs.c:76:3: note: Memory is released
                   kfree(c);
                   ^~~~~~~~
   drivers/base/regmap/regmap-debugfs.c:71:2: note: Loop condition is true.=
  Entering loop body
           while (!list_empty(&map->debugfs_off_cache)) {
           ^
   drivers/base/regmap/regmap-debugfs.c:75:3: note: Calling 'list_del'
                   list_del(&c->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:148:2: note: Calling '__list_del_entry'
           __list_del_entry(entry);
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:134:2: note: Taking false branch
           if (!__list_del_entry_valid(entry))
           ^
   include/linux/list.h:137:13: note: Use of memory after it is freed
           __list_del(entry->prev, entry->next);
                      ^~~~~~~~~~~
   Suppressed 29 warnings (29 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   sound/drivers/serial-generic.c:283:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, s=
ubstream->number);
                   ^~~~~~~
   sound/drivers/serial-generic.c:283:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(substream->name, "Serial MIDI %d-%d", dev_num, s=
ubstream->number);
                   ^~~~~~~
>> sound/drivers/serial-generic.c:303:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:303:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(rrawmidi->name, drvdata->card->shortname);
           ^~~~~~
   sound/drivers/serial-generic.c:333:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:333:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->shortname, "SerialMIDI-%d", serdev->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev=
->ctrl->nr);
           ^~~~~~~
   sound/drivers/serial-generic.c:334:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(card->longname, "Serial MIDI device at serial%d", serdev=
->ctrl->nr);
           ^~~~~~~
   Suppressed 21 warnings (21 in non-user code).
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
   44 warnings generated.
   drivers/platform/mellanox/mlxreg-hotplug.c:87:2: warning: Call to functi=
on 'snprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'snprintf_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=3D%d", label=
, !!action);
           ^~~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c:87:2: note: Call to function =
'snprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(event_str, MLXREG_CORE_LABEL_MAX_SIZE, "%s=3D%d", label=
, !!action);
           ^~~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c:236:9: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'sprintf_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", regval);
                  ^~~~~~~
   drivers/platform/mellanox/mlxreg-hotplug.c:236:9: note: Call to function=
 'sprintf' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", regval);
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/iio/proximity/sx9310.c:451:17: warning: The left operand of '>>'=
 is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           *val =3D pthresh >> (5 - regval);
                          ^
   drivers/iio/proximity/sx9310.c:500:6: note: Assuming field 'type' is equ=
al to IIO_PROXIMITY
           if (chan->type !=3D IIO_PROXIMITY)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:500:2: note: Taking false branch
           if (chan->type !=3D IIO_PROXIMITY)
           ^
   drivers/iio/proximity/sx9310.c:503:2: note: Control jumps to 'case IIO_E=
V_INFO_HYSTERESIS:'  at line 515
           switch (info) {
           ^
   drivers/iio/proximity/sx9310.c:516:10: note: Calling 'sx9310_read_hyster=
esis'
                   return sx9310_read_hysteresis(data, chan, val);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:435:23: note: 'pthresh' declared without =
an initial value
           unsigned int regval, pthresh;
                                ^~~~~~~
   drivers/iio/proximity/sx9310.c:438:8: note: Calling 'sx9310_read_thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:417:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/iio/proximity/sx9310.c:417:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:421:6: note: Assuming 'ret' is not equal =
to 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9310.c:421:2: note: Taking true branch
           if (ret)
           ^
   drivers/iio/proximity/sx9310.c:438:8: note: Returning from 'sx9310_read_=
thresh'
           ret =3D sx9310_read_thresh(data, chan, &pthresh);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/proximity/sx9310.c:439:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/iio/proximity/sx9310.c:439:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/iio/proximity/sx9310.c:443:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/iio/proximity/sx9310.c:443:2: note: Taking false branch
           if (ret)
           ^
   drivers/iio/proximity/sx9310.c:446:11: note: Taking false branch
           regval =3D FIELD_GET(SX9310_REG_PROX_CTRL10_HYST_MASK, regval);
                    ^
   include/linux/bitfield.h:128:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHE=
CK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)

vim +303 sound/drivers/serial-generic.c

542350509499fe Daniel Kaehn 2022-05-09  286  =

542350509499fe Daniel Kaehn 2022-05-09  287  static int snd_serial_generic_=
rmidi(struct snd_serial_generic *drvdata,
542350509499fe Daniel Kaehn 2022-05-09  288  				int outs, int ins, struct =
snd_rawmidi **rmidi)
542350509499fe Daniel Kaehn 2022-05-09  289  {
542350509499fe Daniel Kaehn 2022-05-09  290  	struct snd_rawmidi *rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  291  	int err;
542350509499fe Daniel Kaehn 2022-05-09  292  =

542350509499fe Daniel Kaehn 2022-05-09  293  	err =3D snd_rawmidi_new(drvda=
ta->card, drvdata->card->driver, 0,
542350509499fe Daniel Kaehn 2022-05-09  294  				outs, ins, &rrawmidi);
542350509499fe Daniel Kaehn 2022-05-09  295  =

542350509499fe Daniel Kaehn 2022-05-09  296  	if (err < 0)
542350509499fe Daniel Kaehn 2022-05-09  297  		return err;
542350509499fe Daniel Kaehn 2022-05-09  298  =

542350509499fe Daniel Kaehn 2022-05-09  299  	snd_rawmidi_set_ops(rrawmidi,=
 SNDRV_RAWMIDI_STREAM_INPUT,
542350509499fe Daniel Kaehn 2022-05-09  300  				&snd_serial_generic_input);
542350509499fe Daniel Kaehn 2022-05-09  301  	snd_rawmidi_set_ops(rrawmidi,=
 SNDRV_RAWMIDI_STREAM_OUTPUT,
542350509499fe Daniel Kaehn 2022-05-09  302  				&snd_serial_generic_output=
);
542350509499fe Daniel Kaehn 2022-05-09 @303  	strcpy(rrawmidi->name, drvdat=
a->card->shortname);
542350509499fe Daniel Kaehn 2022-05-09  304  =

542350509499fe Daniel Kaehn 2022-05-09  305  	snd_serial_generic_substreams=
(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT],
542350509499fe Daniel Kaehn 2022-05-09  306  					drvdata->serdev->ctrl->nr=
);
542350509499fe Daniel Kaehn 2022-05-09  307  	snd_serial_generic_substreams=
(&rrawmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT],
542350509499fe Daniel Kaehn 2022-05-09  308  					drvdata->serdev->ctrl->nr=
);
542350509499fe Daniel Kaehn 2022-05-09  309  =

542350509499fe Daniel Kaehn 2022-05-09  310  	rrawmidi->info_flags =3D SNDR=
V_RAWMIDI_INFO_OUTPUT |
542350509499fe Daniel Kaehn 2022-05-09  311  			       SNDRV_RAWMIDI_INFO_I=
NPUT |
542350509499fe Daniel Kaehn 2022-05-09  312  			       SNDRV_RAWMIDI_INFO_D=
UPLEX;
542350509499fe Daniel Kaehn 2022-05-09  313  =

542350509499fe Daniel Kaehn 2022-05-09  314  	if (rmidi)
542350509499fe Daniel Kaehn 2022-05-09  315  		*rmidi =3D rrawmidi;
542350509499fe Daniel Kaehn 2022-05-09  316  	return 0;
542350509499fe Daniel Kaehn 2022-05-09  317  }
542350509499fe Daniel Kaehn 2022-05-09  318  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0841403817313531045==--

