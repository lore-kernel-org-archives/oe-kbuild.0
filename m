Content-Type: multipart/mixed; boundary="===============1231554035292227203=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rtc/rtc-ds1343.c:183:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provi...
Date: Mon, 08 Aug 2022 23:00:58 +0800
Message-ID: <202208082215.MGFimee2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1231554035292227203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/rtc/rtc-ds1343.c:183:9: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-c001-20220801 (https://download.01.org/0day-ci/arch=
ive/20220808/202208082215.MGFimee2-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
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


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   drivers/usb/early/ehci-dbgp.c:243:14: note: 'i' is < 4
           for (i =3D 0; i < 4 && i < size; i++)
                       ^
   drivers/usb/early/ehci-dbgp.c:243:14: note: Left side of '&&' is true
   drivers/usb/early/ehci-dbgp.c:243:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < 4 && i < size; i++)
           ^
   drivers/usb/early/ehci-dbgp.c:244:18: note: The left operand of '<<' is =
a garbage value
                   lo |=3D bytes[i] << (8*i);
                         ~~~~~~~~ ^
   drivers/usb/early/ehci-dbgp.c:812:36: warning: Division by zero [clang-a=
nalyzer-core.DivideZero]
           new_debug_port =3D ((debug_port-1+1)%n_ports) + 1;
                                             ^
   drivers/usb/early/ehci-dbgp.c:836:6: note: Assuming the condition is fal=
se
           if (!early_pci_allowed())
               ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:836:2: note: Taking false branch
           if (!early_pci_allowed())
           ^
   drivers/usb/early/ehci-dbgp.c:840:6: note: Assuming the condition is fal=
se
           if (*s)
               ^~
   drivers/usb/early/ehci-dbgp.c:840:2: note: Taking false branch
           if (*s)
           ^
   drivers/usb/early/ehci-dbgp.c:845:6: note: Assuming 'cap' is not equal t=
o 0
           if (!cap)
               ^~~~
   drivers/usb/early/ehci-dbgp.c:845:2: note: Taking false branch
           if (!cap)
           ^
   drivers/usb/early/ehci-dbgp.c:856:6: note: Assuming 'bar' is equal to PC=
