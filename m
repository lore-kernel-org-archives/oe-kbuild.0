Content-Type: multipart/mixed; boundary="===============5885999656678804212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.18.y-rt-rebase 17/78] drivers/tty/serial/8250/8250_port.c:1047:20: warning: Value stored to 'port' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 01 May 2022 22:17:41 +0800
Message-ID: <202205012230.hlek904W-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5885999656678804212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.18.y-rt-rebase
head:   09785bc060d1469b0991de26d21a7fd67ca3532c
commit: 4a3bd8aca2d6d6c09ea11aafa780e6b68d76fc2d [17/78] serial: 8250: impl=
ement write_atomic
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20501/202205012230.hlek904W-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 400775=
649969b9baf3bc2a510266e7912bb16ae9)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3D4a3bd8aca2d6d6c09ea11aafa780e6b68d76fc2d
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.18.y-rt-rebase
        git checkout 4a3bd8aca2d6d6c09ea11aafa780e6b68d76fc2d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/tty/serial/8250/8250_port.c:3225:6: note: Assuming field 'iotype=
' is equal to field 'cur_iotype'
           if (port->iotype !=3D up->cur_iotype)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3225:2: note: Taking false branch
           if (port->iotype !=3D up->cur_iotype)
           ^
   drivers/tty/serial/8250/8250_port.c:3228:6: note: Assuming the condition=
 is false
           if (flags & UART_CONFIG_TYPE)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3228:2: note: Taking false branch
           if (flags & UART_CONFIG_TYPE)
           ^
   drivers/tty/serial/8250/8250_port.c:3231:6: note: Assuming the condition=
 is false
           if (port->rs485.flags & SER_RS485_ENABLED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3231:2: note: Taking false branch
           if (port->rs485.flags & SER_RS485_ENABLED)
           ^
   drivers/tty/serial/8250/8250_port.c:3235:6: note: Assuming field 'type' =
is not equal to PORT_16550A
           if (port->type =3D=3D PORT_16550A && port->iotype =3D=3D UPIO_AU)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3235:32: note: Left side of '&&' is =
false
           if (port->type =3D=3D PORT_16550A && port->iotype =3D=3D UPIO_AU)
                                         ^
   drivers/tty/serial/8250/8250_port.c:3239:6: note: Assuming field 'type' =
is not equal to PORT_TEGRA
           if (port->type =3D=3D PORT_TEGRA)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3239:2: note: Taking false branch
           if (port->type =3D=3D PORT_TEGRA)
           ^
   drivers/tty/serial/8250/8250_port.c:3242:6: note: Assuming field 'type' =
is not equal to PORT_UNKNOWN
           if (port->type !=3D PORT_UNKNOWN && flags & UART_CONFIG_IRQ)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3242:6: note: Left side of '&&' is t=
rue
   drivers/tty/serial/8250/8250_port.c:3242:36: note: Assuming the conditio=
n is true
           if (port->type !=3D PORT_UNKNOWN && flags & UART_CONFIG_IRQ)
                                             ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:3242:2: note: Taking true branch
           if (port->type !=3D PORT_UNKNOWN && flags & UART_CONFIG_IRQ)
           ^
   drivers/tty/serial/8250/8250_port.c:3243:3: note: Calling 'autoconfig_ir=
q'
                   autoconfig_irq(up);
                   ^~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:1414:6: note: Assuming the condition=
 is true
           if (port->flags & UPF_FOURPORT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:1414:2: note: Taking true branch
           if (port->flags & UPF_FOURPORT) {
           ^
   drivers/tty/serial/8250/8250_port.c:1416:14: note: Calling 'inb_p'
                   save_ICP =3D inb_p(ICP);
                              ^
   arch/x86/include/asm/io.h:325:15: note: expanded from macro 'inb_p'
   #define inb_p inb_p
                 ^
   arch/x86/include/asm/io.h:318:1: note: Calling 'slow_down_io'
   BUILDIO(b, b, char)
   ^
   arch/x86/include/asm/io.h:282:2: note: expanded from macro 'BUILDIO'
           slow_down_io();                                                 \
           ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt.h:55:2: note: Assigned value is garbage or=
 undefined
           PVOP_VCALL0(cpu.io_delay);
           ^
   arch/x86/include/asm/paravirt_types.h:511:2: note: expanded from macro '=
PVOP_VCALL0'
           __PVOP_VCALL(op)
           ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:491:8: note: expanded from macro '=
__PVOP_VCALL'
           (void)____PVOP_CALL(, op, CLBR_ANY, PVOP_VCALL_CLOBBERS,        \
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:446:3: note: expanded from macro '=
____PVOP_CALL'
                   PVOP_CALL_ARGS;                                         \
                   ^~~~~~~~~~~~~~
   arch/x86/include/asm/paravirt_types.h:404:16: note: expanded from macro =
'PVOP_CALL_ARGS'
           unsigned long __edi =3D __edi, __esi =3D __esi,             \
                         ^       ~~~~~
   drivers/tty/serial/8250/8250_port.c:695:2: warning: Call to function 'me=
mset' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memset_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rs485->padding, 0, sizeof(rs485->padding));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:695:2: note: Call to function 'memse=
t' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memset_s' in case of C11
           memset(rs485->padding, 0, sizeof(rs485->padding));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_port.c:1047:20: warning: Value stored to 'p=
ort' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct uart_port *port =3D &up->port;
                             ^~~~   ~~~~~~~~~
   drivers/tty/serial/8250/8250_port.c:1047:20: note: Value stored to 'port=
' during its initialization is never read
           struct uart_port *port =3D &up->port;
                             ^~~~   ~~~~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   fs/dlm/lockspace.c:75:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", ls->ls_global_id);
                  ^~~~~~~~
   fs/dlm/lockspace.c:75:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", ls->ls_global_id);
                  ^~~~~~~~
   fs/dlm/lockspace.c:89:9: warning: Call to function 'snprintf' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%u\n", dlm_no_directory(ls));
                  ^~~~~~~~
   fs/dlm/lockspace.c:89:9: note: Call to function 'snprintf' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%u\n", dlm_no_directory(ls));
                  ^~~~~~~~
   fs/dlm/lockspace.c:107:9: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%x\n", status);
                  ^~~~~~~~
   fs/dlm/lockspace.c:107:9: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%x\n", status);
                  ^~~~~~~~
   fs/dlm/lockspace.c:112:9: warning: Call to function 'snprintf' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(buf, PAGE_SIZE, "%d\n", ls->ls_recover_nodeid);
                  ^~~~~~~~
   fs/dlm/lockspace.c:112:9: note: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11
           return snprintf(buf, PAGE_SIZE, "%d\n", ls->ls_recover_nodeid);
                  ^~~~~~~~
   fs/dlm/lockspace.c:480:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ls->ls_name, name, namelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/dlm/lockspace.c:480:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(ls->ls_name, name, namelen);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   fs/dlm/lockspace.c:543:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&ls->ls_stub_rsb, 0, sizeof(struct dlm_rsb));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   fs/dlm/lockspace.c:543:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(&ls->ls_stub_rsb, 0, sizeof(struct dlm_rsb));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 21 warnings (21 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   22 warnings generated.
   arch/x86/crypto/cast6_avx_glue.c:53:2: warning: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer=
-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           CBC_ENC_BLOCK(__cast6_encrypt);
           ^
   arch/x86/crypto/ecb_cbc_helpers.h:52:2: note: expanded from macro 'CBC_E=
NC_BLOCK'
           memcpy(walk.iv, __iv, __bsize);                                 \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy

vim +/port +1047 drivers/tty/serial/8250/8250_port.c

b6830f6df8914f Peter Hurley   2015-06-27  1038  =

b6830f6df8914f Peter Hurley   2015-06-27  1039  /*
b6830f6df8914f Peter Hurley   2015-06-27  1040   * We know that the chip ha=
s FIFOs.  Does it have an EFR?  The
b6830f6df8914f Peter Hurley   2015-06-27  1041   * EFR is located in the sa=
me register position as the IIR and
b6830f6df8914f Peter Hurley   2015-06-27  1042   * we know the top two bits=
 of the IIR are currently set.  The
b6830f6df8914f Peter Hurley   2015-06-27  1043   * EFR should contain zero.=
  Try to read the EFR.
b6830f6df8914f Peter Hurley   2015-06-27  1044   */
b6830f6df8914f Peter Hurley   2015-06-27  1045  static void autoconfig_1655=
0a(struct uart_8250_port *up)
b6830f6df8914f Peter Hurley   2015-06-27  1046  {
4a3bd8aca2d6d6 John Ogness    2022-02-04 @1047  	struct uart_port *port =3D=
 &up->port;
b6830f6df8914f Peter Hurley   2015-06-27  1048  	unsigned char status1, sta=
tus2;
b6830f6df8914f Peter Hurley   2015-06-27  1049  	unsigned int iersave;
4a3bd8aca2d6d6 John Ogness    2022-02-04  1050  	unsigned long flags;
4a3bd8aca2d6d6 John Ogness    2022-02-04  1051  	bool is_console;
b6830f6df8914f Peter Hurley   2015-06-27  1052  =

b6830f6df8914f Peter Hurley   2015-06-27  1053  	up->port.type =3D PORT_165=
50A;
b6830f6df8914f Peter Hurley   2015-06-27  1054  	up->capabilities |=3D UART=
_CAP_FIFO;
b6830f6df8914f Peter Hurley   2015-06-27  1055  =

dc56ecb81a0aa4 Josh Triplett  2020-01-10  1056  	if (!IS_ENABLED(CONFIG_SER=
IAL_8250_16550A_VARIANTS))
dc56ecb81a0aa4 Josh Triplett  2020-01-10  1057  		return;
dc56ecb81a0aa4 Josh Triplett  2020-01-10  1058  =

b6830f6df8914f Peter Hurley   2015-06-27  1059  	/*
b6830f6df8914f Peter Hurley   2015-06-27  1060  	 * Check for presence of t=
he EFR when DLAB is set.
b6830f6df8914f Peter Hurley   2015-06-27  1061  	 * Only ST16C650V1 UARTs p=
ass this test.
b6830f6df8914f Peter Hurley   2015-06-27  1062  	 */
b6830f6df8914f Peter Hurley   2015-06-27  1063  	serial_out(up, UART_LCR, U=
ART_LCR_CONF_MODE_A);
b6830f6df8914f Peter Hurley   2015-06-27  1064  	if (serial_in(up, UART_EFR=
) =3D=3D 0) {
b6830f6df8914f Peter Hurley   2015-06-27  1065  		serial_out(up, UART_EFR, =
0xA8);
b6830f6df8914f Peter Hurley   2015-06-27  1066  		if (serial_in(up, UART_EF=
R) !=3D 0) {
b6830f6df8914f Peter Hurley   2015-06-27  1067  			DEBUG_AUTOCONF("EFRv1 ");
b6830f6df8914f Peter Hurley   2015-06-27  1068  			up->port.type =3D PORT_1=
6650;
b6830f6df8914f Peter Hurley   2015-06-27  1069  			up->capabilities |=3D UA=
RT_CAP_EFR | UART_CAP_SLEEP;
b6830f6df8914f Peter Hurley   2015-06-27  1070  		} else {
b6830f6df8914f Peter Hurley   2015-06-27  1071  			serial_out(up, UART_LCR,=
 0);
b6830f6df8914f Peter Hurley   2015-06-27  1072  			serial_out(up, UART_FCR,=
 UART_FCR_ENABLE_FIFO |
b6830f6df8914f Peter Hurley   2015-06-27  1073  				   UART_FCR7_64BYTE);
b6830f6df8914f Peter Hurley   2015-06-27  1074  			status1 =3D serial_in(up=
, UART_IIR) >> 5;
b6830f6df8914f Peter Hurley   2015-06-27  1075  			serial_out(up, UART_FCR,=
 0);
b6830f6df8914f Peter Hurley   2015-06-27  1076  			serial_out(up, UART_LCR,=
 0);
b6830f6df8914f Peter Hurley   2015-06-27  1077  =

b6830f6df8914f Peter Hurley   2015-06-27  1078  			if (status1 =3D=3D 7)
b6830f6df8914f Peter Hurley   2015-06-27  1079  				up->port.type =3D PORT_=
16550A_FSL64;
b6830f6df8914f Peter Hurley   2015-06-27  1080  			else
b6830f6df8914f Peter Hurley   2015-06-27  1081  				DEBUG_AUTOCONF("Motorol=
a 8xxx DUART ");
b6830f6df8914f Peter Hurley   2015-06-27  1082  		}
b6830f6df8914f Peter Hurley   2015-06-27  1083  		serial_out(up, UART_EFR, =
0);
b6830f6df8914f Peter Hurley   2015-06-27  1084  		return;
b6830f6df8914f Peter Hurley   2015-06-27  1085  	}
b6830f6df8914f Peter Hurley   2015-06-27  1086  =

b6830f6df8914f Peter Hurley   2015-06-27  1087  	/*
b6830f6df8914f Peter Hurley   2015-06-27  1088  	 * Maybe it requires 0xbf =
to be written to the LCR.
b6830f6df8914f Peter Hurley   2015-06-27  1089  	 * (other ST16C650V2 UARTs=
, TI16C752A, etc)
b6830f6df8914f Peter Hurley   2015-06-27  1090  	 */
b6830f6df8914f Peter Hurley   2015-06-27  1091  	serial_out(up, UART_LCR, U=
ART_LCR_CONF_MODE_B);
b6830f6df8914f Peter Hurley   2015-06-27  1092  	if (serial_in(up, UART_EFR=
) =3D=3D 0 && !broken_efr(up)) {
b6830f6df8914f Peter Hurley   2015-06-27  1093  		DEBUG_AUTOCONF("EFRv2 ");
b6830f6df8914f Peter Hurley   2015-06-27  1094  		autoconfig_has_efr(up);
b6830f6df8914f Peter Hurley   2015-06-27  1095  		return;
b6830f6df8914f Peter Hurley   2015-06-27  1096  	}
b6830f6df8914f Peter Hurley   2015-06-27  1097  =

b6830f6df8914f Peter Hurley   2015-06-27  1098  	/*
b6830f6df8914f Peter Hurley   2015-06-27  1099  	 * Check for a National Se=
miconductor SuperIO chip.
b6830f6df8914f Peter Hurley   2015-06-27  1100  	 * Attempt to switch to ba=
nk 2, read the value of the LOOP bit
b6830f6df8914f Peter Hurley   2015-06-27  1101  	 * from EXCR1. Switch back=
 to bank 0, change it in MCR. Then
b6830f6df8914f Peter Hurley   2015-06-27  1102  	 * switch back to bank 2, =
read it from EXCR1 again and check
b6830f6df8914f Peter Hurley   2015-06-27  1103  	 * it's changed. If so, se=
t baud_base in EXCR2 to 921600. -- dwmw2
b6830f6df8914f Peter Hurley   2015-06-27  1104  	 */
b6830f6df8914f Peter Hurley   2015-06-27  1105  	serial_out(up, UART_LCR, 0=
);
36fd95b17e9c1c Yegor Yefremov 2016-05-31  1106  	status1 =3D serial8250_in_=
MCR(up);
b6830f6df8914f Peter Hurley   2015-06-27  1107  	serial_out(up, UART_LCR, 0=
xE0);
b6830f6df8914f Peter Hurley   2015-06-27  1108  	status2 =3D serial_in(up, =
0x02); /* EXCR1 */
b6830f6df8914f Peter Hurley   2015-06-27  1109  =

b6830f6df8914f Peter Hurley   2015-06-27  1110  	if (!((status2 ^ status1) =
& UART_MCR_LOOP)) {
b6830f6df8914f Peter Hurley   2015-06-27  1111  		serial_out(up, UART_LCR, =
0);
36fd95b17e9c1c Yegor Yefremov 2016-05-31  1112  		serial8250_out_MCR(up, st=
atus1 ^ UART_MCR_LOOP);
b6830f6df8914f Peter Hurley   2015-06-27  1113  		serial_out(up, UART_LCR, =
0xE0);
b6830f6df8914f Peter Hurley   2015-06-27  1114  		status2 =3D serial_in(up,=
 0x02); /* EXCR1 */
b6830f6df8914f Peter Hurley   2015-06-27  1115  		serial_out(up, UART_LCR, =
0);
36fd95b17e9c1c Yegor Yefremov 2016-05-31  1116  		serial8250_out_MCR(up, st=
atus1);
b6830f6df8914f Peter Hurley   2015-06-27  1117  =

b6830f6df8914f Peter Hurley   2015-06-27  1118  		if ((status2 ^ status1) &=
 UART_MCR_LOOP) {
b6830f6df8914f Peter Hurley   2015-06-27  1119  			unsigned short quot;
b6830f6df8914f Peter Hurley   2015-06-27  1120  =

b6830f6df8914f Peter Hurley   2015-06-27  1121  			serial_out(up, UART_LCR,=
 0xE0);
b6830f6df8914f Peter Hurley   2015-06-27  1122  =

b6830f6df8914f Peter Hurley   2015-06-27  1123  			quot =3D serial_dl_read(=
up);
b6830f6df8914f Peter Hurley   2015-06-27  1124  			quot <<=3D 3;
b6830f6df8914f Peter Hurley   2015-06-27  1125  =

b6830f6df8914f Peter Hurley   2015-06-27  1126  			if (ns16550a_goto_highsp=
eed(up))
b6830f6df8914f Peter Hurley   2015-06-27  1127  				serial_dl_write(up, quo=
t);
b6830f6df8914f Peter Hurley   2015-06-27  1128  =

b6830f6df8914f Peter Hurley   2015-06-27  1129  			serial_out(up, UART_LCR,=
 0);
b6830f6df8914f Peter Hurley   2015-06-27  1130  =

b6830f6df8914f Peter Hurley   2015-06-27  1131  			up->port.uartclk =3D 921=
600*16;
b6830f6df8914f Peter Hurley   2015-06-27  1132  			up->port.type =3D PORT_N=
S16550A;
b6830f6df8914f Peter Hurley   2015-06-27  1133  			up->capabilities |=3D UA=
RT_NATSEMI;
b6830f6df8914f Peter Hurley   2015-06-27  1134  			return;
b6830f6df8914f Peter Hurley   2015-06-27  1135  		}
b6830f6df8914f Peter Hurley   2015-06-27  1136  	}
b6830f6df8914f Peter Hurley   2015-06-27  1137  =

b6830f6df8914f Peter Hurley   2015-06-27  1138  	/*
b6830f6df8914f Peter Hurley   2015-06-27  1139  	 * No EFR.  Try to detect =
a TI16750, which only sets bit 5 of
b6830f6df8914f Peter Hurley   2015-06-27  1140  	 * the IIR when 64 byte FI=
FO mode is enabled when DLAB is set.
b6830f6df8914f Peter Hurley   2015-06-27  1141  	 * Try setting it with and=
 without DLAB set.  Cheap clones
b6830f6df8914f Peter Hurley   2015-06-27  1142  	 * set bit 5 without DLAB =
set.
b6830f6df8914f Peter Hurley   2015-06-27  1143  	 */
b6830f6df8914f Peter Hurley   2015-06-27  1144  	serial_out(up, UART_LCR, 0=
);
b6830f6df8914f Peter Hurley   2015-06-27  1145  	serial_out(up, UART_FCR, U=
ART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
b6830f6df8914f Peter Hurley   2015-06-27  1146  	status1 =3D serial_in(up, =
UART_IIR) >> 5;
b6830f6df8914f Peter Hurley   2015-06-27  1147  	serial_out(up, UART_FCR, U=
ART_FCR_ENABLE_FIFO);
b6830f6df8914f Peter Hurley   2015-06-27  1148  	serial_out(up, UART_LCR, U=
ART_LCR_CONF_MODE_A);
b6830f6df8914f Peter Hurley   2015-06-27  1149  	serial_out(up, UART_FCR, U=
ART_FCR_ENABLE_FIFO | UART_FCR7_64BYTE);
b6830f6df8914f Peter Hurley   2015-06-27  1150  	status2 =3D serial_in(up, =
UART_IIR) >> 5;
b6830f6df8914f Peter Hurley   2015-06-27  1151  	serial_out(up, UART_FCR, U=
ART_FCR_ENABLE_FIFO);
b6830f6df8914f Peter Hurley   2015-06-27  1152  	serial_out(up, UART_LCR, 0=
);
b6830f6df8914f Peter Hurley   2015-06-27  1153  =

b6830f6df8914f Peter Hurley   2015-06-27  1154  	DEBUG_AUTOCONF("iir1=3D%d =
iir2=3D%d ", status1, status2);
b6830f6df8914f Peter Hurley   2015-06-27  1155  =

b6830f6df8914f Peter Hurley   2015-06-27  1156  	if (status1 =3D=3D 6 && st=
atus2 =3D=3D 7) {
b6830f6df8914f Peter Hurley   2015-06-27  1157  		up->port.type =3D PORT_16=
750;
b6830f6df8914f Peter Hurley   2015-06-27  1158  		up->capabilities |=3D UAR=
T_CAP_AFE | UART_CAP_SLEEP;
b6830f6df8914f Peter Hurley   2015-06-27  1159  		return;
b6830f6df8914f Peter Hurley   2015-06-27  1160  	}
b6830f6df8914f Peter Hurley   2015-06-27  1161  =

4a3bd8aca2d6d6 John Ogness    2022-02-04  1162  	is_console =3D uart_consol=
e(port);
4a3bd8aca2d6d6 John Ogness    2022-02-04  1163  =

4a3bd8aca2d6d6 John Ogness    2022-02-04  1164  	if (is_console)
4a3bd8aca2d6d6 John Ogness    2022-02-04  1165  		printk_cpu_sync_get_irqsa=
ve(flags);
4a3bd8aca2d6d6 John Ogness    2022-02-04  1166  =

b6830f6df8914f Peter Hurley   2015-06-27  1167  	/*
b6830f6df8914f Peter Hurley   2015-06-27  1168  	 * Try writing and reading=
 the UART_IER_UUE bit (b6).
b6830f6df8914f Peter Hurley   2015-06-27  1169  	 * If it works, this is pr=
obably one of the Xscale platform's
b6830f6df8914f Peter Hurley   2015-06-27  1170  	 * internal UARTs.
b6830f6df8914f Peter Hurley   2015-06-27  1171  	 * We're going to explicit=
ly set the UUE bit to 0 before
b6830f6df8914f Peter Hurley   2015-06-27  1172  	 * trying to write and rea=
d a 1 just to make sure it's not
b6830f6df8914f Peter Hurley   2015-06-27  1173  	 * already a 1 and maybe l=
ocked there before we even start start.
b6830f6df8914f Peter Hurley   2015-06-27  1174  	 */
b6830f6df8914f Peter Hurley   2015-06-27  1175  	iersave =3D serial_in(up, =
UART_IER);
b6830f6df8914f Peter Hurley   2015-06-27  1176  	serial_out(up, UART_IER, i=
ersave & ~UART_IER_UUE);
b6830f6df8914f Peter Hurley   2015-06-27  1177  	if (!(serial_in(up, UART_I=
ER) & UART_IER_UUE)) {
b6830f6df8914f Peter Hurley   2015-06-27  1178  		/*
b6830f6df8914f Peter Hurley   2015-06-27  1179  		 * OK it's in a known zer=
o state, try writing and reading
b6830f6df8914f Peter Hurley   2015-06-27  1180  		 * without disturbing the=
 current state of the other bits.
b6830f6df8914f Peter Hurley   2015-06-27  1181  		 */
b6830f6df8914f Peter Hurley   2015-06-27  1182  		serial_out(up, UART_IER, =
iersave | UART_IER_UUE);
b6830f6df8914f Peter Hurley   2015-06-27  1183  		if (serial_in(up, UART_IE=
R) & UART_IER_UUE) {
b6830f6df8914f Peter Hurley   2015-06-27  1184  			/*
b6830f6df8914f Peter Hurley   2015-06-27  1185  			 * It's an Xscale.
b6830f6df8914f Peter Hurley   2015-06-27  1186  			 * We'll leave the UART_=
IER_UUE bit set to 1 (enabled).
b6830f6df8914f Peter Hurley   2015-06-27  1187  			 */
b6830f6df8914f Peter Hurley   2015-06-27  1188  			DEBUG_AUTOCONF("Xscale "=
);
b6830f6df8914f Peter Hurley   2015-06-27  1189  			up->port.type =3D PORT_X=
SCALE;
b6830f6df8914f Peter Hurley   2015-06-27  1190  			up->capabilities |=3D UA=
RT_CAP_UUE | UART_CAP_RTOIE;
b6830f6df8914f Peter Hurley   2015-06-27  1191  			return;
b6830f6df8914f Peter Hurley   2015-06-27  1192  		}
b6830f6df8914f Peter Hurley   2015-06-27  1193  	} else {
b6830f6df8914f Peter Hurley   2015-06-27  1194  		/*
b6830f6df8914f Peter Hurley   2015-06-27  1195  		 * If we got here we coul=
dn't force the IER_UUE bit to 0.
b6830f6df8914f Peter Hurley   2015-06-27  1196  		 * Log it and continue.
b6830f6df8914f Peter Hurley   2015-06-27  1197  		 */
b6830f6df8914f Peter Hurley   2015-06-27  1198  		DEBUG_AUTOCONF("Couldn't =
force IER_UUE to 0 ");
b6830f6df8914f Peter Hurley   2015-06-27  1199  	}
b6830f6df8914f Peter Hurley   2015-06-27  1200  	serial_out(up, UART_IER, i=
ersave);
b6830f6df8914f Peter Hurley   2015-06-27  1201  =

4a3bd8aca2d6d6 John Ogness    2022-02-04  1202  	if (is_console)
4a3bd8aca2d6d6 John Ogness    2022-02-04  1203  		printk_cpu_sync_put_irqre=
store(flags);
4a3bd8aca2d6d6 John Ogness    2022-02-04  1204  =

b6830f6df8914f Peter Hurley   2015-06-27  1205  	/*
b6830f6df8914f Peter Hurley   2015-06-27  1206  	 * We distinguish between =
16550A and U6 16550A by counting
b6830f6df8914f Peter Hurley   2015-06-27  1207  	 * how many bytes are in t=
he FIFO.
b6830f6df8914f Peter Hurley   2015-06-27  1208  	 */
b6830f6df8914f Peter Hurley   2015-06-27  1209  	if (up->port.type =3D=3D P=
ORT_16550A && size_fifo(up) =3D=3D 64) {
b6830f6df8914f Peter Hurley   2015-06-27  1210  		up->port.type =3D PORT_U6=
_16550A;
b6830f6df8914f Peter Hurley   2015-06-27  1211  		up->capabilities |=3D UAR=
T_CAP_AFE;
b6830f6df8914f Peter Hurley   2015-06-27  1212  	}
b6830f6df8914f Peter Hurley   2015-06-27  1213  }
b6830f6df8914f Peter Hurley   2015-06-27  1214  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5885999656678804212==--

