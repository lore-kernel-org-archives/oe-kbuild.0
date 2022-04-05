Content-Type: multipart/mixed; boundary="===============0438921269289020808=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/of/pdt.c:58:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides bound...
Date: Tue, 05 Apr 2022 09:35:23 +0800
Message-ID: <202204050946.WbtDwMqm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0438921269289020808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 weeks ago
:::::: branch date: 28 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001-20220404 (https://download.01.org/0day-ci/arch=
ive/20220405/202204050946.WbtDwMqm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~
   sound/soc/soc-core.c:3140:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%sbitclock-inversion", prefix);
           ^~~~~~~~
   sound/soc/soc-core.c:3143:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%sframe-inversion", prefix);
           ^~~~~~~~
   sound/soc/soc-core.c:3143:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%sframe-inversion", prefix);
           ^~~~~~~~
   sound/soc/soc-core.c:3180:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%sbitclock-master", prefix);
           ^~~~~~~~
   sound/soc/soc-core.c:3180:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%sbitclock-master", prefix);
           ^~~~~~~~
   sound/soc/soc-core.c:3185:2: warning: Call to function 'snprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(prop, sizeof(prop), "%sframe-master", prefix);
           ^~~~~~~~
   sound/soc/soc-core.c:3185:2: note: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11
           snprintf(prop, sizeof(prop), "%sframe-master", prefix);
           ^~~~~~~~
   Suppressed 63 warnings (63 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   drivers/usb/core/message.c:286:3: warning: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(driver_data, data, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:286:3: note: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11
                   memcpy(driver_data, data, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:789:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(buf, 0, size);   /* Make sure we parse really received da=
ta */
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:789:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(buf, 0, size);   /* Make sure we parse really received da=
ta */
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:1034:4: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(smallbuf, buf, len);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:1034:4: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                           memcpy(smallbuf, buf, len);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:1073:3: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&dev->descriptor, desc, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:1073:3: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&dev->descriptor, desc, size);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:1709:2: warning: Value stored to 'retval' is =
never read [clang-analyzer-deadcode.DeadStores]
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:1709:2: note: Value stored to 'retval' is nev=
er read
           retval =3D 0;
           ^        ~
   drivers/usb/core/message.c:2301:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/core/message.c:2301:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(hdr, 0x00, sizeof(struct usb_cdc_parsed_header));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/of/pdt.c:52:3: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(buf, name);
                   ^~~~~~
   drivers/of/pdt.c:52:3: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
                   strcpy(buf, name);
                   ^~~~~~
>> drivers/of/pdt.c:58:2: warning: Call to function 'sprintf' is insecure a=
s it does not provide bounding of the memory buffer or security checks intr=
oduced in the C11 standard. Replace with analogous functions that support l=
ength arguments or provides boundary checks such as 'sprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(buf, "%s(a)unknown%i", name, failsafe_id++);
           ^~~~~~~
   drivers/of/pdt.c:58:2: note: Call to function 'sprintf' is insecure as i=
t does not provide bounding of the memory buffer or security checks introdu=
ced in the C11 standard. Replace with analogous functions that support leng=
th arguments or provides boundary checks such as 'sprintf_s' in case of C11
           sprintf(buf, "%s(a)unknown%i", name, failsafe_id++);
           ^~~~~~~
   drivers/of/pdt.c:76:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(p, 0, sizeof(*p) + 32);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/pdt.c:76:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(p, 0, sizeof(*p) + 32);
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/of/pdt.c:85:3: warning: Call to function 'strcpy' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(p->name, special_name);
                   ^~~~~~
   drivers/of/pdt.c:85:3: note: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119
                   strcpy(p->name, special_name);
                   ^~~~~~
   drivers/of/pdt.c:88:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(p->value, special_val, special_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/of/pdt.c:88:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(p->value, special_val, special_len);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/of/pdt.c:138:3: warning: Value stored to 'len' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   len =3D of_pdt_prom_ops->getproperty(node, name, buf, le=
n);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/of/pdt.c:138:3: note: Value stored to 'len' is never read
                   len =3D of_pdt_prom_ops->getproperty(node, name, buf, le=
n);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   drivers/base/bus.c:873:18: warning: Access to field 'drivers_kset' resul=
ts in a dereference of a null pointer (loaded from field 'p') [clang-analyz=
er-core.NullDereference]
           kset_unregister(bus->p->drivers_kset);
                           ^
   drivers/base/bus.c:1139:9: note: Calling 'subsys_register'
           return subsys_register(subsys, groups, &system_kset->kobj);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:1083:8: note: Calling 'bus_register'
           err =3D bus_register(subsys);
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:788:6: note: Assuming 'priv' is non-null
           if (!priv)
               ^~~~~
   drivers/base/bus.c:788:2: note: Taking false branch
           if (!priv)
           ^
   drivers/base/bus.c:794:2: note: Loop condition is false.  Exiting loop
           BLOCKING_INIT_NOTIFIER_HEAD(&priv->bus_notifier);
           ^
   include/linux/notifier.h:85:3: note: expanded from macro 'BLOCKING_INIT_=
NOTIFIER_HEAD'
                   init_rwsem(&(name)->rwsem);     \
                   ^
   include/linux/rwsem.h:106:30: note: expanded from macro 'init_rwsem'
   #define init_rwsem(sem)                                         \
                                                                   ^
   drivers/base/bus.c:794:2: note: Loop condition is false.  Exiting loop
           BLOCKING_INIT_NOTIFIER_HEAD(&priv->bus_notifier);
           ^
   include/linux/notifier.h:84:43: note: expanded from macro 'BLOCKING_INIT=
_NOTIFIER_HEAD'
   #define BLOCKING_INIT_NOTIFIER_HEAD(name) do {  \
                                             ^
   drivers/base/bus.c:797:6: note: Assuming 'retval' is not equal to 0
           if (retval)
               ^~~~~~
   drivers/base/bus.c:797:2: note: Taking true branch
           if (retval)
           ^
   drivers/base/bus.c:798:3: note: Control jumps to line 853
                   goto out;
                   ^
   drivers/base/bus.c:854:2: note: Null pointer value stored to field 'p'
           bus->p =3D NULL;
           ^~~~~~~~~~~~~
   drivers/base/bus.c:1083:8: note: Returning from 'bus_register'
           err =3D bus_register(subsys);
                 ^~~~~~~~~~~~~~~~~~~~
   drivers/base/bus.c:1084:6: note: Assuming 'err' is >=3D 0
           if (err < 0)
               ^~~~~~~
   drivers/base/bus.c:1084:2: note: Taking false branch
           if (err < 0)
           ^
   drivers/base/bus.c:1088:6: note: Assuming 'dev' is null
           if (!dev) {
               ^~~~
   drivers/base/bus.c:1088:2: note: Taking true branch
           if (!dev) {

vim +58 drivers/of/pdt.c

3cfc535c5df812 Andres Salomon 2010-10-10  40  =

a74ea43df1afc6 Andres Salomon 2011-02-23  41  static char * __init of_pdt_b=
uild_full_name(struct device_node *dp)
3cfc535c5df812 Andres Salomon 2010-10-10  42  {
a74ea43df1afc6 Andres Salomon 2011-02-23  43  	static int failsafe_id =3D 0=
; /* for generating unique names on failure */
0c5eaa7749726b Rob Herring    2018-11-16  44  	const char *name;
0c5eaa7749726b Rob Herring    2018-11-16  45  	char path[256];
a74ea43df1afc6 Andres Salomon 2011-02-23  46  	char *buf;
a74ea43df1afc6 Andres Salomon 2011-02-23  47  	int len;
a74ea43df1afc6 Andres Salomon 2011-02-23  48  =

0c5eaa7749726b Rob Herring    2018-11-16  49  	if (!of_pdt_prom_ops->pkg2pa=
th(dp->phandle, path, sizeof(path), &len)) {
0c5eaa7749726b Rob Herring    2018-11-16  50  		name =3D kbasename(path);
0c5eaa7749726b Rob Herring    2018-11-16  51  		buf =3D prom_early_alloc(st=
rlen(name) + 1);
0c5eaa7749726b Rob Herring    2018-11-16  52  		strcpy(buf, name);
a74ea43df1afc6 Andres Salomon 2011-02-23  53  		return buf;
0c5eaa7749726b Rob Herring    2018-11-16  54  	}
a74ea43df1afc6 Andres Salomon 2011-02-23  55  =

0c5eaa7749726b Rob Herring    2018-11-16  56  	name =3D of_get_property(dp,=
 "name", &len);
0c5eaa7749726b Rob Herring    2018-11-16  57  	buf =3D prom_early_alloc(len=
 + 16);
0c5eaa7749726b Rob Herring    2018-11-16 @58  	sprintf(buf, "%s(a)unknown%i=
", name, failsafe_id++);
a74ea43df1afc6 Andres Salomon 2011-02-23  59  	pr_err("%s: pkg2path failed;=
 assigning %s\n", __func__, buf);
a74ea43df1afc6 Andres Salomon 2011-02-23  60  	return buf;
3cfc535c5df812 Andres Salomon 2010-10-10  61  }
3cfc535c5df812 Andres Salomon 2010-10-10  62  =


:::::: The code at line 58 was first introduced by commit
:::::: 0c5eaa7749726b2e4667a5e3668c3eb8516e7440 of: Drop full path from ful=
l_name for PDT systems

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0438921269289020808==--

