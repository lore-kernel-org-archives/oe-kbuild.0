Content-Type: multipart/mixed; boundary="===============5499243230355689592=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 6/9] signal: Always call do_notify_parent_cldstop with siglock held
Date: Fri, 29 Apr 2022 06:33:31 +0800
Message-ID: <202204290612.ieU6Djcy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5499243230355689592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220426225211.308418-6-ebiederm@xmission.com>
References: <20220426225211.308418-6-ebiederm@xmission.com>
TO: "Eric W. Biederman" <ebiederm@xmission.com>
TO: linux-kernel(a)vger.kernel.org
CC: rjw(a)rjwysocki.net
CC: Oleg Nesterov <oleg@redhat.com>
CC: mingo(a)kernel.org
CC: vincent.guittot(a)linaro.org
CC: dietmar.eggemann(a)arm.com
CC: rostedt(a)goodmis.org
CC: mgorman(a)suse.de
CC: bigeasy(a)linutronix.de
CC: Will Deacon <will@kernel.org>
CC: tj(a)kernel.org
CC: linux-pm(a)vger.kernel.org
CC: Peter Zijlstra <peterz@infradead.org>
CC: Richard Weinberger <richard@nod.at>
CC: Anton Ivanov <anton.ivanov@cambridgegreys.com>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: linux-um(a)lists.infradead.org
CC: Chris Zankel <chris@zankel.net>
CC: Max Filippov <jcmvbkbc@gmail.com>
CC: inux-xtensa(a)linux-xtensa.org
CC: Kees Cook <keescook@chromium.org>
CC: Jann Horn <jannh@google.com>
CC: "Eric W. Biederman" <ebiederm@xmission.com>

