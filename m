Content-Type: multipart/mixed; boundary="===============6608698891756748523=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 11110/11953] drivers/staging/greybus/arche-apb-ctrl.c:302:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length a...
Date: Sun, 13 Mar 2022 20:11:12 +0800
Message-ID: <202203132012.ONDYfgVm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6608698891756748523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   71941773e143369a73c9c4a3b62fbb60736a1182
commit: 6992f0b3f0fd879b31095263986ba1aedb27c83b [11110/11953] Kbuild: move=
 to -std=3Dgnu11
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-c006-20220313 (https://download.01.org/0day-ci/arc=
hive/20220313/202203132012.ONDYfgVm-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb=
2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D6992f0b3f0fd879b31095263986ba1aedb27c83b
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6992f0b3f0fd879b31095263986ba1aedb27c83b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:882:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   show_tol_temp(target_temp)
   ^
   drivers/hwmon/w83627ehf.c:878:9: note: expanded from macro 'show_tol_tem=
p'
           return sprintf(buf, "%d\n", data->reg[nr] * 1000); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:988:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_start_output, W83627EHF_REG_FAN_START_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:988:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_start_output, W83627EHF_REG_FAN_START_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:989:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_stop_output, W83627EHF_REG_FAN_STOP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:989:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_stop_output, W83627EHF_REG_FAN_STOP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:990:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_max_output, data->REG_FAN_MAX_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:990:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_max_output, data->REG_FAN_MAX_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:991:1: warning: Call to function 'sprintf' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_functions(fan_step_output, data->REG_FAN_STEP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:991:1: note: Call to function 'sprintf' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'sprintf_s' in case of C11
   fan_functions(fan_step_output, data->REG_FAN_STEP_OUTPUT)
   ^
   drivers/hwmon/w83627ehf.c:965:9: note: expanded from macro 'fan_function=
s'
           return sprintf(buf, "%d\n", data->reg[nr]); \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1027:1: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   fan_time_functions(fan_stop_time, W83627EHF_REG_FAN_STOP_TIME)
   ^
   drivers/hwmon/w83627ehf.c:1001:9: note: expanded from macro 'fan_time_fu=
nctions'
           return sprintf(buf, "%d\n", \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1027:1: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
   fan_time_functions(fan_stop_time, W83627EHF_REG_FAN_STOP_TIME)
   ^
   drivers/hwmon/w83627ehf.c:1001:9: note: expanded from macro 'fan_time_fu=
nctions'
           return sprintf(buf, "%d\n", \
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1082:9: warning: Call to function 'sprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   drivers/hwmon/w83627ehf.c:1082:9: note: Call to function 'sprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
                  ^~~~~~~
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   drivers/pinctrl/devicetree.c:380:2: warning: Call to function 'memset' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(out_args, 0, sizeof(*out_args));
           ^~~~~~
   drivers/pinctrl/devicetree.c:380:2: note: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11
           memset(out_args, 0, sizeof(*out_args));
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   44 warnings generated.
   drivers/pinctrl/pinctrl-at91-pio4.c:355:16: warning: Value stored to 'wo=
rd' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
                   unsigned int word =3D bank;
                                ^~~~   ~~~~
   drivers/pinctrl/pinctrl-at91-pio4.c:355:16: note: Value stored to 'word'=
 during its initialization is never read
                   unsigned int word =3D bank;
                                ^~~~   ~~~~
   drivers/pinctrl/pinctrl-at91-pio4.c:412:16: warning: Value stored to 'wo=
rd' during its initialization is never read [clang-analyzer-deadcode.DeadSt=
ores]
                   unsigned int word =3D bank;
                                ^~~~   ~~~~
   drivers/pinctrl/pinctrl-at91-pio4.c:412:16: note: Value stored to 'word'=
 during its initialization is never read
                   unsigned int word =3D bank;
                                ^~~~   ~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
>> drivers/staging/greybus/arche-apb-ctrl.c:302:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide bounding of the memory buff=
er or security checks introduced in the C11 standard. Replace with analogou=
s functions that support length arguments or provides boundary checks such =
as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Deprecat=
edOrUnsafeBufferHandling]
                   return sprintf(buf, "off%s\n",
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:302:10: note: Call to function =
'sprintf' is insecure as it does not provide bounding of the memory buffer =
or security checks introduced in the C11 standard. Replace with analogous f=
unctions that support length arguments or provides boundary checks such as =
'sprintf_s' in case of C11
                   return sprintf(buf, "off%s\n",
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:305:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:305:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "active\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:307:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:307:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "standby\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:309:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:309:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "fw_flashing\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:311:10: warning: Call to functi=
on 'sprintf' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'sprintf_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   drivers/staging/greybus/arche-apb-ctrl.c:311:10: note: Call to function =
'sprintf' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'sprintf_s' in case of C11
                   return sprintf(buf, "unknown state\n");
                          ^~~~~~~
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   43 warnings generated.
   drivers/tty/serial/fsl_lpuart.c:1283:33: warning: The result of the left=
 shift is undefined because the right operand is negative [clang-analyzer-c=
ore.UndefinedBinaryOperatorResult]
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^
   drivers/tty/serial/fsl_lpuart.c:2868:6: note: Assuming field 'suspended'=
 is 0
           if (sport->port.suspended && !irq_wake)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2868:28: note: Left side of '&&' is false
           if (sport->port.suspended && !irq_wake)
                                     ^
   drivers/tty/serial/fsl_lpuart.c:2871:2: note: Taking false branch
           if (lpuart_is_32(sport))
           ^
   drivers/tty/serial/fsl_lpuart.c:2876:6: note: Assuming field 'lpuart_dma=
_rx_use' is true
           if (sport->lpuart_dma_rx_use) {
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2876:2: note: Taking true branch
           if (sport->lpuart_dma_rx_use) {
           ^
   drivers/tty/serial/fsl_lpuart.c:2877:7: note: Assuming 'irq_wake' is true
                   if (irq_wake) {
                       ^~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:2877:3: note: Taking true branch
                   if (irq_wake) {
                   ^
   drivers/tty/serial/fsl_lpuart.c:2878:9: note: Calling 'lpuart_start_rx_d=
ma'
                           if (!lpuart_start_rx_dma(sport))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1274:9: note: Assuming the condition is =
false
           bits =3D (termios->c_cflag & CSIZE) =3D=3D CS7 ? 9 : 10;
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1274:9: note: '?' condition is false
   drivers/tty/serial/fsl_lpuart.c:1275:6: note: Assuming the condition is =
false
           if (termios->c_cflag & PARENB)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/fsl_lpuart.c:1275:2: note: Taking false branch
           if (termios->c_cflag & PARENB)
           ^
   drivers/tty/serial/fsl_lpuart.c:1283:33: note: The result of the left sh=
ift is undefined because the right operand is negative
           sport->rx_dma_rng_buf_len =3D (1 << (fls(sport->rx_dma_rng_buf_l=
en) - 1));
                                          ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/tty/serial/stm32-usart.c:494:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&stm32port->tx_buf[0], &xmit->buf[xmit->tail], co=
unt);
                   ^~~~~~
   drivers/tty/serial/stm32-usart.c:494:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&stm32port->tx_buf[0], &xmit->buf[xmit->tail], co=
unt);
                   ^~~~~~
   drivers/tty/serial/stm32-usart.c:503:3: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&stm32port->tx_buf[0], &xmit->buf[xmit->tail], on=
e);
                   ^~~~~~
   drivers/tty/serial/stm32-usart.c:503:3: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&stm32port->tx_buf[0], &xmit->buf[xmit->tail], on=
e);
                   ^~~~~~
   drivers/tty/serial/stm32-usart.c:505:4: warning: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11 [clang-analyze=
r-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(&stm32port->tx_buf[one], &xmit->buf[0], t=
wo);
                           ^~~~~~
   drivers/tty/serial/stm32-usart.c:505:4: note: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11
                           memcpy(&stm32port->tx_buf[one], &xmit->buf[0], t=
wo);
                           ^~~~~~
   drivers/tty/serial/stm32-usart.c:1442:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/tty/serial/stm32-usart.c:1442:2: note: Call to function 'memset'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'memset_s' in case of C11
           memset(&config, 0, sizeof(config));
           ^~~~~~
   drivers/tty/serial/stm32-usart.c:1480:2: warning: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11 [clang-analyz=
er-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
--
           ^
   drivers/nvme/host/ioctl.c:71:3: note: Returning without writing to '*res=
ult'
                   return PTR_ERR(req);
                   ^
   drivers/nvme/host/ioctl.c:224:11: note: Returning from 'nvme_submit_user=
_cmd'
           status =3D nvme_submit_user_cmd(ns ? ns->queue : ctrl->admin_q, =
&c,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:229:6: note: Assuming 'status' is >=3D 0
           if (status >=3D 0) {
               ^~~~~~~~~~~
   drivers/nvme/host/ioctl.c:229:2: note: Taking true branch
           if (status >=3D 0) {
           ^
   drivers/nvme/host/ioctl.c:230:7: note: Calling '__access_ok'
                   if (put_user(result, &ucmd->result))
                       ^
   include/asm-generic/uaccess.h:172:2: note: expanded from macro 'put_user'
           access_ok(__p, sizeof(*ptr)) ?          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:129:31: note: expanded from macro 'access_=
ok'
   #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:138:2: note: Returning the value 1, which =
participates in a condition later
           return 1;
           ^~~~~~~~
   drivers/nvme/host/ioctl.c:230:7: note: Returning from '__access_ok'
                   if (put_user(result, &ucmd->result))
                       ^
   include/asm-generic/uaccess.h:172:2: note: expanded from macro 'put_user'
           access_ok(__p, sizeof(*ptr)) ?          \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:129:31: note: expanded from macro 'access_=
ok'
   #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/ioctl.c:230:7: note: '?' condition is true
                   if (put_user(result, &ucmd->result))
                       ^
   include/asm-generic/uaccess.h:172:2: note: expanded from macro 'put_user'
           access_ok(__p, sizeof(*ptr)) ?          \
           ^
   include/asm-generic/uaccess.h:129:31: note: expanded from macro 'access_=
ok'
   #define access_ok(addr, size) __access_ok((unsigned long)(addr),(size))
                                 ^
   drivers/nvme/host/ioctl.c:230:7: note: Assigned value is garbage or unde=
fined
                   if (put_user(result, &ucmd->result))
                       ^
   include/asm-generic/uaccess.h:173:3: note: expanded from macro 'put_user'
                   __put_user((x), ((__typeof__(*(ptr)) __user *)__p)) :   \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/uaccess.h:150:2: note: expanded from macro '__put_us=
er'
           __typeof__(*(ptr)) __x =3D (x);                           \
           ^                        ~~~
   drivers/nvme/host/ioctl.c:254:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&c, 0, sizeof(c));
           ^~~~~~
   drivers/nvme/host/ioctl.c:254:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(&c, 0, sizeof(c));
           ^~~~~~
   Suppressed 57 warnings (50 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/perf/fsl_imx8_ddr_perf.c:269:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(event, "config:0-7");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:269:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(event, "config:0-7");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:270:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(axi_id, "config1:0-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:270:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(axi_id, "config1:0-15");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:271:1: warning: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   drivers/perf/fsl_imx8_ddr_perf.c:271:1: note: Call to function 'sprintf'=
 is insecure as it does not provide security checks introduced in the C11 s=
tandard. Replace with analogous functions that support length arguments or =
provides boundary checks such as 'sprintf_s' in case of C11
   PMU_FORMAT_ATTR(axi_mask, "config1:16-31");
   ^
   include/linux/perf_event.h:1619:9: note: expanded from macro 'PMU_FORMAT=
_ATTR'
           return sprintf(page, _format "\n");                             \
                  ^~~~~~~
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   56 warnings generated.
>> drivers/phy/broadcom/phy-brcm-usb.c:233:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/phy/broadcom/phy-brcm-usb.c:233:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/phy/broadcom/phy-brcm-usb.c:269:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide bounding of the memory buffer or =
security checks introduced in the C11 standard. Replace with analogous func=
tions that support length arguments or provides boundary checks such as 'sp=
rintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUn=
safeBufferHandling]
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   drivers/phy/broadcom/phy-brcm-usb.c:269:9: note: Call to function 'sprin=
tf' is insecure as it does not provide bounding of the memory buffer or sec=
urity checks introduced in the C11 standard. Replace with analogous functio=
ns that support length arguments or provides boundary checks such as 'sprin=
tf_s' in case of C11
           return sprintf(buf, "%s\n",
                  ^~~~~~~
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
   Suppressed 20 warnings (13 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   54 warnings generated.
   Suppressed 54 warnings (47 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   Suppressed 55 warnings (47 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   59 warnings generated.
   drivers/phy/cadence/phy-cadence-torrent.c:1352:25: warning: The result o=
f the left shift is undefined because the left operand is negative [clang-a=
nalyzer-core.UndefinedBinaryOperatorResult]
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                                  ^
   drivers/phy/cadence/phy-cadence-torrent.c:1476:6: note: 'ret' is 0
           if (ret) {
               ^~~
   drivers/phy/cadence/phy-cadence-torrent.c:1476:2: note: Taking false bra=
nch
           if (ret) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:1481:6: note: Assuming field '=
set_lanes' is not equal to 0
           if (opts->dp.set_lanes) {
               ^~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1481:2: note: Taking true bran=
ch
           if (opts->dp.set_lanes) {
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:1482:9: note: Calling 'cdns_to=
rrent_dp_set_lanes'
                   ret =3D cdns_torrent_dp_set_lanes(cdns_phy, &opts->dp);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1352:25: note: The result of t=
he left shift is undefined because the left operand is negative
           value |=3D ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
                     ~~~~~~~~~~~~ ^
   drivers/phy/cadence/phy-cadence-torrent.c:1697:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1697:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1780:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1780:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1900:2: warning: Call to funct=
ion 'snprintf' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'snprintf_s' in case of C11 =
[clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   drivers/phy/cadence/phy-cadence-torrent.c:1900:2: note: Call to function=
 'snprintf' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'snprintf_s' in case of C11
           snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
           ^~~~~~~~
   Suppressed 55 warnings (48 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (35 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   27 warnings generated.
   Suppressed 27 warnings (20 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   Suppressed 17 warnings (17 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +302 drivers/staging/greybus/arche-apb-ctrl.c

33d76291073dd94 Vaibhav Hiremath 2016-02-13  294  =

33d76291073dd94 Vaibhav Hiremath 2016-02-13  295  static ssize_t state_show=
(struct device *dev,
33d76291073dd94 Vaibhav Hiremath 2016-02-13  296  			  struct device_attrib=
ute *attr, char *buf)
33d76291073dd94 Vaibhav Hiremath 2016-02-13  297  {
33d76291073dd94 Vaibhav Hiremath 2016-02-13  298  	struct arche_apb_ctrl_dr=
vdata *apb =3D dev_get_drvdata(dev);
33d76291073dd94 Vaibhav Hiremath 2016-02-13  299  =

33d76291073dd94 Vaibhav Hiremath 2016-02-13  300  	switch (apb->state) {
33d76291073dd94 Vaibhav Hiremath 2016-02-13  301  	case ARCHE_PLATFORM_STAT=
E_OFF:
af3aae10f16f05a Vaibhav Hiremath 2016-02-13 @302  		return sprintf(buf, "of=
f%s\n",
af3aae10f16f05a Vaibhav Hiremath 2016-02-13  303  				apb->init_disabled ? =
",disabled" : "");
33d76291073dd94 Vaibhav Hiremath 2016-02-13  304  	case ARCHE_PLATFORM_STAT=
E_ACTIVE:
33d76291073dd94 Vaibhav Hiremath 2016-02-13  305  		return sprintf(buf, "ac=
tive\n");
33d76291073dd94 Vaibhav Hiremath 2016-02-13  306  	case ARCHE_PLATFORM_STAT=
E_STANDBY:
33d76291073dd94 Vaibhav Hiremath 2016-02-13  307  		return sprintf(buf, "st=
andby\n");
33d76291073dd94 Vaibhav Hiremath 2016-02-13  308  	case ARCHE_PLATFORM_STAT=
E_FW_FLASHING:
33d76291073dd94 Vaibhav Hiremath 2016-02-13  309  		return sprintf(buf, "fw=
_flashing\n");
33d76291073dd94 Vaibhav Hiremath 2016-02-13  310  	default:
33d76291073dd94 Vaibhav Hiremath 2016-02-13  311  		return sprintf(buf, "un=
known state\n");
33d76291073dd94 Vaibhav Hiremath 2016-02-13  312  	}
33d76291073dd94 Vaibhav Hiremath 2016-02-13  313  }
33d76291073dd94 Vaibhav Hiremath 2016-02-13  314  =


:::::: The code at line 302 was first introduced by commit
:::::: af3aae10f16f05acba27294bc1ae234f3cb61a61 greybus: arche-apb-ctrl: In=
troduce ara,init-disable property for APB

:::::: TO: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6608698891756748523==--

