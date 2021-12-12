Content-Type: multipart/mixed; boundary="===============8516612799742643760=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to 'unit' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 08:38:18 +0800
Message-ID: <202112120830.J7iC8Lm7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8516612799742643760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mario Limonciello <mario.limonciello@dell.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   eccea80be2576dee642bc6cab20f1a242d58a08c
commit: f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28 platform/x86: Move all del=
l drivers to their own subdirectory
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211212/202112120830.J7iC8Lm7-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f1e1ea516721d1ea0b21327ff9e6cb2c2bb86e28
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/media/dvb-frontends/lgdt3306a.c:964:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x103c, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:964:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x103c, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:967:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x103d, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:967:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x103d, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:970:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x103d, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:970:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x103d, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:973:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x1036, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:973:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x1036, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:976:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x1036, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:976:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x1036, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:979:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x211f, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:979:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x211f, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:981:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x211f, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:981:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x211f, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:984:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_read_reg(state, 0x2849, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:984:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_read_reg(state, 0x2849, &val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:986:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_write_reg(state, 0x2849, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:986:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_write_reg(state, 0x2849, val);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:989:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_set_vsb(state);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:989:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_set_vsb(state);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:992:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:992:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_mpeg_mode(state, state->cfg->mpeg_mode);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:995:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D lgdt3306a_mpeg_tristate(state, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:995:2: note: Value stored to 're=
t' is never read
           ret =3D lgdt3306a_mpeg_tristate(state, 1);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:1029:3: warning: Value stored to=
 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D fe->ops.tuner_ops.set_params(fe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:1029:3: note: Value stored to 'r=
et' is never read
                   ret =3D fe->ops.tuner_ops.set_params(fe);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:1219:2: warning: Value stored to=
 'modeOper' is never read [clang-analyzer-deadcode.DeadStores]
           modeOper =3D LG3306_UNKNOWN_MODE;
           ^          ~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/lgdt3306a.c:1219:2: note: Value stored to 'm=
odeOper' is never read
           modeOper =3D LG3306_UNKNOWN_MODE;
           ^          ~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/staging/comedi/drivers/das08.c:181:2: warning: Value stored to '=
range' is never read [clang-analyzer-deadcode.DeadStores]
           range =3D CR_RANGE(insn->chanspec);
           ^
   drivers/staging/comedi/drivers/das08.c:181:2: note: Value stored to 'ran=
ge' is never read
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
>> drivers/platform/x86/dell/dell-laptop.c:1596:4: warning: Value stored to=
 'unit' is never read [clang-analyzer-deadcode.DeadStores]
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/dell/dell-laptop.c:1596:4: note: Value stored to 'u=
nit' is never read
                           unit =3D KBD_TIMEOUT_SECONDS;
                           ^      ~~~~~~~~~~~~~~~~~~~
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
   Suppressed 7 warnings (7 in non-user code).
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
   8 warnings generated.
   drivers/misc/habanalabs/common/mmu_v1.c:389:2: warning: Value stored to =
'hop2_pte_addr' is never read [clang-analyzer-deadcode.DeadStores]
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
   drivers/misc/habanalabs/common/mmu_v1.c:389:2: note: Value stored to 'ho=
p2_pte_addr' is never read
           hop2_pte_addr =3D hop2_addr;
           ^               ~~~~~~~~~
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
--
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/skbuff.h:2071:2: note: Loop condition is false.  Exiting l=
oop
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:60:2: note: expanded from macro 'WRITE_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/skbuff.h:2071:2: note: Dereference of null pointer
           WRITE_ONCE(next->prev, prev);
           ^
   include/asm-generic/rwonce.h:61:2: note: expanded from macro 'WRITE_ONCE'
           __WRITE_ONCE(x, val);                                           \
           ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:30: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   net/ipv4/ip_output.c:690:15: warning: Value stored to 'len' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           unsigned int len =3D state->left;
                        ^~~   ~~~~~~~~~~~
   net/ipv4/ip_output.c:690:15: note: Value stored to 'len' during its init=
ialization is never read
           unsigned int len =3D state->left;
                        ^~~   ~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
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
>> drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:158:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:160:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].dell_value=
_modifier, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:166:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues,
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: warni=
ng: Call to function 'strcat' is insecure as it does not provide bounding o=
f the memory buffer. Replace unbounded copy functions with analogous functi=
ons that support length arguments such as 'strlcat'. CWE-119 [clang-analyze=
r-security.insecureAPI.strcpy]
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   drivers/platform/x86/dell/dell-wmi-sysman/enum-attributes.c:168:3: note:=
 Call to function 'strcat' is insecure as it does not provide bounding of t=
he memory buffer. Replace unbounded copy functions with analogous functions=
 that support length arguments such as 'strlcat'. CWE-119
                   strcat(wmi_priv.enumeration_data[instance_id].possible_v=
alues, ";");
                   ^~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   8 warnings generated.
   drivers/iio/chemical/bme680_core.c:741:2: warning: Value stored to 'ret'=
 is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/bme680_core.c:741:2: note: Value stored to 'ret' is=
 never read
           ret =3D regmap_read(data->regmap, BME680_REG_MEAS_STAT_0, &check=
);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
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
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/iio/chemical/scd30_i2c.c:104:10: warning: Dereference of null po=
inter [clang-analyzer-core.NullDereference]
                   *rsp++ =3D buf[i];
                   ~~~~~~~^~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:70:2: note: 'rsp' initialized here
           char *rsp =3D response;
           ^~~~~~~~~
   drivers/iio/chemical/scd30_i2c.c:77:6: note: Assuming 'rsp' is null
           if (rsp) {
               ^~~
   drivers/iio/chemical/scd30_i2c.c:77:2: note: Taking false branch
           if (rsp) {
           ^
   drivers/iio/chemical/scd30_i2c.c:88:8: note: Assuming 'cmd' is equal to =
CMD_STOP_MEAS
                   if ((cmd =3D=3D CMD_STOP_MEAS) || (cmd =3D=3D CMD_RESET))

vim +/unit +1596 drivers/platform/x86/dell/dell-laptop.c

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1532  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1533  static ssize_t kbd_led_timeout_store(struct device *dev,
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1534  				     struct device_attribute *attr,
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1535  				     const char *buf, size_t count)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1536  {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1537  	struct kbd_state new_state;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1538  	struct kbd_state state;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1539  	bool convert;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1540  	int value;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1541  	int ret;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1542  	char ch;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1543  	u8 unit;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1544  	int i;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1545  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1546  	ret =3D sscanf(buf, "%d %c", &value, &ch);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1547  	if (ret < 1)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1548  		return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1549  	else if (ret =3D=3D 1)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1550  		ch =3D 's';
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1551  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1552  	if (value < 0)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1553  		return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1554  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1555  	convert =3D false;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1556  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1557  	switch (ch) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1558  	case 's':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1559  		if (value > kbd_info.seconds)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1560  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1561  		unit =3D KBD_TIMEOUT_SECONDS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1562  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1563  	case 'm':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1564  		if (value > kbd_info.minutes)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1565  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1566  		unit =3D KBD_TIMEOUT_MINUTES;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1567  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1568  	case 'h':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1569  		if (value > kbd_info.hours)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1570  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1571  		unit =3D KBD_TIMEOUT_HOURS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1572  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1573  	case 'd':
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1574  		if (value > kbd_info.days)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1575  			convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1576  		unit =3D KBD_TIMEOUT_DAYS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1577  		break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1578  	default:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1579  		return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1580  	}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1581  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1582  	if (quirks && quirks->needs_kbd_timeouts)
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1583  		convert =3D true;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1584  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1585  	if (convert) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1586  		/* Convert value from current units to seconds */
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1587  		switch (unit) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1588  		case KBD_TIMEOUT_DAYS:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1589  			value *=3D 24;
df561f6688fef7 drivers/platform/x86/dell-laptop.c Gustavo A. R. Silva 2020-=
08-23  1590  			fallthrough;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1591  		case KBD_TIMEOUT_HOURS:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1592  			value *=3D 60;
df561f6688fef7 drivers/platform/x86/dell-laptop.c Gustavo A. R. Silva 2020-=
08-23  1593  			fallthrough;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1594  		case KBD_TIMEOUT_MINUTES:
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1595  			value *=3D 60;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19 @1596  			unit =3D KBD_TIMEOUT_SECONDS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1597  		}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1598  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1599  		if (quirks && quirks->needs_kbd_timeouts) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1600  			for (i =3D 0; quirks->kbd_timeouts[i] !=3D -1; i++) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1601  				if (value <=3D quirks->kbd_timeouts[i]) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1602  					value =3D quirks->kbd_timeouts[i];
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1603  					break;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1604  				}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1605  			}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1606  		}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1607  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1608  		if (value <=3D kbd_info.seconds && kbd_info.seconds) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1609  			unit =3D KBD_TIMEOUT_SECONDS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1610  		} else if (value / 60 <=3D kbd_info.minutes && kbd_info.minu=
tes) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1611  			value /=3D 60;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1612  			unit =3D KBD_TIMEOUT_MINUTES;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1613  		} else if (value / (60 * 60) <=3D kbd_info.hours && kbd_info=
.hours) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1614  			value /=3D (60 * 60);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1615  			unit =3D KBD_TIMEOUT_HOURS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1616  		} else if (value / (60 * 60 * 24) <=3D kbd_info.days && kbd_=
info.days) {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1617  			value /=3D (60 * 60 * 24);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1618  			unit =3D KBD_TIMEOUT_DAYS;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1619  		} else {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1620  			return -EINVAL;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1621  		}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1622  	}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1623  =

