Content-Type: multipart/mixed; boundary="===============4558803502353078003=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/usb/mixer.c:2172:16: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 03 May 2022 20:00:22 +0800
Message-ID: <202205031926.VCjGPwlb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4558803502353078003==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Nick Desaulniers <ndesaulniers@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 281d0c962752fb40866dd8d4cade68656f34bd1f fortify: Add Clang support
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220427 (https://download.01.org/0day-ci/arc=
hive/20220503/202205031926.VCjGPwlb-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D281d0c962752fb40866dd8d4cade68656f34bd1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 281d0c962752fb40866dd8d4cade68656f34bd1f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/netlink/genetlink.c:1445:2: note: Loop condition is false. Execution=
 continues on line 1463
           for_each_net_rcu(net) {
           ^
   include/net/net_namespace.h:373:2: note: expanded from macro 'for_each_n=
et_rcu'
           list_for_each_entry_rcu(VAR, &net_namespace_list, list)
           ^
   include/linux/rculist.h:390:2: note: expanded from macro 'list_for_each_=
entry_rcu'
           for (__list_check_rcu(dummy, ## cond, 0),                       \
           ^
   net/netlink/genetlink.c:1463:24: note: Access to field 'genl_sock' resul=
ts in a dereference of a null pointer (loaded from variable 'prev')
           err =3D nlmsg_multicast(prev->genl_sock, skb, portid, group, fla=
gs);
                                 ^~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   sound/sound_core.c:406:9: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                                   strcat(_name, "-");
                                   ^~~~~~
   sound/sound_core.c:406:9: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                                   strcat(_name, "-");
                                   ^~~~~~
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
   15 warnings generated.
   sound/usb/mixer.c:677:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:677:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Selector");
                           ^~~~~~
   sound/usb/mixer.c:680:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:680:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Process Unit");
                           ^~~~~~
   sound/usb/mixer.c:683:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:683:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Ext Unit");
                           ^~~~~~
   sound/usb/mixer.c:686:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:686:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, "Mixer");
                           ^~~~~~
   sound/usb/mixer.c:695:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:695:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "PCM");
                   ^~~~~~
   sound/usb/mixer.c:698:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:698:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Mic");
                   ^~~~~~
   sound/usb/mixer.c:701:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:701:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Headset");
                   ^~~~~~
   sound/usb/mixer.c:704:3: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:704:3: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                   strcpy(name, "Phone");
                   ^~~~~~
   sound/usb/mixer.c:710:4: warning: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(name, names->name);
                           ^~~~~~
   sound/usb/mixer.c:710:4: note: Call to function 'strcpy' is insecure as =
it does not provide bounding of the memory buffer. Replace unbounded copy f=
unctions with analogous functions that support length arguments such as 'st=
rlcpy'. CWE-119
                           strcpy(name, names->name);
                           ^~~~~~
>> sound/usb/mixer.c:2172:16: warning: The left expression of the compound =
assignment is an uninitialized value. The computed value will also be garba=
ge [clang-analyzer-core.uninitialized.Assign]
                           cval->cmask |=3D (1 << i);
                                       ^
   sound/usb/mixer.c:3563:6: note: Assuming 'mixer' is non-null
           if (!mixer)
               ^~~~~~
   sound/usb/mixer.c:3563:2: note: Taking false branch
           if (!mixer)
           ^
   sound/usb/mixer.c:3566:29: note: Assuming the condition is false
           mixer->ignore_ctl_error =3D !!(chip->quirk_flags & QUIRK_FLAG_IG=
NORE_CTL_ERROR);
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
   sound/usb/mixer.c:3569:6: note: Assuming field 'id_elems' is non-null
           if (!mixer->id_elems) {
               ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3569:2: note: Taking false branch
           if (!mixer->id_elems) {
           ^
   sound/usb/mixer.c:3575:2: note: Control jumps to the 'default' case at l=
ine 3577
           switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
           ^
   sound/usb/mixer.c:3579:3: note:  Execution continues on line 3588
                   break;
                   ^
   sound/usb/mixer.c:3588:13: note: Field 'protocol' is not equal to UAC_VE=
RSION_3
           if (mixer->protocol =3D=3D UAC_VERSION_3 &&
                      ^
   sound/usb/mixer.c:3588:39: note: Left side of '&&' is false
           if (mixer->protocol =3D=3D UAC_VERSION_3 &&
                                                ^
   sound/usb/mixer.c:3594:9: note: Calling 'snd_usb_mixer_controls'
                   err =3D snd_usb_mixer_controls(mixer);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3223:2: note: Loop condition is false. Execution conti=
nues on line 3232
           for (map =3D usbmix_ctl_maps; map->id; map++) {
           ^
   sound/usb/mixer.c:3233:9: note: Assuming the condition is true
           while ((p =3D snd_usb_find_csint_desc(mixer->hostif->extra,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3233:2: note: Loop condition is true.  Entering loop b=
ody
           while ((p =3D snd_usb_find_csint_desc(mixer->hostif->extra,
           ^
   sound/usb/mixer.c:3236:7: note: Assuming the condition is false
                   if (!snd_usb_validate_audio_desc(p, mixer->protocol))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:3236:3: note: Taking false branch
                   if (!snd_usb_validate_audio_desc(p, mixer->protocol))
                   ^
   sound/usb/mixer.c:3239:14: note: Field 'protocol' is equal to UAC_VERSIO=
N_1
                   if (mixer->protocol =3D=3D UAC_VERSION_1) {
                              ^
   sound/usb/mixer.c:3239:3: note: Taking true branch
                   if (mixer->protocol =3D=3D UAC_VERSION_1) {
                   ^
   sound/usb/mixer.c:3247:10: note: Calling 'parse_audio_unit'
                           err =3D parse_audio_unit(&state, desc->bSourceID=
);
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2867:6: note: Assuming the condition is false
           if (test_and_set_bit(unitid, state->unitbitmap))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2867:2: note: Taking false branch
           if (test_and_set_bit(unitid, state->unitbitmap))
           ^
   sound/usb/mixer.c:2871:7: note: 'p1' is non-null
           if (!p1) {
                ^~
   sound/usb/mixer.c:2871:2: note: Taking false branch
           if (!p1) {
           ^
   sound/usb/mixer.c:2876:6: note: Assuming the condition is false
           if (!snd_usb_validate_audio_desc(p1, protocol)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2876:2: note: Taking false branch
           if (!snd_usb_validate_audio_desc(p1, protocol)) {
           ^
   sound/usb/mixer.c:2881:2: note: Control jumps to 'case 4:'  at line 2886
           switch (PTYPE(protocol, p1[2])) {
           ^
   sound/usb/mixer.c:2889:10: note: Calling 'parse_audio_mixer_unit'
                   return parse_audio_mixer_unit(state, unitid, p1);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2243:6: note: Assuming 'err' is >=3D 0
           if (err < 0) {
               ^~~~~~~
   sound/usb/mixer.c:2243:2: note: Taking false branch
           if (err < 0) {
           ^
   sound/usb/mixer.c:2255:16: note: Assuming 'pin' is < 'input_pins'
           for (pin =3D 0; pin < input_pins; pin++) {
                         ^~~~~~~~~~~~~~~~
   sound/usb/mixer.c:2255:2: note: Loop condition is true.  Entering loop b=
ody
           for (pin =3D 0; pin < input_pins; pin++) {
           ^
   sound/usb/mixer.c:2257:7: note: Assuming 'err' is >=3D 0
                   if (err < 0)
                       ^~~~~~~
   sound/usb/mixer.c:2257:3: note: Taking false branch
                   if (err < 0)
                   ^
   sound/usb/mixer.c:2260:7: note: Assuming 'num_outs' is not equal to 0
                   if (!num_outs)

vim +2172 sound/usb/mixer.c

f9f0e9ed350e15 sound/usb/mixer.c    Takashi Iwai    2019-08-20  2140  =

^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2141  /*
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2142   * bu=
ild a mixer unit control
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2143   *
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2144   * th=
e callbacks are identical with feature unit.
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2145   * in=
put channel number (zero based) is given in control field instead.
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2146   */
99fc86450c4390 sound/usb/mixer.c    Daniel Mack     2010-03-11  2147  stati=
c void build_mixer_unit_ctl(struct mixer_build *state,
99fc86450c4390 sound/usb/mixer.c    Daniel Mack     2010-03-11  2148  				 =
struct uac_mixer_unit_descriptor *desc,
6cfd839ae78ec3 sound/usb/mixer.c    Jorge Sanjuan   2018-05-11  2149  				 =
int in_pin, int in_ch, int num_outs,
6cfd839ae78ec3 sound/usb/mixer.c    Jorge Sanjuan   2018-05-11  2150  				 =
int unitid, struct usb_audio_term *iterm)
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2151  {
86e07d34658bb8 sound/usb/usbmixer.c Takashi Iwai    2005-11-17  2152  	stru=
ct usb_mixer_elem_info *cval;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2153  	unsi=
gned int i, len;
86e07d34658bb8 sound/usb/usbmixer.c Takashi Iwai    2005-11-17  2154  	stru=
ct snd_kcontrol *kctl;
c3a3e040f01457 sound/usb/usbmixer.c Jaroslav Kysela 2010-02-11  2155  	cons=
t struct usbmix_name_map *map;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2156  =

17156f23e93c0f sound/usb/mixer.c    Ruslan Bilovol  2018-05-04  2157  	map =
=3D find_map(state->map, unitid, 0);
c3a3e040f01457 sound/usb/usbmixer.c Jaroslav Kysela 2010-02-11  2158  	if (=
check_ignored_ctl(map))
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2159  		ret=
urn;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2160  =

561b220a4dece1 sound/usb/usbmixer.c Takashi Iwai    2005-09-09  2161  	cval=
 =3D kzalloc(sizeof(*cval), GFP_KERNEL);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2162  	if (=
!cval)
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2163  		ret=
urn;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2164  =

3360b84b8ed1f0 sound/usb/mixer.c    Takashi Iwai    2014-11-18  2165  	snd_=
usb_mixer_elem_init_std(&cval->head, state->mixer, unitid);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2166  	cval=
->control =3D in_ch + 1; /* based on 1 */
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2167  	cval=
->val_type =3D USB_MIXER_S16;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2168  	for =
(i =3D 0; i < num_outs; i++) {
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2169  		__u=
8 *c =3D uac_mixer_unit_bmControls(desc, state->mixer->protocol);
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2170  =

6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2171  		if =
(check_matrix_bitmap(c, in_ch, i, num_outs)) {
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16 @2172  			cv=
al->cmask |=3D (1 << i);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2173  			cv=
al->channels++;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2174  		}
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2175  	}
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2176  =

^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2177  	/* g=
et min/max values */
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2178  	get_=
min_max(cval, 0);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2179  =

^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2180  	kctl=
 =3D snd_ctl_new1(&usb_feature_unit_ctl, cval);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2181  	if (=
!kctl) {
0ba41d917eeb87 sound/usb/mixer.c    Takashi Iwai    2014-02-26  2182  		usb=
_audio_err(state->chip, "cannot malloc kcontrol\n");
52c3e317a85709 sound/usb/mixer.c    Takashi Iwai    2019-08-22  2183  		usb=
_mixer_elem_info_free(cval);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2184  		ret=
urn;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2185  	}
eef90451605d79 sound/usb/mixer.c    Chris J Arges   2014-11-12  2186  	kctl=
->private_free =3D snd_usb_mixer_elem_free;
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2187  =

c3a3e040f01457 sound/usb/usbmixer.c Jaroslav Kysela 2010-02-11  2188  	len =
=3D check_mapped_name(map, kctl->id.name, sizeof(kctl->id.name));
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2189  	if (=
!len)
eccfc1b868a990 sound/usb/mixer.c    Ruslan Bilovol  2018-05-04  2190  		len=
 =3D get_term_name(state->chip, iterm, kctl->id.name,
6bc170e4e8ac43 sound/usb/mixer.c    Daniel Mack     2014-05-24  2191  				 =
   sizeof(kctl->id.name), 0);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2192  	if (=
!len)
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2193  		len=
 =3D sprintf(kctl->id.name, "Mixer Source %d", in_ch + 1);
08d1e635089f41 sound/usb/usbmixer.c Takashi Iwai    2009-10-02  2194  	appe=
nd_ctl_name(kctl, " Volume");
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2195  =

0ba41d917eeb87 sound/usb/mixer.c    Takashi Iwai    2014-02-26  2196  	usb_=
audio_dbg(state->chip, "[%d] MU [%s] ch =3D %d, val =3D %d/%d\n",
3360b84b8ed1f0 sound/usb/mixer.c    Takashi Iwai    2014-11-18  2197  		   =
 cval->head.id, kctl->id.name, cval->channels, cval->min, cval->max);
3360b84b8ed1f0 sound/usb/mixer.c    Takashi Iwai    2014-11-18  2198  	snd_=
usb_mixer_add_control(&cval->head, kctl);
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2199  }
^1da177e4c3f41 sound/usb/usbmixer.c Linus Torvalds  2005-04-16  2200  =


:::::: The code at line 2172 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4558803502353078003==--

