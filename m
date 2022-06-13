Content-Type: multipart/mixed; boundary="===============8983218390706156743=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC][CFT] handling Rerror without copy_from_iter_full()
Date: Mon, 13 Jun 2022 12:54:54 +0800
Message-ID: <202206131238.IpT05p4w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8983218390706156743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/9p/tr=
ans_virtio.c:401:24: warning: Dereference of null pointer [clang-analyzer-c=
ore.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <YqDfWho8+f2AXPrj@zeniv-ca.linux.org.uk>
References: <YqDfWho8+f2AXPrj@zeniv-ca.linux.org.uk>
TO: Al Viro <viro@zeniv.linux.org.uk>

Hi Al,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.19-rc1]
[also build test WARNING on next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Al-Viro/handling-Rer=
ror-without-copy_from_iter_full/20220609-014338
base:    f2906aa863381afb0015a9eb7fefad885d4e5a56
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20613/202206131238.IpT05p4w-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe=
755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0e939f8c227af3b09fc=
90c8f3b6441a4bfb0b95b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Al-Viro/handling-Rerror-without-co=
py_from_iter_full/20220609-014338
        git checkout 0e939f8c227af3b09fc90c8f3b6441a4bfb0b95b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/fortify-string.h:385:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:378:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/sunrpc/svcauth_unix.c:883:29: warning: Although the value stored to =
'len' is used in the enclosing expression, the value is never actually read=
 from 'len' [clang-analyzer-deadcode.DeadStores]
           if (slen > UNX_NGROUPS || (len -=3D (slen + 2)*4) < 0)
                                      ^      ~~~~~~~~~~~~
   net/sunrpc/svcauth_unix.c:883:29: note: Although the value stored to 'le=
n' is used in the enclosing expression, the value is never actually read fr=
om 'len'
           if (slen > UNX_NGROUPS || (len -=3D (slen + 2)*4) < 0)
                                      ^      ~~~~~~~~~~~~
   Suppressed 94 warnings (93 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   21 warnings generated.
   drivers/leds/trigger/ledtrig-oneshot.c:43:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", oneshot_data->invert);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:43:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", oneshot_data->invert);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:73:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_on);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:73:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_on);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:97:9: warning: Call to function '=
sprintf' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'sprintf_s' in case of C11 [clang-=
analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_off);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-oneshot.c:97:9: note: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%lu\n", led_cdev->blink_delay_off);
                  ^~~~~~~
   Suppressed 18 warnings (18 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   drivers/leds/trigger/ledtrig-gpio.c:53:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", gpio_data->desired_brightness);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:53:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", gpio_data->desired_brightness);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:63:8: warning: Call to function 'ssc=
anf' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &desired_brightness);
                 ^~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:63:8: note: Call to function 'sscanf=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &desired_brightness);
                 ^~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:81:9: warning: Call to function 'spr=
intf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sprintf_s' in case of C11 [clang-ana=
lyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", gpio_data->inverted);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:81:9: note: Call to function 'sprint=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", gpio_data->inverted);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:115:9: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           return sprintf(buf, "%u\n", gpio_data->gpio);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:115:9: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           return sprintf(buf, "%u\n", gpio_data->gpio);
                  ^~~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:126:8: warning: Call to function 'ss=
canf' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'sscanf_s' in case of C11 [clang-anal=
yzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           ret =3D sscanf(buf, "%u", &gpio);
                 ^~~~~~
   drivers/leds/trigger/ledtrig-gpio.c:126:8: note: Call to function 'sscan=
f' is insecure as it does not provide security checks introduced in the C11=
 standard. Replace with analogous functions that support length arguments o=
