Content-Type: multipart/mixed; boundary="===============2155864447114352474=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Sun, 24 Apr 2022 03:23:25 +0800
Message-ID: <202204240359.RIqrBXfp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2155864447114352474==
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
head:   45ab9400e73f34103e73c18a73280c9aa1650e98
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   6 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 weeks ago
config: mips-randconfig-c004-20220421 (https://download.01.org/0day-ci/arch=
ive/20220424/202204240359.RIqrBXfp-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd873=
50a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           set_softirq_pending(0);
           ^
   include/linux/interrupt.h:545:33: note: expanded from macro 'set_softirq=
_pending'
   #define set_softirq_pending(x)  (__this_cpu_write(local_softirq_pending_=
ref, (x)))
                                    ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   note: expanded from here
   include/asm-generic/percpu.h:214:35: note: expanded from macro 'raw_cpu_=
write_4'
   #define raw_cpu_write_4(pcp, val)       raw_cpu_generic_to_op(pcp, val, =
=3D)
                                           ^
   include/asm-generic/percpu.h:70:48: note: expanded from macro 'raw_cpu_g=
eneric_to_op'
   #define raw_cpu_generic_to_op(pcp, val, op)                             \
                                                                           ^
   kernel/softirq.c:540:2: note:  Execution continues on line 540
           set_softirq_pending(0);
           ^
   include/linux/interrupt.h:545:33: note: expanded from macro 'set_softirq=
_pending'
   #define set_softirq_pending(x)  (__this_cpu_write(local_softirq_pending_=
ref, (x)))
                                    ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:379:42: note: expanded from macro '__pcpu_si=
ze_call'
                   case 4: stem##4(variable, __VA_ARGS__);break;           \
                                                          ^
   kernel/softirq.c:540:2: note: Loop condition is false.  Exiting loop
           set_softirq_pending(0);
           ^
   include/linux/interrupt.h:545:33: note: expanded from macro 'set_softirq=
_pending'
   #define set_softirq_pending(x)  (__this_cpu_write(local_softirq_pending_=
ref, (x)))
                                    ^
   include/linux/percpu-defs.h:452:2: note: expanded from macro '__this_cpu=
_write'
           raw_cpu_write(pcp, val);                                        \
           ^
   include/linux/percpu-defs.h:421:34: note: expanded from macro 'raw_cpu_w=
rite'
   #define raw_cpu_write(pcp, val)         __pcpu_size_call(raw_cpu_write_,=
 pcp, val)
                                           ^
   include/linux/percpu-defs.h:373:50: note: expanded from macro '__pcpu_si=
ze_call'
   #define __pcpu_size_call(stem, variable, ...)                           \
                                                                           ^
   kernel/softirq.c:542:2: note: Loop condition is false.  Exiting loop
           local_irq_enable();
           ^
   include/linux/irqflags.h:242:28: note: expanded from macro 'local_irq_en=
