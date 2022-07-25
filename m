Content-Type: multipart/mixed; boundary="===============1771185085693423975=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/pci/hda/patch_ca0132.c:2413:7: warning: Dereference of null pointer (loaded from variable 'reply_len') [clang-analyzer-core.NullDereference]
Date: Mon, 25 Jul 2022 16:58:23 +0000
Message-ID: <202207242020.1Q8T6JGJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1771185085693423975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 sound/pci/hda/patch_ca0132.c:2413:7: warning: Dereference of null pointer =
(loaded from variable 'reply_len') [clang-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Amadeusz S=C5=82awi=C5=84ski" <amadeuszx.slawinski@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   515f71412bb73ebd7f41f90e1684fc80b8730789
commit: 1affc44ea5dd554c103e0ce1e809f3aa5d942349 ASoC: Intel: avs: PCI driv=
er implementation
date:   10 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-c001-20220718 (https://download.01.org/0day-ci/arch=
ive/20220724/202207242020.1Q8T6JGJ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c76=
39e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1affc44ea5dd554c103e0ce1e809f3aa5d942349
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1affc44ea5dd554c103e0ce1e809f3aa5d942349
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/codecs/lpass-wsa-macro.c:1681:9: note: Taking false branch
           } else if (!strcmp(w->name, "WSA_RX INT1 CHAIN")) {
                  ^
   sound/soc/codecs/lpass-wsa-macro.c:1688:2: note: Control jumps to 'case =
8:'  at line 1703
           switch (event) {
           ^
   sound/soc/codecs/lpass-wsa-macro.c:1704:3: note: 2nd function call argum=
ent is an uninitialized value
                   snd_soc_component_update_bits(component, boost_path_ctl,
                   ^                                        ~~~~~~~~~~~~~~
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   112 warnings generated.
   Suppressed 112 warnings (112 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   67 warnings generated.
   sound/pci/hda/patch_ca0132.c:2320:3: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(return_buf, 0, return_buf_size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2320:3: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
                   memset(return_buf, 0, return_buf_size);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2324:3: warning: Value stored to 'waiting_f=
or_resp' is never read [clang-analyzer-deadcode.DeadStores]
                   waiting_for_resp =3D false;
                   ^                  ~~~~~
   sound/pci/hda/patch_ca0132.c:2324:3: note: Value stored to 'waiting_for_=
resp' is never read
                   waiting_for_resp =3D false;
                   ^                  ~~~~~
   sound/pci/hda/patch_ca0132.c:2327:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&ret_msg->hdr, &spec->scp_resp_header, 4);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2327:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&ret_msg->hdr, &spec->scp_resp_header, 4);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2328:4: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&ret_msg->data, spec->scp_resp_data,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2328:4: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&ret_msg->data, spec->scp_resp_data,
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2365:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&scp_send, 0, sizeof(scp_send));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2365:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&scp_send, 0, sizeof(scp_send));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2366:2: warning: Call to function 'memset' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&scp_reply, 0, sizeof(scp_reply));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2366:2: note: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11
           memset(&scp_reply, 0, sizeof(scp_reply));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2385:3: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(scp_send.data, data, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2385:3: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(scp_send.data, data, len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
>> sound/pci/hda/patch_ca0132.c:2413:7: warning: Dereference of null pointe=
r (loaded from variable 'reply_len') [clang-analyzer-core.NullDereference]
                   if (*reply_len < ret_size*sizeof(unsigned int)) {
                       ^
   sound/pci/hda/patch_ca0132.c:9515:6: note: Assuming field 'dsp_state' is=
 not equal to DSP_DOWNLOADED
           if (spec->dsp_state =3D=3D DSP_DOWNLOADED) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:9515:2: note: Taking false branch
           if (spec->dsp_state =3D=3D DSP_DOWNLOADED) {
           ^
   sound/pci/hda/patch_ca0132.c:9527:6: note: Assuming field 'dsp_state' is=
 equal to DSP_DOWNLOAD_FAILED
           if (spec->dsp_state !=3D DSP_DOWNLOAD_FAILED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:9527:2: note: Taking false branch
           if (spec->dsp_state !=3D DSP_DOWNLOAD_FAILED)
           ^
   sound/pci/hda/patch_ca0132.c:9531:6: note: Assuming field 'use_pci_mmio'=
 is false
           if (ca0132_use_pci_mmio(spec))
               ^
   sound/pci/hda/patch_ca0132.c:1183:35: note: expanded from macro 'ca0132_=
use_pci_mmio'
   #define ca0132_use_pci_mmio(spec)       ((spec)->use_pci_mmio)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:9531:2: note: Taking false branch
           if (ca0132_use_pci_mmio(spec))
           ^
   sound/pci/hda/patch_ca0132.c:9536:6: note: Assuming field 'quirk' is not=
 equal to QUIRK_AE5
           if (ca0132_quirk(spec) =3D=3D QUIRK_AE5 || ca0132_quirk(spec) =
=3D=3D QUIRK_AE7)
               ^
   sound/pci/hda/patch_ca0132.c:1182:29: note: expanded from macro 'ca0132_=
quirk'
   #define ca0132_quirk(spec)              ((spec)->quirk)
                                           ^
   sound/pci/hda/patch_ca0132.c:9536:6: note: Left side of '||' is false
           if (ca0132_quirk(spec) =3D=3D QUIRK_AE5 || ca0132_quirk(spec) =
=3D=3D QUIRK_AE7)
               ^
   sound/pci/hda/patch_ca0132.c:1182:29: note: expanded from macro 'ca0132_=
quirk'
   #define ca0132_quirk(spec)              ((spec)->quirk)
                                           ^
   sound/pci/hda/patch_ca0132.c:9536:41: note: Assuming field 'quirk' is no=
t equal to QUIRK_AE7
           if (ca0132_quirk(spec) =3D=3D QUIRK_AE5 || ca0132_quirk(spec) =
=3D=3D QUIRK_AE7)
                                                  ^
   sound/pci/hda/patch_ca0132.c:1182:29: note: expanded from macro 'ca0132_=
quirk'
   #define ca0132_quirk(spec)              ((spec)->quirk)
                                           ^
   sound/pci/hda/patch_ca0132.c:9536:2: note: Taking false branch
           if (ca0132_quirk(spec) =3D=3D QUIRK_AE5 || ca0132_quirk(spec) =
=3D=3D QUIRK_AE7)
           ^
   sound/pci/hda/patch_ca0132.c:9544:6: note: Assuming field 'use_alt_funct=
ions' is false
           if (ca0132_use_alt_functions(spec))
               ^
   sound/pci/hda/patch_ca0132.c:1184:40: note: expanded from macro 'ca0132_=
use_alt_functions'
   #define ca0132_use_alt_functions(spec)  ((spec)->use_alt_functions)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:9544:2: note: Taking false branch
           if (ca0132_use_alt_functions(spec))
           ^
   sound/pci/hda/patch_ca0132.c:9551:2: note: Control jumps to the 'default=
' case at line 9566
           switch (ca0132_quirk(spec)) {
           ^
   sound/pci/hda/patch_ca0132.c:9567:3: note: Calling 'ca0132_setup_default=
s'
                   ca0132_setup_defaults(codec);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:8211:6: note: Assuming field 'dsp_state' is=
 equal to DSP_DOWNLOADED
           if (spec->dsp_state !=3D DSP_DOWNLOADED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:8211:2: note: Taking false branch
           if (spec->dsp_state !=3D DSP_DOWNLOADED)
           ^
   sound/pci/hda/patch_ca0132.c:8216:2: note: Loop condition is true.  Ente=
ring loop body
           for (idx =3D 0; idx < num_fx; idx++) {
           ^
   sound/pci/hda/patch_ca0132.c:8217:15: note: Assuming 'i' is <=3D field '=
params'
                   for (i =3D 0; i <=3D ca0132_effects[idx].params; i++) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:8217:3: note: Loop condition is true.  Ente=
ring loop body
                   for (i =3D 0; i <=3D ca0132_effects[idx].params; i++) {
                   ^
   sound/pci/hda/patch_ca0132.c:8218:4: note: Calling 'dspio_set_uint_param'
                           dspio_set_uint_param(codec, ca0132_effects[idx].=
mid,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   sound/pci/hda/patch_ca0132.c:2447:9: note: Calling 'dspio_set_param'
           return dspio_set_param(codec, mod_id, 0x20, req, &data,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2441:4: note: Passing null pointer value vi=
a 9th parameter 'reply_len'
                           NULL);
                           ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   sound/pci/hda/patch_ca0132.c:2440:9: note: Calling 'dspio_scp'
           return dspio_scp(codec, mod_id, src_id, req, SCP_SET, data, len,=
 NULL,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   sound/pci/hda/patch_ca0132.c:2368:7: note: 'len' is not equal to 0
           if ((len !=3D 0 && data =3D=3D NULL) || (len > SCP_MAX_DATA_WORD=
S))
                ^~~
   sound/pci/hda/patch_ca0132.c:2368:7: note: Left side of '&&' is true
   sound/pci/hda/patch_ca0132.c:2368:19: note: 'data' is not equal to NULL
           if ((len !=3D 0 && data =3D=3D NULL) || (len > SCP_MAX_DATA_WORD=
S))
                            ^~~~
   sound/pci/hda/patch_ca0132.c:2368:6: note: Left side of '||' is false
           if ((len !=3D 0 && data =3D=3D NULL) || (len > SCP_MAX_DATA_WORD=
S))
               ^
   sound/pci/hda/patch_ca0132.c:2368:37: note: 'len' is <=3D SCP_MAX_DATA_W=
ORDS

vim +/reply_len +2413 sound/pci/hda/patch_ca0132.c

01ef7dbffb411d9d Ian Minett           2012-09-20  2340  =

d5c21b88e8df0701 Ian Minett           2012-09-20  2341  /**
3531ba21f5520d08 Pierre-Louis Bossart 2021-03-01  2342   * dspio_scp - Prep=
are and send the SCP message to DSP
d5c21b88e8df0701 Ian Minett           2012-09-20  2343   * @codec: the HDA =
codec
d5c21b88e8df0701 Ian Minett           2012-09-20  2344   * @mod_id: ID of t=
he DSP module to send the command
4f5c26534d395bf6 Pierre-Louis Bossart 2020-01-13  2345   * @src_id: ID of t=
he source
d5c21b88e8df0701 Ian Minett           2012-09-20  2346   * @req: ID of requ=
est to send to the DSP module
d5c21b88e8df0701 Ian Minett           2012-09-20  2347   * @dir: SET or GET
d5c21b88e8df0701 Ian Minett           2012-09-20  2348   * @data: pointer t=
o the data to send with the request, request specific
d5c21b88e8df0701 Ian Minett           2012-09-20  2349   * @len: length of =
the data, in bytes
d5c21b88e8df0701 Ian Minett           2012-09-20  2350   * @reply: point to=
 the buffer to hold data returned for a reply
d5c21b88e8df0701 Ian Minett           2012-09-20  2351   * @reply_len: leng=
th of the reply buffer returned from GET
d5c21b88e8df0701 Ian Minett           2012-09-20  2352   *
d5c21b88e8df0701 Ian Minett           2012-09-20  2353   * Returns zero or =
a negative error code.
d5c21b88e8df0701 Ian Minett           2012-09-20  2354   */
01ef7dbffb411d9d Ian Minett           2012-09-20  2355  static int dspio_sc=
p(struct hda_codec *codec,
447fd8e9a88e4663 Connor McAdams       2018-05-08  2356  		int mod_id, int s=
rc_id, int req, int dir, const void *data,
447fd8e9a88e4663 Connor McAdams       2018-05-08  2357  		unsigned int len,=
 void *reply, unsigned int *reply_len)
01ef7dbffb411d9d Ian Minett           2012-09-20  2358  {
01ef7dbffb411d9d Ian Minett           2012-09-20  2359  	int status =3D 0;
01ef7dbffb411d9d Ian Minett           2012-09-20  2360  	struct scp_msg scp=
_send, scp_reply;
01ef7dbffb411d9d Ian Minett           2012-09-20  2361  	unsigned int ret_b=
ytes, send_size, ret_size;
01ef7dbffb411d9d Ian Minett           2012-09-20  2362  	unsigned int send_=
get_flag, reply_resp_flag, reply_error_flag;
01ef7dbffb411d9d Ian Minett           2012-09-20  2363  	unsigned int reply=
_data_size;
01ef7dbffb411d9d Ian Minett           2012-09-20  2364  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2365  	memset(&scp_send, =
0, sizeof(scp_send));
01ef7dbffb411d9d Ian Minett           2012-09-20  2366  	memset(&scp_reply,=
 0, sizeof(scp_reply));
01ef7dbffb411d9d Ian Minett           2012-09-20  2367  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2368  	if ((len !=3D 0 &&=
 data =3D=3D NULL) || (len > SCP_MAX_DATA_WORDS))
01ef7dbffb411d9d Ian Minett           2012-09-20  2369  		return -EINVAL;
01ef7dbffb411d9d Ian Minett           2012-09-20  2370  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2371  	if (dir =3D=3D SCP=
_GET && reply =3D=3D NULL) {
4e76a8833fac8dc1 Takashi Iwai         2014-02-25  2372  		codec_dbg(codec, =
"dspio_scp get but has no buffer\n");
01ef7dbffb411d9d Ian Minett           2012-09-20  2373  		return -EINVAL;
01ef7dbffb411d9d Ian Minett           2012-09-20  2374  	}
01ef7dbffb411d9d Ian Minett           2012-09-20  2375  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2376  	if (reply !=3D NUL=
L && (reply_len =3D=3D NULL || (*reply_len =3D=3D 0))) {
4e76a8833fac8dc1 Takashi Iwai         2014-02-25  2377  		codec_dbg(codec, =
"dspio_scp bad resp buf len parms\n");
01ef7dbffb411d9d Ian Minett           2012-09-20  2378  		return -EINVAL;
01ef7dbffb411d9d Ian Minett           2012-09-20  2379  	}
01ef7dbffb411d9d Ian Minett           2012-09-20  2380  =

447fd8e9a88e4663 Connor McAdams       2018-05-08  2381  	scp_send.hdr =3D m=
ake_scp_header(mod_id, src_id, (dir =3D=3D SCP_GET), req,
01ef7dbffb411d9d Ian Minett           2012-09-20  2382  				       0, 0, 0,=
 len/sizeof(unsigned int));
01ef7dbffb411d9d Ian Minett           2012-09-20  2383  	if (data !=3D NULL=
 && len > 0) {
01ef7dbffb411d9d Ian Minett           2012-09-20  2384  		len =3D min((unsi=
gned int)(sizeof(scp_send.data)), len);
01ef7dbffb411d9d Ian Minett           2012-09-20  2385  		memcpy(scp_send.d=
ata, data, len);
01ef7dbffb411d9d Ian Minett           2012-09-20  2386  	}
01ef7dbffb411d9d Ian Minett           2012-09-20  2387  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2388  	ret_bytes =3D 0;
01ef7dbffb411d9d Ian Minett           2012-09-20  2389  	send_size =3D size=
of(unsigned int) + len;
01ef7dbffb411d9d Ian Minett           2012-09-20  2390  	status =3D dspio_s=
end_scp_message(codec, (unsigned char *)&scp_send,
01ef7dbffb411d9d Ian Minett           2012-09-20  2391  					send_size, (un=
signed char *)&scp_reply,
01ef7dbffb411d9d Ian Minett           2012-09-20  2392  					sizeof(scp_rep=
ly), &ret_bytes);
01ef7dbffb411d9d Ian Minett           2012-09-20  2393  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2394  	if (status < 0) {
4e76a8833fac8dc1 Takashi Iwai         2014-02-25  2395  		codec_dbg(codec, =
"dspio_scp: send scp msg failed\n");
01ef7dbffb411d9d Ian Minett           2012-09-20  2396  		return status;
01ef7dbffb411d9d Ian Minett           2012-09-20  2397  	}
01ef7dbffb411d9d Ian Minett           2012-09-20  2398  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2399  	/* extract send an=
d reply headers members */
01ef7dbffb411d9d Ian Minett           2012-09-20  2400  	extract_scp_header=
(scp_send.hdr, NULL, NULL, &send_get_flag,
01ef7dbffb411d9d Ian Minett           2012-09-20  2401  			   NULL, NULL, N=
ULL, NULL, NULL);
01ef7dbffb411d9d Ian Minett           2012-09-20  2402  	extract_scp_header=
(scp_reply.hdr, NULL, NULL, NULL, NULL, NULL,
01ef7dbffb411d9d Ian Minett           2012-09-20  2403  			   &reply_resp_f=
lag, &reply_error_flag,
01ef7dbffb411d9d Ian Minett           2012-09-20  2404  			   &reply_data_s=
ize);
01ef7dbffb411d9d Ian Minett           2012-09-20  2405  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2406  	if (!send_get_flag)
01ef7dbffb411d9d Ian Minett           2012-09-20  2407  		return 0;
01ef7dbffb411d9d Ian Minett           2012-09-20  2408  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2409  	if (reply_resp_fla=
g && !reply_error_flag) {
01ef7dbffb411d9d Ian Minett           2012-09-20  2410  		ret_size =3D (ret=
_bytes - sizeof(scp_reply.hdr))
01ef7dbffb411d9d Ian Minett           2012-09-20  2411  					/ sizeof(unsig=
ned int);
01ef7dbffb411d9d Ian Minett           2012-09-20  2412  =

01ef7dbffb411d9d Ian Minett           2012-09-20 @2413  		if (*reply_len < =
ret_size*sizeof(unsigned int)) {
4e76a8833fac8dc1 Takashi Iwai         2014-02-25  2414  			codec_dbg(codec,=
 "reply too long for buf\n");
01ef7dbffb411d9d Ian Minett           2012-09-20  2415  			return -EINVAL;
01ef7dbffb411d9d Ian Minett           2012-09-20  2416  		} else if (ret_si=
ze !=3D reply_data_size) {
4e76a8833fac8dc1 Takashi Iwai         2014-02-25  2417  			codec_dbg(codec,=
 "RetLen and HdrLen .NE.\n");
01ef7dbffb411d9d Ian Minett           2012-09-20  2418  			return -EINVAL;
46a049dae771b95e Arnd Bergmann        2017-01-11  2419  		} else if (!reply=
) {
46a049dae771b95e Arnd Bergmann        2017-01-11  2420  			codec_dbg(codec,=
 "NULL reply\n");
46a049dae771b95e Arnd Bergmann        2017-01-11  2421  			return -EINVAL;
01ef7dbffb411d9d Ian Minett           2012-09-20  2422  		} else {
01ef7dbffb411d9d Ian Minett           2012-09-20  2423  			*reply_len =3D r=
et_size*sizeof(unsigned int);
01ef7dbffb411d9d Ian Minett           2012-09-20  2424  			memcpy(reply, sc=
p_reply.data, *reply_len);
01ef7dbffb411d9d Ian Minett           2012-09-20  2425  		}
01ef7dbffb411d9d Ian Minett           2012-09-20  2426  	} else {
4e76a8833fac8dc1 Takashi Iwai         2014-02-25  2427  		codec_dbg(codec, =
"reply ill-formed or errflag set\n");
01ef7dbffb411d9d Ian Minett           2012-09-20  2428  		return -EIO;
01ef7dbffb411d9d Ian Minett           2012-09-20  2429  	}
01ef7dbffb411d9d Ian Minett           2012-09-20  2430  =

01ef7dbffb411d9d Ian Minett           2012-09-20  2431  	return status;
01ef7dbffb411d9d Ian Minett           2012-09-20  2432  }
01ef7dbffb411d9d Ian Minett           2012-09-20  2433  =


:::::: The code@line 2413 was first introduced by commit
:::::: 01ef7dbffb411d9d78d1150b268d9c757f9f2f93 ALSA: hda - Update CA0132 c=
odec to load DSP firmware binary

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1771185085693423975==--