I_BASE_ADDRESS_0
           if (bar !=3D PCI_BASE_ADDRESS_0) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:856:2: note: Taking false branch
           if (bar !=3D PCI_BASE_ADDRESS_0) {
           ^
   drivers/usb/early/ehci-dbgp.c:864:6: note: Assuming the condition is fal=
se
           if (bar_val & ~PCI_BASE_ADDRESS_MEM_MASK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:864:2: note: Taking false branch
           if (bar_val & ~PCI_BASE_ADDRESS_MEM_MASK) {
           ^
   drivers/usb/early/ehci-dbgp.c:872:6: note: Assuming the condition is fal=
se
           if (!(byte & 0x2)) {
               ^~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:872:2: note: Taking false branch
           if (!(byte & 0x2)) {
           ^
   drivers/usb/early/ehci-dbgp.c:896:8: note: Calling 'ehci_setup'
           ret =3D ehci_setup();
                 ^~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:769:2: note: Value assigned to 'n_ports'
           n_ports    =3D HCS_N_PORTS(hcs_params);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:775:14: note: Assuming 'i' is > 'n_ports'
           for (i =3D 1; i <=3D n_ports; i++) {
                       ^~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:775:2: note: Loop condition is false. Exec=
ution continues on line 780
           for (i =3D 1; i <=3D n_ports; i++) {
           ^
   drivers/usb/early/ehci-dbgp.c:780:6: note: 'port_map_tried' is 0
           if (port_map_tried && (new_debug_port !=3D debug_port)) {
               ^~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:780:21: note: Left side of '&&' is false
           if (port_map_tried && (new_debug_port !=3D debug_port)) {
                              ^
   drivers/usb/early/ehci-dbgp.c:790:6: note: Assuming the condition is fal=
se
           if (!(readl(&ehci_regs->configured_flag) & FLAG_CF)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:790:2: note: Taking false branch
           if (!(readl(&ehci_regs->configured_flag) & FLAG_CF)) {
           ^
   drivers/usb/early/ehci-dbgp.c:798:6: note: Assuming the condition is true
           if (ret =3D=3D -EIO)
               ^~~~~~~~~~~
   drivers/usb/early/ehci-dbgp.c:798:2: note: Taking true branch
           if (ret =3D=3D -EIO)
           ^
   drivers/usb/early/ehci-dbgp.c:799:3: note: Control jumps to line 811
                   goto next_debug_port;
                   ^
   drivers/usb/early/ehci-dbgp.c:812:36: note: Division by zero
           new_debug_port =3D ((debug_port-1+1)%n_ports) + 1;
                             ~~~~~~~~~~~~~~~~^~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/rtc/rtc-ds1343.c:97:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "enabled\n");
                          ^~~~~~~
   drivers/rtc/rtc-ds1343.c:97:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "enabled\n");
                          ^~~~~~~
   drivers/rtc/rtc-ds1343.c:99:10: warning: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
   drivers/rtc/rtc-ds1343.c:99:10: note: Call to function 'sprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "disabled\n");
                          ^~~~~~~
>> drivers/rtc/rtc-ds1343.c:183:9: warning: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferH=
andling]
           return sprintf(buf, "%s %s\n", diodes, resistors);
                  ^~~~~~~
   drivers/rtc/rtc-ds1343.c:183:9: note: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11
           return sprintf(buf, "%s %s\n", diodes, resistors);
                  ^~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/usb/dwc3/host.c:97:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(prop=
s));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/host.c:97:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(prop=
s));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 44 warnings (44 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   drivers/usb/dwc3/gadget.c:454:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&params, 0, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:454:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&params, 0, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:501:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&params, 0x00, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:501:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&params, 0x00, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:553:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&params, 0x00, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:553:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&params, 0x00, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:585:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&params, 0x00, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:585:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&params, 0x00, sizeof(params));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:713:2: warning: Value stored to 'dep' is never=
 read [clang-analyzer-deadcode.DeadStores]
           dep =3D dwc->eps[1];
           ^     ~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:713:2: note: Value stored to 'dep' is never re=
ad
           dep =3D dwc->eps[1];
           ^     ~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:894:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(dep->trb_pool, 0,
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:894:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(dep->trb_pool, 0,
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:918:3: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&params, 0, sizeof(params));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/dwc3/gadget.c:918:3: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
                   memset(&params, 0, sizeof(params));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
--
                  ^~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   63 warnings generated.
   drivers/usb/gadget/function/f_uvc.c:214:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&v4l2_event, 0, sizeof(v4l2_event));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:214:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(&v4l2_event, 0, sizeof(v4l2_event));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:217:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&uvc_event->data.data, req->buf, req->actual);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:217:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&uvc_event->data.data, req->buf, req->actual);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:244:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&v4l2_event, 0, sizeof(v4l2_event));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:244:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&v4l2_event, 0, sizeof(v4l2_event));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:246:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:246:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&uvc_event->req, ctrl, sizeof(uvc_event->req));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:299:4: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&v4l2_event, 0, sizeof(v4l2_event));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:299:4: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                           memset(&v4l2_event, 0, sizeof(v4l2_event));
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:326:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&v4l2_event, 0, sizeof(v4l2_event));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:326:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(&v4l2_event, 0, sizeof(v4l2_event));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:349:3: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&v4l2_event, 0, sizeof(v4l2_event));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:349:3: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
                   memset(&v4l2_event, 0, sizeof(v4l2_event));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:367:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&v4l2_event, 0, sizeof(v4l2_event));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:367:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&v4l2_event, 0, sizeof(v4l2_event));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
>> drivers/usb/gadget/function/f_uvc.c:408:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n", uvc->func.fi->group.cg_item.ci_name);
                  ^~~~~~~
   drivers/usb/gadget/function/f_uvc.c:408:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n", uvc->func.fi->group.cg_item.ci_name);
                  ^~~~~~~
   drivers/usb/gadget/function/f_uvc.c:420:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&uvc->vdev, 0, sizeof(uvc->video));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:420:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(&uvc->vdev, 0, sizeof(uvc->video));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:557:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           UVC_COPY_DESCRIPTOR(mem, dst, &uvc_iad);
           ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:557:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           UVC_COPY_DESCRIPTOR(mem, dst, &uvc_iad);
           ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:558:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_intf);
           ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:558:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_intf);
           ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:561:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           UVC_COPY_DESCRIPTORS(mem, dst,
           ^
   drivers/usb/gadget/function/f_uvc.c:457:4: note: expanded from macro 'UV=
C_COPY_DESCRIPTORS'
                           memcpy(mem, *__src, (*__src)->bLength); \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:561:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           UVC_COPY_DESCRIPTORS(mem, dst,
           ^
   drivers/usb/gadget/function/f_uvc.c:457:4: note: expanded from macro 'UV=
C_COPY_DESCRIPTORS'
                           memcpy(mem, *__src, (*__src)->bLength); \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:567:2: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_ep);
           ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:567:2: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
           UVC_COPY_DESCRIPTOR(mem, dst, &uvc_control_ep);
           ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:569:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_control_comp);
                   ^
   drivers/usb/gadget/function/f_uvc.c:448:3: note: expanded from macro 'UV=
