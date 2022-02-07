Content-Type: multipart/mixed; boundary="===============6286963197021507063=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: vmlinux.o: warning: objtool: rcu_user_enter()+0x34: call to ftrace_likely_update() leaves .noinstr.text section
Date: Mon, 07 Feb 2022 23:18:05 +0800
Message-ID: <202202072352.s2ULx5sU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6286963197021507063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dfd42facf1e4ada021b939b4e19c935dcdd55566
commit: db2b0c5d7b6f19b3c2cab08c531b65342eb5252b objtool: Support pv_opsind=
irect calls for noinstr
date:   5 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-s022-20220207 (https://download.01.org/0day-ci/ar=
chive/20220207/202202072352.s2ULx5sU-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddb2b0c5d7b6f19b3c2cab08c531b65342eb5252b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db2b0c5d7b6f19b3c2cab08c531b65342eb5252b
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: __rdgsbase_inactive()+0x34: call to ftrace_=
likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive()+0x39: call to ftrace_=
likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret()+0x72: call to ftrace_likel=
y_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug()+0x39: call to ftrace_like=
ly_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x31: call to ftrace_likely_updat=
e() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler()+0x46: call to ftrace_li=
kely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu()+0x31: call to ftra=
ce_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x9a3: call to queue_tas=
k_work() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check()+0x72: call to ftrace_li=
kely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_enter()+0x1a: call to ftra=
ce_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_dynticks_eqs_exit()+0x1a: call to ftrac=
e_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_exit.constprop.0()+0x37: call to ft=
race_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_eqs_enter.constprop.0()+0x3c: call to f=
trace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: rcu_user_enter()+0x34: call to ftrace_likel=
y_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_exit()+0x34: call to ftrace_likely_=
update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_nmi_enter()+0x2e: call to ftrace_likely=
_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: rcu_irq_enter()+0x34: call to ftrace_likely=
_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter()+0x48: call to ftrace_l=
ikely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit()+0x54: call to ftrace_li=
kely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x45: call to ftrace=
_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x4b: call t=
o ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x45=
: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x45: call =
to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit()+0x3c: call to ftrace_likely=
_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: context_tracking_recursion_enter()+0x68: ca=
ll to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __context_tracking_enter()+0x31: call to ft=
race_likely_update() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6286963197021507063==--

