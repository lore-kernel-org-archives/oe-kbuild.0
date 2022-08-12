Content-Type: multipart/mixed; boundary="===============1697148090206004519=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/hda/patch_hdmi.c:1866:20: warning: Value stored to 'codec' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 13 Aug 2022 05:43:37 +0800
Message-ID: <202208130512.RVBe6Z4w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1697148090206004519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 sound/pci/hda/patch_hdmi.c:1866:20: warning: Value stored to 'codec' durin=
g its initialization is never read [clang-analyzer-deadcode.DeadStores]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4a9350597aff50bbd0f4b80ccf49d2e02d1111f5
commit: b5df2a7dca1cc6c66eee0005c92094855dc2028c ASoC: codecs: Add HD-Audio=
 codec driver
date:   10 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 weeks ago
config: mips-randconfig-c004-20220808 (https://download.01.org/0day-ci/arch=
ive/20220813/202208130512.RVBe6Z4w-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e=
2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db5df2a7dca1cc6c66eee0005c92094855dc2028c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b5df2a7dca1cc6c66eee0005c92094855dc2028c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                           ^~~~~~
   sound/soc/generic/audio-graph-card.c:571:2: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(li, 0, sizeof(*li));
           ^~~~~~
   sound/soc/generic/audio-graph-card.c:571:2: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
           memset(li, 0, sizeof(*li));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   drivers/hwtracing/intel_th/gth.c:157:11: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count =3D snprintf(buf, PAGE_SIZE, "%x\n", port);
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:157:11: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   count =3D snprintf(buf, PAGE_SIZE, "%x\n", port);
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:159:11: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   count =3D snprintf(buf, PAGE_SIZE, "disabled\n");
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:159:11: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
                   count =3D snprintf(buf, PAGE_SIZE, "disabled\n");
                           ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:335:10: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           count =3D snprintf(buf, PAGE_SIZE, "%x\n",
                   ^~~~~~~~
   drivers/hwtracing/intel_th/gth.c:335:10: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           count =3D snprintf(buf, PAGE_SIZE, "%x\n",
                   ^~~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/soc/codecs/tas2764.c:54:23: warning: Value stored to 'tas2764' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   sound/soc/codecs/tas2764.c:54:23: note: Value stored to 'tas2764' during=
 its initialization is never read
           struct tas2764_priv *tas2764 =3D snd_soc_component_get_drvdata(c=
omponent);
                                ^~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   sound/soc/codecs/tas571x.c:860:2: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&priv->component_driver, &tas571x_component, sizeof(priv-=
>component_driver));
           ^~~~~~
   sound/soc/codecs/tas571x.c:860:2: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
           memcpy(&priv->component_driver, &tas571x_component, sizeof(priv-=
>component_driver));
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   sound/pci/hda/patch_hdmi.c:375:3: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ucontrol->value.bytes.data, 0,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:375:3: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
                   memset(ucontrol->value.bytes.data, 0,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:388:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ucontrol->value.bytes.data, 0,
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:388:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(ucontrol->value.bytes.data, 0,
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:391:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:391:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:684:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ai, 0, sizeof(ai));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:684:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&ai, 0, sizeof(ai));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1342:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(per_pin->mux_nids, spec->cvt_nids,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:1342:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(per_pin->mux_nids, spec->cvt_nids,
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:1500:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1500:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1593:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(pin_eld->eld_buffer, eld->eld_buffer,
                           ^~~~~~
   sound/pci/hda/patch_hdmi.c:1593:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(pin_eld->eld_buffer, eld->eld_buffer,
                           ^~~~~~
>> sound/pci/hda/patch_hdmi.c:1866:20: warning: Value stored to 'codec' dur=
ing its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hda_codec *codec =3D per_pin->codec;
                             ^~~~~   ~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:1866:20: note: Value stored to 'codec' during=
 its initialization is never read
           struct hda_codec *codec =3D per_pin->codec;
                             ^~~~~   ~~~~~~~~~~~~~~
>> sound/pci/hda/patch_hdmi.c:2109:26: warning: Value stored to 'runtime' d=
uring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct snd_pcm_runtime *runtime =3D substream->runtime;
                                   ^~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:2109:26: note: Value stored to 'runtime' duri=
ng its initialization is never read
           struct snd_pcm_runtime *runtime =3D substream->runtime;
                                   ^~~~~~~   ~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_hdmi.c:2243:3: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:2243:3: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
                   memset(per_pin->chmap, 0, sizeof(per_pin->chmap));
                   ^~~~~~
   sound/pci/hda/patch_hdmi.c:2286:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(chmap, per_pin->chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2286:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(chmap, per_pin->chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2300:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(per_pin->chmap, chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2300:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(per_pin->chmap, chmap, ARRAY_SIZE(per_pin->chmap));
           ^~~~~~
   sound/pci/hda/patch_hdmi.c:2379:3: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(hdmi_str + strlen(hdmi_str), ",pcm=3D%d", pcmdev=
);
                   ^~~~~~~
   sound/pci/hda/patch_hdmi.c:2379:3: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
                   sprintf(hdmi_str + strlen(hdmi_str), ",pcm=3D%d", pcmdev=
);
                   ^~~~~~~
   sound/pci/hda/patch_hdmi.c:2382:3: warning: Call to function 'strncat' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncat_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   strncat(hdmi_str, " Phantom",
                   ^~~~~~~
   sound/pci/hda/patch_hdmi.c:2382:3: note: Call to function 'strncat' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncat_s' in case of C11
                   strncat(hdmi_str, " Phantom",
                   ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   39 warnings generated.
   sound/soc/codecs/lpass-wsa-macro.c:1172:3: warning: 2nd function call ar=
gument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   snd_soc_component_update_bits(component, tx_reg0,
                   ^                                        ~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1159:6: note: 'tx_reg0' declared with=
out an initial value
           u32 tx_reg0, tx_reg1;
               ^~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1161:6: note: Assuming the condition =
is false
           if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_V=
I])) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   sound/soc/codecs/lpass-wsa-macro.c:1161:2: note: Taking false branch
           if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_V=
I])) {
           ^
   sound/soc/codecs/lpass-wsa-macro.c:1164:13: note: Assuming the condition=
 is false
           } else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACR=
O_AIF_VI])) {
                      ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   sound/soc/codecs/lpass-wsa-macro.c:1164:9: note: Taking false branch
           } else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACR=
O_AIF_VI])) {
                  ^
   sound/soc/codecs/lpass-wsa-macro.c:1169:2: note: Control jumps to 'case =
2:'  at line 1170
           switch (event) {
           ^
   sound/soc/codecs/lpass-wsa-macro.c:1172:3: note: 2nd function call argum=
ent is an uninitialized value
                   snd_soc_component_update_bits(component, tx_reg0,
                   ^                                        ~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1199:3: warning: 2nd function call ar=
gument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   snd_soc_component_update_bits(component, tx_reg0,
                   ^                                        ~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1159:6: note: 'tx_reg0' declared with=
out an initial value
           u32 tx_reg0, tx_reg1;
               ^~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1161:6: note: Assuming the condition =
is false
           if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_V=
I])) {
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   sound/soc/codecs/lpass-wsa-macro.c:1161:2: note: Taking false branch
           if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_V=
I])) {
           ^
   sound/soc/codecs/lpass-wsa-macro.c:1164:13: note: Assuming the condition=
 is false
           } else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACR=
