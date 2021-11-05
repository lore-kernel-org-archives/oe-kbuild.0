Content-Type: multipart/mixed; boundary="===============4594795169899536057=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 442/13128] include/linux/lockdep.h:44:9: sparse: sparse: Trying to use reserved word 'for' as identifier
Date: Fri, 05 Nov 2021 08:32:01 +0800
Message-ID: <202111050843.zaQDvIhy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4594795169899536057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Greentime Hu <green.hu@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8a796a1dfca2780321755033a74bca2bbe651680
commit: 36b9b19753937a6fe0e591b518d46a1f2efae679 [442/13128] nds32: add a K=
config symbol for LOCKDEP_SUPPORT
:::::: branch date: 21 hours ago
:::::: commit date: 8 weeks ago
config: nds32-randconfig-s031-20211104 (attached as .config)
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
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ds32 SHELL=3D/bin/bash drivers/crypto/

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
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/lockdep.h, include/linux/mutex.h, include/linux/notifier.h, ...):
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
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/mutex.h, include/linux/notifier.h, include/linux/clk.h):
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
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h,=
 ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h,=
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
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...=
):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h,=
 ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h,=
 ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/exynos-rng.c: note: in included file (through include/lin=
ux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/asm=
/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
/lockdep.h, include/linux/spinlock.h, include/linux/mmzone.h, ...):
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
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
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
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
/resource.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/qcom-rng.c: note: in included file (through include/linux=
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/atmel-sha204a.c: note: in included file (through include/=
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
   drivers/crypto/atmel-sha204a.c: note: in included file (through include/=
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
   drivers/crypto/atmel-sha204a.c: note: in included file (through include/=
linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/atmel-sha204a.c: note: in included file (through include/=
linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/atmel-sha204a.c: note: in included file (through include/=
linux/nodemask.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/atmel-sha204a.c: note: in included file (through include/=
linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/atmel-i2c.c: note: in included file (through include/linu=
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
   drivers/crypto/atmel-i2c.c: note: in included file (through include/linu=
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
   drivers/crypto/atmel-i2c.c: note: in included file (through include/linu=
x/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/atmel-i2c.c: note: in included file (through include/linu=
x/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/atmel-i2c.c: note: in included file (through include/linu=
x/nodemask.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/atmel-i2c.c: note: in included file (through include/linu=
x/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
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
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
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
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
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
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
x/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
x/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, =
...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/atmel-sha.c: note: in included file (through include/linu=
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
lockdep.h, include/linux/mutex.h, include/linux/notifier.h, ...):
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
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
mutex.h, include/linux/notifier.h, include/linux/clk.h):
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
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
resource.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/s5p-sss.c: note: in included file (through include/linux/=
ratelimit.h, include/linux/dev_printk.h, include/linux/device.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/sa2ul.c: note: in included file (through include/linux/lo=
ckdep.h, include/linux/mutex.h, include/linux/notifier.h, ...):
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
   drivers/crypto/sa2ul.c: note: in included file (through include/linux/mu=
tex.h, include/linux/notifier.h, include/linux/clk.h):
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
   drivers/crypto/sa2ul.c: note: in included file (through include/linux/sc=
hed.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/sa2ul.c: note: in included file (through include/linux/sc=
hed.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/sa2ul.c: note: in included file (through include/linux/no=
demask.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/sa2ul.c: note: in included file (through include/linux/sc=
hed.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...):
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
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
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
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
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
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
de/linux/fs.h, include/linux/debugfs.h):
   include/linux/capability.h:256:49: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/capability.h:256:49: sparse: sparse: got $
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
de/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwse=
m.h, ...):
   include/linux/signal.h:294:46: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:294:46: sparse: sparse: got $
   include/linux/signal.h:327:50: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:327:50: sparse: sparse: got $
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
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
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
de/linux/resource.h, include/linux/sched.h, include/linux/sched/signal.h, .=
..):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
de/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ..=
.):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/ccree/cc_debugfs.c: note: in included file (through inclu=
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: too many errors
--
   drivers/crypto/ccree/cc_sram_mgr.c: note: in included file (through incl=
ude/linux/lockdep.h, include/linux/hardirq.h, include/linux/interrupt.h, ..=
.):
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
   drivers/crypto/ccree/cc_sram_mgr.c: note: in included file (through incl=
ude/linux/hardirq.h, include/linux/interrupt.h, drivers/crypto/ccree/cc_dri=
ver.h):
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
   drivers/crypto/ccree/cc_sram_mgr.c: note: in included file (through incl=
ude/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_sram_mgr.c: note: in included file (through incl=
ude/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
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
   drivers/crypto/ccree/cc_sram_mgr.c: note: in included file (through incl=
ude/linux/nodemask.h, include/linux/sched.h, include/linux/hardirq.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_sram_mgr.c: note: in included file (through incl=
ude/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, ...):
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
   drivers/crypto/ccree/cc_pm.c: note: in included file (through include/li=
nux/lockdep.h, include/linux/hardirq.h, include/linux/interrupt.h):
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
   drivers/crypto/ccree/cc_pm.c: note: in included file (through include/li=
nux/hardirq.h, include/linux/interrupt.h):
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
   drivers/crypto/ccree/cc_pm.c: note: in included file (through include/li=
nux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_pm.c: note: in included file (through include/li=
nux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h):
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
   drivers/crypto/ccree/cc_pm.c: note: in included file (through include/li=
nux/nodemask.h, include/linux/sched.h, include/linux/hardirq.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_pm.c: note: in included file (through include/li=
nux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h):
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
   drivers/crypto/ccree/cc_request_mgr.c: note: in included file (through i=
nclude/linux/lockdep.h, include/linux/hardirq.h, include/linux/interrupt.h,=
 ...):
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
   drivers/crypto/ccree/cc_request_mgr.c: note: in included file (through i=
nclude/linux/hardirq.h, include/linux/interrupt.h, drivers/crypto/ccree/cc_=
driver.h):
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
   drivers/crypto/ccree/cc_request_mgr.c: note: in included file (through i=
nclude/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, .=
..):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_request_mgr.c: note: in included file (through i=
nclude/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, .=
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
   drivers/crypto/ccree/cc_request_mgr.c: note: in included file (through i=
nclude/linux/nodemask.h, include/linux/sched.h, include/linux/hardirq.h, ..=
.):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_request_mgr.c: note: in included file (through i=
nclude/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.h, .=
..):
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
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
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
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
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
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
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
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h=
, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/ccree/cc_driver.c: note: in included file (through includ=
e/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/includ=
e/asm/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/lockdep.h, include/linux/spinlock.h, include/linux/mmzone.h, ..=
.):
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
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
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
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/fs.h, include/linux/highmem.h, include/crypto/scatterwalk.h):
   include/linux/capability.h:256:49: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/capability.h:256:49: sparse: sparse: got $
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-r=
wsem.h, ...):
   include/linux/signal.h:294:46: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:294:46: sparse: sparse: got $
   include/linux/signal.h:327:50: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:327:50: sparse: sparse: got $
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h,=
 ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h,=
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
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/resource.h, include/linux/sched.h, include/linux/sched/signal.h=
, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h,=
 ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/sched.h, include/linux/sched/signal.h, include/linux/rcuwait.h,=
 ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/ccree/cc_buffer_mgr.c: note: in included file (through in=
clude/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-r=
wsem.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: too many errors
--
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
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
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
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
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
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
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h=
, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/f=
pu.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/ccree/cc_cipher.c: note: in included file (through includ=
e/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/includ=
e/asm/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
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
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
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
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
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
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, =
...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/ccree/cc_aead.c: note: in included file (through include/=
linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/=
asm/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/lockdep.h, include/linux/spinlock.h, include/linux/mm_types.h, ...):
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
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/spinlock.h, include/linux/mm_types.h, include/linux/buildid.h, ...):
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
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
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
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/resource.h, include/linux/sched.h, include/linux/sched/task_stack.h, =
...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu=
.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/ccree/cc_hash.c: note: in included file (through include/=
linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds32/include/=
asm/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/lockdep.h, include/linux/spinlock.h, include/linux/mm_typ=
es.h, ...):
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
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/spinlock.h, include/linux/mm_types.h, include/linux/build=
id.h, ...):
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
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/inc=
lude/asm/fpu.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/inc=
lude/asm/fpu.h, ...):
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
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/resource.h, include/linux/sched.h, include/linux/sched/ta=
sk_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/inc=
lude/asm/fpu.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/inc=
lude/asm/fpu.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_core.c: note: in included file (thro=
ugh include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nd=
s32/include/asm/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/lockdep.h, include/linux/mutex.h):
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
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/mutex.h):
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
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/incl=
ude/asm/fpu.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/incl=
ude/asm/fpu.h, ...):
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
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/resource.h, include/linux/sched.h, include/linux/sched/tas=
k_stack.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/incl=
ude/asm/fpu.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/sched/task_stack.h, arch/nds32/incl=
ude/asm/fpu.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_mgr.c: note: in included file (throu=
gh include/linux/sched/task_stack.h, arch/nds32/include/asm/fpu.h, arch/nds=
32/include/asm/elf.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/lockdep.h, include/linux/spinlock.h, include/linux/mmzone=
.h, ...):
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
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h, =
...):
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
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/mm.h, include/linux/scatterlist.h):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/mm.h, include/linux/scatterlist.h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/mm.h, include/linux/scatterlist.h):
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
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/sched.h, include/linux/mm.h, include/linux/scatterlist.h):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/virtio/virtio_crypto_algs.c: note: in included file (thro=
ugh include/linux/mm.h, include/linux/scatterlist.h):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in nested decl=
arator
   include/linux/sched.h:1533:34: sparse: sparse: got volatile
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/lockdep.h, include/linux/mutex.h, include/linux/notifier.h=
, ...):
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
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/mutex.h, include/linux/notifier.h, include/linux/clk.h):
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
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.=
h):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.=
h):
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
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/resource.h, include/linux/sched.h, include/linux/hardirq.h=
, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.=
h):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/sched.h, include/linux/hardirq.h, include/linux/interrupt.=
h):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-core.c: note: in included file (throu=
gh include/linux/hardirq.h, include/linux/interrupt.h):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/lockdep.h, include/linux/spinlock.h, include/linux/mmzon=
e.h, ...):
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
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h,=
 ...):
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
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/fs.h, include/linux/highmem.h, include/crypto/scatterwal=
k.h):
   include/linux/capability.h:256:49: sparse: sparse: Expected ) in functio=