C_COPY_DESCRIPTOR'
                   memcpy(mem, desc, (desc)->bLength); \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/f_uvc.c:569:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_control_comp);
--
                          ^~~~~~~~
   net/sunrpc/addr.c:48:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::1");
                          ^~~~~~~~
   net/sunrpc/addr.c:57:10: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return snprintf(buf, buflen, "::ffff:%pI4",
                          ^~~~~~~~
   net/sunrpc/addr.c:57:10: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
                   return snprintf(buf, buflen, "::ffff:%pI4",
                          ^~~~~~~~
   net/sunrpc/addr.c:63:9: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, buflen, "%pI6c", addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:63:9: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           return snprintf(buf, buflen, "%pI6c", addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:83:7: warning: Call to function 'snprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
           rc =3D snprintf(scopebuf, sizeof(scopebuf), "%c%u",
                ^~~~~~~~
   net/sunrpc/addr.c:83:7: note: Call to function 'snprintf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'snprintf_s' in case of C11
           rc =3D snprintf(scopebuf, sizeof(scopebuf), "%c%u",
                ^~~~~~~~
   net/sunrpc/addr.c:92:2: warning: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, scopebuf);
           ^~~~~~
   net/sunrpc/addr.c:92:2: note: Call to function 'strcat' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcat'. CWE-119
           strcat(buf, scopebuf);
           ^~~~~~
   net/sunrpc/addr.c:117:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, buflen, "%pI4", &sin->sin_addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:117:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, buflen, "%pI4", &sin->sin_addr);
                  ^~~~~~~~
   net/sunrpc/addr.c:151:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sap, 0, sizeof(struct sockaddr_in));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:151:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(sap, 0, sizeof(struct sockaddr_in));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:183:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(p, delim + 1, len);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:183:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(p, delim + 1, len);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:210:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(sap, 0, sizeof(struct sockaddr_in6));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:210:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(sap, 0, sizeof(struct sockaddr_in6));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:286:6: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(portbuf, sizeof(portbuf),
               ^~~~~~~~
   net/sunrpc/addr.c:286:6: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           if (snprintf(portbuf, sizeof(portbuf),
               ^~~~~~~~
   net/sunrpc/addr.c:321:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buf, uaddr, uaddr_len);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/sunrpc/addr.c:321:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(buf, uaddr, uaddr_len);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 78 warnings (78 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   28 warnings generated.
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
   Suppressed 22 warnings (22 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/usb/c67x00/c67x00-sched.c:661:44: warning: Division by zero [cla=
ng-analyzer-core.DivideZero]
               usb_pipeout(urb->pipe) && !(remaining % maxps);
                                                     ^
   drivers/usb/c67x00/c67x00-sched.c:1131:2: note: Calling 'c67x00_do_work'
           c67x00_do_work(c67x00);
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:1092:2: note: Taking false branch
           if (!c67x00_all_tds_processed(c67x00))
           ^
   drivers/usb/c67x00/c67x00-sched.c:1101:6: note: Assuming the condition i=
s false
           if (!list_empty(&c67x00->td_list))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:1101:2: note: Taking false branch
           if (!list_empty(&c67x00->td_list))
           ^
   drivers/usb/c67x00/c67x00-sched.c:1105:6: note: Assuming field 'current_=
frame' is not equal to field 'last_frame'
           if (c67x00->current_frame =3D=3D c67x00->last_frame)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:1105:2: note: Taking false branch
           if (c67x00->current_frame =3D=3D c67x00->last_frame)
           ^
   drivers/usb/c67x00/c67x00-sched.c:1110:6: note: Assuming field 'urb_coun=
t' is not equal to 0
           if (!c67x00->urb_count) {
               ^~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:1110:2: note: Taking false branch
           if (!c67x00->urb_count) {
           ^
   drivers/usb/c67x00/c67x00-sched.c:1115:2: note: Calling 'c67x00_fill_fra=
me'
           c67x00_fill_frame(c67x00);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:801:6: note: Assuming the condition is=
 false
           if (!list_empty(&c67x00->td_list)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:801:2: note: Taking false branch
           if (!list_empty(&c67x00->td_list)) {
           ^
   drivers/usb/c67x00/c67x00-sched.c:821:2: note: Calling 'c67x00_fill_from=
_list'
           c67x00_fill_from_list(c67x00, PIPE_BULK, c67x00_add_data_urb);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:784:2: note: Loop condition is true.  =
Entering loop body
           list_for_each_entry(ep_data, &c67x00->list[type], node) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/usb/c67x00/c67x00-sched.c:785:7: note: Assuming the condition is=
 true
                   if (!list_empty(&ep_data->queue)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:785:3: note: Taking true branch
                   if (!list_empty(&ep_data->queue)) {
                   ^
   drivers/usb/c67x00/c67x00-sched.c:791:4: note: Calling 'c67x00_add_data_=
urb'
                           add(c67x00, urb);
                           ^~~~~~~~~~~~~~~~
   drivers/usb/c67x00/c67x00-sched.c:655:11: note: Assuming the condition i=
s true
                                  usb_pipeout(urb->pipe));
--
   39 warnings generated.
   drivers/hid/hid-roccat-pyra.c:289:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", pyra->actual_cpi);
                  ^~~~~~~~
   drivers/hid/hid-roccat-pyra.c:289:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", pyra->actual_cpi);
                  ^~~~~~~~
   drivers/hid/hid-roccat-pyra.c:306:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", settings.startup_profile=
);
                  ^~~~~~~~
   drivers/hid/hid-roccat-pyra.c:306:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", settings.startup_profile=
);
                  ^~~~~~~~
   drivers/hid/hid-roccat-pyra.c:327:9: warning: Call to function 'snprintf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'snprintf_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", info.firmware_version);
                  ^~~~~~~~
   drivers/hid/hid-roccat-pyra.c:327:9: note: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", info.firmware_version);
                  ^~~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   60 warnings generated.
   net/dns_resolver/dns_query.c:112:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(cp, type, typelen);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/dns_resolver/dns_query.c:112:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(cp, type, typelen);
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/dns_resolver/dns_query.c:116:2: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cp, name, namelen);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   net/dns_resolver/dns_query.c:116:2: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
           memcpy(cp, name, namelen);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   Suppressed 58 warnings (58 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/comedi/drivers/pcm3724.c:96:2: warning: Value stored to 'buffer_=
config' is never read [clang-analyzer-deadcode.DeadStores]
           buffer_config =3D 0;
           ^               ~
   drivers/comedi/drivers/pcm3724.c:96:2: note: Value stored to 'buffer_con=
fig' is never read
           buffer_config =3D 0;
           ^               ~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   25 warnings generated.
   drivers/mcb/mcb-parse.c:210:2: warning: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
           ^~~~~~~~
   drivers/mcb/mcb-parse.c:210:2: note: Call to function 'snprintf' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'snprintf_s' in case of C11
           snprintf(bus->name, CHAMELEON_FILENAME_LEN + 1, "%s",
           ^~~~~~~~
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
>> drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide bounding of the memory=
 buffer or security checks introduced in the C11 standard. Replace with ana=
logous functions that support length arguments or provides boundary checks =
such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Dep=
recatedOrUnsafeBufferHandling]
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:169:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide bounding of the memory bu=
ffer or security checks introduced in the C11 standard. Replace with analog=
ous functions that support length arguments or provides boundary checks suc=
h as 'sprintf_s' in case of C11
           return sprintf(buf, "%s\n", cd->version);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: warning: Call to f=
unction 'sprintf' is insecure as it does not provide security checks introd=
uced in the C11 standard. Replace with analogous functions that support len=
gth arguments or provides boundary checks such as 'sprintf_s' in case of C1=
1 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:178:9: note: Call to func=
tion 'sprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", cd->design_no);
                  ^~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: warning: Call to f=
unction 'snprintf' is insecure as it does not provide security checks intro=
duced in the C11 standard. Replace with analogous functions that support le=
ngth arguments or provides boundary checks such as 'snprintf_s' in case of =
C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   drivers/staging/fieldbus/anybuss/arcx-anybus.c:256:2: note: Call to func=
tion 'snprintf' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(cd->version, sizeof(cd->version), "%c%d",
           ^~~~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   drivers/greybus/interface.c:472:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:472:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:491:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:491:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:510:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:510:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", measurement);
                  ^~~~~~~
   drivers/greybus/interface.c:589:9: warning: Call to function 'sprintf' i=
s insecure as it does not provide bounding of the memory buffer or security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'sprintf_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           return sprintf(buf, "%s\n", gb_interface_type_string(intf));
                  ^~~~~~~
   drivers/greybus/interface.c:589:9: note: Call to function 'sprintf' is i=
nsecure as it does not provide bounding of the memory buffer or security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'sprintf_s' in=
 case of C11
           return sprintf(buf, "%s\n", gb_interface_type_string(intf));
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   net/ethtool/stats.c:122:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&data->stats, 0xff, sizeof(data->stats));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   net/ethtool/stats.c:122:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&data->stats, 0xff, sizeof(data->stats));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   37 warnings generated.
   drivers/gnss/core.c:358:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]
           return sprintf(buf, "%s\n", gnss_type_name(gdev));
                  ^~~~~~~
   drivers/gnss/core.c:358:9: note: Call to function 'sprintf' is insecure =
as it does not provide bounding of the memory buffer or security checks int=
roduced in the C11 standard. Replace with analogous functions that support =
length arguments or provides boundary checks such as 'sprintf_s' in case of=
 C11
           return sprintf(buf, "%s\n", gnss_type_name(gdev));
                  ^~~~~~~
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   36 warnings generated.
   Suppressed 36 warnings (36 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   Suppressed 38 warnings (38 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   46 warnings generated.
   Suppressed 46 warnings (46 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   90 warnings generated.
   net/sunrpc/auth.c:84:9: warning: Call to function 'sprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buffer, "%u\n", 1U << nbits);
                  ^~~~~~~
   net/sunrpc/auth.c:84:9: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           return sprintf(buffer, "%u\n", 1U << nbits);

vim +183 drivers/rtc/rtc-ds1343.c

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   82  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   83  static ssize_t ds1343_s=
how_glitchfilter(struct device *dev,
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   84  				struct device_attri=
bute *attr, char *buf)
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   85  {
580daaf43afc702 Alexandre Belloni  2019-10-19   86  	struct ds1343_priv *pr=
iv =3D dev_get_drvdata(dev->parent);
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   87  	int glitch_filt_status=
, data;
ce0fd9db653b18e Alexandre Belloni  2019-10-19   88  	int res;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   89  =

ce0fd9db653b18e Alexandre Belloni  2019-10-19   90  	res =3D regmap_read(pr=
iv->map, DS1343_CONTROL_REG, &data);
ce0fd9db653b18e Alexandre Belloni  2019-10-19   91  	if (res)
ce0fd9db653b18e Alexandre Belloni  2019-10-19   92  		return res;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   93  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   94  	glitch_filt_status =3D=
 !!(data & DS1343_EGFIL);
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   95  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   96  	if (glitch_filt_status)
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  @97  		return sprintf(buf, "=
enabled\n");
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   98  	else
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06   99  		return sprintf(buf, "=
disabled\n");
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  100  }
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  101  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  102  static ssize_t ds1343_s=
tore_glitchfilter(struct device *dev,
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  103  					struct device_attr=
ibute *attr,
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  104  					const char *buf, s=
ize_t count)
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  105  {
580daaf43afc702 Alexandre Belloni  2019-10-19  106  	struct ds1343_priv *pr=
iv =3D dev_get_drvdata(dev->parent);
ac08888b2590f69 Alexandre Belloni  2019-10-19  107  	int data =3D 0;
ac08888b2590f69 Alexandre Belloni  2019-10-19  108  	int res;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  109  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  110  	if (strncmp(buf, "enab=
led", 7) =3D=3D 0)
ac08888b2590f69 Alexandre Belloni  2019-10-19  111  		data =3D DS1343_EGFIL;
ac08888b2590f69 Alexandre Belloni  2019-10-19  112  	else if (strncmp(buf, =
"disabled", 8))
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  113  		return -EINVAL;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  114  =

ac08888b2590f69 Alexandre Belloni  2019-10-19  115  	res =3D regmap_update_=
bits(priv->map, DS1343_CONTROL_REG,
ac08888b2590f69 Alexandre Belloni  2019-10-19  116  				 DS1343_EGFIL, data=
);
ac08888b2590f69 Alexandre Belloni  2019-10-19  117  	if (res)
ac08888b2590f69 Alexandre Belloni  2019-10-19  118  		return res;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  119  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  120  	return count;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  121  }
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  122  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  123  static DEVICE_ATTR(glit=
ch_filter, S_IRUGO | S_IWUSR, ds1343_show_glitchfilter,
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  124  			ds1343_store_glitchf=
ilter);
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  125  =

d7501f709410f68 Alexandre Belloni  2018-02-12  126  static int ds1343_nvram=
_write(void *priv, unsigned int off, void *val,
d7501f709410f68 Alexandre Belloni  2018-02-12  127  			      size_t bytes)
571eb88390182b0 Raghavendra Ganiga 2014-08-08  128  {
d7501f709410f68 Alexandre Belloni  2018-02-12  129  	struct ds1343_priv *ds=
1343 =3D priv;
571eb88390182b0 Raghavendra Ganiga 2014-08-08  130  =

d7501f709410f68 Alexandre Belloni  2018-02-12  131  	return regmap_bulk_wri=
te(ds1343->map, DS1343_NVRAM + off, val, bytes);
571eb88390182b0 Raghavendra Ganiga 2014-08-08  132  }
571eb88390182b0 Raghavendra Ganiga 2014-08-08  133  =

d7501f709410f68 Alexandre Belloni  2018-02-12  134  static int ds1343_nvram=
_read(void *priv, unsigned int off, void *val,
d7501f709410f68 Alexandre Belloni  2018-02-12  135  			     size_t bytes)
571eb88390182b0 Raghavendra Ganiga 2014-08-08  136  {
d7501f709410f68 Alexandre Belloni  2018-02-12  137  	struct ds1343_priv *ds=
1343 =3D priv;
571eb88390182b0 Raghavendra Ganiga 2014-08-08  138  =

d7501f709410f68 Alexandre Belloni  2018-02-12  139  	return regmap_bulk_rea=
d(ds1343->map, DS1343_NVRAM + off, val, bytes);
571eb88390182b0 Raghavendra Ganiga 2014-08-08  140  }
571eb88390182b0 Raghavendra Ganiga 2014-08-08  141  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  142  static ssize_t ds1343_s=
how_tricklecharger(struct device *dev,
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  143  				struct device_attri=
bute *attr, char *buf)
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  144  {
580daaf43afc702 Alexandre Belloni  2019-10-19  145  	struct ds1343_priv *pr=
iv =3D dev_get_drvdata(dev->parent);
ce0fd9db653b18e Alexandre Belloni  2019-10-19  146  	int res, data;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  147  	char *diodes =3D "disa=
bled", *resistors =3D " ";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  148  =

ce0fd9db653b18e Alexandre Belloni  2019-10-19  149  	res =3D regmap_read(pr=
iv->map, DS1343_TRICKLE_REG, &data);
ce0fd9db653b18e Alexandre Belloni  2019-10-19  150  	if (res)
ce0fd9db653b18e Alexandre Belloni  2019-10-19  151  		return res;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  152  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  153  	if ((data & 0xf0) =3D=
=3D DS1343_TRICKLE_MAGIC) {
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  154  		switch (data & 0x0c) {
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  155  		case DS1343_TRICKLE_D=
S1:
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  156  			diodes =3D "one diod=
e,";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  157  			break;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  158  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  159  		default:
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  160  			diodes =3D "no diode=
,";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  161  			break;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  162  		}
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  163  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  164  		switch (data & 0x03) {
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  165  		case DS1343_TRICKLE_1=
K:
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  166  			resistors =3D "1k Oh=
m";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  167  			break;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  168  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  169  		case DS1343_TRICKLE_2=
K:
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  170  			resistors =3D "2k Oh=
m";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  171  			break;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  172  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  173  		case DS1343_TRICKLE_4=
K:
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  174  			resistors =3D "4k Oh=
m";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  175  			break;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  176  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  177  		default:
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  178  			diodes =3D "disabled=
";
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  179  			break;
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  180  		}
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  181  	}
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  182  =

1d6316f56d04a10 Raghavendra Ganiga 2014-06-06 @183  	return sprintf(buf, "%=
s %s\n", diodes, resistors);
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  184  }
1d6316f56d04a10 Raghavendra Ganiga 2014-06-06  185  =


:::::: The code at line 183 was first introduced by commit
:::::: 1d6316f56d04a10f39621088f3b672a3c5528b80 drivers/rtc: add support fo=
r maxim dallas rtc ds1343 and ds1344

:::::: TO: Raghavendra Ganiga <ravi23ganiga@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1231554035292227203==--

