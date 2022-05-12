Content-Type: multipart/mixed; boundary="===============2991666738839255674=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/5 v1] mm: add numa_count field for rss_stat
Date: Fri, 13 May 2022 05:21:01 +0800
Message-ID: <202205130551.e9BVkfHo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2991666738839255674==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220512044634.63586-3-ligang.bdlg@bytedance.com>
References: <20220512044634.63586-3-ligang.bdlg@bytedance.com>
TO: Gang Li <ligang.bdlg@bytedance.com>
TO: akpm(a)linux-foundation.org
CC: songmuchun(a)bytedance.com
CC: hca(a)linux.ibm.com
CC: gor(a)linux.ibm.com
CC: agordeev(a)linux.ibm.com
CC: borntraeger(a)linux.ibm.com
CC: svens(a)linux.ibm.com
CC: ebiederm(a)xmission.com
CC: keescook(a)chromium.org
CC: viro(a)zeniv.linux.org.uk
CC: rostedt(a)goodmis.org
CC: mingo(a)redhat.com
CC: peterz(a)infradead.org
CC: acme(a)kernel.org
CC: mark.rutland(a)arm.com
CC: alexander.shishkin(a)linux.intel.com
CC: jolsa(a)kernel.org
CC: namhyung(a)kernel.org
CC: david(a)redhat.com
CC: imbrenda(a)linux.ibm.com
CC: apopple(a)nvidia.com
CC: adobriyan(a)gmail.com
CC: stephen.s.brennan(a)oracle.com
CC: ohoono.kwon(a)samsung.com
CC: haolee.swjtu(a)gmail.com
CC: kaleshsingh(a)google.com
CC: zhengqi.arch(a)bytedance.com
CC: peterx(a)redhat.com
CC: shy828301(a)gmail.com
CC: surenb(a)google.com

Hi Gang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on s390/features]
[also build test WARNING on kees/for-next/execve tip/perf/core linus/master=
 v5.18-rc6]