able'
   #define local_irq_enable()      do { raw_local_irq_enable(); } while (0)
                                   ^
   kernel/softirq.c:546:2: note: Loop condition is true.  Entering loop body
           while ((softirq_bit =3D ffs(pending))) {
           ^
   kernel/softirq.c:552:3: note: The value 23 is assigned to 'vec_nr'
                   vec_nr =3D h - softirq_vec;
                   ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/softirq.c:560:16: note: Assuming the condition is true
                   if (unlikely(prev_count !=3D preempt_count())) {
                                ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   kernel/softirq.c:560:3: note: Taking true branch
                   if (unlikely(prev_count !=3D preempt_count())) {
                   ^
   kernel/softirq.c:561:4: note: Loop condition is false.  Exiting loop
                           pr_err("huh, entered softirq %u %s %p with preem=
pt_count %08x, exited with %08x?\n",
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:392:34: note: expanded from macro '__printk_index=
_emit'
   #define __printk_index_emit(...) do {} while (0)
                                    ^
   kernel/softirq.c:561:4: note: 3rd function call argument is an uninitial=
ized value
                           pr_err("huh, entered softirq %u %s %p with preem=
pt_count %08x, exited with %08x?\n",
                           ^
   include/linux/printk.h:489:2: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
           ^                              ~~~~~~~~~~~
   include/linux/printk.h:446:44: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                              ^               ~~~~~~~~~~~
   include/linux/printk.h:418:3: note: expanded from macro 'printk_index_wr=
ap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                   ^               ~~~~~~~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
>> arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:61:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   33 warnings generated.
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   45 warnings generated.
   drivers/regulator/helpers.c:150:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:138:6: note: Assuming 'r' is non-null
           if (!r)
               ^~
   drivers/regulator/helpers.c:138:2: note: Taking false branch
           if (!r)
           ^
   drivers/regulator/helpers.c:142:6: note: Assuming 'ret' is equal to 0
           if (ret !=3D 0)
               ^~~~~~~~
   drivers/regulator/helpers.c:142:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   drivers/regulator/helpers.c:146:6: note: Assuming 'ret' is equal to 0
           if (ret !=3D 0)
               ^~~~~~~~
   drivers/regulator/helpers.c:146:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   drivers/regulator/helpers.c:150:6: note: Assigned value is garbage or un=
defined
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:245:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:241:6: note: Assuming 'ret' is equal to 0
           if (ret !=3D 0)
               ^~~~~~~~
   drivers/regulator/helpers.c:241:2: note: Taking false branch
           if (ret !=3D 0)
           ^
   drivers/regulator/helpers.c:245:6: note: Assigned value is garbage or un=
defined
           val >>=3D ffs(rdev->desc->vsel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:833:6: warning: Assigned value is garbage or=
 undefined [clang-analyzer-core.uninitialized.Assign]
           sel <<=3D ffs(rdev->desc->csel_mask) - 1;
               ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:803:6: note: Assuming 'n_currents' is not eq=
ual to 0
           if (n_currents =3D=3D 0)
               ^~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:803:2: note: Taking false branch
           if (n_currents =3D=3D 0)
           ^
   drivers/regulator/helpers.c:806:6: note: Assuming field 'curr_table' is =
non-null
           if (rdev->desc->curr_table) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/helpers.c:806:2: note: Taking true branch
           if (rdev->desc->curr_table) {
           ^
   drivers/regulator/helpers.c:811:7: note: Assuming 'ascend' is false
                   if (ascend) {
                       ^~~~~~
   drivers/regulator/helpers.c:811:3: note: Taking false branch
                   if (ascend) {
                   ^
   drivers/regulator/helpers.c:820:16: note: 'i' is < 'n_currents'
                           for (i =3D 0; i < n_currents; i++) {
                                       ^
   drivers/regulator/helpers.c:820:4: note: Loop condition is true.  Enteri=
ng loop body
                           for (i =3D 0; i < n_currents; i++) {
--
                         ^~~~~~
   drivers/leds/led-class-multicolor.c:79:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%d",
                          ^~~~~~~
   drivers/leds/led-class-multicolor.c:79:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   len +=3D sprintf(buf + len, "%d",
                          ^~~~~~~
   drivers/leds/led-class-multicolor.c:82:11: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, " ");
                                  ^~~~~~~
   drivers/leds/led-class-multicolor.c:82:11: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, " ");
                                  ^~~~~~~
   drivers/leds/led-class-multicolor.c:102:10: warning: Call to function 's=
printf' is insecure as it does not provide bounding of the memory buffer or=
 security checks introduced in the C11 standard. Replace with analogous fun=
ctions that support length arguments or provides boundary checks such as 's=
printf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrU=
nsafeBufferHandling]
                   len +=3D sprintf(buf + len, "%s", led_colors[index]);
                          ^~~~~~~
   drivers/leds/led-class-multicolor.c:102:10: note: Call to function 'spri=
ntf' is insecure as it does not provide bounding of the memory buffer or se=
curity checks introduced in the C11 standard. Replace with analogous functi=
ons that support length arguments or provides boundary checks such as 'spri=
ntf_s' in case of C11
                   len +=3D sprintf(buf + len, "%s", led_colors[index]);
                          ^~~~~~~
   drivers/leds/led-class-multicolor.c:104:11: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           len +=3D sprintf(buf + len, " ");
                                  ^~~~~~~
   drivers/leds/led-class-multicolor.c:104:11: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
                           len +=3D sprintf(buf + len, " ");
                                  ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/usb/serial/quatech2.c:229:2: warning: Value stored to 'clear' is=
 never read [clang-analyzer-deadcode.DeadStores]
           clear &=3D ~set;  /* 'set' takes precedence over 'clear' */
           ^        ~~~~
   drivers/usb/serial/quatech2.c:229:2: note: Value stored to 'clear' is ne=
ver read
           clear &=3D ~set;  /* 'set' takes precedence over 'clear' */
           ^        ~~~~
   drivers/usb/serial/quatech2.c:482:2: warning: Value stored to 'ch' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
           ch =3D urb->transfer_buffer;
           ^    ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/quatech2.c:482:2: note: Value stored to 'ch' is never=
 read
           ch =3D urb->transfer_buffer;
           ^    ~~~~~~~~~~~~~~~~~~~~
   drivers/usb/serial/quatech2.c:927:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data, buf, count);
           ^~~~~~
   drivers/usb/serial/quatech2.c:927:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data, buf, count);
           ^~~~~~
   Suppressed 35 warnings (34 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/usb/serial/sierra.c:468:2: warning: Call to function 'memcpy' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-sec=
urity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(buffer, buf, writesize);
           ^~~~~~
   drivers/usb/serial/sierra.c:468:2: note: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11
           memcpy(buffer, buf, writesize);
           ^~~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   35 warnings generated.
   drivers/usb/serial/ssu100.c:144:2: warning: Value stored to 'clear' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           clear &=3D ~set;  /* 'set' takes precedence over 'clear' */
           ^        ~~~~
   drivers/usb/serial/ssu100.c:144:2: note: Value stored to 'clear' is neve=
r read
           clear &=3D ~set;  /* 'set' takes precedence over 'clear' */
           ^        ~~~~
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   34 warnings generated.
   Suppressed 34 warnings (34 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   65 warnings generated.
   drivers/usb/gadget/function/f_ncm.c:733:3: warning: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req->buf, &ntb_parameters, value);
                   ^~~~~~
   drivers/usb/gadget/function/f_ncm.c:733:3: note: Call to function 'memcp=
y' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req->buf, &ntb_parameters, value);
                   ^~~~~~
   drivers/usb/gadget/function/f_ncm.c:1089:4: warning: Call to function 'm=
emset' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'memset_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(ntb_ndp, 0, ncb_len);
                           ^~~~~~
   drivers/usb/gadget/function/f_ncm.c:1089:4: note: Call to function 'mems=
et' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'memset_s' in case of C11
                           memset(ntb_ndp, 0, ncb_len);
                           ^~~~~~
   drivers/usb/gadget/function/f_ncm.c:1586:1: warning: Call to function 's=
printf' is insecure as it does not provide security checks introduced in th=
e C11 standard. Replace with analogous functions that support length argume=
nts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
   ^
   drivers/usb/gadget/function/u_ether_configfs.h:108:10: note: expanded fr=
om macro 'USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT'
                   return sprintf(page, "%d\n", qmult);                    \
                          ^~~~~~~
   drivers/usb/gadget/function/f_ncm.c:1586:1: note: Call to function 'spri=
ntf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sprintf_s' in case of C11
   USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
   ^
   drivers/usb/gadget/function/u_ether_configfs.h:108:10: note: expanded fr=
om macro 'USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT'
                   return sprintf(page, "%d\n", qmult);                    \
                          ^~~~~~~
   Suppressed 62 warnings (62 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
>> drivers/usb/usbip/vudc_dev.c:535:3: warning: Call to function 'sprintf' =
is insecure as it does not provide bounding of the memory buffer or securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'sprintf_s=
' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuf=
ferHandling]
                   sprintf(ep->name, "ep%d%s", num,
                   ^~~~~~~
   drivers/usb/usbip/vudc_dev.c:535:3: note: Call to function 'sprintf' is =
insecure as it does not provide bounding of the memory buffer or security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'sprintf_s' i=
n case of C11
                   sprintf(ep->name, "ep%d%s", num,
                   ^~~~~~~
   Suppressed 37 warnings (37 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   drivers/usb/usbip/vudc_sysfs.c:55:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ddesc, usb_req->req.buf, sizeof(*ddesc));
           ^~~~~~
   drivers/usb/usbip/vudc_sysfs.c:55:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ddesc, usb_req->req.buf, sizeof(*ddesc));
           ^~~~~~
   drivers/usb/usbip/vudc_sysfs.c:85:2: warning: Call to function 'memcpy' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, desc_ptr + off, count);
           ^~~~~~
   drivers/usb/usbip/vudc_sysfs.c:85:2: note: Call to function 'memcpy' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memcpy_s' in case of C11
           memcpy(out, desc_ptr + off, count);
           ^~~~~~
   drivers/usb/usbip/vudc_sysfs.c:245:9: warning: Call to function 'snprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'snprintf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return snprintf(out, PAGE_SIZE, "%d\n", status);
                  ^~~~~~~~
   drivers/usb/usbip/vudc_sysfs.c:245:9: note: Call to function 'snprintf' =
is insecure as it does not provide security checks introduced in the C11 st=
andard. Replace with analogous functions that support length arguments or p=
rovides boundary checks such as 'snprintf_s' in case of C11
           return snprintf(out, PAGE_SIZE, "%d\n", status);
                  ^~~~~~~~
   Suppressed 68 warnings (68 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   75 warnings generated.
   drivers/usb/usbip/vudc_tx.c:48:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pdu_header, 0, sizeof(pdu_header));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:48:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&pdu_header, 0, sizeof(pdu_header));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:49:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:49:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:50:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&iov, 0, sizeof(iov));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:50:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&iov, 0, sizeof(iov));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:85:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&pdu_header, 0, sizeof(pdu_header));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:85:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&pdu_header, 0, sizeof(pdu_header));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:86:2: warning: Call to function 'memset' is =
insecure as it does not provide security checks introduced in the C11 stand=
ard. Replace with analogous functions that support length arguments or prov=
ides boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secu=
rity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   drivers/usb/usbip/vudc_tx.c:86:2: note: Call to function 'memset' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^~~~~~
   include/linux/list.h:137:13: warning: Use of memory after it is freed [c=
lang-analyzer-unix.Malloc]
           __list_del(entry->prev, entry->next);
                      ^
   drivers/usb/usbip/vudc_tx.c:227:9: note: Assuming the condition is true
           while (!kthread_should_stop()) {
                  ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/usbip/vudc_tx.c:227:2: note: Loop condition is true.  Enteri=
ng loop body
           while (!kthread_should_stop()) {
           ^
   drivers/usb/usbip/vudc_tx.c:228:7: note: Assuming the condition is false
                   if (usbip_event_happened(&udc->ud))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/usbip/vudc_tx.c:228:3: note: Taking false branch
                   if (usbip_event_happened(&udc->ud))
                   ^
   drivers/usb/usbip/vudc_tx.c:230:9: note: Calling 'v_send_ret'
                   ret =3D v_send_ret(udc);
                         ^~~~~~~~~~~~~~~
   drivers/usb/usbip/vudc_tx.c:191:2: note: Loop condition is false.  Exiti=
ng loop
           spin_lock_irqsave(&udc->lock_tx, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:264:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:69:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:244:36: note: expanded from macro 'local_irq_sa=
ve'
   #define local_irq_save(flags)   do { raw_local_irq_save(flags); } while =
(0)
                                        ^
   include/linux/irqflags.h:176:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/usbip/vudc_tx.c:191:2: note: Loop condition is false.  Exiti=
ng loop
           spin_lock_irqsave(&udc->lock_tx, flags);

vim +61 arch/mips/kernel/proc.c

^1da177e4c3f415 Linus Torvalds      2005-04-16   49  =

^1da177e4c3f415 Linus Torvalds      2005-04-16   50  	/*
^1da177e4c3f415 Linus Torvalds      2005-04-16   51  	 * For the first proc=
essor also print the system type
^1da177e4c3f415 Linus Torvalds      2005-04-16   52  	 */
487d70d0b8bd1c7 Gabor Juhos         2010-11-23   53  	if (n =3D=3D 0) {
^1da177e4c3f415 Linus Torvalds      2005-04-16   54  		seq_printf(m, "syste=
m type\t\t: %s\n", get_system_type());
487d70d0b8bd1c7 Gabor Juhos         2010-11-23   55  		if (mips_get_machine=
_name())
487d70d0b8bd1c7 Gabor Juhos         2010-11-23   56  			seq_printf(m, "mach=
ine\t\t\t: %s\n",
487d70d0b8bd1c7 Gabor Juhos         2010-11-23   57  				   mips_get_machin=
e_name());
487d70d0b8bd1c7 Gabor Juhos         2010-11-23   58  	}
^1da177e4c3f415 Linus Torvalds      2005-04-16   59  =

^1da177e4c3f415 Linus Torvalds      2005-04-16   60  	seq_printf(m, "proces=
sor\t\t: %ld\n", n);
^1da177e4c3f415 Linus Torvalds      2005-04-16  @61  	sprintf(fmt, "cpu mod=
el\t\t: %%s V%%d.%%d%s\n",
e04582b7bc70b40 Atsushi Nemoto      2006-10-09   62  		      cpu_data[n].op=
tions & MIPS_CPU_FPU ? "  FPU V%d.%d" : "");
e47c659b55aff70 Johannes Dickgreber 2008-10-13   63  	seq_printf(m, fmt, __=
cpu_name[n],
^1da177e4c3f415 Linus Torvalds      2005-04-16   64  		      (version >> 4)=
 & 0x0f, version & 0x0f,
^1da177e4c3f415 Linus Torvalds      2005-04-16   65  		      (fp_vers >> 4)=
 & 0x0f, fp_vers & 0x0f);
5636919b5c909fe Ralf Baechle        2009-02-28   66  	seq_printf(m, "BogoMI=
PS\t\t: %u.%02u\n",
0ac354801a87918 Ralf Baechle        2005-02-21   67  		      cpu_data[n].ud=
elay_val / (500000/HZ),
0ac354801a87918 Ralf Baechle        2005-02-21   68  		      (cpu_data[n].u=
delay_val / (5000/HZ)) % 100);
^1da177e4c3f415 Linus Torvalds      2005-04-16   69  	seq_printf(m, "wait i=
nstruction\t: %s\n", cpu_wait ? "yes" : "no");
^1da177e4c3f415 Linus Torvalds      2005-04-16   70  	seq_printf(m, "micros=
econd timers\t: %s\n",
^1da177e4c3f415 Linus Torvalds      2005-04-16   71  		      cpu_has_counte=
r ? "yes" : "no");
31aa36658a12326 Karl-Johan Karlsson 2006-10-08   72  	seq_printf(m, "tlb_en=
tries\t\t: %d\n", cpu_data[n].tlbsize);
^1da177e4c3f415 Linus Torvalds      2005-04-16   73  	seq_printf(m, "extra =
interrupt vector\t: %s\n",
^1da177e4c3f415 Linus Torvalds      2005-04-16   74  		      cpu_has_divec =
? "yes" : "no");
654f57bfb467996 David Daney         2008-09-23   75  	seq_printf(m, "hardwa=
re watchpoint\t: %s",
654f57bfb467996 David Daney         2008-09-23   76  		      cpu_has_watch =
? "yes, " : "no\n");
654f57bfb467996 David Daney         2008-09-23   77  	if (cpu_has_watch) {
654f57bfb467996 David Daney         2008-09-23   78  		seq_printf(m, "count=
: %d, address/irw mask: [",
654f57bfb467996 David Daney         2008-09-23   79  		      cpu_data[n].wa=
tch_reg_count);
654f57bfb467996 David Daney         2008-09-23   80  		for (i =3D 0; i < cp=
u_data[n].watch_reg_count; i++)
654f57bfb467996 David Daney         2008-09-23   81  			seq_printf(m, "%s0x=
%04x", i ? ", " : "",
654f57bfb467996 David Daney         2008-09-23   82  				cpu_data[n].watch_=
reg_masks[i]);
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   83  		seq_puts(m, "]\n");
654f57bfb467996 David Daney         2008-09-23   84  	}
41315b6ec108e93 Aaro Koskinen       2013-12-31   85  =

1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   86  	seq_puts(m, "isa\t\t\=
t:");
e5f5a5b06e51a36 Maciej W. Rozycki   2017-07-08   87  	if (cpu_has_mips_1)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   88  		seq_puts(m, " mips1"=
);
a96102be700f872 Steven J. Hill      2012-12-07   89  	if (cpu_has_mips_2)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   90  		seq_puts(m, " mips2"=
);
a96102be700f872 Steven J. Hill      2012-12-07   91  	if (cpu_has_mips_3)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   92  		seq_puts(m, " mips3"=
);
a96102be700f872 Steven J. Hill      2012-12-07   93  	if (cpu_has_mips_4)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   94  		seq_puts(m, " mips4"=
);
a96102be700f872 Steven J. Hill      2012-12-07   95  	if (cpu_has_mips_5)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   96  		seq_puts(m, " mips5"=
);
a96102be700f872 Steven J. Hill      2012-12-07   97  	if (cpu_has_mips32r1)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13   98  		seq_puts(m, " mips32=
r1");
a96102be700f872 Steven J. Hill      2012-12-07   99  	if (cpu_has_mips32r2)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  100  		seq_puts(m, " mips32=
r2");
ab7c01fdc3cfe02 Serge Semin         2020-05-21  101  	if (cpu_has_mips32r5)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  102  		seq_puts(m, " mips32=
r5");
515a6393dbac4f4 Markos Chandras     2014-11-14  103  	if (cpu_has_mips32r6)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  104  		seq_puts(m, " mips32=
r6");
a96102be700f872 Steven J. Hill      2012-12-07  105  	if (cpu_has_mips64r1)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  106  		seq_puts(m, " mips64=
r1");
a96102be700f872 Steven J. Hill      2012-12-07  107  	if (cpu_has_mips64r2)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  108  		seq_puts(m, " mips64=
r2");
ab7c01fdc3cfe02 Serge Semin         2020-05-21  109  	if (cpu_has_mips64r5)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  110  		seq_puts(m, " mips64=
r5");
515a6393dbac4f4 Markos Chandras     2014-11-14  111  	if (cpu_has_mips64r6)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  112  		seq_puts(m, " mips64=
r6");
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  113  	seq_puts(m, "\n");
981ef0de49869c9 Ralf Baechle        2012-08-20  114  =

1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  115  	seq_puts(m, "ASEs imp=
lemented\t:");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  116  	if (cpu_has_mips16)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  117  		seq_puts(m, " mips16=
");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  118  	if (cpu_has_mips16e2)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  119  		seq_puts(m, " mips16=
e2");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  120  	if (cpu_has_mdmx)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  121  		seq_puts(m, " mdmx");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  122  	if (cpu_has_mips3d)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  123  		seq_puts(m, " mips3d=
");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  124  	if (cpu_has_smartmips)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  125  		seq_puts(m, " smartm=
ips");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  126  	if (cpu_has_dsp)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  127  		seq_puts(m, " dsp");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  128  	if (cpu_has_dsp2)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  129  		seq_puts(m, " dsp2");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  130  	if (cpu_has_dsp3)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  131  		seq_puts(m, " dsp3");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  132  	if (cpu_has_mipsmt)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  133  		seq_puts(m, " mt");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  134  	if (cpu_has_mmips)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  135  		seq_puts(m, " microm=
ips");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  136  	if (cpu_has_vz)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  137  		seq_puts(m, " vz");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  138  	if (cpu_has_msa)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  139  		seq_puts(m, " msa");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  140  	if (cpu_has_eva)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  141  		seq_puts(m, " eva");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  142  	if (cpu_has_htw)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  143  		seq_puts(m, " htw");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  144  	if (cpu_has_xpa)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  145  		seq_puts(m, " xpa");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  146  	if (cpu_has_loongson_=
mmi)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  147  		seq_puts(m, " loongs=
on-mmi");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  148  	if (cpu_has_loongson_=
cam)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  149  		seq_puts(m, " loongs=
on-cam");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  150  	if (cpu_has_loongson_=
ext)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  151  		seq_puts(m, " loongs=
on-ext");
01fde9a0e497c70 Ilya Lipnitskiy     2021-10-13  152  	if (cpu_has_loongson_=
ext2)
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  153  		seq_puts(m, " loongs=
on-ext2");
1ad964ae1a91501 Ilya Lipnitskiy     2021-10-13  154  	seq_puts(m, "\n");
981ef0de49869c9 Ralf Baechle        2012-08-20  155  =

bce860833ab1e40 Steven J. Hill      2013-03-25  156  	if (cpu_has_mmips) {
bce860833ab1e40 Steven J. Hill      2013-03-25  157  		seq_printf(m, "micro=
mips kernel\t: %s\n",
bce860833ab1e40 Steven J. Hill      2013-03-25  158  		      (read_c0_confi=
g3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
bce860833ab1e40 Steven J. Hill      2013-03-25  159  	}
626bfa03729959e Hauke Mehrtens      2021-10-13  160  =

626bfa03729959e Hauke Mehrtens      2021-10-13  161  	seq_puts(m, "Options =
implemented\t:");
626bfa03729959e Hauke Mehrtens      2021-10-13  162  	if (cpu_has_tlb)
626bfa03729959e Hauke Mehrtens      2021-10-13  163  		seq_puts(m, " tlb");
626bfa03729959e Hauke Mehrtens      2021-10-13  164  	if (cpu_has_ftlb)
626bfa03729959e Hauke Mehrtens      2021-10-13  165  		seq_puts(m, " ftlb");
626bfa03729959e Hauke Mehrtens      2021-10-13  166  	if (cpu_has_tlbinv)
626bfa03729959e Hauke Mehrtens      2021-10-13  167  		seq_puts(m, " tlbinv=
");
626bfa03729959e Hauke Mehrtens      2021-10-13  168  	if (cpu_has_segments)
626bfa03729959e Hauke Mehrtens      2021-10-13  169  		seq_puts(m, " segmen=
ts");
626bfa03729959e Hauke Mehrtens      2021-10-13  170  	if (cpu_has_rixiex)
626bfa03729959e Hauke Mehrtens      2021-10-13  171  		seq_puts(m, " rixiex=
");
626bfa03729959e Hauke Mehrtens      2021-10-13  172  	if (cpu_has_ldpte)
626bfa03729959e Hauke Mehrtens      2021-10-13  173  		seq_puts(m, " ldpte"=
);
626bfa03729959e Hauke Mehrtens      2021-10-13  174  	if (cpu_has_maar)
626bfa03729959e Hauke Mehrtens      2021-10-13  175  		seq_puts(m, " maar");
626bfa03729959e Hauke Mehrtens      2021-10-13  176  	if (cpu_has_rw_llb)
626bfa03729959e Hauke Mehrtens      2021-10-13  177  		seq_puts(m, " rw_llb=
");
626bfa03729959e Hauke Mehrtens      2021-10-13  178  	if (cpu_has_4kex)
626bfa03729959e Hauke Mehrtens      2021-10-13  179  		seq_puts(m, " 4kex");
626bfa03729959e Hauke Mehrtens      2021-10-13  180  	if (cpu_has_3k_cache)
626bfa03729959e Hauke Mehrtens      2021-10-13  181  		seq_puts(m, " 3k_cac=
he");
626bfa03729959e Hauke Mehrtens      2021-10-13  182  	if (cpu_has_4k_cache)
626bfa03729959e Hauke Mehrtens      2021-10-13  183  		seq_puts(m, " 4k_cac=
he");
626bfa03729959e Hauke Mehrtens      2021-10-13  184  	if (cpu_has_tx39_cach=
e)
626bfa03729959e Hauke Mehrtens      2021-10-13  185  		seq_puts(m, " tx39_c=
ache");
626bfa03729959e Hauke Mehrtens      2021-10-13  186  	if (cpu_has_octeon_ca=
che)
626bfa03729959e Hauke Mehrtens      2021-10-13  187  		seq_puts(m, " octeon=
_cache");
1cab5bd69eb1f99 Tiezhu Yang         2021-11-25  188  	if (raw_cpu_has_fpu)
626bfa03729959e Hauke Mehrtens      2021-10-13  189  		seq_puts(m, " fpu");
626bfa03729959e Hauke Mehrtens      2021-10-13  190  	if (cpu_has_32fpr)
626bfa03729959e Hauke Mehrtens      2021-10-13  191  		seq_puts(m, " 32fpr"=
);
626bfa03729959e Hauke Mehrtens      2021-10-13  192  	if (cpu_has_cache_cde=
x_p)
626bfa03729959e Hauke Mehrtens      2021-10-13  193  		seq_puts(m, " cache_=
cdex_p");
626bfa03729959e Hauke Mehrtens      2021-10-13  194  	if (cpu_has_cache_cde=
x_s)
626bfa03729959e Hauke Mehrtens      2021-10-13  195  		seq_puts(m, " cache_=
cdex_s");
626bfa03729959e Hauke Mehrtens      2021-10-13  196  	if (cpu_has_prefetch)
626bfa03729959e Hauke Mehrtens      2021-10-13  197  		seq_puts(m, " prefet=
ch");
626bfa03729959e Hauke Mehrtens      2021-10-13  198  	if (cpu_has_mcheck)
626bfa03729959e Hauke Mehrtens      2021-10-13  199  		seq_puts(m, " mcheck=
");
626bfa03729959e Hauke Mehrtens      2021-10-13  200  	if (cpu_has_ejtag)
626bfa03729959e Hauke Mehrtens      2021-10-13  201  		seq_puts(m, " ejtag"=
);
626bfa03729959e Hauke Mehrtens      2021-10-13  202  	if (cpu_has_llsc)
626bfa03729959e Hauke Mehrtens      2021-10-13  203  		seq_puts(m, " llsc");
626bfa03729959e Hauke Mehrtens      2021-10-13  204  	if (cpu_has_guestctl0=
ext)
626bfa03729959e Hauke Mehrtens      2021-10-13  205  		seq_puts(m, " guestc=
tl0ext");
626bfa03729959e Hauke Mehrtens      2021-10-13  206  	if (cpu_has_guestctl1)
626bfa03729959e Hauke Mehrtens      2021-10-13  207  		seq_puts(m, " guestc=
tl1");
626bfa03729959e Hauke Mehrtens      2021-10-13  208  	if (cpu_has_guestctl2)
626bfa03729959e Hauke Mehrtens      2021-10-13  209  		seq_puts(m, " guestc=
tl2");
626bfa03729959e Hauke Mehrtens      2021-10-13  210  	if (cpu_has_guestid)
626bfa03729959e Hauke Mehrtens      2021-10-13  211  		seq_puts(m, " guesti=
d");
626bfa03729959e Hauke Mehrtens      2021-10-13  212  	if (cpu_has_drg)
626bfa03729959e Hauke Mehrtens      2021-10-13  213  		seq_puts(m, " drg");
626bfa03729959e Hauke Mehrtens      2021-10-13  214  	if (cpu_has_rixi)
626bfa03729959e Hauke Mehrtens      2021-10-13  215  		seq_puts(m, " rixi");
626bfa03729959e Hauke Mehrtens      2021-10-13  216  	if (cpu_has_lpa)
626bfa03729959e Hauke Mehrtens      2021-10-13  217  		seq_puts(m, " lpa");
626bfa03729959e Hauke Mehrtens      2021-10-13  218  	if (cpu_has_mvh)
626bfa03729959e Hauke Mehrtens      2021-10-13  219  		seq_puts(m, " mvh");
626bfa03729959e Hauke Mehrtens      2021-10-13  220  	if (cpu_has_vtag_icac=
he)
626bfa03729959e Hauke Mehrtens      2021-10-13  221  		seq_puts(m, " vtag_i=
cache");
626bfa03729959e Hauke Mehrtens      2021-10-13  222  	if (cpu_has_dc_aliase=
s)
626bfa03729959e Hauke Mehrtens      2021-10-13  223  		seq_puts(m, " dc_ali=
ases");
626bfa03729959e Hauke Mehrtens      2021-10-13  224  	if (cpu_has_ic_fills_=
f_dc)
626bfa03729959e Hauke Mehrtens      2021-10-13  225  		seq_puts(m, " ic_fil=
ls_f_dc");
626bfa03729959e Hauke Mehrtens      2021-10-13  226  	if (cpu_has_pindexed_=
dcache)
626bfa03729959e Hauke Mehrtens      2021-10-13  227  		seq_puts(m, " pindex=
ed_dcache");
626bfa03729959e Hauke Mehrtens      2021-10-13  228  	if (cpu_has_userlocal)
626bfa03729959e Hauke Mehrtens      2021-10-13  229  		seq_puts(m, " userlo=
cal");
626bfa03729959e Hauke Mehrtens      2021-10-13  230  	if (cpu_has_nofpuex)
626bfa03729959e Hauke Mehrtens      2021-10-13  231  		seq_puts(m, " nofpue=
x");
626bfa03729959e Hauke Mehrtens      2021-10-13  232  	if (cpu_has_vint)
626bfa03729959e Hauke Mehrtens      2021-10-13  233  		seq_puts(m, " vint");
626bfa03729959e Hauke Mehrtens      2021-10-13  234  	if (cpu_has_veic)
626bfa03729959e Hauke Mehrtens      2021-10-13  235  		seq_puts(m, " veic");
626bfa03729959e Hauke Mehrtens      2021-10-13  236  	if (cpu_has_inclusive=
_pcaches)
626bfa03729959e Hauke Mehrtens      2021-10-13  237  		seq_puts(m, " inclus=
ive_pcaches");
626bfa03729959e Hauke Mehrtens      2021-10-13  238  	if (cpu_has_perf_cntr=
_intr_bit)
626bfa03729959e Hauke Mehrtens      2021-10-13  239  		seq_puts(m, " perf_c=
ntr_intr_bit");
626bfa03729959e Hauke Mehrtens      2021-10-13  240  	if (cpu_has_ufr)
626bfa03729959e Hauke Mehrtens      2021-10-13  241  		seq_puts(m, " ufr");
626bfa03729959e Hauke Mehrtens      2021-10-13  242  	if (cpu_has_fre)
626bfa03729959e Hauke Mehrtens      2021-10-13  243  		seq_puts(m, " fre");
626bfa03729959e Hauke Mehrtens      2021-10-13  244  	if (cpu_has_cdmm)
626bfa03729959e Hauke Mehrtens      2021-10-13  245  		seq_puts(m, " cdmm");
626bfa03729959e Hauke Mehrtens      2021-10-13  246  	if (cpu_has_small_pag=
es)
626bfa03729959e Hauke Mehrtens      2021-10-13  247  		seq_puts(m, " small_=
pages");
626bfa03729959e Hauke Mehrtens      2021-10-13  248  	if (cpu_has_nan_legac=
y)
626bfa03729959e Hauke Mehrtens      2021-10-13  249  		seq_puts(m, " nan_le=
gacy");
626bfa03729959e Hauke Mehrtens      2021-10-13  250  	if (cpu_has_nan_2008)
626bfa03729959e Hauke Mehrtens      2021-10-13  251  		seq_puts(m, " nan_20=
08");
626bfa03729959e Hauke Mehrtens      2021-10-13  252  	if (cpu_has_ebase_wg)
626bfa03729959e Hauke Mehrtens      2021-10-13  253  		seq_puts(m, " ebase_=
wg");
626bfa03729959e Hauke Mehrtens      2021-10-13  254  	if (cpu_has_badinstr)
626bfa03729959e Hauke Mehrtens      2021-10-13  255  		seq_puts(m, " badins=
tr");
626bfa03729959e Hauke Mehrtens      2021-10-13  256  	if (cpu_has_badinstrp)
626bfa03729959e Hauke Mehrtens      2021-10-13  257  		seq_puts(m, " badins=
trp");
626bfa03729959e Hauke Mehrtens      2021-10-13  258  	if (cpu_has_contextco=
nfig)
626bfa03729959e Hauke Mehrtens      2021-10-13  259  		seq_puts(m, " contex=
tconfig");
626bfa03729959e Hauke Mehrtens      2021-10-13  260  	if (cpu_has_perf)
626bfa03729959e Hauke Mehrtens      2021-10-13  261  		seq_puts(m, " perf");
626bfa03729959e Hauke Mehrtens      2021-10-13  262  	if (cpu_has_mac2008_o=
nly)
626bfa03729959e Hauke Mehrtens      2021-10-13  263  		seq_puts(m, " mac200=
8_only");
626bfa03729959e Hauke Mehrtens      2021-10-13  264  	if (cpu_has_ftlbparex)
626bfa03729959e Hauke Mehrtens      2021-10-13  265  		seq_puts(m, " ftlbpa=
rex");
626bfa03729959e Hauke Mehrtens      2021-10-13  266  	if (cpu_has_gsexcex)
626bfa03729959e Hauke Mehrtens      2021-10-13  267  		seq_puts(m, " gsexce=
x");
626bfa03729959e Hauke Mehrtens      2021-10-13  268  	if (cpu_has_shared_ft=
lb_ram)
626bfa03729959e Hauke Mehrtens      2021-10-13  269  		seq_puts(m, " shared=
_ftlb_ram");
626bfa03729959e Hauke Mehrtens      2021-10-13  270  	if (cpu_has_shared_ft=
lb_entries)
626bfa03729959e Hauke Mehrtens      2021-10-13  271  		seq_puts(m, " shared=
_ftlb_entries");
626bfa03729959e Hauke Mehrtens      2021-10-13  272  	if (cpu_has_mipsmt_pe=
rtccounters)
626bfa03729959e Hauke Mehrtens      2021-10-13  273  		seq_puts(m, " mipsmt=
_pertccounters");
626bfa03729959e Hauke Mehrtens      2021-10-13  274  	if (cpu_has_mmid)
626bfa03729959e Hauke Mehrtens      2021-10-13  275  		seq_puts(m, " mmid");
626bfa03729959e Hauke Mehrtens      2021-10-13  276  	if (cpu_has_mm_sysad)
626bfa03729959e Hauke Mehrtens      2021-10-13  277  		seq_puts(m, " mm_sys=
ad");
626bfa03729959e Hauke Mehrtens      2021-10-13  278  	if (cpu_has_mm_full)
626bfa03729959e Hauke Mehrtens      2021-10-13  279  		seq_puts(m, " mm_ful=
l");
626bfa03729959e Hauke Mehrtens      2021-10-13  280  	seq_puts(m, "\n");
626bfa03729959e Hauke Mehrtens      2021-10-13  281  =

f6771dbb27c704c Ralf Baechle        2007-11-08  282  	seq_printf(m, "shadow=
 register sets\t: %d\n",
f6771dbb27c704c Ralf Baechle        2007-11-08  283  		      cpu_data[n].sr=
sets);
e77c32fe284a4da David Daney         2010-12-21  284  	seq_printf(m, "kscrat=
ch registers\t: %d\n",
e77c32fe284a4da David Daney         2010-12-21  285  		      hweight8(cpu_d=
ata[n].kscratch_mask));
bda4584cd943d7b Huacai Chen         2014-06-26  286  	seq_printf(m, "packag=
e\t\t\t: %d\n", cpu_data[n].package);
f875a832d202852 Paul Burton         2017-08-12  287  	seq_printf(m, "core\t=
\t\t: %d\n", cpu_core(&cpu_data[n]));
5508d456e9992bb Ralf Baechle        2014-04-03  288  =


:::::: The code@line 61 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2155864447114352474==--