r provides boundary checks such as 'sscanf_s' in case of C11
           ret =3D sscanf(buf, "%u", &gpio);
                 ^~~~~~
   Suppressed 33 warnings (33 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   71 warnings generated.
   net/wireless/lib80211.c:51:2: warning: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(info, 0, sizeof(*info));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/wireless/lib80211.c:51:2: note: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11
           memset(info, 0, sizeof(*info));
           ^
   include/linux/fortify-string.h:288:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:281:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   Suppressed 70 warnings (70 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   86 warnings generated.
>> net/9p/trans_virtio.c:401:24: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
                   memcpy_from_page(to, *pages++, offs, n);
                                        ^
   net/9p/trans_virtio.c:435:2: note: Taking false branch
           p9_debug(P9_DEBUG_TRANS, "virtio request\n");
           ^
   include/net/9p/9p.h:56:2: note: expanded from macro 'p9_debug'
           no_printk(fmt, ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/9p/trans_virtio.c:437:6: note: Assuming 'uodata' is null
           if (uodata) {
               ^~~~~~
   net/9p/trans_virtio.c:437:2: note: Taking false branch
           if (uodata) {
           ^
   net/9p/trans_virtio.c:457:13: note: Assuming 'uidata' is non-null
           } else if (uidata) {
                      ^~~~~~
   net/9p/trans_virtio.c:457:9: note: Taking true branch
           } else if (uidata) {
                  ^
   net/9p/trans_virtio.c:460:7: note: Assuming 'n' is >=3D 0
                   if (n < 0) {
                       ^~~~~
   net/9p/trans_virtio.c:460:3: note: Taking false branch
                   if (n < 0) {
                   ^
   net/9p/trans_virtio.c:465:7: note: Assuming 'n' is equal to 'inlen'
                   if (n !=3D inlen) {
                       ^~~~~~~~~~
   net/9p/trans_virtio.c:465:3: note: Taking false branch
                   if (n !=3D inlen) {
                   ^
   net/9p/trans_virtio.c:473:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/9p/trans_virtio.c:473:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/9p/trans_virtio.c:481:6: note: Assuming 'out' is 0
           if (out)
               ^~~
   net/9p/trans_virtio.c:481:2: note: Taking false branch
           if (out)
           ^
   net/9p/trans_virtio.c:484:6: note: 'out_pages' is null
           if (out_pages) {
               ^~~~~~~~~
   net/9p/trans_virtio.c:484:2: note: Taking false branch
           if (out_pages) {
           ^
   net/9p/trans_virtio.c:499:6: note: Assuming 'in' is 0
           if (in)
               ^~
   net/9p/trans_virtio.c:499:2: note: Taking false branch
           if (in)
           ^
   net/9p/trans_virtio.c:502:6: note: Assuming 'in_pages' is null
           if (in_pages) {
               ^~~~~~~~
   net/9p/trans_virtio.c:502:2: note: Taking false branch
           if (in_pages) {
           ^
   net/9p/trans_virtio.c:508:2: note: Taking false branch
           BUG_ON(out_sgs + in_sgs > ARRAY_SIZE(sgs));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/9p/trans_virtio.c:508:2: note: Loop condition is false.  Exiting loop
           BUG_ON(out_sgs + in_sgs > ARRAY_SIZE(sgs));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/9p/trans_virtio.c:511:6: note: Assuming 'err' is >=3D 0
           if (err < 0) {
               ^~~~~~~
   net/9p/trans_virtio.c:511:2: note: Taking false branch
           if (err < 0) {
           ^
   net/9p/trans_virtio.c:533:2: note: Taking false branch
           p9_debug(P9_DEBUG_TRANS, "virtio request kicked\n");
           ^
   include/net/9p/9p.h:56:2: note: expanded from macro 'p9_debug'
           no_printk(fmt, ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/9p/trans_virtio.c:534:8: note: Loop condition is false.  Exiting loop
           err =3D wait_event_killable(req->wq, req->status >=3D REQ_STATUS=
_RCVD);
                 ^
   include/linux/wait.h:928:2: note: expanded from macro 'wait_event_killab=
le'
           might_sleep();                                                  =
        \
           ^
   include/linux/kernel.h:143:2: note: expanded from macro 'might_sleep'
           do { __might_sleep(__FILE__, __LINE__); might_resched(); } while=
 (0)
           ^
   net/9p/trans_virtio.c:534:37: note: Assuming field 'status' is >=3D REQ_=
STATUS_RCVD
           err =3D wait_event_killable(req->wq, req->status >=3D REQ_STATUS=
_RCVD);
                                              ^
   include/linux/wait.h:929:8: note: expanded from macro 'wait_event_killab=
le'
           if (!(condition))                                               =
        \
                 ^~~~~~~~~
   net/9p/trans_virtio.c:534:8: note: Taking false branch
           err =3D wait_event_killable(req->wq, req->status >=3D REQ_STATUS=
_RCVD);
                 ^
   include/linux/wait.h:929:2: note: expanded from macro 'wait_event_killab=
le'
           if (!(condition))                                               =
        \
           ^
   net/9p/trans_virtio.c:536:6: note: Assuming field 'status' is equal to R=
EQ_STATUS_RCVD
           if (req->status =3D=3D REQ_STATUS_RCVD &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:536:6: note: Left side of '&&' is true
   net/9p/trans_virtio.c:537:15: note: Assuming the condition is true
               unlikely(req->rc.sdata[4] =3D=3D P9_RERROR))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/9p/trans_virtio.c:536:2: note: Taking true branch
           if (req->status =3D=3D REQ_STATUS_RCVD &&
           ^
   net/9p/trans_virtio.c:538:3: note: Calling 'handle_rerror'
                   handle_rerror(req, in_hdr_len, offs, in_pages);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:387:6: note: Assuming 'in_hdr_len' is <=3D field '=
size'
           if (req->rc.size < in_hdr_len)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:387:2: note: Taking false branch
           if (req->rc.size < in_hdr_len)
           ^
   net/9p/trans_virtio.c:394:15: note: Assuming field 'size' is <=3D 4096
           if (unlikely(req->rc.size > P9_ZC_HDR_SZ))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/9p/trans_virtio.c:394:2: note: Taking false branch
           if (unlikely(req->rc.size > P9_ZC_HDR_SZ))
           ^
   net/9p/trans_virtio.c:400:6: note: Assuming 'size' is > 'n'
           if (size > n) {
               ^~~~~~~~
   net/9p/trans_virtio.c:400:2: note: Taking true branch
           if (size > n) {
           ^
   net/9p/trans_virtio.c:401:25: note: Null pointer value stored to 'pages'
                   memcpy_from_page(to, *pages++, offs, n);
                                         ^~~~~~~
   net/9p/trans_virtio.c:401:24: note: Dereference of null pointer
                   memcpy_from_page(to, *pages++, offs, n);
                                        ^~~~~~~~
>> net/9p/trans_virtio.c:406:23: warning: Dereference of null pointer (load=
ed from variable 'pages') [clang-analyzer-core.NullDereference]
           memcpy_from_page(to, *pages, offs, size);
                                ^
   net/9p/trans_virtio.c:435:2: note: Taking false branch
           p9_debug(P9_DEBUG_TRANS, "virtio request\n");
           ^
   include/net/9p/9p.h:56:2: note: expanded from macro 'p9_debug'
           no_printk(fmt, ##__VA_ARGS__)
           ^
   include/linux/printk.h:130:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/9p/trans_virtio.c:437:6: note: Assuming 'uodata' is null
           if (uodata) {
               ^~~~~~
   net/9p/trans_virtio.c:437:2: note: Taking false branch
           if (uodata) {
           ^
   net/9p/trans_virtio.c:457:13: note: Assuming 'uidata' is non-null
           } else if (uidata) {
                      ^~~~~~
   net/9p/trans_virtio.c:457:9: note: Taking true branch
           } else if (uidata) {
                  ^
   net/9p/trans_virtio.c:458:11: note: Value assigned to 'in_pages'
                   int n =3D p9_get_mapped_pages(chan, &in_pages, uidata,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_virtio.c:460:7: note: Assuming 'n' is >=3D 0
                   if (n < 0) {
                       ^~~~~
   net/9p/trans_virtio.c:460:3: note: Taking false branch
                   if (n < 0) {
                   ^
   net/9p/trans_virtio.c:465:7: note: Assuming 'n' is equal to 'inlen'
                   if (n !=3D inlen) {
                       ^~~~~~~~~~
   net/9p/trans_virtio.c:465:3: note: Taking false branch
                   if (n !=3D inlen) {
                   ^
   net/9p/trans_virtio.c:473:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/9p/trans_virtio.c:473:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&chan->lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   net/9p/trans_virtio.c:481:6: note: Assuming 'out' is 0
           if (out)
               ^~~
   net/9p/trans_virtio.c:481:2: note: Taking false branch
           if (out)
           ^
   net/9p/trans_virtio.c:484:6: note: 'out_pages' is null
           if (out_pages) {
               ^~~~~~~~~
   net/9p/trans_virtio.c:484:2: note: Taking false branch
           if (out_pages) {
           ^
   net/9p/trans_virtio.c:499:6: note: Assuming 'in' is 0
           if (in)
               ^~
   net/9p/trans_virtio.c:499:2: note: Taking false branch
           if (in)
           ^
   net/9p/trans_virtio.c:502:6: note: Assuming 'in_pages' is null
           if (in_pages) {
               ^~~~~~~~
   net/9p/trans_virtio.c:502:2: note: Taking false branch
           if (in_pages) {
           ^
   net/9p/trans_virtio.c:508:2: note: Taking false branch
           BUG_ON(out_sgs + in_sgs > ARRAY_SIZE(sgs));
           ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   net/9p/trans_virtio.c:508:2: note: Loop condition is false.  Exiting loop
           BUG_ON(out_sgs + in_sgs > ARRAY_SIZE(sgs));
           ^
   include/asm-generic/bug.h:71:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   net/9p/trans_virtio.c:511:6: note: Assuming 'err' is >=3D 0
           if (err < 0) {
               ^~~~~~~
   net/9p/trans_virtio.c:511:2: note: Taking false branch
           if (err < 0) {
           ^
   net/9p/trans_virtio.c:533:2: note: Taking false branch
           p9_debug(P9_DEBUG_TRANS, "virtio request kicked\n");
           ^
   include/net/9p/9p.h:56:2: note: expanded from macro 'p9_debug'
           no_printk(fmt, ##__VA_ARGS__)

vim +401 net/9p/trans_virtio.c

4038866dab4e46 Venkateswararao Jujjuri (JV  2011-01-28  379) =

0e939f8c227af3 Al Viro                      2022-06-08  380  static void ha=
ndle_rerror(struct p9_req_t *req, int in_hdr_len,
0e939f8c227af3 Al Viro                      2022-06-08  381  			  size_t of=
fs, struct page **pages)
0e939f8c227af3 Al Viro                      2022-06-08  382  {
0e939f8c227af3 Al Viro                      2022-06-08  383  	unsigned size=
, n;
0e939f8c227af3 Al Viro                      2022-06-08  384  	void *to =3D =
req->rc.sdata + in_hdr_len;
0e939f8c227af3 Al Viro                      2022-06-08  385  =

0e939f8c227af3 Al Viro                      2022-06-08  386  	// Fits entir=
ely into the static data?  Nothing to do.
0e939f8c227af3 Al Viro                      2022-06-08  387  	if (req->rc.s=
ize < in_hdr_len)
0e939f8c227af3 Al Viro                      2022-06-08  388  		return;
0e939f8c227af3 Al Viro                      2022-06-08  389  =

0e939f8c227af3 Al Viro                      2022-06-08  390  	// Really lon=
g error message?  Tough, truncate the reply.  Might get
0e939f8c227af3 Al Viro                      2022-06-08  391  	// rejected (=
we can't be arsed to adjust the size encoded in header,
0e939f8c227af3 Al Viro                      2022-06-08  392  	// or string =
size for that matter), but it wouldn't be anything valid
0e939f8c227af3 Al Viro                      2022-06-08  393  	// anyway.
0e939f8c227af3 Al Viro                      2022-06-08  394  	if (unlikely(=
req->rc.size > P9_ZC_HDR_SZ))
0e939f8c227af3 Al Viro                      2022-06-08  395  		req->rc.size=
 =3D P9_ZC_HDR_SZ;
0e939f8c227af3 Al Viro                      2022-06-08  396  =

0e939f8c227af3 Al Viro                      2022-06-08  397  	// data won't=
 span more than two pages
0e939f8c227af3 Al Viro                      2022-06-08  398  	size =3D req-=
>rc.size - in_hdr_len;
0e939f8c227af3 Al Viro                      2022-06-08  399  	n =3D PAGE_SI=
ZE - offs;
0e939f8c227af3 Al Viro                      2022-06-08  400  	if (size > n)=
 {
0e939f8c227af3 Al Viro                      2022-06-08 @401  		memcpy_from_=
page(to, *pages++, offs, n);
0e939f8c227af3 Al Viro                      2022-06-08  402  		offs =3D 0;
0e939f8c227af3 Al Viro                      2022-06-08  403  		to +=3D n;
0e939f8c227af3 Al Viro                      2022-06-08  404  		size -=3D n;
0e939f8c227af3 Al Viro                      2022-06-08  405  	}
0e939f8c227af3 Al Viro                      2022-06-08 @406  	memcpy_from_p=
age(to, *pages, offs, size);
0e939f8c227af3 Al Viro                      2022-06-08  407  }
0e939f8c227af3 Al Viro                      2022-06-08  408  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8983218390706156743==--

