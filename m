Content-Type: multipart/mixed; boundary="===============6926085775572867680=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vme/bridges/vme_ca91cx42.c:539:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length argument...
Date: Tue, 26 Apr 2022 11:55:50 +0800
Message-ID: <202204261135.SJElqEvr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6926085775572867680==
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
head:   d615b5416f8a1afeb82d13b238f8152c572d59c0
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-c001-20220425 (https://download.01.org/0day-ci/arch=
ive/20220426/202204261135.SJElqEvr-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcf=
dc3c683b393df1a5c9063252eb60e52818)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   77 warnings generated.
   fs/cifs/netmisc.c:179:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(scope_id, pct + 1, slen);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/cifs/netmisc.c:179:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(scope_id, pct + 1, slen);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/cifs/netmisc.c:981:6: warning: Assigned value is garbage or undefined=
 [clang-analyzer-core.uninitialized.Assign]
           min =3D st->Minutes;
               ^ ~~~~~~~~~~~
   fs/cifs/netmisc.c:978:2: note: Taking false branch
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:76:2: note: expanded from macro 'cifs_dbg'
           if ((type) & ONCE)                                              \
           ^
   fs/cifs/netmisc.c:978:2: note: Left side of '&&' is true
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:6: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
               ^
   fs/cifs/netmisc.c:978:2: note: Assuming the condition is false
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/cifs/cifs_debug.h:64:22: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
                               ^~~~~~~~~~~~~~~~~~~
   fs/cifs/netmisc.c:978:2: note: Taking false branch
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:64:2: note: expanded from macro 'cifs_dbg_func'
           if ((type) & FYI && cifsFYI & CIFS_INFO) {                      \
           ^
   fs/cifs/netmisc.c:978:2: note: Taking false branch
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:67:9: note: expanded from macro 'cifs_dbg_func'
           } else if ((type) & VFS) {                                      \
                  ^
   fs/cifs/netmisc.c:978:2: note: Left side of '&&' is false
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:69:28: note: expanded from macro 'cifs_dbg_func'
           } else if ((type) & NOISY && (NOISY !=3D 0)) {                  =
  \
                                     ^
   fs/cifs/netmisc.c:978:2: note: Loop condition is false.  Exiting loop
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:79:3: note: expanded from macro 'cifs_dbg'
                   cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
                   ^
   fs/cifs/cifs_debug.h:62:52: note: expanded from macro 'cifs_dbg_func'
   #define cifs_dbg_func(ratefunc, type, fmt, ...)                         \
                                                                           ^
   fs/cifs/netmisc.c:978:2: note: Loop condition is false.  Exiting loop
           cifs_dbg(FYI, "date %d time %d\n", date, time);
           ^
   fs/cifs/cifs_debug.h:74:38: note: expanded from macro 'cifs_dbg'
   #define cifs_dbg(type, fmt, ...)                                        \
                                                                           ^
   fs/cifs/netmisc.c:981:6: note: Assigned value is garbage or undefined
           min =3D st->Minutes;
               ^ ~~~~~~~~~~~
   Suppressed 75 warnings (75 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/vme/bridges/vme_ca91cx42.c:528:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&image->bus_resource, 0, sizeof(image->bus_resour=
ce));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:528:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(&image->bus_resource, 0, sizeof(image->bus_resour=
ce));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/vme/bridges/vme_ca91cx42.c:539:2: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
           sprintf((char *)image->bus_resource.name, "%s.%d",
           ^~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:539:2: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
           sprintf((char *)image->bus_resource.name, "%s.%d",
           ^~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:571:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&image->bus_resource, 0, sizeof(image->bus_resource));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:571:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&image->bus_resource, 0, sizeof(image->bus_resource));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:585:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&image->bus_resource, 0, sizeof(image->bus_resource));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:585:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(&image->bus_resource, 0, sizeof(image->bus_resource));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:879:4: warning: Value stored to 'done=
' is never read [clang-analyzer-deadcode.DeadStores]
                           done +=3D 1;
                           ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:879:4: note: Value stored to 'done' i=
s never read
                           done +=3D 1;
                           ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:899:3: warning: Value stored to 'done=
' is never read [clang-analyzer-deadcode.DeadStores]
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:899:3: note: Value stored to 'done' i=
s never read
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:933:4: warning: Value stored to 'done=
' is never read [clang-analyzer-deadcode.DeadStores]
                           done +=3D 1;
                           ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:933:4: note: Value stored to 'done' i=
s never read
                           done +=3D 1;
                           ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:953:3: warning: Value stored to 'done=
' is never read [clang-analyzer-deadcode.DeadStores]
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:953:3: note: Value stored to 'done' i=
s never read
                   done +=3D 1;
                   ^       ~
   drivers/vme/bridges/vme_ca91cx42.c:1045:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&entry->descriptor, 0, sizeof(entry->descriptor));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1045:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&entry->descriptor, 0, sizeof(entry->descriptor));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1257:3: warning: Value stored to 'val=
' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D ioread32(bridge->base + DCTL);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1257:3: note: Value stored to 'val' i=
s never read
                   val =3D ioread32(bridge->base + DCTL);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1665:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(ca91cx42_bridge->name, driver_name);
           ^~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1665:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(ca91cx42_bridge->name, driver_name);
           ^~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1690:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&master_image->bus_resource, 0,
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/vme/bridges/vme_ca91cx42.c:1690:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(&master_image->bus_resource, 0,
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   97 warnings generated.
   net/sunrpc/addr.c:40:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::");
                          ^~~~~~~~
   net/sunrpc/addr.c:40:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::");
                          ^~~~~~~~
   net/sunrpc/addr.c:48:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::1");

vim +539 drivers/vme/bridges/vme_ca91cx42.c

60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  495  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  496  /*
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  497   * Allocate and map PCI Resource
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  498   */
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  499  static int ca91cx42_alloc_resource(struct vme_master_reso=
urce *image,
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  500  	unsigned long long size)
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  501  {
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  502  	unsigned long long existing_size;
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  503  	int retval =3D 0;
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  504  	struct pci_dev *pdev;
29848ac9f3b33b drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  505  	struct vme_bridge *ca91cx42_bridge;
29848ac9f3b33b drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  506  =

29848ac9f3b33b drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  507  	ca91cx42_bridge =3D image->parent;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  508  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  509  	/* Find pci_dev container of dev */
8d97931740cff8 drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring   =
 2017-08-25  510  	if (!ca91cx42_bridge->parent) {
48d9356e7750d3 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-03-22  511  		dev_err(ca91cx42_bridge->parent, "Dev entry NULL\n");
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  512  		return -EINVAL;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  513  	}
445f82492f2256 drivers/vme/bridges/vme_ca91cx42.c         Geliang Tang     =
 2015-12-27  514  	pdev =3D to_pci_dev(ca91cx42_bridge->parent);
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  515  =

8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  516  	existing_size =3D (unsigned long long)(image->bus_resour=
ce.end -
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  517  		image->bus_resource.start);
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  518  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  519  	/* If the existing size is OK, return */
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  520  	if (existing_size =3D=3D (size - 1))
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  521  		return 0;
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  522  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  523  	if (existing_size !=3D 0) {
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  524  		iounmap(image->kern_base);
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  525  		image->kern_base =3D NULL;
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  526  		kfree(image->bus_resource.name);
886953e9b70bcb drivers/staging/vme/bridges/vme_ca91cx42.c Emilio G. Cota   =
 2010-11-12  527  		release_resource(&image->bus_resource);
3d9b1e53343651 drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring   =
 2017-08-25 @528  		memset(&image->bus_resource, 0, sizeof(image->bus_resou=
rce));
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  529  	}
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  530  =

8d97931740cff8 drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring   =
 2017-08-25  531  	if (!image->bus_resource.name) {
0aa3f139cd5123 drivers/staging/vme/bridges/vme_ca91cx42.c Julia Lawall     =
 2010-05-30  532  		image->bus_resource.name =3D kmalloc(VMENAMSIZ+3, GFP_A=
TOMIC);
8d97931740cff8 drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring   =
 2017-08-25  533  		if (!image->bus_resource.name) {
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  534  			retval =3D -ENOMEM;
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  535  			goto err_name;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  536  		}
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  537  	}
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  538  =

8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18 @539  	sprintf((char *)image->bus_resource.name, "%s.%d",
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  540  		ca91cx42_bridge->name, image->number);
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  541  =

8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  542  	image->bus_resource.start =3D 0;
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  543  	image->bus_resource.end =3D (unsigned long)size;
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  544  	image->bus_resource.flags =3D IORESOURCE_MEM;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  545  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  546  	retval =3D pci_bus_alloc_resource(pdev->bus,
da5ae8a991d35d drivers/vme/bridges/vme_ca91cx42.c         Dmitry Kalinkin  =
 2015-07-08  547  		&image->bus_resource, size, 0x10000, PCIBIOS_MIN_MEM,
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  548  		0, NULL, NULL);
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  549  	if (retval) {
48d9356e7750d3 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-03-22  550  		dev_err(ca91cx42_bridge->parent, "Failed to allocate me=
m "
48d9356e7750d3 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-03-22  551  			"resource for window %d size 0x%lx start 0x%lx\n",
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  552  			image->number, (unsigned long)size,
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  553  			(unsigned long)image->bus_resource.start);
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  554  		goto err_resource;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  555  	}
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  556  =

4bdc0d676a6431 drivers/vme/bridges/vme_ca91cx42.c         Christoph Hellwig=
 2020-01-06  557  	image->kern_base =3D ioremap(
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  558  		image->bus_resource.start, size);
8d97931740cff8 drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring   =
 2017-08-25  559  	if (!image->kern_base) {
48d9356e7750d3 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-03-22  560  		dev_err(ca91cx42_bridge->parent, "Failed to remap resou=
rce\n");
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  561  		retval =3D -ENOMEM;
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  562  		goto err_remap;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  563  	}
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  564  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  565  	return 0;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  566  =

3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  567  err_remap:
886953e9b70bcb drivers/staging/vme/bridges/vme_ca91cx42.c Emilio G. Cota   =
 2010-11-12  568  	release_resource(&image->bus_resource);
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  569  err_resource:
8fafb47638012d drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2010-02-18  570  	kfree(image->bus_resource.name);
3d9b1e53343651 drivers/vme/bridges/vme_ca91cx42.c         Markus Elfring   =
 2017-08-25  571  	memset(&image->bus_resource, 0, sizeof(image->bus_resour=
ce));
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  572  err_name:
3d0f8bc7517718 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-08-27  573  	return retval;
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  574  }
60479690af6d55 drivers/staging/vme/bridges/vme_ca91cx42.c Martyn Welch     =
 2009-07-31  575  =


:::::: The code at line 539 was first introduced by commit
:::::: 8fafb47638012d93134d0ff38adcc5fc661beeb1 Staging: vme: Make vme_mast=
er_resource naming bus neutral

:::::: TO: Martyn Welch <martyn.welch@ge.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6926085775572867680==--

