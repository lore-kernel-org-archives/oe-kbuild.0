Content-Type: multipart/mixed; boundary="===============7545222453686581367=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/usb/mixer.c:1510:35: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 02 Jan 2022 23:30:23 +0800
Message-ID: <202201022305.uQyiulrW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7545222453686581367==
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
head:   278218f6778bc7d6f8b67199446c56cec7ebb841
commit: 69644fca2716699cc6896aff51d37b1e886c94d2 ALSA: usb-audio: Carve out=
 connector value checking into a helper
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: riscv-randconfig-c006-20211207 (https://download.01.org/0day-ci/arc=
hive/20220102/202201022305.uQyiulrW-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D69644fca2716699cc6896aff51d37b1e886c94d2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 69644fca2716699cc6896aff51d37b1e886c94d2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:19:2: note: Taking false branch
           if (!(x & 0xffff0000u)) {
           ^
   include/asm-generic/bitops/fls.h:23:6: note: Assuming the condition is f=
alse
           if (!(x & 0xff000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:23:2: note: Taking false branch
           if (!(x & 0xff000000u)) {
           ^
   include/asm-generic/bitops/fls.h:27:6: note: Assuming the condition is f=
alse
           if (!(x & 0xf0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:27:2: note: Taking false branch
           if (!(x & 0xf0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:31:6: note: Assuming the condition is f=
alse
           if (!(x & 0xc0000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:31:2: note: Taking false branch
           if (!(x & 0xc0000000u)) {
           ^
   include/asm-generic/bitops/fls.h:35:6: note: Assuming the condition is f=
alse
           if (!(x & 0x80000000u)) {
               ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/fls.h:35:2: note: Taking false branch
           if (!(x & 0x80000000u)) {
           ^
   include/asm-generic/bitops/fls.h:39:2: note: Returning the value 32 (loa=
ded from 'r')
           return r;
           ^~~~~~~~
   sound/soc/soc-ops.c:535:28: note: Returning from 'fls'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                     ^~~~~~~~
   sound/soc/soc-ops.c:535:25: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'int'
           unsigned int mask =3D (1 << fls(max)) - 1;
                                  ^  ~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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
   7 warnings generated.
   net/ceph/messenger_v2.c:370:9: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           return le32_to_cpu(msg->hdr.data_len);
                  ^
   include/linux/byteorder/generic.h:89:21: note: expanded from macro 'le32=
_to_cpu'
   #define le32_to_cpu __le32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:34:50: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                    ^
   net/ceph/messenger_v2.c:3045:2: note: Taking false branch
           dout("%s con %p state %d have %zu\n", __func__, con, con->state,
           ^
   include/linux/ceph/ceph_debug.h:25:3: note: expanded from macro 'dout'
                   if (0)                                          \
                   ^
   net/ceph/messenger_v2.c:3045:2: note: Loop condition is false.  Exiting =
loop
           dout("%s con %p state %d have %zu\n", __func__, con, con->state,
           ^
   include/linux/ceph/ceph_debug.h:24:26: note: expanded from macro 'dout'
   #  define dout(fmt, ...)        do {                            \
                                   ^
   net/ceph/messenger_v2.c:3049:6: note: Assuming field 'state' is not equa=
l to CEPH_CON_S_PREOPEN
           if (con->state =3D=3D CEPH_CON_S_PREOPEN) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3049:2: note: Taking false branch
           if (con->state =3D=3D CEPH_CON_S_PREOPEN) {
           ^
   net/ceph/messenger_v2.c:3084:6: note: Assuming the condition is true
           if (!iov_iter_count(&con->v2.out_iter)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:3084:2: note: Taking true branch
           if (!iov_iter_count(&con->v2.out_iter)) {
           ^
   net/ceph/messenger_v2.c:3085:9: note: Calling 'populate_out_iter'
                   ret =3D populate_out_iter(con);
                         ^~~~~~~~~~~~~~~~~~~~~~
   net/ceph/messenger_v2.c:2967:2: note: Taking false branch

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
--===============7545222453686581367==--