O_AIF_VI])) {
                      ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   sound/soc/codecs/lpass-wsa-macro.c:1164:9: note: Taking false branch
           } else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACR=
O_AIF_VI])) {
                  ^
   sound/soc/codecs/lpass-wsa-macro.c:1169:2: note: Control jumps to 'case =
8:'  at line 1197
           switch (event) {
           ^
   sound/soc/codecs/lpass-wsa-macro.c:1199:3: note: 2nd function call argum=
ent is an uninitialized value
                   snd_soc_component_update_bits(component, tx_reg0,

vim +/codec +1866 sound/pci/hda/patch_hdmi.c

788d441a164cae Takashi Iwai 2015-11-12  1863  =

db8454023b7f9c Takashi Iwai 2020-02-06  1864  static void hdmi_present_sens=
e(struct hdmi_spec_per_pin *per_pin, int repoll)
788d441a164cae Takashi Iwai 2015-11-12  1865  {
788d441a164cae Takashi Iwai 2015-11-12 @1866  	struct hda_codec *codec =3D =
per_pin->codec;
788d441a164cae Takashi Iwai 2015-11-12  1867  =

ae47e2ec5b4504 Takashi Iwai 2020-02-06  1868  	if (!codec_has_acomp(codec))
db8454023b7f9c Takashi Iwai 2020-02-06  1869  		hdmi_present_sense_via_verb=
s(per_pin, repoll);
ae47e2ec5b4504 Takashi Iwai 2020-02-06  1870  	else
788d441a164cae Takashi Iwai 2015-11-12  1871  		sync_eld_via_acomp(codec, p=
er_pin);
788d441a164cae Takashi Iwai 2015-11-12  1872  }
788d441a164cae Takashi Iwai 2015-11-12  1873  =


:::::: The code at line 1866 was first introduced by commit
:::::: 788d441a164caea0a5d82e1d5bcd161820bfe62a ALSA: hda - Use component o=
ps for i915 HDMI/DP audio jack handling

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1697148090206004519==--

