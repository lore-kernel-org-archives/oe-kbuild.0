Content-Type: multipart/mixed; boundary="===============0626093443201200793=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/host/fotg210-hcd.c:2987:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 28 Nov 2021 19:17:14 +0800
Message-ID: <202111281927.tDgxSmxn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0626093443201200793==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3498e7f2bb415e447354a3debef6738d9655768c
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   3 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c006-20211127 (https://download.01.org/0day-ci/arc=
hive/20211128/202111281927.tDgxSmxn-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   net/core/dev.c:8201:2: note: Left side of '&&' is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:30: note: expanded from macro 'DO_ONCE_LITE=
_IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                                              ^
   net/core/dev.c:8201:2: note: '?' condition is false
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
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
   net/core/dev.c:8201:2: note: Taking false branch
           ASSERT_RTNL();
           ^
   include/linux/rtnetlink.h:110:2: note: expanded from macro 'ASSERT_RTNL'
           WARN_ONCE(!rtnl_is_locked(), \
           ^
   include/asm-generic/bug.h:150:2: note: expanded from macro 'WARN_ONCE'
           DO_ONCE_LITE_IF(condition, WARN, 1, format)
           ^
   include/linux/once_lite.h:17:3: note: expanded from macro 'DO_ONCE_LITE_=
IF'
                   if (unlikely(__ret_do_once && !__already_done)) {       \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/dev.c:8203:28: note: Assuming pointer value is null
           changeupper_info.master =3D netdev_master_upper_dev_get(dev) =3D=
=3D upper_dev;
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/core/dev.c:8216:30: note: Passing null pointer value via 1st paramet=
er 'dev'
           __netdev_update_lower_level(upper_dev, priv);
                                       ^~~~~~~~~
   net/core/dev.c:8216:2: note: Calling '__netdev_update_lower_level'
           __netdev_update_lower_level(upper_dev, priv);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/dev.c:7778:19: note: Access to field 'lower_level' results in a=
 dereference of a null pointer (loaded from variable 'dev')
           dev->lower_level =3D __netdev_lower_depth(dev) + 1;
           ~~~              ^
   net/core/dev.c:10864:2: warning: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(dev->name, name);
           ^~~~~~
   net/core/dev.c:10864:2: note: Call to function 'strcpy' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcpy'. CWE-119
           strcpy(dev->name, name);
           ^~~~~~
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
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/usb/host/fotg210-hcd.c:735:2: warning: Value stored to 'next' is=
 never read [clang-analyzer-deadcode.DeadStores]
           next +=3D temp;
           ^       ~~~~
   drivers/usb/host/fotg210-hcd.c:735:2: note: Value stored to 'next' is ne=
ver read
           next +=3D temp;
           ^       ~~~~
>> drivers/usb/host/fotg210-hcd.c:2987:10: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
                           token =3D qtd->hw_token;
                                 ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:214:3: note: expanded from macro 'local_irq_sav=
e'
                   raw_local_irq_save(flags);              \
                   ^
   include/linux/irqflags.h:169:2: note: expanded from macro 'raw_local_irq=
_save'
           do {                                            \
           ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: '?' condition is false
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/irqflags.h:215:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: '?' condition is false
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/usb/host/fotg210-hcd.c:3835:2: note: Taking false branch
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^
   include/linux/spinlock_api_up.h:40:8: note: expanded from macro '__LOCK_=
IRQSAVE'
     do { local_irq_save(flags); __LOCK(lock); } while (0)
          ^
   include/linux/irqflags.h:215:3: note: expanded from macro 'local_irq_sav=
e'
                   if (!raw_irqs_disabled_flags(flags))    \
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/usb/host/fotg210-hcd.c:3835:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&fotg210->lock, flags);
           ^
   include/linux/spinlock.h:392:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:277:3: note: expanded from macro 'raw_spin_lock=
_irqsave'
                   _raw_spin_lock_irqsave(lock, flags);    \
                   ^
   include/linux/spinlock_api_up.h:68:45: note: expanded from macro '_raw_s=
pin_lock_irqsave'
   #define _raw_spin_lock_irqsave(lock, flags)     __LOCK_IRQSAVE(lock, fla=
gs)
                                                   ^

vim +2987 drivers/usb/host/fotg210-hcd.c

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2939  =

259127ba78d0f2 Peter Senna Tschudin 2015-10-12  2940  /* For control/bulk/i=
nterrupt, return QH with these TDs appended.
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2941   * Allocates and init=
ializes the QH if necessary.
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2942   * Returns null if it=
 can't allocate a QH it needs to.
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2943   * If the QH has TDs =
(urbs) already, that's great.
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2944   */
259127ba78d0f2 Peter Senna Tschudin 2015-10-12  2945  static struct fotg210=
_qh *qh_append_tds(struct fotg210_hcd *fotg210,
259127ba78d0f2 Peter Senna Tschudin 2015-10-12  2946  		struct urb *urb, st=
ruct list_head *qtd_list,
259127ba78d0f2 Peter Senna Tschudin 2015-10-12  2947  		int epnum, void **p=
tr)
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2948  {
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2949  	struct fotg210_qh *q=
h =3D NULL;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2950  	__hc32 qh_addr_mask =
=3D cpu_to_hc32(fotg210, 0x7f);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2951  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2952  	qh =3D (struct fotg2=
10_qh *) *ptr;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2953  	if (unlikely(qh =3D=
=3D NULL)) {
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2954  		/* can't sleep here=
, we have fotg210->lock... */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2955  		qh =3D qh_make(fotg=
210, urb, GFP_ATOMIC);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2956  		*ptr =3D qh;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2957  	}
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2958  	if (likely(qh !=3D N=
ULL)) {
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2959  		struct fotg210_qtd =
*qtd;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2960  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2961  		if (unlikely(list_e=
mpty(qtd_list)))
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2962  			qtd =3D NULL;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2963  		else
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2964  			qtd =3D list_entry=
(qtd_list->next, struct fotg210_qtd,
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2965  					qtd_list);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2966  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2967  		/* control qh may n=
eed patching ... */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2968  		if (unlikely(epnum =
=3D=3D 0)) {
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2969  			/* usb_reset_devic=
e() briefly reverts to address 0 */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2970  			if (usb_pipedevice=
(urb->pipe) =3D=3D 0)
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2971  				qh->hw->hw_info1 =
&=3D ~qh_addr_mask;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2972  		}
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2973  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2974  		/* just one way to =
queue requests: swap with the dummy qtd.
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2975  		 * only hc or qh_re=
fresh() ever modify the overlay.
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2976  		 */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2977  		if (likely(qtd !=3D=
 NULL)) {
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2978  			struct fotg210_qtd=
 *dummy;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2979  			dma_addr_t dma;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2980  			__hc32 token;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2981  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2982  			/* to avoid racing=
 the HC, use the dummy td instead of
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2983  			 * the first td of=
 our list (becomes new dummy).  both
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2984  			 * tds stay deacti=
vated until we're done, when the
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2985  			 * HC is allowed t=
o fetch the old dummy (4.10.2).
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2986  			 */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29 @2987  			token =3D qtd->hw_=
token;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2988  			qtd->hw_token =3D =
HALT_BIT(fotg210);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2989  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2990  			dummy =3D qh->dumm=
y;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2991  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2992  			dma =3D dummy->qtd=
_dma;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2993  			*dummy =3D *qtd;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2994  			dummy->qtd_dma =3D=
 dma;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2995  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2996  			list_del(&qtd->qtd=
_list);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2997  			list_add(&dummy->q=
td_list, qtd_list);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2998  			list_splice_tail(q=
td_list, &qh->qtd_list);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  2999  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3000  			fotg210_qtd_init(f=
otg210, qtd, qtd->qtd_dma);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3001  			qh->dummy =3D qtd;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3002  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3003  			/* hc must see the=
 new dummy at list end */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3004  			dma =3D qtd->qtd_d=
ma;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3005  			qtd =3D list_entry=
(qh->qtd_list.prev,
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3006  					struct fotg210_q=
td, qtd_list);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3007  			qtd->hw_next =3D Q=
TD_NEXT(fotg210, dma);
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3008  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3009  			/* let the hc proc=
ess these next qtds */
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3010  			wmb();
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3011  			dummy->hw_token =
=3D token;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3012  =

7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3013  			urb->hcpriv =3D qh;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3014  		}
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3015  	}
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3016  	return qh;
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3017  }
7d50195f6c5005 Feng-Hsin Chiang     2013-07-29  3018  =


:::::: The code at line 2987 was first introduced by commit
:::::: 7d50195f6c5005d6ae7a789d9a7f0a94d104ee96 usb: host: Faraday fotg210-=
hcd driver

:::::: TO: Feng-Hsin Chiang <john453@faraday-tech.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0626093443201200793==--