Hi "Eric,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tip/timers/core linus/master v5.18-rc4 next-202=
20428]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/sig=
nal-Rename-send_signal-send_signal_locked/20220427-065551
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-=
testing
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-s031-20220425 (https://download.01.org/0day-ci/ar=
chive/20220429/202204290612.ieU6Djcy-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1d8ae697c0ac6bf1f99=
f694c9976ceac8a336f4b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-W-Biederman/signal-Rename-sen=
d_signal-send_signal_locked/20220427-065551
        git checkout 1d8ae697c0ac6bf1f99f694c9976ceac8a336f4b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
arisc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   kernel/signal.c: note: in included file (through arch/parisc/include/uap=
i/asm/signal.h, arch/parisc/include/asm/signal.h, include/uapi/linux/signal=
.h, ...):
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple a=
ddress spaces given
   kernel/signal.c:195:31: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:195:31: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/signal.c:195:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:198:33: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:198:33: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/signal.c:198:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:480:9: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:480:9: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/signal.c:480:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:484:34: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:484:34: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/signal.c:484:34: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:542:53: sparse: sparse: incorrect type in initializer (d=
ifferent address spaces) @@     expected struct k_sigaction *ka @@     got =
struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:542:53: sparse:     expected struct k_sigaction *ka
   kernel/signal.c:542:53: sparse:     got struct k_sigaction [noderef] __r=
cu *
   include/uapi/asm-generic/signal-defs.h:83:29: sparse: sparse: multiple a=
ddress spaces given
   kernel/signal.c:887:9: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct arch_spinlock_t [usertype] *x=
 @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/signal.c:887:9: sparse:     expected struct arch_spinlock_t [user=
type] *x
   kernel/signal.c:887:9: sparse:     got struct arch_spinlock_t [noderef] =
__rcu *
   kernel/signal.c:1082:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct arch_spinlock_t [usertype] *=
x @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/signal.c:1082:9: sparse:     expected struct arch_spinlock_t [use=
rtype] *x
   kernel/signal.c:1082:9: sparse:     got struct arch_spinlock_t [noderef]=
 __rcu *
   kernel/signal.c:1257:9: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: cannot dereference this type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: cannot dereference this type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: cannot dereference this type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: cannot dereference this type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: cannot dereference this type
   kernel/signal.c:1263:29: sparse: sparse: no member 'ip' in struct pt_regs
   kernel/signal.c:1263:29: sparse: sparse: cast from unknown type
   kernel/signal.c:1263:29: sparse: sparse: incompatible types for 'case' s=
tatement
   kernel/signal.c:1263:29: sparse: sparse: incompatible types for 'case' s=
tatement
   kernel/signal.c:1263:29: sparse: sparse: incompatible types for 'case' s=
tatement
   kernel/signal.c:1263:29: sparse: sparse: incompatible types for 'case' s=
tatement
   kernel/signal.c:1324:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct spinlock [usertype] *lock @@=
     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1324:9: sparse:     expected struct spinlock [usertype] =
*lock
   kernel/signal.c:1324:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/signal.c:1325:16: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct k_sigaction *action @@     =
got struct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:1325:16: sparse:     expected struct k_sigaction *action
   kernel/signal.c:1325:16: sparse:     got struct k_sigaction [noderef] __=
rcu *
   kernel/signal.c:1345:34: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1345:34: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:1345:34: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:1923:36: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected struct spinlock [usertype] *lock =
@@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:1923:36: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:1923:36: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2033:44: sparse: sparse: cast removes address space '__r=
cu' of expression
   kernel/signal.c:2052:65: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct task_struct *tsk @@     got=
 struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2052:65: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2052:65: sparse:     got struct task_struct [noderef] __=
rcu *parent
   kernel/signal.c:2053:40: sparse: sparse: cast removes address space '__r=
cu' of expression
   kernel/signal.c:2071:14: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct sighand_struct *psig @@    =
 got struct sighand_struct [noderef] __rcu *[noderef] __rcu sighand @@
   kernel/signal.c:2071:14: sparse:     expected struct sighand_struct *psig
   kernel/signal.c:2071:14: sparse:     got struct sighand_struct [noderef]=
 __rcu *[noderef] __rcu sighand
   kernel/signal.c:2100:53: sparse: sparse: incorrect type in argument 3 (d=
ifferent address spaces) @@     expected struct task_struct *t @@     got s=
truct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2100:53: sparse:     expected struct task_struct *t
   kernel/signal.c:2100:53: sparse:     got struct task_struct [noderef] __=
rcu *parent
   kernel/signal.c:2101:34: sparse: sparse: incorrect type in argument 2 (d=
ifferent address spaces) @@     expected struct task_struct *parent @@     =
got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2101:34: sparse:     expected struct task_struct *parent
   kernel/signal.c:2101:34: sparse:     got struct task_struct [noderef] __=
rcu *parent
   kernel/signal.c:2129:9: sparse: sparse: incorrect type in argument 1 (di=
fferent address spaces) @@     expected struct arch_spinlock_t [usertype] *=
x @@     got struct arch_spinlock_t [noderef] __rcu * @@
   kernel/signal.c:2129:9: sparse:     expected struct arch_spinlock_t [use=
rtype] *x
   kernel/signal.c:2129:9: sparse:     got struct arch_spinlock_t [noderef]=
 __rcu *
   kernel/signal.c:2132:24: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct *parent @@     =
got struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2132:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2132:24: sparse:     got struct task_struct [noderef] __=
rcu *parent
   kernel/signal.c:2135:24: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct task_struct *parent @@     =
got struct task_struct [noderef] __rcu *real_parent @@
   kernel/signal.c:2135:24: sparse:     expected struct task_struct *parent
   kernel/signal.c:2135:24: sparse:     got struct task_struct [noderef] __=
rcu *real_parent
   kernel/signal.c:2168:17: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct sighand_struct *sighand @@ =
    got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2168:17: sparse:     expected struct sighand_struct *sig=
hand
   kernel/signal.c:2168:17: sparse:     got struct sighand_struct [noderef]=
 __rcu *sighand
   kernel/signal.c:2169:29: sparse: sparse: incompatible types in compariso=
n expression (different address spaces):
>> kernel/signal.c:2169:29: sparse:    struct sighand_struct [noderef] __rc=
u *
   kernel/signal.c:2169:29: sparse:    struct sighand_struct *
   kernel/signal.c:2211:41: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2211:41: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2211:41: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2213:39: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2213:39: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2213:39: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2290:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2290:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2290:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2302:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2302:31: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2302:31: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2342:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2342:31: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2342:31: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2344:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2344:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2344:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2441:41: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2441:41: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2441:41: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2510:41: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2510:41: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2510:41: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2522:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2522:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2522:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2557:52: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct task_struct *tsk @@     got=
 struct task_struct [noderef] __rcu *parent @@
   kernel/signal.c:2557:52: sparse:     expected struct task_struct *tsk
   kernel/signal.c:2557:52: sparse:     got struct task_struct [noderef] __=
rcu *parent
   kernel/signal.c:2559:49: sparse: sparse: cast removes address space '__r=
cu' of expression
   kernel/signal.c:2597:49: sparse: sparse: incorrect type in initializer (=
different address spaces) @@     expected struct sighand_struct *sighand @@=
     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/signal.c:2597:49: sparse:     expected struct sighand_struct *sig=
hand
   kernel/signal.c:2597:49: sparse:     got struct sighand_struct [noderef]=
 __rcu *sighand
   kernel/signal.c:2918:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2918:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2918:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2942:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2942:29: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2942:29: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:2999:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:2999:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:2999:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3001:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3001:29: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3001:29: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3152:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3152:31: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3152:31: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3155:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3155:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3155:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3542:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3542:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3542:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3554:37: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3554:37: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3554:37: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3559:35: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3559:35: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3559:35: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:3564:29: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:3564:29: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:3564:29: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4018:31: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4018:31: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4018:31: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4030:33: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4030:33: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4030:33: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4048:11: sparse: sparse: incorrect type in assignment (d=
ifferent address spaces) @@     expected struct k_sigaction *k @@     got s=
truct k_sigaction [noderef] __rcu * @@
   kernel/signal.c:4048:11: sparse:     expected struct k_sigaction *k
   kernel/signal.c:4048:11: sparse:     got struct k_sigaction [noderef] __=
rcu *
   kernel/signal.c:4050:25: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4050:25: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4050:25: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4052:35: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4052:35: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4052:35: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:4100:27: sparse: sparse: incorrect type in argument 1 (d=
ifferent address spaces) @@     expected struct spinlock [usertype] *lock @=
@     got struct spinlock [noderef] __rcu * @@
   kernel/signal.c:4100:27: sparse:     expected struct spinlock [usertype]=
 *lock
   kernel/signal.c:4100:27: sparse:     got struct spinlock [noderef] __rcu=
 *
   kernel/signal.c:69:34: sparse: sparse: dereference of noderef expression
   kernel/signal.c:529:35: sparse: sparse: dereference of noderef expression
   kernel/signal.c:557:52: sparse: sparse: dereference of noderef expression
   kernel/signal.c:1034:13: sparse: sparse: dereference of noderef expressi=
on
   kernel/signal.c: note: in included file (through include/linux/sched/cpu=
time.h):
   include/linux/sched/signal.h:731:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:731:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:731:37: sparse:     got struct spinlock [no=
deref] __rcu *
   kernel/signal.c:1295:9: sparse: sparse: context imbalance in 'do_send_si=
g_info' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/rbtree.h,=
 include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:725:9: sparse: sparse: context imbalance in '__=
lock_task_sighand' - different lock contexts for basic block
   kernel/signal.c: note: in included file (through include/linux/sched/cpu=
time.h):
   include/linux/sched/signal.h:731:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:731:37: sparse:     expected struct spinloc=
k [usertype] *lock
   include/linux/sched/signal.h:731:37: sparse:     got struct spinlock [no=
deref] __rcu *
   include/linux/sched/signal.h:731:37: sparse: sparse: incorrect type in a=
rgument 1 (different address spaces) @@     expected struct spinlock [usert=
ype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:731:37: sparse:     expected struct spinloc=
k [usertype] *lock

vim +2169 kernel/signal.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  2106  =

75b95953a56969 Tejun Heo           2011-03-23  2107  /**
75b95953a56969 Tejun Heo           2011-03-23  2108   * do_notify_parent_cl=
dstop - notify parent of stopped/continued state change
75b95953a56969 Tejun Heo           2011-03-23  2109   * @tsk: task reportin=
g the state change
75b95953a56969 Tejun Heo           2011-03-23  2110   * @for_ptracer: the n=
otification is for ptracer
75b95953a56969 Tejun Heo           2011-03-23  2111   * @why: CLD_{CONTINUE=
D|STOPPED|TRAPPED} to report
75b95953a56969 Tejun Heo           2011-03-23  2112   *
75b95953a56969 Tejun Heo           2011-03-23  2113   * Notify @tsk's paren=
t that the stopped/continued state has changed.  If
75b95953a56969 Tejun Heo           2011-03-23  2114   * @for_ptracer is %fa=
lse, @tsk's group leader notifies to its real parent.
75b95953a56969 Tejun Heo           2011-03-23  2115   * If %true, @tsk repo=
rts to @tsk->parent which should be the ptracer.
75b95953a56969 Tejun Heo           2011-03-23  2116   *
75b95953a56969 Tejun Heo           2011-03-23  2117   * CONTEXT:
75b95953a56969 Tejun Heo           2011-03-23  2118   * Must be called with=
 tasklist_lock at least read locked.
75b95953a56969 Tejun Heo           2011-03-23  2119   */
75b95953a56969 Tejun Heo           2011-03-23  2120  static void do_notify_=
parent_cldstop(struct task_struct *tsk,
75b95953a56969 Tejun Heo           2011-03-23  2121  				     bool for_ptra=
cer, int why)
^1da177e4c3f41 Linus Torvalds      2005-04-16  2122  {
ae7795bc6187a1 Eric W. Biederman   2018-09-25  2123  	struct kernel_siginfo=
 info;
bc505a478d3fff Oleg Nesterov       2005-09-06  2124  	struct task_struct *p=
arent;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2125  	struct sighand_struct=
 *sighand;
1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2126  	bool lock;
bde8285e5cf784 Frederic Weisbecker 2017-01-31  2127  	u64 utime, stime;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2128  =

1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2129  	assert_spin_locked(&t=
sk->sighand->siglock);
1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2130  =

75b95953a56969 Tejun Heo           2011-03-23  2131  	if (for_ptracer) {
bc505a478d3fff Oleg Nesterov       2005-09-06  2132  		parent =3D tsk->pare=
nt;
75b95953a56969 Tejun Heo           2011-03-23  2133  	} else {
bc505a478d3fff Oleg Nesterov       2005-09-06  2134  		tsk =3D tsk->group_l=
eader;
bc505a478d3fff Oleg Nesterov       2005-09-06  2135  		parent =3D tsk->real=
_parent;
bc505a478d3fff Oleg Nesterov       2005-09-06  2136  	}
bc505a478d3fff Oleg Nesterov       2005-09-06  2137  =

faf1f22b61f271 Eric W. Biederman   2018-01-05  2138  	clear_siginfo(&info);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2139  	info.si_signo =3D SIG=
CHLD;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2140  	info.si_errno =3D 0;
b488893a390edf Pavel Emelyanov     2007-10-18  2141  	/*
5aba085ededa6c Randy Dunlap        2011-04-04  2142  	 * see comment in do_=
notify_parent() about the following 4 lines
b488893a390edf Pavel Emelyanov     2007-10-18  2143  	 */
b488893a390edf Pavel Emelyanov     2007-10-18  2144  	rcu_read_lock();
17cf22c33e1f1b Eric W. Biederman   2010-03-02  2145  	info.si_pid =3D task_=
pid_nr_ns(tsk, task_active_pid_ns(parent));
54ba47edac9009 Eric W. Biederman   2012-03-13  2146  	info.si_uid =3D from_=
kuid_munged(task_cred_xxx(parent, user_ns), task_uid(tsk));
b488893a390edf Pavel Emelyanov     2007-10-18  2147  	rcu_read_unlock();
b488893a390edf Pavel Emelyanov     2007-10-18  2148  =

bde8285e5cf784 Frederic Weisbecker 2017-01-31  2149  	task_cputime(tsk, &ut=
ime, &stime);
bde8285e5cf784 Frederic Weisbecker 2017-01-31  2150  	info.si_utime =3D nse=
c_to_clock_t(utime);
bde8285e5cf784 Frederic Weisbecker 2017-01-31  2151  	info.si_stime =3D nse=
c_to_clock_t(stime);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2152  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  2153   	info.si_code =3D why;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2154   	switch (why) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  2155   	case CLD_CONTINUED:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2156   		info.si_status =3D =
SIGCONT;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2157   		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2158   	case CLD_STOPPED:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2159   		info.si_status =3D =
tsk->signal->group_exit_code & 0x7f;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2160   		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2161   	case CLD_TRAPPED:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2162   		info.si_status =3D =
tsk->exit_code & 0x7f;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2163   		break;
^1da177e4c3f41 Linus Torvalds      2005-04-16  2164   	default:
^1da177e4c3f41 Linus Torvalds      2005-04-16  2165   		BUG();
^1da177e4c3f41 Linus Torvalds      2005-04-16  2166   	}
^1da177e4c3f41 Linus Torvalds      2005-04-16  2167  =

^1da177e4c3f41 Linus Torvalds      2005-04-16  2168  	sighand =3D parent->s=
ighand;
1d8ae697c0ac6b Eric W. Biederman   2022-04-26 @2169  	lock =3D tsk->sighand=
 !=3D sighand;
1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2170  	if (lock)
1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2171  		spin_lock_nested(&si=
ghand->siglock, SINGLE_DEPTH_NESTING);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2172  	if (sighand->action[S=
IGCHLD-1].sa.sa_handler !=3D SIG_IGN &&
^1da177e4c3f41 Linus Torvalds      2005-04-16  2173  	    !(sighand->action=
[SIGCHLD-1].sa.sa_flags & SA_NOCLDSTOP))
13adee57c025b3 Eric W. Biederman   2022-04-26  2174  		send_signal_locked(S=
IGCHLD, &info, parent, PIDTYPE_TGID);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2175  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  2176  	 * Even if SIGCHLD is=
 not generated, we must wake up wait4 calls.
^1da177e4c3f41 Linus Torvalds      2005-04-16  2177  	 */
^1da177e4c3f41 Linus Torvalds      2005-04-16  2178  	__wake_up_parent(tsk,=
 parent);
1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2179  	if (lock)
1d8ae697c0ac6b Eric W. Biederman   2022-04-26  2180  		spin_unlock(&sighand=
->siglock);
^1da177e4c3f41 Linus Torvalds      2005-04-16  2181  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  2182  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5499243230355689592==--

