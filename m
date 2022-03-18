Content-Type: multipart/mixed; boundary="===============4899371657285963674=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 2/2] acpi/pci_root: negotiate CXL _OSC
Date: Fri, 18 Mar 2022 08:33:29 +0800
Message-ID: <202203180801.eBPKbPgj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4899371657285963674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220317002704.1835870-3-vishal.l.verma@intel.com>
References: <20220317002704.1835870-3-vishal.l.verma@intel.com>
TO: Vishal Verma <vishal.l.verma@intel.com>

Hi Vishal,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on 74be98774dfbc5b8b795db726bd772e735d2edd4]

url:    https://github.com/0day-ci/linux/commits/Vishal-Verma/acpi-add-supp=
ort-for-CXL-_OSC/20220317-082840
base:   74be98774dfbc5b8b795db726bd772e735d2edd4
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
318/202203180801.eBPKbPgj-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e=
3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/8020d862c22d52b61a590343b=
2202e5d05332100
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Vishal-Verma/acpi-add-support-for-=
CXL-_OSC/20220317-082840
        git checkout 8020d862c22d52b61a590343b2202e5d05332100
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/mfd/wm831x-irq.c:517:7: note: 'primary' is equal to 8192
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/mfd/wm831x-irq.c:517:7: note: Left side of '&&' is true
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^
   drivers/mfd/wm831x-irq.c:517:3: note: '?' condition is false
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/mfd/wm831x-irq.c:517:3: note: Taking false branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mfd/wm831x-irq.c:528:7: note: 'primary' is equal to 8192
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mfd/wm831x-irq.c:528:7: note: Left side of '&&' is true
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^
   drivers/mfd/wm831x-irq.c:528:3: note: Assuming the condition is false
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/mfd/wm831x-irq.c:528:3: note: '?' condition is false
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/mfd/wm831x-irq.c:528:7: note: 'primary' is equal to 8192
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/mfd/wm831x-irq.c:528:7: note: Left side of '&&' is true
                   if (primary =3D=3D WM831X_GP_INT &&
                       ^
   drivers/mfd/wm831x-irq.c:528:3: note: '?' condition is true
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/mfd/wm831x-irq.c:528:3: note: Taking true branch
                   if (primary =3D=3D WM831X_GP_INT &&
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/mfd/wm831x-irq.c:531:21: note: The result of the left shift is u=
ndefined due to shifting by '4294967295', which is greater or equal to the =
width of type 'int'
                           while (!(ret & 1 << (i - WM831X_IRQ_GPIO_1))) {
                                            ^  ~~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.
>> drivers/acpi/pci_root.c:283:17: warning: Assigned value is garbage or un=
defined [clang-analyzer-core.uninitialized.Assign]
                           *cxl_control =3D cxl_result;
                                        ^
   drivers/acpi/pci_root.c:428:6: note: Assuming 'mask' is non-null
           if (!mask)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/acpi/pci_root.c:428:2: note: '?' condition is false
           if (!mask)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:428:7: note: 'mask' is non-null
           if (!mask)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/acpi/pci_root.c:428:2: note: '?' condition is false
           if (!mask)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:428:2: note: Taking false branch
           if (!mask)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:432:6: note: Assuming 'root' is non-null
           if (!root)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/acpi/pci_root.c:432:2: note: '?' condition is false
           if (!root)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:432:7: note: 'root' is non-null
           if (!root)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/acpi/pci_root.c:432:2: note: '?' condition is false
           if (!root)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:432:2: note: Taking false branch
           if (!root)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:438:2: note: '?' condition is false
           if (is_cxl(root)) {
--
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:447:3: note: Taking false branch
                   if (ACPI_FAILURE(status))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:449:3: note: '?' condition is false
                   if (is_cxl(root)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:449:3: note: '?' condition is false
                   if (is_cxl(root)) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:449:3: note: Taking false branch
                   if (is_cxl(root)) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:455:8: note: Assuming the condition is true
                           if (ctrl =3D=3D *mask)
                               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/acpi/pci_root.c:455:4: note: '?' condition is false
                           if (ctrl =3D=3D *mask)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:455:4: note: '?' condition is true
                           if (ctrl =3D=3D *mask)
                           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:455:4: note: Taking true branch
                           if (ctrl =3D=3D *mask)
                           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:456:5: note:  Execution continues on line 465
                                   break;
                                   ^
   drivers/acpi/pci_root.c:465:7: note: Assuming the condition is true
           if (((root->osc_control_set & ctrl) =3D=3D ctrl) &&
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/acpi/pci_root.c:465:6: note: Left side of '&&' is true
           if (((root->osc_control_set & ctrl) =3D=3D ctrl) &&
               ^
   drivers/acpi/pci_root.c:466:34: note: The right operand of '&' is a garb=
age value
               ((root->cxl_osc_control_set & cxl_ctrl) =3D=3D cxl_ctrl))
                                           ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
>> drivers/acpi/pci_root.c:564:2: warning: Undefined or garbage value retur=
ned to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return control;
           ^
   drivers/acpi/pci_root.c:598:2: note: Assuming 'x86_apple_machine' is fal=
se
           if (x86_apple_machine) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/acpi/pci_root.c:598:2: note: '?' condition is false
           if (x86_apple_machine) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:598:6: note: 'x86_apple_machine' is false
           if (x86_apple_machine) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/acpi/pci_root.c:598:2: note: '?' condition is false
           if (x86_apple_machine) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:598:2: note: Taking false branch
           if (x86_apple_machine) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:609:2: note: '?' condition is false
           if (os_control_query_checks(root, support))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:609:2: note: '?' condition is false
           if (os_control_query_checks(root, support))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:609:2: note: Taking false branch
           if (os_control_query_checks(root, support))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/acpi/pci_root.c:612:2: note: '?' condition is false
           if (is_cxl(root)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/acpi/pci_root.c:612:2: note: '?' condition is true
           if (is_cxl(root)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/acpi/pci_root.c:612:2: note: Taking true branch
           if (is_cxl(root)) {

vim +283 drivers/acpi/pci_root.c

63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  256  =

8020d862c22d52 Vishal Verma      2022-03-16  257  static acpi_status acpi_p=
ci_query_osc(struct acpi_pci_root *root, u32 support,
8020d862c22d52 Vishal Verma      2022-03-16  258  				      u32 *control, u=
32 cxl_support,
8020d862c22d52 Vishal Verma      2022-03-16  259  				      u32 *cxl_contro=
l)
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  260  {
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  261  	acpi_status status;
8020d862c22d52 Vishal Verma      2022-03-16  262  	u32 pci_result, cxl_resu=
lt, capbuf[8];
ab8e8957a2ae21 Rafael J. Wysocki 2010-08-21  263  =

ab8e8957a2ae21 Rafael J. Wysocki 2010-08-21  264  	support |=3D root->osc_s=
upport_set;
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  265  =

b938a229c85a56 Bjorn Helgaas     2013-09-05  266  	capbuf[OSC_QUERY_DWORD] =
=3D OSC_QUERY_ENABLE;
b938a229c85a56 Bjorn Helgaas     2013-09-05  267  	capbuf[OSC_SUPPORT_DWORD=
] =3D support;
b938a229c85a56 Bjorn Helgaas     2013-09-05  268  	capbuf[OSC_CONTROL_DWORD=
] =3D *control | root->osc_control_set;
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  269  =

8020d862c22d52 Vishal Verma      2022-03-16  270  	if (is_cxl(root)) {
8020d862c22d52 Vishal Verma      2022-03-16  271  		cxl_support |=3D root->=
cxl_osc_support_set;
8020d862c22d52 Vishal Verma      2022-03-16  272  		capbuf[OSC_CXL_SUPPORT_=
DWORD] =3D cxl_support;
8020d862c22d52 Vishal Verma      2022-03-16  273  		capbuf[OSC_CXL_CONTROL_=
DWORD] =3D *cxl_control | root->cxl_osc_control_set;
8020d862c22d52 Vishal Verma      2022-03-16  274  	}
8020d862c22d52 Vishal Verma      2022-03-16  275  =

53da48751c13ff Dan Williams      2022-03-16  276  retry:
8020d862c22d52 Vishal Verma      2022-03-16  277  	status =3D acpi_pci_run_=
osc(root, capbuf, &pci_result, &cxl_result);
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  278  	if (ACPI_SUCCESS(status)=
) {
ab8e8957a2ae21 Rafael J. Wysocki 2010-08-21  279  		root->osc_support_set =
=3D support;
8020d862c22d52 Vishal Verma      2022-03-16  280  		*control =3D pci_result;
8020d862c22d52 Vishal Verma      2022-03-16  281  		if (is_cxl(root)) {
8020d862c22d52 Vishal Verma      2022-03-16  282  			root->cxl_osc_support_=
set =3D cxl_support;
8020d862c22d52 Vishal Verma      2022-03-16 @283  			*cxl_control =3D cxl_r=
esult;
8020d862c22d52 Vishal Verma      2022-03-16  284  		}
53da48751c13ff Dan Williams      2022-03-16  285  	} else if (is_cxl(root))=
 {
53da48751c13ff Dan Williams      2022-03-16  286  		/*
53da48751c13ff Dan Williams      2022-03-16  287  		 * CXL _OSC is optional=
 on CXL 1.1 hosts. Fall back to PCIe _OSC
53da48751c13ff Dan Williams      2022-03-16  288  		 * upon any failure usi=
ng CXL _OSC.
53da48751c13ff Dan Williams      2022-03-16  289  		 */
53da48751c13ff Dan Williams      2022-03-16  290  		root->cxl_osc_disable =
=3D true;
53da48751c13ff Dan Williams      2022-03-16  291  		goto retry;
ab8e8957a2ae21 Rafael J. Wysocki 2010-08-21  292  	}
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  293  	return status;
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  294  }
63f10f0f6df4e4 Kenji Kaneshige   2009-02-09  295  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4899371657285963674==--

