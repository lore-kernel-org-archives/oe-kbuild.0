Content-Type: multipart/mixed; boundary="===============4749792145421992934=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/xen/xenbus/xenbus_xs.c:580:8: warning: Call to function 'vsscanf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or...
Date: Sun, 03 Apr 2022 21:15:43 +0800
Message-ID: <202204032118.O22zJIfP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4749792145421992934==
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
head:   be2d3ecedd9911fbfd7e55cc9ceac5f8b79ae4cf
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220402 (https://download.01.org/0day-ci/archi=
ve/20220403/202204032118.O22zJIfP-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   51 warnings generated.
   lib/irq_poll.c:181:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(iop, 0, sizeof(*iop));
           ^~~~~~
   lib/irq_poll.c:181:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(iop, 0, sizeof(*iop));
           ^~~~~~
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   lib/stackdepot.c:139:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(stack->entries, entries, flex_array_size(stack, entries, =
size));
           ^~~~~~
   lib/stackdepot.c:139:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(stack->entries, entries, flex_array_size(stack, entries, =
size));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   51 warnings generated.
   Suppressed 51 warnings (50 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   26 warnings generated.
   Suppressed 26 warnings (26 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   66 warnings generated.
   Suppressed 66 warnings (66 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   fs/proc/self.c:25:2: warning: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "%u", tgid);
           ^~~~~~~
   fs/proc/self.c:25:2: note: Call to function 'sprintf' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'sprintf_s' in case of C11
           sprintf(name, "%u", tgid);
           ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   fs/proc/thread_self.c:25:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "%u/task/%u", tgid, pid);
           ^~~~~~~
   fs/proc/thread_self.c:25:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(name, "%u/task/%u", tgid, pid);
           ^~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/xen/xenbus/xenbus_client.c:294:8: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           len =3D sprintf(printf_buffer, "%i ", -err);
                 ^~~~~~~
   drivers/xen/xenbus/xenbus_client.c:294:8: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           len =3D sprintf(printf_buffer, "%i ", -err);
                 ^~~~~~~
   drivers/xen/xenbus/xenbus_client.c:295:2: warning: Call to function 'vsn=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'vsnprintf_s' in case of C11 [clang=
-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           vsnprintf(printf_buffer + len, PRINTF_BUFFER_SIZE - len, fmt, ap=
);
           ^~~~~~~~~
   drivers/xen/xenbus/xenbus_client.c:295:2: note: Call to function 'vsnpri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'vsnprintf_s' in case of C11
           vsnprintf(printf_buffer + len, PRINTF_BUFFER_SIZE - len, fmt, ap=
);
           ^~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/xen/xenbus/xenbus_comms.c:135:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dst, data, avail);
                   ^~~~~~
   drivers/xen/xenbus/xenbus_comms.c:135:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dst, data, avail);
                   ^~~~~~
   drivers/xen/xenbus/xenbus_comms.c:188:3: warning: Call to function 'memc=
py' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(data, src, avail);
                   ^~~~~~
   drivers/xen/xenbus/xenbus_comms.c:188:3: note: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(data, src, avail);
                   ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   drivers/xen/xenbus/xenbus_xs.c:412:2: warning: Call to function 'memcpy'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&ret[*num], strings, len);
           ^~~~~~
   drivers/xen/xenbus/xenbus_xs.c:412:2: note: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&ret[*num], strings, len);
           ^~~~~~
>> drivers/xen/xenbus/xenbus_xs.c:580:8: warning: Call to function 'vsscanf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'vsscanf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           ret =3D vsscanf(val, fmt, ap);
                 ^~~~~~~
   drivers/xen/xenbus/xenbus_xs.c:580:8: note: Call to function 'vsscanf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'vsscanf_s'=
 in case of C11
           ret =3D vsscanf(val, fmt, ap);
                 ^~~~~~~
>> drivers/xen/xenbus/xenbus_xs.c:647:8: warning: Call to function 'sscanf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sscanf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                           if (sscanf(p, fmt, result) =3D=3D 0)
                               ^~~~~~
   drivers/xen/xenbus/xenbus_xs.c:647:8: note: Call to function 'sscanf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sscanf_s' i=