e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1624  	mutex_lock(&kbd_led_mutex);
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1625  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1626  	ret =3D kbd_get_state(&state);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1627  	if (ret)
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1628  		goto out;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1629  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1630  	new_state =3D state;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1631  =

9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1632  	if (kbd_timeout_ac_supported && power_supply_is_system_s=
upplied() > 0) {
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1633  		new_state.timeout_value_ac =3D value;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1634  		new_state.timeout_unit_ac =3D unit;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1635  	} else {
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1636  		new_state.timeout_value =3D value;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1637  		new_state.timeout_unit =3D unit;
9216e0dcb5533a drivers/platform/x86/dell-laptop.c Pali Roh=C3=A1r          =
2017-04-23  1638  	}
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1639  =

6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1640  	ret =3D kbd_set_state_safe(&new_state, &state);
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1641  	if (ret)
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1642  		goto out;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1643  =

e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1644  	ret =3D count;
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1645  out:
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1646  	mutex_unlock(&kbd_led_mutex);
e5bf5df7858e23 drivers/platform/x86/dell-laptop.c Hans de Goede       2017-=
03-16  1647  	return ret;
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1648  }
6cff8d60aa0aba drivers/platform/x86/dell-laptop.c Gabriele Mazzotta   2015-=
02-19  1649  =


:::::: The code at line 1596 was first introduced by commit
:::::: 6cff8d60aa0aba5583ecda09984dbcb2f24cc28d platform: x86: dell-laptop:=
 Add support for keyboard backlight

:::::: TO: Gabriele Mazzotta <gabriele.mzt@gmail.com>
:::::: CC: Darren Hart <dvhart@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8516612799742643760==--