n declarator
   include/linux/capability.h:256:49: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/p=
ercpu-rwsem.h, ...):
   include/linux/signal.h:294:46: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:294:46: sparse: sparse: got $
   include/linux/signal.h:327:50: sparse: sparse: Expected ) in function de=
clarator
   include/linux/signal.h:327:50: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/sched.h, include/linux/sched/signal.h, include/linux/rcu=
wait.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/sched.h, include/linux/sched/signal.h, include/linux/rcu=
wait.h, ...):
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
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/resource.h, include/linux/sched.h, include/linux/sched/s=
ignal.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/sched.h, include/linux/sched/signal.h, include/linux/rcu=
wait.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/sched.h, include/linux/sched/signal.h, include/linux/rcu=
wait.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/amlogic/amlogic-gxl-cipher.c: note: in included file (thr=
ough include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/p=
ercpu-rwsem.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: too many errors
--
   drivers/crypto/keembay/ocs-hcu.c: note: in included file (through includ=
e/linux/lockdep.h, include/linux/rcupdate.h, include/linux/rculist.h, ...):
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
   drivers/crypto/keembay/ocs-hcu.c: note: in included file (through includ=
e/linux/rcupdate.h, include/linux/rculist.h, include/linux/pid.h, ...):
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
   drivers/crypto/keembay/ocs-hcu.c: note: in included file (through includ=
e/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...=
):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/keembay/ocs-hcu.c: note: in included file (through includ=
e/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...=
):
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
   drivers/crypto/keembay/ocs-hcu.c: note: in included file (through includ=
e/linux/nodemask.h, include/linux/sched.h, include/linux/ratelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/keembay/ocs-hcu.c: note: in included file (through includ=
e/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.h, ...=
):
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
   drivers/crypto/keembay/keembay-ocs-hcu-core.c: note: in included file (t=
hrough include/linux/lockdep.h, include/linux/spinlock.h, include/linux/swa=
it.h, ...):
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
   drivers/crypto/keembay/keembay-ocs-hcu-core.c: note: in included file (t=
hrough include/linux/spinlock.h, include/linux/swait.h, include/linux/compl=
etion.h):
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
   drivers/crypto/keembay/keembay-ocs-hcu-core.c: note: in included file (t=
hrough include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_=
printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/keembay/keembay-ocs-hcu-core.c: note: in included file (t=
hrough include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_=
printk.h, ...):
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
   drivers/crypto/keembay/keembay-ocs-hcu-core.c: note: in included file (t=
hrough include/linux/nodemask.h, include/linux/sched.h, include/linux/ratel=
imit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/keembay/keembay-ocs-hcu-core.c: note: in included file (t=
hrough include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_=
printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux=
/mmzone.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/spinlock.h, include/linux/mmzone.h, include/linux/=
gfp.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/resource.h, include/linux/sched.h, include/linux/k=
thread.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-trng.c: note: in included fil=
e (through include/linux/kthread.h, include/crypto/engine.h, drivers/crypto=
/allwinner/sun8i-ce/sun8i-ce.h):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux=
/mmzone.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/spinlock.h, include/linux/mmzone.h, include/linux/=
gfp.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/resource.h, include/linux/sched.h, include/linux/k=
thread.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-prng.c: note: in included fil=
e (through include/linux/kthread.h, include/crypto/engine.h, drivers/crypto=
/allwinner/sun8i-ce/sun8i-ce.h):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/lockdep.h, include/linux/spinlock.h, include/lin=
ux/mmzone.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/spinlock.h, include/linux/mmzone.h, include/linu=
x/gfp.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/resource.h, include/linux/sched.h, include/linux=
/ratelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c: note: in included f=
ile (through include/linux/ratelimit.h, include/linux/dev_printk.h, include=
/linux/device.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/lockdep.h, include/linux/mutex.h, include/linux/no=
tifier.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/mutex.h, include/linux/notifier.h, include/linux/c=
lk.h):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/resource.h, include/linux/sched.h, include/linux/r=
atelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c: note: in included fil=
e (through include/linux/ratelimit.h, include/linux/dev_printk.h, include/l=
inux/device.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c: note: in included fil=
e (through include/linux/lockdep.h, include/linux/rcupdate.h, include/linux=
/rculist.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c: note: in included fil=
e (through include/linux/rcupdate.h, include/linux/rculist.h, include/linux=
/pid.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c: note: in included fil=
e (through include/linux/nodemask.h, include/linux/sched.h, include/linux/r=
atelimit.h, ...):
   include/linux/numa.h:50:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:50:1: sparse: sparse: got }
   include/linux/numa.h:54:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:54:1: sparse: sparse: got }
   include/linux/numa.h:58:1: sparse: sparse: Expected ; at the end of type=
 declaration
   include/linux/numa.h:58:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/lockdep.h, include/linux/spinlock.h, include/linux=
/mmzone.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/spinlock.h, include/linux/mmzone.h, include/linux/=
gfp.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/resource.h, include/linux/sched.h, include/linux/k=
thread.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/sched.h, include/linux/kthread.h, include/crypto/e=
ngine.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-prng.c: note: in included fil=
e (through include/linux/kthread.h, include/crypto/engine.h, drivers/crypto=
/allwinner/sun8i-ss/sun8i-ss.h):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/lockdep.h, include/linux/spinlock.h, include/lin=
ux/mmzone.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/spinlock.h, include/linux/mmzone.h, include/linu=
x/gfp.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/resource.h, include/linux/sched.h, include/linux=
/ratelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/sched.h, include/linux/ratelimit.h, include/linu=
x/dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c: note: in included f=
ile (through include/linux/ratelimit.h, include/linux/dev_printk.h, include=
/linux/device.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/lockdep.h, include/linux/mutex.h, include/linux/no=
tifier.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/mutex.h, include/linux/notifier.h, include/linux/c=
lk.h):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
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
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/resource.h, include/linux/sched.h, include/linux/r=
atelimit.h, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/sched.h, include/linux/ratelimit.h, include/linux/=
dev_printk.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c: note: in included fil=
e (through include/linux/ratelimit.h, include/linux/dev_printk.h, include/l=
inux/device.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/lockdep.h, include/linux/spinlock.h, include/linux/mmzone.h,=
 ...):
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
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/spinlock.h, include/linux/mmzone.h, include/linux/gfp.h, ...=
):
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
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk=
.h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk=
.h, ...):
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
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/resource.h, include/linux/sched.h, include/linux/ratelimit.h=
, ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk=
.h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk=
.h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/hisilicon/sec/sec_algs.c: note: in included file (through=
 include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/devic=
e.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ; at the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors
--
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/lockdep.h, include/linux/mutex.h, include/linux/kernfs.h, ...=
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
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/mutex.h, include/linux/kernfs.h, include/linux/sysfs.h, ...):
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
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.=
h, ...):
   include/linux/sem.h:16:72: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:16:72: sparse: sparse: got $
   include/linux/sem.h:17:42: sparse: sparse: Expected ) in function declar=
ator
   include/linux/sem.h:17:42: sparse: sparse: got $
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.=
h, ...):
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
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/resource.h, include/linux/sched.h, include/linux/ratelimit.h,=
 ...):
   include/uapi/linux/resource.h:41:1: sparse: sparse: Expected ; at the en=
