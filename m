Content-Type: multipart/mixed; boundary="===============0508098751935977807=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ipa/ipa_qmi.c:128:14: warning: Value stored to 'ipa' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 04:13:17 +0800
Message-ID: <202112100459.2zN1UKNj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0508098751935977807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Elder <elder@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 99e75a37bd0af8eb8a0560f48091672b1b6d9218 net: ipa: relax 64-bit bui=
ld requirement
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20211201 (https://download.01.org/0day-ci/archi=
ve/20211210/202112100459.2zN1UKNj-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7f=
a01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D99e75a37bd0af8eb8a0560f48091672b1b6d9218
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 99e75a37bd0af8eb8a0560f48091672b1b6d9218
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   drivers/virtio/virtio_ring.c:1128:15: note: Assuming 'total_sg' is <=3D =
field 'num'
           WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
                        ^
   include/asm-generic/bug.h:201:41: note: expanded from macro 'WARN_ON_ONC=
E'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:188:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/virtio/virtio_ring.c:1128:47: note: Left side of '&&' is false
           WARN_ON_ONCE(total_sg > vq->packed.vring.num && !vq->indirect);
                                                        ^
   drivers/virtio/virtio_ring.c:1134:15: note: Assuming 'descs_used' is <=
=3D field 'num_free'
           if (unlikely(vq->vq.num_free < descs_used)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/virtio/virtio_ring.c:1134:2: note: Taking false branch
           if (unlikely(vq->vq.num_free < descs_used)) {
           ^
   drivers/virtio/virtio_ring.c:1142:9: note: Assuming 'id' is not equal to=
 field 'num'
           BUG_ON(id =3D=3D vq->packed.vring.num);
                  ^
   include/asm-generic/bug.h:183:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/virtio/virtio_ring.c:1142:2: note: Taking false branch
           BUG_ON(id =3D=3D vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:183:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   drivers/virtio/virtio_ring.c:1142:2: note: Loop condition is false.  Exi=
ting loop
           BUG_ON(id =3D=3D vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:183:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/virtio/virtio_ring.c:1146:2: note: Loop condition is true.  Ente=
ring loop body
           for (n =3D 0; n < out_sgs + in_sgs; n++) {
           ^
   drivers/virtio/virtio_ring.c:1147:3: note: Loop condition is false. Exec=
ution continues on line 1146
                   for (sg =3D sgs[n]; sg; sg =3D sg_next(sg)) {
                   ^
   drivers/virtio/virtio_ring.c:1146:2: note: Loop condition is false. Exec=
ution continues on line 1183
           for (n =3D 0; n < out_sgs + in_sgs; n++) {
           ^
   drivers/virtio/virtio_ring.c:1183:6: note: 'i' is >=3D 'head'
           if (i < head)
               ^
   drivers/virtio/virtio_ring.c:1183:2: note: Taking false branch
           if (i < head)
           ^
   drivers/virtio/virtio_ring.c:1205:36: note: Assigned value is garbage or=
 undefined
           vq->packed.vring.desc[head].flags =3D head_flags;
                                             ^ ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> drivers/net/ipa/ipa_qmi.c:128:14: warning: Value stored to 'ipa' during =
its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct ipa *ipa =3D container_of(ipa_qmi, struct ipa, qmi);
                       ^~~
   drivers/net/ipa/ipa_qmi.c:128:14: note: Value stored to 'ipa' during its=
 initialization is never read
           struct ipa *ipa =3D container_of(ipa_qmi, struct ipa, qmi);
                       ^~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   include/asm-generic/bitops/non-atomic.h:106:16: warning: Array access (f=
rom variable 'addr') results in a null pointer dereference [clang-analyzer-=
core.NullDereference]
           return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
                         ^
   drivers/usb/gadget/function/u_serial.c:359:26: note: Left side of '&&' i=
s false
           struct gs_port          *port =3D container_of(w, struct gs_port=
, push);
                                           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/function/u_serial.c:359:26: note: Taking false branch
           struct gs_port          *port =3D container_of(w, struct gs_port=
, push);
                                           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   drivers/usb/gadget/function/u_serial.c:359:26: note: Loop condition is f=
alse.  Exiting loop
           struct gs_port          *port =3D container_of(w, struct gs_port=
, push);
                                           ^
   include/linux/kernel.h:709:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:298:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   drivers/usb/gadget/function/u_serial.c:366:2: note: Calling 'spin_lock_i=
rq'
           spin_lock_irq(&port->port_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:379:2: note: Value assigned to field 'tty'
           raw_spin_lock_irq(&lock->rlock);
           ^
   include/linux/spinlock.h:282:34: note: expanded from macro 'raw_spin_loc=
k_irq'
   #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_serial.c:366:2: note: Returning from 'spin=
_lock_irq'
           spin_lock_irq(&port->port_lock);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_serial.c:367:2: note: Value assigned to 't=
ty'
           tty =3D port->port.tty;
           ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/u_serial.c:368:2: note: Loop condition is tr=
ue.  Entering loop body
           while (!list_empty(queue)) {
           ^
   drivers/usb/gadget/function/u_serial.c:371:9: note: Left side of '&&' is=
 false
                   req =3D list_first_entry(queue, struct usb_request, list=
);
                         ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   drivers/usb/gadget/function/u_serial.c:371:9: note: Taking false branch
                   req =3D list_first_entry(queue, struct usb_request, list=
);

vim +/ipa +128 drivers/net/ipa/ipa_qmi.c

530f9216a9537b5 Alex Elder 2020-03-05  116  =

530f9216a9537b5 Alex Elder 2020-03-05  117  /* Determine whether everything=
 is ready to start normal operation.
530f9216a9537b5 Alex Elder 2020-03-05  118   * We know everything (else) is=
 ready when we know the IPA driver on
530f9216a9537b5 Alex Elder 2020-03-05  119   * the modem is ready, and the =
microcontroller is ready.
530f9216a9537b5 Alex Elder 2020-03-05  120   *
530f9216a9537b5 Alex Elder 2020-03-05  121   * When the modem boots (or reb=
oots), the handshake sequence starts
530f9216a9537b5 Alex Elder 2020-03-05  122   * with the AP sending the mode=
m an INIT_DRIVER request.  Within
530f9216a9537b5 Alex Elder 2020-03-05  123   * that request, the uc_loaded =
flag will be zero (false) for an
530f9216a9537b5 Alex Elder 2020-03-05  124   * initial boot, non-zero (true=
) for a subsequent (SSR) boot.
530f9216a9537b5 Alex Elder 2020-03-05  125   */
530f9216a9537b5 Alex Elder 2020-03-05  126  static void ipa_qmi_ready(struc=
t ipa_qmi *ipa_qmi)
530f9216a9537b5 Alex Elder 2020-03-05  127  {
530f9216a9537b5 Alex Elder 2020-03-05 @128  	struct ipa *ipa =3D container_=
of(ipa_qmi, struct ipa, qmi);
530f9216a9537b5 Alex Elder 2020-03-05  129  	int ret;
530f9216a9537b5 Alex Elder 2020-03-05  130  =

530f9216a9537b5 Alex Elder 2020-03-05  131  	/* We aren't ready until the m=
odem and microcontroller are */
530f9216a9537b5 Alex Elder 2020-03-05  132  	if (!ipa_qmi->modem_ready || !=
ipa_qmi->uc_ready)
530f9216a9537b5 Alex Elder 2020-03-05  133  		return;
530f9216a9537b5 Alex Elder 2020-03-05  134  =

530f9216a9537b5 Alex Elder 2020-03-05  135  	/* Send the indication message=
 if it was requested */
530f9216a9537b5 Alex Elder 2020-03-05  136  	ipa_qmi_indication(ipa_qmi);
530f9216a9537b5 Alex Elder 2020-03-05  137  =

530f9216a9537b5 Alex Elder 2020-03-05  138  	/* The initial boot requires u=
s to send the indication. */
530f9216a9537b5 Alex Elder 2020-03-05  139  	if (ipa_qmi->initial_boot) {
530f9216a9537b5 Alex Elder 2020-03-05  140  		if (!ipa_qmi->indication_sent)
530f9216a9537b5 Alex Elder 2020-03-05  141  			return;
530f9216a9537b5 Alex Elder 2020-03-05  142  =

530f9216a9537b5 Alex Elder 2020-03-05  143  		/* The initial modem boot com=
pleted successfully */
530f9216a9537b5 Alex Elder 2020-03-05  144  		ipa_qmi->initial_boot =3D fal=
se;
530f9216a9537b5 Alex Elder 2020-03-05  145  	}
530f9216a9537b5 Alex Elder 2020-03-05  146  =

530f9216a9537b5 Alex Elder 2020-03-05  147  	/* We're ready.  Start up norm=
al operation */
530f9216a9537b5 Alex Elder 2020-03-05  148  	ipa =3D container_of(ipa_qmi, =
struct ipa, qmi);
530f9216a9537b5 Alex Elder 2020-03-05  149  	ret =3D ipa_modem_start(ipa);
530f9216a9537b5 Alex Elder 2020-03-05  150  	if (ret)
530f9216a9537b5 Alex Elder 2020-03-05  151  		dev_err(&ipa->pdev->dev, "err=
or %d starting modem\n", ret);
530f9216a9537b5 Alex Elder 2020-03-05  152  }
530f9216a9537b5 Alex Elder 2020-03-05  153  =


:::::: The code at line 128 was first introduced by commit
:::::: 530f9216a9537b58cdc2f967b5cd78f5dafb34c4 soc: qcom: ipa: AP/modem co=
mmunications

:::::: TO: Alex Elder <elder@linaro.org>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0508098751935977807==--

