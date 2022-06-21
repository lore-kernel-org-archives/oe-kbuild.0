Content-Type: multipart/mixed; boundary="===============6737938647271296483=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 6/7] drivers/block/mtip32xx/mtip32xx.c:2607:44: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 21 Jun 2022 18:20:11 +0800
Message-ID: <202206211838.Mfp8OrKU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6737938647271296483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/block/mtip32xx/mtip32xx.c:2607:44: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: a8846f7b2f123f210694db27803e17fae1c15cbe [6/7] bitops: let optimize=
 out non-atomic bitops on compile-time constants
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-randconfig-c005-20220619 (https://download.01.org/0day-ci/arch=
ive/20220621/202206211838.Mfp8OrKU-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af6d2a=
0b6825e71965f3e2701a63c239fa0ad70f)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/alobakin/linux/commit/a8846f7b2f123f210694db27=
803e17fae1c15cbe
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout a8846f7b2f123f210694db27803e17fae1c15cbe
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2289:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "H/ S ACTive      : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2292:11: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size +=3D sprintf(&buf[size], "%08X ",
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2292:11: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   size +=3D sprintf(&buf[size], "%08X ",
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2295:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2295:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2296:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "H/ Command Issue : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2296:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "H/ Command Issue : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2299:11: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size +=3D sprintf(&buf[size], "%08X ",
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2299:11: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   size +=3D sprintf(&buf[size], "%08X ",
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2302:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2302:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2303:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "H/ Completed     : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2303:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "H/ Completed     : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2306:11: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size +=3D sprintf(&buf[size], "%08X ",
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2306:11: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   size +=3D sprintf(&buf[size], "%08X ",
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2309:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2309:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2310:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "H/ PORT IRQ STAT : [ 0x%08X ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2310:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "H/ PORT IRQ STAT : [ 0x%08X ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2312:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "H/ HOST IRQ STAT : [ 0x%08X ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2312:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "H/ HOST IRQ STAT : [ 0x%08X ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2314:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2314:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2316:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "L/ Commands in Q : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2316:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "L/ Commands in Q : [ 0x");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2324:11: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   size +=3D sprintf(&buf[size], "%08X ", group_allocated);
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2324:11: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
                   size +=3D sprintf(&buf[size], "%08X ", group_allocated);
                           ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2326:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2326:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "]\n");
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2352:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "Flag-port : [ %08lX ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2352:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "Flag-port : [ %08lX ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2354:10: warning: Call to function 'sp=
rintf' is insecure as it does not provide security checks introduced in the=
 C11 standard. Replace with analogous functions that support length argumen=
ts or provides boundary checks such as 'sprintf_s' in case of C11 [clang-an=
alyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           size +=3D sprintf(&buf[size], "Flag-dd   : [ %08lX ]\n",
                   ^~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2354:10: note: Call to function 'sprin=
tf' is insecure as it does not provide security checks introduced in the C1=
1 standard. Replace with analogous functions that support length arguments =
or provides boundary checks such as 'sprintf_s' in case of C11
           size +=3D sprintf(&buf[size], "Flag-dd   : [ %08lX ]\n",
                   ^~~~~~~
>> drivers/block/mtip32xx/mtip32xx.c:2607:44: warning: Use of memory after =
it is freed [clang-analyzer-unix.Malloc]
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                                                            ^
   include/linux/wait.h:500:8: note: expanded from macro 'wait_event_interr=
uptible'
           if (!(condition))                                               =
        \
                 ^~~~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2597:2: note: Loop condition is true. =
 Entering loop body
           while (1) {
           ^
   drivers/block/mtip32xx/mtip32xx.c:2598:7: note: Assuming the condition i=
s false
                   if (kthread_should_stop() ||
                       ^~~~~~~~~~~~~~~~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2598:7: note: Left side of '||' is fal=
se
   drivers/block/mtip32xx/mtip32xx.c:2599:4: note: Left side of '&&' is true
                           test_bit(MTIP_PF_SVC_THD_STOP_BIT, &port->flags))
                           ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:49:4: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
             ^
   drivers/block/mtip32xx/mtip32xx.c:2599:4: note: Assuming the condition i=
s true
                           test_bit(MTIP_PF_SVC_THD_STOP_BIT, &port->flags))
                           ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:50:25: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2599:4: note: Left side of '&&' is fal=
se
                           test_bit(MTIP_PF_SVC_THD_STOP_BIT, &port->flags))
                           ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^
   include/linux/bitops.h:50:63: note: expanded from macro 'bitop'
             __builtin_constant_p((uintptr_t)(addr) !=3D (uintptr_t)NULL) &=
& \
                                                                        ^
   drivers/block/mtip32xx/mtip32xx.c:2599:4: note: Assuming the condition i=
s false
                           test_bit(MTIP_PF_SVC_THD_STOP_BIT, &port->flags))
                           ^
   include/linux/bitops.h:61:29: note: expanded from macro 'test_bit'
   #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:49:3: note: expanded from macro 'bitop'
           ((__builtin_constant_p(nr) &&                                   \
            ^
   drivers/block/mtip32xx/mtip32xx.c:2598:3: note: Taking false branch
                   if (kthread_should_stop() ||
                   ^
   drivers/block/mtip32xx/mtip32xx.c:2607:3: note: Loop condition is false.=
  Exiting loop
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                   ^
   include/linux/wait.h:499:2: note: expanded from macro 'wait_event_interr=
uptible'
           might_sleep();                                                  =
        \
           ^
   include/linux/kernel.h:185:24: note: expanded from macro 'might_sleep'
   # define might_sleep() do { might_resched(); } while (0)
                          ^
   drivers/block/mtip32xx/mtip32xx.c:2607:44: note: Assuming field 'flags' =
is 0
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                                                            ^
   include/linux/wait.h:500:8: note: expanded from macro 'wait_event_interr=
uptible'
           if (!(condition))                                               =
        \
                 ^~~~~~~~~
   drivers/block/mtip32xx/mtip32xx.c:2607:58: note: Left side of '&&' is fa=
lse
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                                                                          ^
   drivers/block/mtip32xx/mtip32xx.c:2607:3: note: Taking true branch
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                   ^
   include/linux/wait.h:500:2: note: expanded from macro 'wait_event_interr=
uptible'
           if (!(condition))                                               =
        \
           ^
   drivers/block/mtip32xx/mtip32xx.c:2607:3: note: '?' condition is false
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                   ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_inter=
ruptible'
                   __ret =3D __wait_event_interruptible(wq_head, condition)=
;         \
                           ^
   include/linux/wait.h:478:56: note: expanded from macro '__wait_event_int=
erruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,     =
        \
                                                                 ^
   drivers/block/mtip32xx/mtip32xx.c:2607:3: note: Loop condition is true. =
 Entering loop body
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                   ^
   include/linux/wait.h:501:11: note: expanded from macro 'wait_event_inter=
ruptible'
                   __ret =3D __wait_event_interruptible(wq_head, condition)=
;         \
                           ^
   include/linux/wait.h:478:2: note: expanded from macro '__wait_event_inte=
rruptible'
           ___wait_event(wq_head, condition, TASK_INTERRUPTIBLE, 0, 0,     =
        \
           ^
   include/linux/wait.h:307:2: note: expanded from macro '___wait_event'
           for (;;) {                                                      =
        \
           ^
   drivers/block/mtip32xx/mtip32xx.c:2607:44: note: Assuming field 'flags' =
is 0
                   wait_event_interruptible(port->svc_wait, (port->flags) &&
                                                            ^
   include/linux/wait.h:501:47: note: expanded from macro 'wait_event_inter=
ruptible'

vim +2607 drivers/block/mtip32xx/mtip32xx.c

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2580  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2581  /*
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2582   * service thread to is=
sue queued commands
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2583   *
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2584   * @data Pointer to the=
 driver data structure.
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2585   *
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2586   * return value
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2587   *	0
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2588   */
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2589  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2590  static int mtip_service=
_thread(void *data)
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2591  {
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2592  	struct driver_data *dd=
 =3D (struct driver_data *)data;
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2593  	unsigned long slot, sl=
ot_start, slot_wrap, to;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2594  	unsigned int num_cmd_s=
lots =3D dd->slot_groups * 32;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2595  	struct mtip_port *port=
 =3D dd->port;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2596  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2597  	while (1) {
9b204fbf0987748 Asai Thambi S P   2014-05-20  2598  		if (kthread_should_st=
op() ||
9b204fbf0987748 Asai Thambi S P   2014-05-20  2599  			test_bit(MTIP_PF_SVC=
_THD_STOP_BIT, &port->flags))
9b204fbf0987748 Asai Thambi S P   2014-05-20  2600  			goto st_out;
9b204fbf0987748 Asai Thambi S P   2014-05-20  2601  		clear_bit(MTIP_PF_SVC=
_THD_ACTIVE_BIT, &port->flags);
9b204fbf0987748 Asai Thambi S P   2014-05-20  2602  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2603  		/*
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2604  		 * the condition is t=
o check neither an internal command is
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2605  		 * is in progress nor=
 error handling is active
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2606  		 */
60ec0eecfa8968d Asai Thambi S P   2011-11-23 @2607  		wait_event_interrupti=
ble(port->svc_wait, (port->flags) &&
cfc05bd31384c48 Asai Thambi SP    2016-02-24  2608  			(port->flags & MTIP_=
PF_SVC_THD_WORK));
8f8b899563f28ef Asai Thambi S P   2013-09-11  2609  =

9b204fbf0987748 Asai Thambi S P   2014-05-20  2610  		if (kthread_should_st=
op() ||
9b204fbf0987748 Asai Thambi S P   2014-05-20  2611  			test_bit(MTIP_PF_SVC=
_THD_STOP_BIT, &port->flags))
9b204fbf0987748 Asai Thambi S P   2014-05-20  2612  			goto st_out;
9b204fbf0987748 Asai Thambi S P   2014-05-20  2613  =

8a857a880bd83ba Asai Thambi S P   2012-04-09  2614  		if (unlikely(test_bit=
(MTIP_DDF_REMOVE_PENDING_BIT,
45038367c271f83 Asai Thambi S P   2012-04-09  2615  				&dd->dd_flag)))
8f8b899563f28ef Asai Thambi S P   2013-09-11  2616  			goto st_out;
c74b0f586fa3cbc Asai Thambi S P   2012-04-09  2617  =

cfc05bd31384c48 Asai Thambi SP    2016-02-24  2618  		set_bit(MTIP_PF_SVC_T=
HD_ACTIVE_BIT, &port->flags);
cfc05bd31384c48 Asai Thambi SP    2016-02-24  2619  =

9b204fbf0987748 Asai Thambi S P   2014-05-20  2620  restart_eh:
9b204fbf0987748 Asai Thambi S P   2014-05-20  2621  		/* Demux bits: start =
with error handling */
9b204fbf0987748 Asai Thambi S P   2014-05-20  2622  		if (test_bit(MTIP_PF_=
EH_ACTIVE_BIT, &port->flags)) {
9b204fbf0987748 Asai Thambi S P   2014-05-20  2623  			mtip_handle_tfe(dd);
9b204fbf0987748 Asai Thambi S P   2014-05-20  2624  			clear_bit(MTIP_PF_EH=
_ACTIVE_BIT, &port->flags);
9b204fbf0987748 Asai Thambi S P   2014-05-20  2625  		}
9b204fbf0987748 Asai Thambi S P   2014-05-20  2626  =

9b204fbf0987748 Asai Thambi S P   2014-05-20  2627  		if (test_bit(MTIP_PF_=
EH_ACTIVE_BIT, &port->flags))
9b204fbf0987748 Asai Thambi S P   2014-05-20  2628  			goto restart_eh;
9b204fbf0987748 Asai Thambi S P   2014-05-20  2629  =

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2630  		if (test_bit(MTIP_PF_=
TO_ACTIVE_BIT, &port->flags)) {
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2631  			to =3D jiffies + mse=
cs_to_jiffies(5000);
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2632  =

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2633  			do {
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2634  				mdelay(100);
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2635  			} while (atomic_read=
(&dd->irq_workers_active) !=3D 0 &&
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2636  				time_before(jiffies=
, to));
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2637  =

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2638  			if (atomic_read(&dd-=
>irq_workers_active) !=3D 0)
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2639  				dev_warn(&dd->pdev-=
>dev,
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2640  					"Completion worker=
s still active!");
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2641  =

436c15ab6596b12 Sagi Grimberg     2017-07-04  2642  			blk_mq_quiesce_queue=
(dd->queue);
436c15ab6596b12 Sagi Grimberg     2017-07-04  2643  =

39795d6534c6e69 Christoph Hellwig 2018-11-14  2644  			blk_mq_tagset_busy_i=
ter(&dd->tags, mtip_queue_cmd, dd);
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2645  =

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2646  			set_bit(MTIP_PF_ISSU=
E_CMDS_BIT, &dd->port->flags);
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2647  =

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2648  			if (mtip_device_rese=
t(dd))
6d125de40bbc5b2 Keith Busch       2016-03-10  2649  				blk_mq_tagset_busy_=
iter(&dd->tags,
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2650  							mtip_abort_cmd, =
dd);
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2651  =

abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2652  			clear_bit(MTIP_PF_TO=
_ACTIVE_BIT, &dd->port->flags);
436c15ab6596b12 Sagi Grimberg     2017-07-04  2653  =

436c15ab6596b12 Sagi Grimberg     2017-07-04  2654  			blk_mq_unquiesce_que=
ue(dd->queue);
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2655  		}
abb0ccd185c9e31 Asai Thambi SP    2016-02-24  2656  =

8a857a880bd83ba Asai Thambi S P   2012-04-09  2657  		if (test_bit(MTIP_PF_=
ISSUE_CMDS_BIT, &port->flags)) {
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2658  			slot =3D 1;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2659  			/* used to restrict =
the loop to one iteration */
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2660  			slot_start =3D num_c=
md_slots;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2661  			slot_wrap =3D 0;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2662  			while (1) {
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2663  				slot =3D find_next_=
bit(port->cmds_to_issue,
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2664  						num_cmd_slots, sl=
ot);
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2665  				if (slot_wrap =3D=
=3D 1) {
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2666  					if ((slot_start >=
=3D slot) ||
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2667  						(slot >=3D num_cm=
d_slots))
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2668  						break;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2669  				}
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2670  				if (unlikely(slot_s=
tart =3D=3D num_cmd_slots))
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2671  					slot_start =3D slo=
t;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2672  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2673  				if (unlikely(slot =
=3D=3D num_cmd_slots)) {
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2674  					slot =3D 1;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2675  					slot_wrap =3D 1;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2676  					continue;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2677  				}
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2678  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2679  				/* Issue the comman=
d to the hardware */
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2680  				mtip_issue_ncq_comm=
and(port, slot);
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2681  =

60ec0eecfa8968d Asai Thambi S P   2011-11-23  2682  				clear_bit(slot, por=
t->cmds_to_issue);
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2683  			}
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2684  =

8a857a880bd83ba Asai Thambi S P   2012-04-09  2685  			clear_bit(MTIP_PF_IS=
SUE_CMDS_BIT, &port->flags);
9b204fbf0987748 Asai Thambi S P   2014-05-20  2686  		}
9b204fbf0987748 Asai Thambi S P   2014-05-20  2687  =

9b204fbf0987748 Asai Thambi S P   2014-05-20  2688  		if (test_bit(MTIP_PF_=
REBUILD_BIT, &port->flags)) {
59cf70e236c9659 Asai Thambi SP    2016-02-24  2689  			if (mtip_ftl_rebuild=
_poll(dd) =3D=3D 0)
8a857a880bd83ba Asai Thambi S P   2012-04-09  2690  				clear_bit(MTIP_PF_R=
EBUILD_BIT, &port->flags);
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2691  		}
8f8b899563f28ef Asai Thambi S P   2013-09-11  2692  	}
8f8b899563f28ef Asai Thambi S P   2013-09-11  2693  =

8f8b899563f28ef Asai Thambi S P   2013-09-11  2694  st_out:
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2695  	return 0;
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2696  }
60ec0eecfa8968d Asai Thambi S P   2011-11-23  2697  =


:::::: The code at line 2607 was first introduced by commit
:::::: 60ec0eecfa8968d0f1188e3730979196ac28b9de mtip32xx: updates based on =
feedback

:::::: TO: Asai Thambi S P <asamymuthupa@micron.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6737938647271296483==--

