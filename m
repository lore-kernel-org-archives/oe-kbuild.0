Content-Type: multipart/mixed; boundary="===============4765602038856976460=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/usb/hso.c:505:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides...
Date: Tue, 26 Jul 2022 08:51:46 +0800
Message-ID: <202207260830.2AUQ5Qyf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4765602038856976460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/net/usb/hso.c:505:9: warning: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandli=
ng]"
:::::: =


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
head:   e0dccc3b76fb35bb257b4118367a883073d7390e
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   5 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220721 (https://download.01.org/0day-ci/archi=
ve/20220726/202207260830.2AUQ5Qyf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 72686d=
68c137551cce816416190a18d45b4d4e2a)
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
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:363:7: not=
e: 'type' is equal to PAGELIST_READ
           if ((type =3D=3D PAGELIST_READ) &&
                ^~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:363:6: not=
e: Left side of '&&' is true
           if ((type =3D=3D PAGELIST_READ) &&
               ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364:8: not=
e: Assuming the condition is true
               ((pagelist->offset & (g_cache_line_size - 1)) ||
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:364:52: no=
te: Left side of '||' is true
               ((pagelist->offset & (g_cache_line_size - 1)) ||
                                                             ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:369:7: not=
e: Assuming the condition is false
                   if (down_interruptible(&g_free_fragments_sema)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:369:3: not=
e: Taking false branch
                   if (down_interruptible(&g_free_fragments_sema)) {
                   ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:374:11: no=
te: Assuming 'g_free_fragments' is non-null
                   WARN_ON(!g_free_fragments);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:376:3: not=
e: Value assigned to 'g_free_fragments'
                   down(&g_free_fragments_mutex);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:378:11: no=
te: Assuming 'fragments' is null
                   WARN_ON(!fragments);
                           ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:379:22: no=
te: Dereference of null pointer
                   g_free_fragments =3D *(char **)g_free_fragments;
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:423:4: war=
ning: Call to function 'memcpy' is insecure as it does not provide security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'memcpy_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                           memcpy((char *)kmap(pages[0]) +
                           ^~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:423:4: not=
e: Call to function 'memcpy' is insecure as it does not provide security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'memcpy_s' in =
case of C11
                           memcpy((char *)kmap(pages[0]) +
                           ^~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:431:4: war=
ning: Call to function 'memcpy' is insecure as it does not provide security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'memcpy_s' =
in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuffe=
rHandling]
                           memcpy((char *)kmap(pages[num_pages - 1]) +
                           ^~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:431:4: not=
e: Call to function 'memcpy' is insecure as it does not provide security ch=
ecks introduced in the C11 standard. Replace with analogous functions that =
support length arguments or provides boundary checks such as 'memcpy_s' in =
case of C11
                           memcpy((char *)kmap(pages[num_pages - 1]) +
                           ^~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:648:8: war=
ning: Call to function 'snprintf' is insecure as it does not provide securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'snprintf=
_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeB=
ufferHandling]
           len =3D snprintf(buf, sizeof(buf), "  Platform: 2835 (VC master)=
");
                 ^~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:648:8: not=
e: Call to function 'snprintf' is insecure as it does not provide security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'snprintf_s'=
 in case of C11
           len =3D snprintf(buf, sizeof(buf), "  Platform: 2835 (VC master)=
");
                 ^~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1251:9: wa=
rning: Call to function 'snprintf' is insecure as it does not provide secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'snprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
                   len =3D snprintf(buf, sizeof(buf),
                         ^~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1251:9: no=
te: Call to function 'snprintf' is insecure as it does not provide security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'snprintf_s=
' in case of C11
                   len =3D snprintf(buf, sizeof(buf),
                         ^~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1415:3: wa=
rning: Call to function 'sprintf' is insecure as it does not provide securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   sprintf(entity, "VCHIQ:   ");
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1415:3: no=
te: Call to function 'sprintf' is insecure as it does not provide security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   sprintf(entity, "VCHIQ:   ");
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1418:3: wa=
rning: Call to function 'sprintf' is insecure as it does not provide securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   sprintf(entity, "%c%c%c%c:%03d",
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1418:3: no=
te: Call to function 'sprintf' is insecure as it does not provide security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   sprintf(entity, "%c%c%c%c:%03d",
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1470:3: wa=
rning: Call to function 'sprintf' is insecure as it does not provide securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   sprintf(entity, "%c%c%c%c:%03d",
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1470:3: no=
te: Call to function 'sprintf' is insecure as it does not provide security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   sprintf(entity, "%c%c%c%c:%03d",
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1475:3: wa=
rning: Call to function 'sprintf' is insecure as it does not provide securi=
ty checks introduced in the C11 standard. Replace with analogous functions =
that support length arguments or provides boundary checks such as 'sprintf_=
s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBu=
fferHandling]
                   sprintf(entity, "PEER:   ");
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1475:3: no=
te: Call to function 'sprintf' is insecure as it does not provide security =
checks introduced in the C11 standard. Replace with analogous functions tha=
t support length arguments or provides boundary checks such as 'sprintf_s' =
in case of C11
                   sprintf(entity, "PEER:   ");
                   ^~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1734:2: wa=
rning: Call to function 'snprintf' is insecure as it does not provide secur=
ity checks introduced in the C11 standard. Replace with analogous functions=
 that support length arguments or provides boundary checks such as 'snprint=
f_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafe=
BufferHandling]
           snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
           ^~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1734:2: no=
te: Call to function 'snprintf' is insecure as it does not provide security=
 checks introduced in the C11 standard. Replace with analogous functions th=
at support length arguments or provides boundary checks such as 'snprintf_s=
' in case of C11
           snprintf(threadname, sizeof(threadname), "vchiq-keep/%d",
           ^~~~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1761:2: wa=
rning: Call to function 'memset' is insecure as it does not provide securit=
y checks introduced in the C11 standard. Replace with analogous functions t=
hat support length arguments or provides boundary checks such as 'memset_s'=
 in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBuff=
erHandling]
           memset(&pdevinfo, 0, sizeof(pdevinfo));
           ^~~~~~
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:1761:2: no=
te: Call to function 'memset' is insecure as it does not provide security c=
hecks introduced in the C11 standard. Replace with analogous functions that=
 support length arguments or provides boundary checks such as 'memset_s' in=
 case of C11
           memset(&pdevinfo, 0, sizeof(pdevinfo));
           ^~~~~~
   Suppressed 43 warnings (41 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   80 warnings generated.
>> drivers/net/usb/hso.c:505:9: warning: Call to function 'sprintf' is inse=
cure as it does not provide bounding of the memory buffer or security check=
s introduced in the C11 standard. Replace with analogous functions that sup=
port length arguments or provides boundary checks such as 'sprintf_s' in ca=
se of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHand=
ling]
           return sprintf(buf, "%s\n", port_name);
                  ^~~~~~~
   drivers/net/usb/hso.c:505:9: note: Call to function 'sprintf' is insecur=
e as it does not provide bounding of the memory buffer or security checks i=
ntroduced in the C11 standard. Replace with analogous functions that suppor=
t length arguments or provides boundary checks such as 'sprintf_s' in case =
of C11
           return sprintf(buf, "%s\n", port_name);
                  ^~~~~~~
   drivers/net/usb/hso.c:785:2: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(odev->mux_bulk_tx_buf, skb->data, skb->len);
           ^~~~~~
   drivers/net/usb/hso.c:785:2: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
           memcpy(odev->mux_bulk_tx_buf, skb->data, skb->len);
           ^~~~~~
   drivers/net/usb/hso.c:861:4: warning: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(((unsigned char *)(&odev->rx_ip_hdr)) +
                           ^~~~~~
   drivers/net/usb/hso.c:861:4: note: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11
                           memcpy(((unsigned char *)(&odev->rx_ip_hdr)) +
                           ^~~~~~
   drivers/net/usb/hso.c:1346:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(serial->tx_buffer + serial->tx_buffer_count, buf, tx_byte=
s);
           ^~~~~~
   drivers/net/usb/hso.c:1346:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(serial->tx_buffer + serial->tx_buffer_count, buf, tx_byte=
s);
           ^~~~~~
   drivers/net/usb/hso.c:1398:18: warning: Dereference of null pointer (loa=
ded from variable 'old') [clang-analyzer-core.NullDereference]
                   tty->termios =3D *old;
                                  ^~~~
   drivers/net/usb/hso.c:1388:6: note: Assuming 'old' is null
           if (old)
               ^~~
   drivers/net/usb/hso.c:1388:2: note: Taking false branch
           if (old)
           ^
   drivers/net/usb/hso.c:1394:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_irqsave(&serial->serial_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   drivers/net/usb/hso.c:1394:2: note: Loop condition is false.  Exiting lo=
op
           spin_lock_irqsave(&serial->serial_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   drivers/net/usb/hso.c:1395:6: note: Assuming field 'count' is 0
           if (serial->port.count)
               ^~~~~~~~~~~~~~~~~~
   drivers/net/usb/hso.c:1395:2: note: Taking false branch
           if (serial->port.count)
           ^
   drivers/net/usb/hso.c:1398:18: note: Dereference of null pointer (loaded=
 from variable 'old')
                   tty->termios =3D *old;
                                  ^~~~
   drivers/net/usb/hso.c:1524:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(serial_state_notification, 0,
           ^~~~~~
   drivers/net/usb/hso.c:1524:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(serial_state_notification, 0,
           ^~~~~~
   drivers/net/usb/hso.c:1554:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cprev, &tiocmget->icount, sizeof(struct uart_icount));
           ^~~~~~
   drivers/net/usb/hso.c:1554:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&cprev, &tiocmget->icount, sizeof(struct uart_icount));
           ^~~~~~
   drivers/net/usb/hso.c:1559:3: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&cnow, &tiocmget->icount, sizeof(struct uart_icou=
nt));
                   ^~~~~~
   drivers/net/usb/hso.c:1559:3: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
                   memcpy(&cnow, &tiocmget->icount, sizeof(struct uart_icou=
nt));
                   ^~~~~~
   drivers/net/usb/hso.c:1595:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(icount, 0, sizeof(struct serial_icounter_struct));
           ^~~~~~
   drivers/net/usb/hso.c:1595:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(icount, 0, sizeof(struct serial_icounter_struct));
           ^~~~~~
   drivers/net/usb/hso.c:1600:2: warning: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&cnow, &tiocmget->icount, sizeof(struct uart_icount));
           ^~~~~~
   drivers/net/usb/hso.c:1600:2: note: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11
           memcpy(&cnow, &tiocmget->icount, sizeof(struct uart_icount));
           ^~~~~~
   drivers/net/usb/hso.c:1815:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(serial->rx_data[0], 0, CTRL_URB_RX_SIZE);
           ^~~~~~
   drivers/net/usb/hso.c:1815:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(serial->rx_data[0], 0, CTRL_URB_RX_SIZE);
           ^~~~~~
   drivers/net/usb/hso.c:2078:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   sprintf(port_dev, "%s", dev2net(hso_dev)->net->name);
                   ^~~~~~~
   drivers/net/usb/hso.c:2078:3: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
                   sprintf(port_dev, "%s", dev2net(hso_dev)->net->name);
                   ^~~~~~~
   drivers/net/usb/hso.c:2080:3: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
                   sprintf(port_dev, "/dev/%s%d", tty_filename,

vim +505 drivers/net/usb/hso.c

72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  458  =

72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  459  /* Sysfs attribute */
7567d603b3f1c5e YueHaibing         2021-05-20  460  static ssize_t hsotype_=
show(struct device *dev,
7567d603b3f1c5e YueHaibing         2021-05-20  461  			    struct device_at=
tribute *attr, char *buf)
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  462  {
1aec5bdfed91b50 Greg Kroah-Hartman 2009-04-30  463  	struct hso_device *hso=
_dev =3D dev_get_drvdata(dev);
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  464  	char *port_name;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  465  =

72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  466  	if (!hso_dev)
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  467  		return 0;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  468  =

72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  469  	switch (hso_dev->port_=
spec & HSO_PORT_MASK) {
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  470  	case HSO_PORT_CONTROL:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  471  		port_name =3D "Contro=
l";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  472  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  473  	case HSO_PORT_APP:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  474  		port_name =3D "Applic=
ation";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  475  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  476  	case HSO_PORT_APP2:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  477  		port_name =3D "Applic=
ation2";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  478  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  479  	case HSO_PORT_GPS:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  480  		port_name =3D "GPS";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  481  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  482  	case HSO_PORT_GPS_CONT=
ROL:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  483  		port_name =3D "GPS Co=
ntrol";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  484  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  485  	case HSO_PORT_PCSC:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  486  		port_name =3D "PCSC";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  487  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  488  	case HSO_PORT_DIAG:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  489  		port_name =3D "Diagno=
stic";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  490  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  491  	case HSO_PORT_DIAG2:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  492  		port_name =3D "Diagno=
stic2";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  493  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  494  	case HSO_PORT_MODEM:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  495  		port_name =3D "Modem";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  496  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  497  	case HSO_PORT_NETWORK:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  498  		port_name =3D "Networ=
k";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  499  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  500  	default:
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  501  		port_name =3D "Unknow=
n";
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  502  		break;
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  503  	}
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  504  =

72dc1c096c7051a Greg Kroah-Hartman 2008-05-13 @505  	return sprintf(buf, "%=
s\n", port_name);
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  506  }
7567d603b3f1c5e YueHaibing         2021-05-20  507  static DEVICE_ATTR_RO(h=
sotype);
72dc1c096c7051a Greg Kroah-Hartman 2008-05-13  508  =


:::::: The code at line 505 was first introduced by commit
:::::: 72dc1c096c7051a48ab1dbb12f71976656b55eb5 HSO: add option hso driver

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Jeff Garzik <jgarzik@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4765602038856976460==--