n case of C11
                           if (sscanf(p, fmt, result) =3D=3D 0)
                               ^~~~~~
   drivers/xen/xenbus/xenbus_xs.c:770:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(token, "%lX", (long)watch);
           ^~~~~~~
   drivers/xen/xenbus/xenbus_xs.c:770:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(token, "%lX", (long)watch);
           ^~~~~~~
   drivers/xen/xenbus/xenbus_xs.c:801:2: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(token, "%lX", (long)watch);
           ^~~~~~~
   drivers/xen/xenbus/xenbus_xs.c:801:2: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
           sprintf(token, "%lX", (long)watch);
           ^~~~~~~
   drivers/xen/xenbus/xenbus_xs.c:860:3: warning: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   sprintf(token, "%lX", (long)watch);
                   ^~~~~~~
   drivers/xen/xenbus/xenbus_xs.c:860:3: note: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11
                   sprintf(token, "%lX", (long)watch);
                   ^~~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   security/keys/gc.c:366:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
           ^~~~~~
   security/keys/gc.c:366:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   drivers/gpio/gpio-tegra186.c:579:17: warning: Value stored to 'dev' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D gpio->gpio.parent;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tegra186.c:579:17: note: Value stored to 'dev' during =
its initialization is never read
           struct device *dev =3D gpio->gpio.parent;
                          ^~~   ~~~~~~~~~~~~~~~~~
   drivers/gpio/gpio-tegra186.c:618:6: warning: Value stored to 'value' is =
never read [clang-analyzer-deadcode.DeadStores]
                                           value =3D readl(base + offset);
                                           ^
   drivers/gpio/gpio-tegra186.c:618:6: note: Value stored to 'value' is nev=
er read
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/spi/spi-pxa2xx-dma.c:86:2: warning: Call to function 'memset' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   drivers/spi/spi-pxa2xx-dma.c:86:2: note: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11
           memset(&cfg, 0, sizeof(cfg));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   arch/arm/kernel/devtree.c:232:6: warning: Access to field 'dt_fixup' res=