[cannot apply to akpm-mm/mm-everything rostedt-trace/for-next next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gang-Li/mm-oom-Intro=
duce-per-numa-node-oom-for-CONSTRAINT_MEMORY_POLICY/20220512-124948
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git feat=
ures
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/202=
20513/202205130551.e9BVkfHo-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/3e724f844e3fe45cdff=
d9f359d140a424aeb462c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gang-Li/mm-oom-Introduce-per-numa-=
node-oom-for-CONSTRAINT_MEMORY_POLICY/20220512-124948
        git checkout 3e724f844e3fe45cdffd9f359d140a424aeb462c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> kernel/fork.c:1110:1: sparse: sparse: unused label 'free_stack'
>> kernel/fork.c:878:6: sparse: sparse: symbol 'rss_stat_free' was not decl=
ared. Should it be static?
   kernel/fork.c:1366:24: sparse: sparse: incorrect type in initializer (di=
fferent address spaces) @@     expected struct file [noderef] __rcu *__ret =
@@     got struct file *new_exe_file @@
   kernel/fork.c:1366:24: sparse:     expected struct file [noderef] __rcu =
*__ret
   kernel/fork.c:1366:24: sparse:     got struct file *new_exe_file
   kernel/fork.c:1366:22: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct file *[assigned] old_exe_file=
 @@     got struct file [noderef] __rcu *[assigned] __ret @@
   kernel/fork.c:1366:22: sparse:     expected struct file *[assigned] old_=
exe_file
   kernel/fork.c:1366:22: sparse:     got struct file [noderef] __rcu *[ass=
igned] __ret
   kernel/fork.c:1697:38: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct refcount_struct [usertype] *r=
 @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:1697:38: sparse:     expected struct refcount_struct [user=
type] *r
   kernel/fork.c:1697:38: sparse:     got struct refcount_struct [noderef] =
__rcu *
   kernel/fork.c:1706:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1706:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1706:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1707:9: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const * @@     got struct k_siga=
ction [noderef] __rcu * @@
   kernel/fork.c:1707:9: sparse:     expected void const *
   kernel/fork.c:1707:9: sparse:     got struct k_sigaction [noderef] __rcu=
 *
   kernel/fork.c:1707:9: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected void const * @@     got struct k_siga=
ction [noderef] __rcu * @@
   kernel/fork.c:1707:9: sparse:     expected void const *
   kernel/fork.c:1707:9: sparse:     got struct k_sigaction [noderef] __rcu=
 *
   kernel/fork.c:1707:9: sparse: sparse: incorrect type in argument 2 (diff=
erent address spaces) @@     expected void const * @@     got struct k_siga=
ction [noderef] __rcu * @@
   kernel/fork.c:1707:9: sparse:     expected void const *
   kernel/fork.c:1707:9: sparse:     got struct k_sigaction [noderef] __rcu=
 *
   kernel/fork.c:1708:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:1708:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:1708:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:1801:9: sparse: sparse: incorrect type in argument 1 (diff=
erent address spaces) @@     expected struct qspinlock *lock @@     got str=
uct qspinlock [noderef] __rcu * @@
   kernel/fork.c:1801:9: sparse:     expected struct qspinlock *lock
   kernel/fork.c:1801:9: sparse:     got struct qspinlock [noderef] __rcu *
   kernel/fork.c:2120:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2120:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2120:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2124:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2124:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2124:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2443:32: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct [noderef] __rcu *=
real_parent @@     got struct task_struct * @@
   kernel/fork.c:2443:32: sparse:     expected struct task_struct [noderef]=
 __rcu *real_parent
   kernel/fork.c:2443:32: sparse:     got struct task_struct *
   kernel/fork.c:2452:27: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2452:27: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2452:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2497:54: sparse: sparse: incorrect type in argument 2 (dif=
ferent address spaces) @@     expected struct list_head *head @@     got st=
ruct list_head [noderef] __rcu * @@
   kernel/fork.c:2497:54: sparse:     expected struct list_head *head
   kernel/fork.c:2497:54: sparse:     got struct list_head [noderef] __rcu *
   kernel/fork.c:2518:29: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2518:29: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2518:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2539:29: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2539:29: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2539:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2566:28: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct sighand_struct *sighand @@   =
  got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/fork.c:2566:28: sparse:     expected struct sighand_struct *sigha=
nd
   kernel/fork.c:2566:28: sparse:     got struct sighand_struct [noderef] _=
_rcu *sighand
   kernel/fork.c:2595:31: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2595:31: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2595:31: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:2597:33: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct spinlock [usertype] *lock @@ =
    got struct spinlock [noderef] __rcu * @@
   kernel/fork.c:2597:33: sparse:     expected struct spinlock [usertype] *=
lock
   kernel/fork.c:2597:33: sparse:     got struct spinlock [noderef] __rcu *
   kernel/fork.c:3006:24: sparse: sparse: incorrect type in assignment (dif=
ferent address spaces) @@     expected struct task_struct *[assigned] paren=
t @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/fork.c:3006:24: sparse:     expected struct task_struct *[assigne=
d] parent
   kernel/fork.c:3006:24: sparse:     got struct task_struct [noderef] __rc=
u *real_parent
   kernel/fork.c:3087:43: sparse: sparse: incorrect type in argument 1 (dif=
ferent address spaces) @@     expected struct refcount_struct const [userty=
pe] *r @@     got struct refcount_struct [noderef] __rcu * @@
   kernel/fork.c:3087:43: sparse:     expected struct refcount_struct const=
 [usertype] *r
   kernel/fork.c:3087:43: sparse:     got struct refcount_struct [noderef] =
__rcu *
   kernel/fork.c:2162:22: sparse: sparse: dereference of noderef expression
   kernel/fork.c: note: in included file (through include/uapi/asm-generic/=
bpf_perf_event.h, arch/x86/include/generated/uapi/asm/bpf_perf_event.h, ...=
):
   include/linux/ptrace.h:217:45: sparse: sparse: incorrect type in argumen=
t 2 (different address spaces) @@     expected struct task_struct *new_pare=
nt @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:217:45: sparse:     expected struct task_struct *=
new_parent
   include/linux/ptrace.h:217:45: sparse:     got struct task_struct [noder=
ef] __rcu *parent
   include/linux/ptrace.h:217:62: sparse: sparse: incorrect type in argumen=
t 3 (different address spaces) @@     expected struct cred const *ptracer_c=
red @@     got struct cred const [noderef] __rcu *ptracer_cred @@
   include/linux/ptrace.h:217:62: sparse:     expected struct cred const *p=
tracer_cred
   include/linux/ptrace.h:217:62: sparse:     got struct cred const [nodere=
f] __rcu *ptracer_cred
   kernel/fork.c:2495:59: sparse: sparse: dereference of noderef expression
   kernel/fork.c:2496:59: sparse: sparse: dereference of noderef expression

Please review and possibly fold the followup patch.

vim +/free_stack +1110 kernel/fork.c

a3d29e8291b622 Peter Zijlstra            2022-02-07  1100  =

d46eb14b735b11 Shakeel Butt              2018-08-17  1101  #ifdef CONFIG_ME=
MCG
d46eb14b735b11 Shakeel Butt              2018-08-17  1102  	tsk->active_mem=
cg =3D NULL;
d46eb14b735b11 Shakeel Butt              2018-08-17  1103  #endif
^1da177e4c3f41 Linus Torvalds            2005-04-16  1104  	return tsk;
61c4628b538608 Suresh Siddha             2008-03-10  1105  =

3e724f844e3fe4 Gang Li                   2022-05-12  1106  free_rss_stat:
3e724f844e3fe4 Gang Li                   2022-05-12  1107  #ifdef SPLIT_RSS=
_NUMA_COUNTING
3e724f844e3fe4 Gang Li                   2022-05-12  1108  	kfree(numa_coun=
t);
3e724f844e3fe4 Gang Li                   2022-05-12  1109  #endif
b235beea9e996a Linus Torvalds            2016-06-24 @1110  free_stack:
1a03d3f13ffe5d Sebastian Andrzej Siewior 2022-02-17  1111  	exit_task_stack=
_account(tsk);
ba14a194a434cc Andy Lutomirski           2016-08-11  1112  	free_thread_sta=
ck(tsk);
f19b9f74b7ea3b Akinobu Mita              2012-07-30  1113  free_tsk:
61c4628b538608 Suresh Siddha             2008-03-10  1114  	free_task_struc=
t(tsk);
61c4628b538608 Suresh Siddha             2008-03-10  1115  	return NULL;
^1da177e4c3f41 Linus Torvalds            2005-04-16  1116  }
^1da177e4c3f41 Linus Torvalds            2005-04-16  1117  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2991666738839255674==--