d of type declaration
   include/uapi/linux/resource.h:41:1: sparse: sparse: got }
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.=
h, ...):
   include/linux/resource.h:11:36: sparse: sparse: Expected ) in function d=
eclarator
   include/linux/resource.h:11:36: sparse: sparse: got $
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/sched.h, include/linux/ratelimit.h, include/linux/dev_printk.=
h, ...):
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: Expected ) =
in function declarator
   include/linux/syscall_user_dispatch.h:34:81: sparse: sparse: got $
   drivers/crypto/hisilicon/sec/sec_drv.c: note: in included file (through =
include/linux/ratelimit.h, include/linux/dev_printk.h, include/linux/device=
.h, ...):
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
   include/linux/sched.h:1526:1: sparse: sparse: Expected ; at the end of t=
ype declaration
   include/linux/sched.h:1526:1: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: Expected ) in function de=
clarator
   include/linux/sched.h:1533:34: sparse: sparse: got !
   include/linux/sched.h:1533:34: sparse: sparse: Trying to use reserved wo=
rd 'if' as identifier
   include/linux/sched.h:1533:34: sparse: sparse: Expected ;@the end of =
type declaration
   include/linux/sched.h:1533:34: sparse: sparse: got }
   include/linux/sched.h:1533:34: sparse: sparse: too many errors

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

--===============4594795169899536057==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
kuF7r0gCAA==
--===============4594795169899536057==--