ults in a dereference of a null pointer (loaded from variable 'mdesc') [cla=
ng-analyzer-core.NullDereference]
           if (mdesc->dt_fixup)
               ^~~~~
   arch/arm/kernel/devtree.c:206:6: note: Assuming 'dt_virt' is non-null
           if (!dt_virt || !early_init_dt_verify(dt_virt))
               ^~~~~~~~
   arch/arm/kernel/devtree.c:206:6: note: Left side of '||' is false
   arch/arm/kernel/devtree.c:206:18: note: Assuming the condition is false
           if (!dt_virt || !early_init_dt_verify(dt_virt))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:206:2: note: Taking false branch
           if (!dt_virt || !early_init_dt_verify(dt_virt))
           ^
   arch/arm/kernel/devtree.c:209:2: note: Value assigned to 'mdesc'
           mdesc =3D of_flat_dt_match_machine(mdesc_best, arch_get_next_mac=
h);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/devtree.c:211:6: note: Assuming 'mdesc' is null
           if (!mdesc) {
               ^~~~~~
   arch/arm/kernel/devtree.c:211:2: note: Taking true branch
           if (!mdesc) {
           ^
   arch/arm/kernel/devtree.c:221:10: note: Assuming 'size' is <=3D 0
                   while (size > 0) {
                          ^~~~~~~~
   arch/arm/kernel/devtree.c:221:3: note: Loop condition is false. Executio=
n continues on line 226
                   while (size > 0) {
                   ^
   arch/arm/kernel/devtree.c:232:6: note: Access to field 'dt_fixup' result=
s in a dereference of a null pointer (loaded from variable 'mdesc')
           if (mdesc->dt_fixup)
               ^~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   arch/arm/kernel/hw_breakpoint.c:304:2: warning: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ctrl, 0, sizeof(ctrl));
           ^~~~~~
--
           ^~~~~~
   drivers/char/tpm/tpm2-space.c:567:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(space->context_buf, chip->work_space.context_buf,
           ^~~~~~
   drivers/char/tpm/tpm2-space.c:569:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(space->session_buf, chip->work_space.session_buf,
           ^~~~~~
   drivers/char/tpm/tpm2-space.c:569:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(space->session_buf, chip->work_space.session_buf,
           ^~~~~~
   Suppressed 54 warnings (53 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   fs/proc/proc_sysctl.c:980:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_name, name, namelen);
           ^~~~~~
   fs/proc/proc_sysctl.c:980:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(new_name, name, namelen);
           ^~~~~~
   fs/proc/proc_sysctl.c:1197:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(link_name, entry->procname, len);
                   ^~~~~~
   fs/proc/proc_sysctl.c:1197:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(link_name, entry->procname, len);
                   ^~~~~~
   fs/proc/proc_sysctl.c:1231:3: warning: Value stored to 'link' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1231:3: note: Value stored to 'link' is never read
                   link =3D find_entry(&head, dir, procname, strlen(procnam=
e));
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/proc/proc_sysctl.c:1442:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pos, name, namelen);
           ^~~~~~
   fs/proc/proc_sysctl.c:1442:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(pos, name, namelen);
           ^~~~~~
   fs/proc/proc_sysctl.c:1752:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(set, 0, sizeof(*set));
           ^~~~~~
   fs/proc/proc_sysctl.c:1752:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(set, 0, sizeof(*set));
           ^~~~~~
   Suppressed 49 warnings (49 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   drivers/xen/xenbus/xenbus_probe.c:220:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   XENBUS_SHOW_STAT(event_channels);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:220:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   XENBUS_SHOW_STAT(event_channels);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:221:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   XENBUS_SHOW_STAT(events);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:221:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   XENBUS_SHOW_STAT(events);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:222:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   XENBUS_SHOW_STAT(spurious_events);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:222:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   XENBUS_SHOW_STAT(spurious_events);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:223:1: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   XENBUS_SHOW_STAT(jiffies_eoi_delayed);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:223:1: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
   XENBUS_SHOW_STAT(jiffies_eoi_delayed);
   ^
   drivers/xen/xenbus/xenbus_probe.c:216:9: note: expanded from macro 'XENB=
US_SHOW_STAT'
           return sprintf(buf, "%d\n", atomic_read(&dev->name));           \
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:231:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", dev->spurious_threshold);
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:231:9: note: Call to function 'sprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", dev->spurious_threshold);
                  ^~~~~~~
>> drivers/xen/xenbus/xenbus_probe.c:451:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", to_xenbus_device(dev)->nodename);
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:451:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", to_xenbus_device(dev)->nodename);
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:458:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n", to_xenbus_device(dev)->devicetype);
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:458:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n", to_xenbus_device(dev)->devicetype);
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:465:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s:%s\n", dev->bus->name,
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:465:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s:%s\n", dev->bus->name,
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:473:9: warning: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsa=
feBufferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:473:9: note: Call to function 'sprintf=
' is insecure as it does not provide bounding of the memory buffer or secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'sprintf=
_s' in case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:524:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(tmpstring, nodename);
           ^~~~~~
   drivers/xen/xenbus/xenbus_probe.c:524:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(tmpstring, nodename);
           ^~~~~~
   drivers/xen/xenbus/xenbus_probe.c:528:2: warning: Call to function 'strc=
py' is insecure as it does not provide bounding of the memory buffer. Repla=
ce unbounded copy functions with analogous functions that support length ar=
guments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.str=
cpy]
           strcpy(tmpstring, type);
           ^~~~~~
   drivers/xen/xenbus/xenbus_probe.c:528:2: note: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119
           strcpy(tmpstring, type);
           ^~~~~~
   drivers/xen/xenbus/xenbus_probe.c:640:2: warning: Call to function 'snpr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'snprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(type, XEN_BUS_ID_SIZE, "%.*s", (int)strcspn(p, "/"), p);
           ^~~~~~~~
   drivers/xen/xenbus/xenbus_probe.c:640:2: note: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(type, XEN_BUS_ID_SIZE, "%.*s", (int)strcspn(p, "/"), p);
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
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
   46 warnings generated.
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   lib/kfifo.c:71:2: note: Taking true branch
           if (!is_power_of_2(size))
           ^
   lib/kfifo.c:72:10: note: '?' condition is false
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   lib/kfifo.c:72:10: note: Calling '__rounddown_pow_of_two'
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   lib/kfifo.c:104:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(fifo->data + off, src, l);
           ^~~~~~
   lib/kfifo.c:104:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(fifo->data + off, src, l);
           ^~~~~~
   lib/kfifo.c:105:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(fifo->data, src + l, len - l);
           ^~~~~~
   lib/kfifo.c:105:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(fifo->data, src + l, len - l);
           ^~~~~~
   lib/kfifo.c:143:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, fifo->data + off, l);
           ^~~~~~
   lib/kfifo.c:143:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(dst, fifo->data + off, l);
           ^~~~~~
   lib/kfifo.c:144:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst + l, fifo->data, len - l);
           ^~~~~~
   lib/kfifo.c:144:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(dst + l, fifo->data, len - l);
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
--
                                    ^
   drivers/base/cacheinfo.c:25:29: note: expanded from macro 'ci_cacheinfo'
   #define ci_cacheinfo(cpu)       (&per_cpu(ci_cpu_cacheinfo, cpu))
                                     ^
   include/linux/percpu-defs.h:269:29: note: expanded from macro 'per_cpu'
   #define per_cpu(var, cpu)       (*per_cpu_ptr(&(var), cpu))
                                     ^
   include/linux/percpu-defs.h:263:47: note: expanded from macro 'per_cpu_p=
tr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); =
})
                                                   ^
   include/linux/percpu-defs.h:259:2: note: expanded from macro 'VERIFY_PER=
CPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   drivers/base/cacheinfo.c:270:18: note: Assuming 'index' is < field 'num_=
leaves'
           for (index =3D 0; index < cache_leaves(cpu); index++) {
                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:270:2: note: Loop condition is true.  Entering =
loop body
           for (index =3D 0; index < cache_leaves(cpu); index++) {
           ^
   drivers/base/cacheinfo.c:271:3: note: Value assigned to 'this_leaf'
                   this_leaf =3D this_cpu_ci->info_list + index;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:272:3: note: Loop condition is true.  Entering =
loop body
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:275:8: note: 'sibling' is not equal to 'cpu'
                           if (sibling =3D=3D cpu) /* skip itself */
                               ^~~~~~~
   drivers/base/cacheinfo.c:275:4: note: Taking false branch
                           if (sibling =3D=3D cpu) /* skip itself */
                           ^
   drivers/base/cacheinfo.c:279:8: note: Assuming field 'info_list' is null
                           if (!sib_cpu_ci->info_list)
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:279:4: note: Taking true branch
                           if (!sib_cpu_ci->info_list)
                           ^
   drivers/base/cacheinfo.c:280:5: note:  Execution continues on line 272
                                   continue;
                                   ^
   drivers/base/cacheinfo.c:272:3: note: Loop condition is false. Execution=
 continues on line 286
                   for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
                   ^
   include/linux/cpumask.h:190:2: note: expanded from macro 'for_each_cpu'
           for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
           ^
   drivers/base/cacheinfo.c:286:7: note: Calling 'of_have_populated_dt'
                   if (of_have_populated_dt())
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/of.h:180:9: note: Assuming 'of_root' is not equal to NULL
           return of_root !=3D NULL;
                  ^~~~~~~~~~~~~~~
   include/linux/of.h:180:2: note: Returning the value 1, which participate=
s in a condition later
           return of_root !=3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:286:7: note: Returning from 'of_have_populated_=
dt'
                   if (of_have_populated_dt())
                       ^~~~~~~~~~~~~~~~~~~~~~
   drivers/base/cacheinfo.c:286:3: note: Taking true branch
                   if (of_have_populated_dt())
                   ^
   drivers/base/cacheinfo.c:287:16: note: Access to field 'fw_token' result=
s in a dereference of a null pointer (loaded from variable 'this_leaf')
                           of_node_put(this_leaf->fw_token);
                                       ^~~~~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/xen/evtchn.c:354:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_ring, old_ring, u->ring_size * sizeof(*u->ring));
           ^~~~~~
   drivers/xen/evtchn.c:354:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(new_ring, old_ring, u->ring_size * sizeof(*u->ring));
           ^~~~~~
   drivers/xen/evtchn.c:355:2: warning: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(new_ring + u->ring_size, old_ring,
           ^~~~~~
   drivers/xen/evtchn.c:355:2: note: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11
           memcpy(new_ring + u->ring_size, old_ring,
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/xen/sys-hypervisor.c:40:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buffer, "xen\n");
                  ^~~~~~~
   drivers/xen/sys-hypervisor.c:40:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buffer, "xen\n");
                  ^~~~~~~
>> drivers/xen/sys-hypervisor.c:69:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buffer, "%s\n", type);
                  ^~~~~~~
   drivers/xen/sys-hypervisor.c:69:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buffer, "%s\n", type);
                  ^~~~~~~
   drivers/xen/sys-hypervisor.c:84:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buffer, "%d\n", version >> 16);
                          ^~~~~~~
   drivers/xen/sys-hypervisor.c:84:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buffer, "%d\n", version >> 16);
                          ^~~~~~~
   drivers/xen/sys-hypervisor.c:94:10: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buffer, "%d\n", version & 0xff);
                          ^~~~~~~
   drivers/xen/sys-hypervisor.c:94:10: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buffer, "%d\n", version & 0xff);
                          ^~~~~~~
   drivers/xen/sys-hypervisor.c:109:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           ret =3D sprintf(buffer, "%s\n", extra);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:109:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           ret =3D sprintf(buffer, "%s\n", extra);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:153:8: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
           ret =3D sprintf(buffer, "%s\n", val);
                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:153:8: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
           ret =3D sprintf(buffer, "%s\n", val);
                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:165:8: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sprintf(buffer, "%pU\n", uuid);
                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:165:8: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
           ret =3D sprintf(buffer, "%pU\n", uuid);
                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:187:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           ret =3D sprintf(buffer, "%s\n", info->compiler);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:187:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           ret =3D sprintf(buffer, "%s\n", info->compiler);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:205:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           ret =3D sprintf(buffer, "%s\n", info->compile_by=
);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:205:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           ret =3D sprintf(buffer, "%s\n", info->compile_by=
);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:223:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           ret =3D sprintf(buffer, "%s\n", info->compile_da=
te);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:223:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           ret =3D sprintf(buffer, "%s\n", info->compile_da=
te);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:260:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           ret =3D sprintf(buffer, "%s\n", caps);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:260:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           ret =3D sprintf(buffer, "%s\n", caps);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:278:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide bounding of the memory buffer or securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                           ret =3D sprintf(buffer, "%s\n", cset);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:278:10: note: Call to function 'sprintf' is=
 insecure as it does not provide bounding of the memory buffer or security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                           ret =3D sprintf(buffer, "%s\n", cset);
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:297:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D sprintf(buffer, "%"PRI_xen_ulong"\n",
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:297:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                           ret =3D sprintf(buffer, "%"PRI_xen_ulong"\n",
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:313:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buffer, "%x\n", ret);
                         ^~~~~~~
   drivers/xen/sys-hypervisor.c:313:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buffer, "%x\n", ret);
                         ^~~~~~~
   drivers/xen/sys-hypervisor.c:328:9: warning: Call to function 'sprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   ret =3D sprintf(buffer, "%08x", info.submap);
                         ^~~~~~~
   drivers/xen/sys-hypervisor.c:328:9: note: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11
                   ret =3D sprintf(buffer, "%08x", info.submap);
                         ^~~~~~~
   drivers/xen/sys-hypervisor.c:364:10: warning: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           ret =3D sprintf(buffer, "<denied>");
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:364:10: note: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11
                           ret =3D sprintf(buffer, "<denied>");
                                 ^~~~~~~
   drivers/xen/sys-hypervisor.c:375:9: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   ret =3D sprintf(buffer, "%s", buildid->buf);
                         ^~~~~~~
   drivers/xen/sys-hypervisor.c:375:9: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   ret =3D sprintf(buffer, "%s", buildid->buf);
                         ^~~~~~~
   Suppressed 25 warnings (25 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   50 warnings generated.
   Suppressed 50 warnings (50 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +580 drivers/xen/xenbus/xenbus_xs.c

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  398  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  399  static char **split(cha=
r *strings, unsigned int len, unsigned int *num)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  400  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  401  	char *p, **ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  402  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  403  	/* Count the strings. =
*/
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  404  	*num =3D count_strings=
(strings, len);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  405  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  406  	/* Transfer to one big=
 alloc for easy freeing. */
a144ff09bc52ef Ian Campbell        2008-06-17  407  	ret =3D kmalloc(*num *=
 sizeof(char *) + len, GFP_NOIO | __GFP_HIGH);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  408  	if (!ret) {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  409  		kfree(strings);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  410  		return ERR_PTR(-ENOME=
M);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  411  	}
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17 @412  	memcpy(&ret[*num], str=
ings, len);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  413  	kfree(strings);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  414  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  415  	strings =3D (char *)&r=
et[*num];
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  416  	for (p =3D strings, *n=
um =3D 0; p < strings + len; p +=3D strlen(p) + 1)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  417  		ret[(*num)++] =3D p;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  418  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  419  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  420  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  421  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  422  char **xenbus_directory=
(struct xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  423  			const char *dir, con=
st char *node, unsigned int *num)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  424  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  425  	char *strings, *path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  426  	unsigned int len;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  427  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  428  	path =3D join(dir, nod=
e);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  429  	if (IS_ERR(path))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  430  		return (char **)path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  431  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  432  	strings =3D xs_single(=
t, XS_DIRECTORY, path, &len);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  433  	kfree(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  434  	if (IS_ERR(strings))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  435  		return (char **)strin=
gs;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  436  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  437  	return split(strings, =
len, num);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  438  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  439  EXPORT_SYMBOL_GPL(xenbu=
s_directory);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  440  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  441  /* Check if a path exis=
ts. Return 1 if it does. */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  442  int xenbus_exists(struc=
t xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  443  		  const char *dir, co=
nst char *node)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  444  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  445  	char **d;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  446  	int dir_n;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  447  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  448  	d =3D xenbus_directory=
(t, dir, node, &dir_n);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  449  	if (IS_ERR(d))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  450  		return 0;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  451  	kfree(d);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  452  	return 1;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  453  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  454  EXPORT_SYMBOL_GPL(xenbu=
s_exists);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  455  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  456  /* Get the value of a s=
ingle file.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  457   * Returns a kmalloced =
value: call free() on it after use.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  458   * len indicates length=
 in bytes.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  459   */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  460  void *xenbus_read(struc=
t xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  461  		  const char *dir, co=
nst char *node, unsigned int *len)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  462  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  463  	char *path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  464  	void *ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  465  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  466  	path =3D join(dir, nod=
e);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  467  	if (IS_ERR(path))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  468  		return (void *)path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  469  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  470  	ret =3D xs_single(t, X=
S_READ, path, len);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  471  	kfree(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  472  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  473  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  474  EXPORT_SYMBOL_GPL(xenbu=
s_read);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  475  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  476  /* Write the value of a=
 single file.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  477   * Returns -err on fail=
ure.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  478   */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  479  int xenbus_write(struct=
 xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  480  		 const char *dir, con=
st char *node, const char *string)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  481  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  482  	const char *path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  483  	struct kvec iovec[2];
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  484  	int ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  485  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  486  	path =3D join(dir, nod=
e);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  487  	if (IS_ERR(path))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  488  		return PTR_ERR(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  489  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  490  	iovec[0].iov_base =3D =
(void *)path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  491  	iovec[0].iov_len =3D s=
trlen(path) + 1;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  492  	iovec[1].iov_base =3D =
(void *)string;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  493  	iovec[1].iov_len =3D s=
trlen(string);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  494  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  495  	ret =3D xs_error(xs_ta=
lkv(t, XS_WRITE, iovec, ARRAY_SIZE(iovec), NULL));
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  496  	kfree(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  497  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  498  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  499  EXPORT_SYMBOL_GPL(xenbu=
s_write);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  500  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  501  /* Create a new directo=
ry. */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  502  int xenbus_mkdir(struct=
 xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  503  		 const char *dir, con=
st char *node)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  504  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  505  	char *path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  506  	int ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  507  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  508  	path =3D join(dir, nod=
e);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  509  	if (IS_ERR(path))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  510  		return PTR_ERR(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  511  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  512  	ret =3D xs_error(xs_si=
ngle(t, XS_MKDIR, path, NULL));
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  513  	kfree(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  514  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  515  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  516  EXPORT_SYMBOL_GPL(xenbu=
s_mkdir);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  517  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  518  /* Destroy a file or di=
rectory (directories must be empty). */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  519  int xenbus_rm(struct xe=
nbus_transaction t, const char *dir, const char *node)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  520  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  521  	char *path;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  522  	int ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  523  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  524  	path =3D join(dir, nod=
e);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  525  	if (IS_ERR(path))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  526  		return PTR_ERR(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  527  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  528  	ret =3D xs_error(xs_si=
ngle(t, XS_RM, path, NULL));
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  529  	kfree(path);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  530  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  531  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  532  EXPORT_SYMBOL_GPL(xenbu=
s_rm);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  533  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  534  /* Start a transaction:=
 changes by others will not be seen during this
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  535   * transaction, and cha=
nges will not be visible to others until end.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  536   */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  537  int xenbus_transaction_=
start(struct xenbus_transaction *t)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  538  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  539  	char *id_str;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  540  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  541  	id_str =3D xs_single(X=
BT_NIL, XS_TRANSACTION_START, "", NULL);
fd8aa9095a95c0 Juergen Gross       2017-02-09  542  	if (IS_ERR(id_str))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  543  		return PTR_ERR(id_str=
);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  544  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  545  	t->id =3D simple_strto=
ul(id_str, NULL, 0);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  546  	kfree(id_str);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  547  	return 0;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  548  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  549  EXPORT_SYMBOL_GPL(xenbu=
s_transaction_start);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  550  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  551  /* End a transaction.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  552   * If abandon is true, =
transaction is discarded instead of committed.
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  553   */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  554  int xenbus_transaction_=
end(struct xenbus_transaction t, int abort)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  555  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  556  	char abortstr[2];
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  557  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  558  	if (abort)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  559  		strcpy(abortstr, "F");
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  560  	else
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  561  		strcpy(abortstr, "T");
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  562  =

fd8aa9095a95c0 Juergen Gross       2017-02-09  563  	return xs_error(xs_sin=
gle(t, XS_TRANSACTION_END, abortstr, NULL));
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  564  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  565  EXPORT_SYMBOL_GPL(xenbu=
s_transaction_end);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  566  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  567  /* Single read and scan=
f: returns -errno or num scanned. */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  568  int xenbus_scanf(struct=
 xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  569  		 const char *dir, con=
st char *node, const char *fmt, ...)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  570  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  571  	va_list ap;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  572  	int ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  573  	char *val;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  574  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  575  	val =3D xenbus_read(t,=
 dir, node, NULL);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  576  	if (IS_ERR(val))
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  577  		return PTR_ERR(val);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  578  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  579  	va_start(ap, fmt);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17 @580  	ret =3D vsscanf(val, f=
mt, ap);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  581  	va_end(ap);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  582  	kfree(val);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  583  	/* Distinctive errno. =
*/
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  584  	if (ret =3D=3D 0)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  585  		return -ERANGE;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  586  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  587  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  588  EXPORT_SYMBOL_GPL(xenbu=
s_scanf);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  589  =

9c53a1792a5e6c Juergen Gross       2016-10-31  590  /* Read an (optional) u=
nsigned value. */
9c53a1792a5e6c Juergen Gross       2016-10-31  591  unsigned int xenbus_rea=
d_unsigned(const char *dir, const char *node,
9c53a1792a5e6c Juergen Gross       2016-10-31  592  				  unsigned int defa=
ult_val)
9c53a1792a5e6c Juergen Gross       2016-10-31  593  {
9c53a1792a5e6c Juergen Gross       2016-10-31  594  	unsigned int val;
9c53a1792a5e6c Juergen Gross       2016-10-31  595  	int ret;
9c53a1792a5e6c Juergen Gross       2016-10-31  596  =

9c53a1792a5e6c Juergen Gross       2016-10-31  597  	ret =3D xenbus_scanf(X=
BT_NIL, dir, node, "%u", &val);
9c53a1792a5e6c Juergen Gross       2016-10-31  598  	if (ret <=3D 0)
9c53a1792a5e6c Juergen Gross       2016-10-31  599  		val =3D default_val;
9c53a1792a5e6c Juergen Gross       2016-10-31  600  =

9c53a1792a5e6c Juergen Gross       2016-10-31  601  	return val;
9c53a1792a5e6c Juergen Gross       2016-10-31  602  }
9c53a1792a5e6c Juergen Gross       2016-10-31  603  EXPORT_SYMBOL_GPL(xenbu=
s_read_unsigned);
9c53a1792a5e6c Juergen Gross       2016-10-31  604  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  605  /* Single printf and wr=
ite: returns -errno or 0. */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  606  int xenbus_printf(struc=
t xenbus_transaction t,
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  607  		  const char *dir, co=
nst char *node, const char *fmt, ...)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  608  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  609  	va_list ap;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  610  	int ret;
a800651e889300 Ian Campbell        2012-01-04  611  	char *buf;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  612  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  613  	va_start(ap, fmt);
a800651e889300 Ian Campbell        2012-01-04  614  	buf =3D kvasprintf(GFP=
_NOIO | __GFP_HIGH, fmt, ap);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  615  	va_end(ap);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  616  =

a800651e889300 Ian Campbell        2012-01-04  617  	if (!buf)
a800651e889300 Ian Campbell        2012-01-04  618  		return -ENOMEM;
a800651e889300 Ian Campbell        2012-01-04  619  =

a800651e889300 Ian Campbell        2012-01-04  620  	ret =3D xenbus_write(t=
, dir, node, buf);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  621  =

a800651e889300 Ian Campbell        2012-01-04  622  	kfree(buf);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  623  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  624  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  625  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  626  EXPORT_SYMBOL_GPL(xenbu=
s_printf);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  627  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  628  /* Takes tuples of name=
s, scanf-style args, and void **, NULL terminated. */
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  629  int xenbus_gather(struc=
t xenbus_transaction t, const char *dir, ...)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  630  {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  631  	va_list ap;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  632  	const char *name;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  633  	int ret =3D 0;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  634  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  635  	va_start(ap, dir);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  636  	while (ret =3D=3D 0 &&=
 (name =3D va_arg(ap, char *)) !=3D NULL) {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  637  		const char *fmt =3D v=
a_arg(ap, char *);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  638  		void *result =3D va_a=
rg(ap, void *);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  639  		char *p;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  640  =

4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  641  		p =3D xenbus_read(t, =
dir, name, NULL);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  642  		if (IS_ERR(p)) {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  643  			ret =3D PTR_ERR(p);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  644  			break;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  645  		}
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  646  		if (fmt) {
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17 @647  			if (sscanf(p, fmt, r=
esult) =3D=3D 0)
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  648  				ret =3D -EINVAL;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  649  			kfree(p);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  650  		} else
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  651  			*(char **)result =3D=
 p;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  652  	}
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  653  	va_end(ap);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  654  	return ret;
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  655  }
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  656  EXPORT_SYMBOL_GPL(xenbu=
s_gather);
4bac07c993d034 Jeremy Fitzhardinge 2007-07-17  657  =


:::::: The code@line 580 was first introduced by commit
:::::: 4bac07c993d03434ea902d3d4290d9e45944b66c xen: add the Xenbus sysfs a=
nd virtual device hotplug driver

:::::: TO: Jeremy Fitzhardinge <jeremy@xensource.com>
:::::: CC: Jeremy Fitzhardinge <jeremy@goop.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4749792145421992934==--

