Content-Type: multipart/mixed; boundary="===============9141096263901435850=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 72/12117] include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved word 'for' as identifier
Date: Fri, 14 Jan 2022 13:31:21 +0800
Message-ID: <202201141336.VZ0MMmP0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9141096263901435850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Greentime Hu <green.hu@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   27c9d5b3c24af29de643533984f1ba3e650c7c78
commit: 36b9b19753937a6fe0e591b518d46a1f2efae679 [72/12117] nds32: add a Kc=
onfig symbol for LOCKDEP_SUPPORT
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: nds32-allyesconfig (https://download.01.org/0day-ci/archive/2022011=
4/202201141336.VZ0MMmP0-lkp(a)intel.com/config)
compiler: nds32le-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D36b9b19753937a6fe0e591b518d46a1f2efae679
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 36b9b19753937a6fe0e591b518d46a1f2efae679
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ds32 SHELL=3D/bin/bash arch/nds32/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/nds32/kernel/vdso/gettimeofday.c: note: in included file (through i=
nclude/linux/lockdep.h, include/linux/rcupdate.h, include/linux/rbtree.h, .=
..):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ; at the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/vdso/gettimeofday.c: note: in included file (through i=
nclude/linux/rcupdate.h, include/linux/rbtree.h, include/linux/hrtimer.h):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   include/linux/lockdep.h:35:16: sparse: sparse: undefined identifier 'fro=
m'
--
   arch/nds32/kernel/time.c: note: in included file (through include/linux/=
lockdep.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/time.c: note: in included file (through include/linux/=
spinlock.h, include/linux/debugobjects.h, include/linux/timer.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   include/linux/lockdep.h:35:16: sparse: sparse: undefined identifier 'fro=
m'
--
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/l=
ockdep.h, include/linux/mutex.h, include/linux/kernfs.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/m=
utex.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/s=
ched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/s=
ched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/r=
esource.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/s=
ched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/s=
ched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/s=
ched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/irq.c: note: in included file (through include/linux/r=
atelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/module.c: note: in included file (through include/linu=
x/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/asm/=
elf.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
lockdep.h, include/linux/spinlock.h, include/linux/debugobjects.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
spinlock.h, include/linux/debugobjects.h, include/linux/timer.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ..=
.):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ..=
.):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ..=
.):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ..=
.):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ..=
.):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/vdso.c: note: in included file (through include/linux/=
sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/asm/el=
f.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/ptrace.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/ptrace.c: note: in included file (through include/linu=
x/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/ptrace.c: note: in included file (through include/linu=
x/sched.h, include/linux/ptrace.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/ptrace.c: note: in included file (through include/linu=
x/sched.h, include/linux/ptrace.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/ptrace.c: note: in included file (through include/linu=
x/nodemask.h, include/linux/sched.h, include/linux/ptrace.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/ptrace.c: note: in included file (through include/linu=
x/sched.h, include/linux/ptrace.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/setup.c: note: in included file (through include/linux=
/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/setup.c: note: in included file (through include/linux=
/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/setup.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/setup.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/setup.c: note: in included file (through include/linux=
/nodemask.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/setup.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/process.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/process.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/process.c: note: in included file (through include/lin=
ux/sched.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/process.c: note: in included file (through include/lin=
ux/sched.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/process.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/process.c: note: in included file (through include/lin=
ux/sched.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/l=
ockdep.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/s=
pinlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/m=
m.h):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/s=
ched.h, include/linux/mm.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/s=
ched.h, include/linux/mm.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/s=
ched.h, include/linux/mm.h):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/s=
ched.h, include/linux/mm.h):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/dma.c: note: in included file (through include/linux/m=
m.h):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1520:1: sparse: sparse: got }
   include/linux/sched.h:1526:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/fpu.c: note: in included file (through include/linux/l=
ockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/fpu.c: note: in included file (through include/linux/r=
cupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/fpu.c: note: in included file (through include/linux/s=
ched.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/fpu.c: note: in included file (through include/linux/s=
ched.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/fpu.c: note: in included file (through include/linux/n=
odemask.h, include/linux/sched.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/fpu.c: note: in included file (through include/linux/s=
ched.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/cacheinfo.c: note: in included file (through include/l=
inux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/cacheinfo.c: note: in included file (through include/l=
inux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/cacheinfo.c: note: in included file (through include/l=
inux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/cacheinfo.c: note: in included file (through include/l=
inux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/cacheinfo.c: note: in included file (through include/l=
inux/nodemask.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/cacheinfo.c: note: in included file (through include/l=
inux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/stacktrace.c: note: in included file (through include/=
linux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/stacktrace.c: note: in included file (through include/=
linux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/stacktrace.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/stacktrace.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/stacktrace.c: note: in included file (through include/=
linux/nodemask.h, include/linux/sched.h, include/linux/sched/task_stack.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/stacktrace.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/lockdep.h, include/linux/spinlock.h, include/linux/wait.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/spinlock.h, include/linux/wait.h, include/linux/wait_bit.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/fs.h, include/uapi/linux/aio_abi.h, include/linux/syscalls.h):
   include/linux/capability.h:256:49: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/capability.h:256:49: sparse: sparse: got $
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h,=
 ...):
   include/linux/signal.h:294:46: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:294:46: sparse: sparse: got $
   include/linux/signal.h:327:50: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:327:50: sparse: sparse: got $
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/resource.h, include/linux/sched.h, include/linux/sched/signal.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/sys_nds32.c: note: in included file (through include/l=
inux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h,=
 ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: too many errors
--
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, .=
..):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, .=
..):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, .=
..):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, .=
..):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, .=
..):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/traps.c: note: in included file (through include/linux=
/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/asm/e=
lf.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/lockdep.h, include/linux/spinlock.h, include/linux/wait.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/spinlock.h, include/linux/wait.h, include/linux/wait_bit.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/fs.h, include/uapi/linux/aio_abi.h, include/linux/syscalls.h):
   include/linux/capability.h:256:49: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/capability.h:256:49: sparse: sparse: got $
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwse=
m.h, ...):
   include/linux/signal.h:294:46: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:294:46: sparse: sparse: got $
   include/linux/signal.h:327:50: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:327:50: sparse: sparse: got $
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/resource.h, include/linux/sched.h, include/linux/sched/signal.h, .=
..):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/syscall_table.c: note: in included file (through inclu=
de/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwse=
m.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: too many errors
--
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fp=
u.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fp=
u.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h,=
 ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fp=
u.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fp=
u.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fp=
u.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/nds32_ksyms.c: note: in included file (through include=
/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include=
/asm/elf.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/lo=
ckdep.h, include/linux/spinlock.h, include/linux/swap.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/sp=
inlock.h, include/linux/swap.h, include/linux/suspend.h):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/sc=
hed.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/sc=
hed.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/re=
source.h, include/linux/sched.h, include/linux/cgroup.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/sc=
hed.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/sc=
hed.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/sc=
hed.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/pm.c: note: in included file (through include/linux/cg=
roup.h, include/linux/memcontrol.h, include/linux/swap.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/lockdep.h, include/linux/mutex.h, include/linux/kernfs.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/mutex.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/resource.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/kernel/atl2c.c: note: in included file (through include/linux=
/ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/signal.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/signal.c: note: in included file (through include/linu=
x/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/signal.c: note: in included file (through include/linu=
x/sched.h, include/linux/ptrace.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/signal.c: note: in included file (through include/linu=
x/sched.h, include/linux/ptrace.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/signal.c: note: in included file (through include/linu=
x/nodemask.h, include/linux/sched.h, include/linux/ptrace.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/signal.c: note: in included file (through include/linu=
x/sched.h, include/linux/ptrace.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/ftrace.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/ftrace.c: note: in included file (through include/linu=
x/hardirq.h, include/linux/interrupt.h, include/linux/trace_recursion.h, ..=
.):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/ftrace.c: note: in included file (through include/linu=
x/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/ftrace.c: note: in included file (through include/linu=
x/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/ftrace.c: note: in included file (through include/linu=
x/nodemask.h, include/linux/sched.h, include/linux/hardirq.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/ftrace.c: note: in included file (through include/linu=
x/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/kernel/perf_event_cpu.c: note: in included file (through incl=
ude/linux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...=
):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/kernel/perf_event_cpu.c: note: in included file (through incl=
ude/linux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/kernel/perf_event_cpu.c: note: in included file (through incl=
ude/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_per=
f_event.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/kernel/perf_event_cpu.c: note: in included file (through incl=
ude/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_per=
f_event.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/kernel/perf_event_cpu.c: note: in included file (through incl=
ude/linux/nodemask.h, include/linux/sched.h, include/linux/ptrace.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/kernel/perf_event_cpu.c: note: in included file (through incl=
ude/linux/sched.h, include/linux/ptrace.h, include/uapi/asm-generic/bpf_per=
f_event.h, ...):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/mm/extable.c: note: in included file (through include/linux/l=
ockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/extable.c: note: in included file (through include/linux/r=
cupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/extable.c: note: in included file (through include/linux/s=
ched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/extable.c: note: in included file (through include/linux/s=
ched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/extable.c: note: in included file (through include/linux/n=
odemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/mm/extable.c: note: in included file (through include/linux/s=
ched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/mm/mmap.c: note: in included file (through include/linux/lock=
dep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/mmap.c: note: in included file (through include/linux/rcup=
date.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/mmap.c: note: in included file (through include/linux/sche=
d.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/mmap.c: note: in included file (through include/linux/sche=
d.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/mmap.c: note: in included file (through include/linux/node=
mask.h, include/linux/sched.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/mm/mmap.c: note: in included file (through include/linux/sche=
d.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/lockdep.h, include/linux/spinlock.h, include/linux/wait.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/spinlock.h, include/linux/wait.h, include/linux/wait_bit.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/fs.h, include/linux/proc_fs.h):
   include/linux/capability.h:256:49: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/capability.h:256:49: sparse: sparse: got $
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...=
):
   include/linux/signal.h:294:46: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:294:46: sparse: sparse: got $
   include/linux/signal.h:327:50: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:327:50: sparse: sparse: got $
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/resource.h, include/linux/sched.h, include/linux/sched/signal.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/mm/alignment.c: note: in included file (through include/linux=
/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...=
):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: too many errors
--
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/lockd=
ep.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/spinl=
ock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/mm.h):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/sched=
.h, include/linux/mm.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/sched=
.h, include/linux/mm.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/sched=
.h, include/linux/mm.h):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/sched=
.h, include/linux/mm.h):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/mm/tlb.c: note: in included file (through include/linux/mm.h):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1520:1: sparse: sparse: got }
   include/linux/sched.h:1526:1: sparse: sparse: too many errors
--
   arch/nds32/mm/mm-nds32.c: note: in included file (through include/linux/=
lockdep.h, include/linux/rcupdate.h, include/linux/init_task.h):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/mm-nds32.c: note: in included file (through include/linux/=
rcupdate.h, include/linux/init_task.h):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/mm-nds32.c: note: in included file (through include/linux/=
sched.h, include/linux/utsname.h, include/linux/init_task.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/mm-nds32.c: note: in included file (through include/linux/=
sched.h, include/linux/utsname.h, include/linux/init_task.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/mm-nds32.c: note: in included file (through include/linux/=
nodemask.h, include/linux/sched.h, include/linux/utsname.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/mm/mm-nds32.c: note: in included file (through include/linux/=
sched.h, include/linux/utsname.h, include/linux/init_task.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/mm/fault.c: note: in included file (through include/linux/loc=
kdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/fault.c: note: in included file (through include/linux/spi=
nlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/fault.c: note: in included file (through include/linux/sch=
ed.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/fault.c: note: in included file (through include/linux/sch=
ed.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/fault.c: note: in included file (through include/linux/res=
ource.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/mm/fault.c: note: in included file (through include/linux/sch=
ed.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/mm/fault.c: note: in included file (through include/linux/sch=
ed.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/mm/fault.c: note: in included file (through include/linux/sch=
ed.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/mm/fault.c: note: in included file (through include/linux/sch=
ed/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/asm/elf.h=
, ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/mm/init.c: note: in included file (through include/linux/lock=
dep.h, include/linux/spinlock.h, include/linux/swap.h):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/init.c: note: in included file (through include/linux/spin=
lock.h, include/linux/swap.h):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/init.c: note: in included file (through include/linux/sche=
d.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/init.c: note: in included file (through include/linux/sche=
d.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/init.c: note: in included file (through include/linux/reso=
urce.h, include/linux/sched.h, include/linux/cgroup.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/mm/init.c: note: in included file (through include/linux/sche=
d.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/mm/init.c: note: in included file (through include/linux/sche=
d.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/mm/init.c: note: in included file (through include/linux/sche=
d.h, include/linux/cgroup.h, include/linux/memcontrol.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/mm/init.c: note: in included file (through include/linux/cgro=
up.h, include/linux/memcontrol.h, include/linux/swap.h):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/mm/proc.c: note: in included file (through include/linux/lock=
dep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/proc.c: note: in included file (through include/linux/spin=
lock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/proc.c: note: in included file (through include/linux/sche=
d.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/proc.c: note: in included file (through include/linux/sche=
d.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/proc.c: note: in included file (through include/linux/reso=
urce.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   arch/nds32/mm/proc.c: note: in included file (through include/linux/sche=
d.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/mm/proc.c: note: in included file (through include/linux/sche=
d.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/mm/proc.c: note: in included file (through include/linux/sche=
d.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, ...):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/mm/proc.c: note: in included file (through include/linux/sche=
d/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/asm/elf.h,=
 ...):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: too many errors
--
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/mm.h):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/sched.h, include/linux/mm.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/sched.h, include/linux/mm.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/sched.h, include/linux/mm.h):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/sched.h, include/linux/mm.h):
   include/linux/task_io_accounting.h:46:1: sparse: sparse: Expected ; at t=
he end of type declaration
   include/linux/task_io_accounting.h:46:1: sparse: sparse: got }
   arch/nds32/mm/cacheflush.c: note: in included file (through include/linu=
x/mm.h):
   include/linux/sched.h:1438:53: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1438:53: sparse: sparse: got $
   include/linux/sched.h:1441:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1441:1: sparse: sparse: got }
   include/linux/sched.h:1446:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1446:1: sparse: sparse: got }
   include/linux/sched.h:1451:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1451:1: sparse: sparse: got }
   include/linux/sched.h:1457:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1457:1: sparse: sparse: got }
   include/linux/sched.h:1472:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1472:1: sparse: sparse: got }
   include/linux/sched.h:1477:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1477:1: sparse: sparse: got }
   include/linux/sched.h:1482:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1482:1: sparse: sparse: got }
   include/linux/sched.h:1488:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1488:1: sparse: sparse: got }
   include/linux/sched.h:1493:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1493:1: sparse: sparse: got }
   include/linux/sched.h:1498:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1498:1: sparse: sparse: got }
   include/linux/sched.h:1503:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1503:1: sparse: sparse: got }
   include/linux/sched.h:1510:22: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1510:22: sparse: sparse: got (
   include/linux/sched.h:1510:9: sparse: sparse: Trying to use reserved wor=
d 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got !
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1511:39: sparse: sparse: got volatile
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'const' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'do' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1511:39: sparse: sparse: got {
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got "include/linux/sched.=
h"
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got (
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'void' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1511:39: sparse: sparse: got *
   include/linux/sched.h:1511:39: sparse: sparse: Trying to use reserved wo=
rd 'typeof' as identifier
   include/linux/sched.h:1511:39: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1511:39: sparse: sparse: got }
   include/linux/sched.h:1514:9: sparse: sparse: Trying to use reserved wor=
d 'return' as identifier
   include/linux/sched.h:1514:16: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/sched.h:1514:16: sparse: sparse: got pid
   include/linux/sched.h:1515:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1515:1: sparse: sparse: got }
   include/linux/sched.h:1520:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1520:1: sparse: sparse: got }
   include/linux/sched.h:1526:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fpuemu.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fpuemu.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fpuemu.c: note: in included file (through include/li=
nux/sched.h, arch/nds32/include/asm/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fpuemu.c: note: in included file (through include/li=
nux/sched.h, arch/nds32/include/asm/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fpuemu.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, arch/nds32/include/asm/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fpuemu.c: note: in included file (through include/li=
nux/sched.h, arch/nds32/include/asm/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fsubd.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubd.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fsubd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubd.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fmuld.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuld.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuld.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fmuld.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuld.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuld.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fsqrtd.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrtd.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrtd.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fsqrtd.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrtd.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrtd.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fs2d.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2d.c: note: in included file (through include/linu=
x/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2d.c: note: in included file (through include/linu=
x/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fs2d.c: note: in included file (through include/linu=
x/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2d.c: note: in included file (through include/linu=
x/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2d.c: note: in included file (through include/linu=
x/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/faddd.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/faddd.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/faddd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/faddd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/faddd.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/faddd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fdivd.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivd.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fdivd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivd.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fnegs.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegs.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fnegs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegs.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fd2siz.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2siz.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2siz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fd2siz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2siz.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2siz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fd2si.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2si.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2si.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fd2si.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2si.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2si.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fsi2d.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2d.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2d.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fsi2d.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2d.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2d.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fd2ui.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2ui.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2ui.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fd2ui.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2ui.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2ui.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fd2s.c: note: in included file (through include/linu=
x/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2s.c: note: in included file (through include/linu=
x/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2s.c: note: in included file (through include/linu=
x/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fd2s.c: note: in included file (through include/linu=
x/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2s.c: note: in included file (through include/linu=
x/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2s.c: note: in included file (through include/linu=
x/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fui2d.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2d.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2d.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fui2d.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2d.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2d.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fd2uiz.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2uiz.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2uiz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fd2uiz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2uiz.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fd2uiz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fsubs.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubs.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fsubs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubs.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fsubs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fadds.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fadds.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fadds.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fadds.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fadds.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fadds.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fdivs.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivs.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fdivs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivs.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fdivs.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fs2si.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2si.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2si.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fs2si.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2si.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2si.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fs2ui.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2ui.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2ui.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fs2ui.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2ui.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2ui.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fs2uiz.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2uiz.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2uiz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fs2uiz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2uiz.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2uiz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fnegd.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegd.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fnegd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegd.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fnegd.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fsqrts.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrts.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrts.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fsqrts.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrts.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fsqrts.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fui2s.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2s.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2s.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fui2s.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2s.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fui2s.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fmuls.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuls.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuls.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fmuls.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuls.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fmuls.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fsi2s.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2s.c: note: in included file (through include/lin=
ux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2s.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fsi2s.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2s.c: note: in included file (through include/lin=
ux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fsi2s.c: note: in included file (through include/lin=
ux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors
--
   arch/nds32/math-emu/fs2siz.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
   include/linux/stacktrace.h:89:54: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:89:54: sparse: sparse: got $
   include/linux/stacktrace.h:91:62: sparse: sparse: Expected ) in function=
 declarator
   include/linux/stacktrace.h:91:62: sparse: sparse: got $
   include/linux/stacktrace.h:101:69: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/stacktrace.h:101:69: sparse: sparse: got $
   include/linux/stacktrace.h:106:1: sparse: sparse: Expected ;@the end =
of type declaration
   include/linux/stacktrace.h:106:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2siz.c: note: in included file (through include/li=
nux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
   include/linux/lockdep.h:44:16: sparse: sparse: Expected ) in function de=
clarator
   include/linux/lockdep.h:44:16: sparse: sparse: got =3D
>> include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved wor=
d 'for' as identifier
   include/linux/lockdep.h:44:23: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:23: sparse: sparse: got <
   include/linux/lockdep.h:44:54: sparse: sparse: Expected ; at end of decl=
aration
   include/linux/lockdep.h:44:54: sparse: sparse: got ++
   include/linux/lockdep.h:46:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:46:1: sparse: sparse: got }
   include/linux/lockdep.h:68:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/lockdep.h:68:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2siz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   arch/nds32/math-emu/fs2siz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/seccomp.h:96:63: sparse: sparse: Expected ) in function de=
clarator
   include/linux/seccomp.h:96:63: sparse: sparse: got $
   include/linux/seccomp.h:99:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/seccomp.h:99:1: sparse: sparse: got }
   include/linux/seccomp.h:103:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:103:1: sparse: sparse: got }
   include/linux/seccomp.h:116:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:116:1: sparse: sparse: got }
   include/linux/seccomp.h:122:1: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/seccomp.h:122:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2siz.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/uaccess.h):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   arch/nds32/math-emu/fs2siz.c: note: in included file (through include/li=
nux/sched.h, include/linux/uaccess.h):
   include/linux/nodemask.h:98:54: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:98:54: sparse: sparse: got }
   include/linux/nodemask.h:99:19: sparse: sparse: Expected ; at end of dec=
laration
   include/linux/nodemask.h:99:19: sparse: sparse: got _unused_nodemask_arg_
   include/linux/nodemask.h:109:68: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:109:68: sparse: sparse: got *
   include/linux/nodemask.h:112:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:112:1: sparse: sparse: got }
   include/linux/nodemask.h:116:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:116:1: sparse: sparse: got }
   include/linux/nodemask.h:131:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:131:1: sparse: sparse: got }
   include/linux/nodemask.h:137:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:137:1: sparse: sparse: got }
   include/linux/nodemask.h:143:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:143:1: sparse: sparse: got }
   include/linux/nodemask.h:149:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:149:1: sparse: sparse: got }
   include/linux/nodemask.h:159:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:159:1: sparse: sparse: got }
   include/linux/nodemask.h:167:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:167:1: sparse: sparse: got }
   include/linux/nodemask.h:175:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:175:1: sparse: sparse: got }
   include/linux/nodemask.h:183:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:183:1: sparse: sparse: got }
   include/linux/nodemask.h:191:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:191:1: sparse: sparse: got }
   include/linux/nodemask.h:199:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:199:1: sparse: sparse: got }
   include/linux/nodemask.h:207:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:207:1: sparse: sparse: got }
   include/linux/nodemask.h:215:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:215:1: sparse: sparse: got }
   include/linux/nodemask.h:223:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:223:1: sparse: sparse: got }
   include/linux/nodemask.h:229:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:229:1: sparse: sparse: got }
   include/linux/nodemask.h:235:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:235:1: sparse: sparse: got }
   include/linux/nodemask.h:241:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:241:1: sparse: sparse: got }
   include/linux/nodemask.h:249:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:249:1: sparse: sparse: got }
   include/linux/nodemask.h:257:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:257:1: sparse: sparse: got }
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:265:16: sparse: sparse: got <
   include/linux/nodemask.h:265:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:265:16: sparse: sparse: got }
   include/linux/nodemask.h:266:1: sparse: sparse: Expected ; at the end of=
 type declaration
   include/linux/nodemask.h:266:1: sparse: sparse: got }
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ) in nested de=
clarator
   include/linux/nodemask.h:271:16: sparse: sparse: got <
   include/linux/nodemask.h:271:16: sparse: sparse: Expected ; at the end o=
f type declaration
   include/linux/nodemask.h:271:16: sparse: sparse: got }
   include/linux/nodemask.h:272:1: sparse: sparse: Expected ;@the end of=
 type declaration
   include/linux/nodemask.h:272:1: sparse: sparse: got }
   include/linux/nodemask.h:281:53: sparse: sparse: Expected ) in function =
declarator
   include/linux/nodemask.h:281:53: sparse: sparse: got *
   include/linux/nodemask.h:284:9: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/nodemask.h:284:9: sparse: sparse: got (
   include/linux/nodemask.h:285:1: sparse: sparse: too many errors

vim +/for +44 include/linux/lockdep.h

fbb9ce9530fd9b Ingo Molnar    2006-07-03  29  =

4d82a1debbffec Peter Zijlstra 2012-05-15  30  static inline void lockdep_co=
py_map(struct lockdep_map *to,
4d82a1debbffec Peter Zijlstra 2012-05-15  31  				    struct lockdep_map *f=
rom)
4d82a1debbffec Peter Zijlstra 2012-05-15  32  {
4d82a1debbffec Peter Zijlstra 2012-05-15  33  	int i;
4d82a1debbffec Peter Zijlstra 2012-05-15  34  =

4d82a1debbffec Peter Zijlstra 2012-05-15  35  	*to =3D *from;
4d82a1debbffec Peter Zijlstra 2012-05-15  36  	/*
4d82a1debbffec Peter Zijlstra 2012-05-15  37  	 * Since the class cache can=
 be modified concurrently we could observe
4d82a1debbffec Peter Zijlstra 2012-05-15  38  	 * half pointers (64bit arch=
 using 32bit copy insns). Therefore clear
4d82a1debbffec Peter Zijlstra 2012-05-15  39  	 * the caches and take the p=
erformance hit.
4d82a1debbffec Peter Zijlstra 2012-05-15  40  	 *
4d82a1debbffec Peter Zijlstra 2012-05-15  41  	 * XXX it doesn't work well =
with lockdep_set_class_and_subclass(), since
4d82a1debbffec Peter Zijlstra 2012-05-15  42  	 *     that relies on cache =
abuse.
4d82a1debbffec Peter Zijlstra 2012-05-15  43  	 */
4d82a1debbffec Peter Zijlstra 2012-05-15 @44  	for (i =3D 0; i < NR_LOCKDEP=
_CACHING_CLASSES; i++)
4d82a1debbffec Peter Zijlstra 2012-05-15  45  		to->class_cache[i] =3D NULL;
4d82a1debbffec Peter Zijlstra 2012-05-15  46  }
4d82a1debbffec Peter Zijlstra 2012-05-15  47  =


:::::: The code at line 44 was first introduced by commit
:::::: 4d82a1debbffec129cc387aafa8f40b7bbab3297 lockdep: fix oops in proces=
sing workqueue

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Tejun Heo <tj@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9141096263901435850==--

