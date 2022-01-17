Content-Type: multipart/mixed; boundary="===============5252489181204753429=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [peterz-queue:locking/wip.refcount.crazy 5/10] net/sched/act_api.c:181:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 17 Jan 2022 21:58:36 +0800
Message-ID: <202201172054.zdPp5NQS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5252489181204753429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/wip.refcount.crazy
head:   96fbd45c2ceaf3352d76860c2749784fafcab5f1
commit: 9d238fe29c410f0c4ba150019b542d30f5319b49 [5/10] atomic,x86: Impleme=
nt atomic_dec_and_test_overflow()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
117/202201172054.zdPp5NQS-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 650fc4=
0b6d8d9a5869b4fca525d5f237b0ee2803)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/=
commit/?id=3D9d238fe29c410f0c4ba150019b542d30f5319b49
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/ke=
rnel/git/peterz/queue.git
        git fetch --no-tags peterz-queue locking/wip.refcount.crazy
        git checkout 9d238fe29c410f0c4ba150019b542d30f5319b49
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   drivers/i3c/device.c:64:2: note: '?' condition is false
           if (!info)
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
   drivers/i3c/device.c:64:2: note: Taking false branch
           if (!info)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/i3c/device.c:68:2: note: Assuming field 'desc' is null
           if (dev->desc)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/i3c/device.c:68:2: note: '?' condition is false
           if (dev->desc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/i3c/device.c:68:11: note: Field 'desc' is null
           if (dev->desc)
                    ^
   drivers/i3c/device.c:68:2: note: '?' condition is false
           if (dev->desc)
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
   drivers/i3c/device.c:68:2: note: Taking false branch
           if (dev->desc)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/i3c/device.c:71:1: note: Returning without writing to '->pid'
   }
   ^
   drivers/i3c/device.c:219:2: note: Returning from 'i3c_device_get_info'
           i3c_device_get_info(i3cdev, &devinfo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/device.c:221:10: note: The left operand of '&' is a garbage =
value
           manuf =3D I3C_PID_MANUF_ID(devinfo.pid);
                   ^
   include/linux/i3c/device.h:79:40: note: expanded from macro 'I3C_PID_MAN=
UF_ID'
   #define I3C_PID_MANUF_ID(pid)           (((pid) & GENMASK_ULL(47, 33)) >=
> 33)
                                              ~~~  ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> net/sched/act_api.c:181:7: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                   if (__tcf_action_put(p, bind))
                       ^
   net/sched/act_api.c:193:8: note: Calling '__tcf_idr_release'
           ret =3D __tcf_idr_release(a, bind, false);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sched/act_api.c:177:6: note: 'p' is non-null
           if (p) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/act_api.c:177:2: note: '?' condition is false
           if (p) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sched/act_api.c:177:6: note: 'p' is non-null
           if (p) {
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
   net/sched/act_api.c:177:2: note: '?' condition is true
           if (p) {
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
   net/sched/act_api.c:177:2: note: Taking true branch
           if (p) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/sched/act_api.c:178:7: note: Assuming 'bind' is false
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/act_api.c:178:7: note: Left side of '&&' is true
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)
                       ^
   net/sched/act_api.c:178:16: note: 'strict' is false
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/sched/act_api.c:178:23: note: Left side of '&&' is false
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)
                                       ^
   net/sched/act_api.c:178:3: note: '?' condition is false
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/sched/act_api.c:178:8: note: 'bind' is false
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)
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
   net/sched/act_api.c:178:7: note: Left side of '&&' is true
                   if (!bind && strict && atomic_read(&p->tcfa_bindcnt) > 0)

vim +181 net/sched/act_api.c

16af6067392c40 Vlad Buslov     2018-07-05  160  =

b3650bf76a3238 Vlad Buslov     2021-04-07  161  static int __tcf_idr_releas=
e(struct tc_action *p, bool bind, bool strict)
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  162  {
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  163  	int ret =3D 0;
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  164  =

036bb44327f502 Vlad Buslov     2018-07-05  165  	/* Release with strict=3D=
=3D1 and bind=3D=3D0 is only called through act API
036bb44327f502 Vlad Buslov     2018-07-05  166  	 * interface (classifiers =
always bind). Only case when action with
036bb44327f502 Vlad Buslov     2018-07-05  167  	 * positive reference coun=
t and zero bind count can exist is when it was
036bb44327f502 Vlad Buslov     2018-07-05  168  	 * also created with act A=
PI (unbinding last classifier will destroy the
036bb44327f502 Vlad Buslov     2018-07-05  169  	 * action if it was create=
d by classifier). So only case when bind count
036bb44327f502 Vlad Buslov     2018-07-05  170  	 * can be changed after in=
itial check is when unbound action is
036bb44327f502 Vlad Buslov     2018-07-05  171  	 * destroyed by act API wh=
ile classifier binds to action with same id
036bb44327f502 Vlad Buslov     2018-07-05  172  	 * concurrently. This resu=
lt either creation of new action(same behavior
036bb44327f502 Vlad Buslov     2018-07-05  173  	 * as before), or reusing =
existing action if concurrent process
036bb44327f502 Vlad Buslov     2018-07-05  174  	 * increments reference co=
unt before action is deleted. Both scenarios
036bb44327f502 Vlad Buslov     2018-07-05  175  	 * are acceptable.
036bb44327f502 Vlad Buslov     2018-07-05  176  	 */
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  177  	if (p) {
16af6067392c40 Vlad Buslov     2018-07-05  178  		if (!bind && strict && at=
omic_read(&p->tcfa_bindcnt) > 0)
55334a5db5cd32 WANG Cong       2014-02-11  179  			return -EPERM;
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  180  =

16af6067392c40 Vlad Buslov     2018-07-05 @181  		if (__tcf_action_put(p, b=
ind))
1d4150c02c5709 WANG Cong       2016-02-22  182  			ret =3D ACT_P_DELETED;
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  183  	}
28e6b67f0b292f Daniel Borkmann 2015-07-29  184  =

e9ce1cd3cf6cf3 David S. Miller 2006-08-21  185  	return ret;
e9ce1cd3cf6cf3 David S. Miller 2006-08-21  186  }
b3650bf76a3238 Vlad Buslov     2021-04-07  187  =


:::::: The code at line 181 was first introduced by commit
:::::: 16af6067392c40e454e49eec834843ab03643d96 net: sched: implement refer=
ence counted action release

:::::: TO: Vlad Buslov <vladbu@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5252489181204753429==--

