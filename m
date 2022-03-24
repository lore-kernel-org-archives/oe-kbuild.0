Content-Type: multipart/mixed; boundary="===============0417450211091457075=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 33/38] arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 24 Mar 2022 17:16:52 +0800
Message-ID: <202203241716.f3xyMi6b-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0417450211091457075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   bafeaefb38960799e1f7ac9b6707a22e5be067d0
commit: 472607f8a84913ba6fda3fbda42c963a1df9e411 [33/38] RISC-V: KVM: Initi=
al skeletal support for in-kernel AIA irqchip
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220324/202203241716.f3xyMi6b-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/avpatel/linux/commit/472607f8a84913ba6fda3fbda=
42c963a1df9e411
        git remote add avpatel https://github.com/avpatel/linux.git
        git fetch --no-tags avpatel riscv_kvm_aia_v1
        git checkout 472607f8a84913ba6fda3fbda42c963a1df9e411
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                       ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:346:22: note: expanded from macro 'compil=
etime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   include/linux/compiler_types.h:334:23: note: expanded from macro '_compi=
letime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:326:9: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   include/linux/sched.h:1640:2: note: Taking false branch
           BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) !=3D sizeof(state_char) =
- 1);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   include/linux/sched.h:1640:2: note: Loop condition is false.  Exiting lo=
op
           BUILD_BUG_ON(1 + ilog2(TASK_REPORT_MAX) !=3D sizeof(state_char) =
- 1);
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   include/linux/sched.h:1642:2: note: Undefined or garbage value returned =
to caller
           return state_char[state];
           ^      ~~~~~~~~~~~~~~~~~
   kernel/sched/debug.c:554:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           SEQ_printf_task_group_path(m, task_group(p), " %s")
           ^
   kernel/sched/debug.c:524:3: note: expanded from macro 'SEQ_printf_task_g=
roup_path'
                   strcpy(bufend - 1, "...");                              \
                   ^~~~~~
   kernel/sched/debug.c:554:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           SEQ_printf_task_group_path(m, task_group(p), " %s")
           ^
   kernel/sched/debug.c:524:3: note: expanded from macro 'SEQ_printf_task_g=
roup_path'
                   strcpy(bufend - 1, "...");                              \
                   ^~~~~~
   kernel/sched/debug.c:591:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu=
);
           ^
   kernel/sched/debug.c:524:3: note: expanded from macro 'SEQ_printf_task_g=
roup_path'
                   strcpy(bufend - 1, "...");                              \
                   ^~~~~~
   kernel/sched/debug.c:591:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           SEQ_printf_task_group_path(m, cfs_rq->tg, "cfs_rq[%d]:%s\n", cpu=
);
           ^
   kernel/sched/debug.c:524:3: note: expanded from macro 'SEQ_printf_task_g=
roup_path'
                   strcpy(bufend - 1, "...");                              \
                   ^~~~~~
   kernel/sched/debug.c:667:2: warning: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           SEQ_printf_task_group_path(m, rt_rq->tg, "rt_rq[%d]:%s\n", cpu);
           ^
   kernel/sched/debug.c:524:3: note: expanded from macro 'SEQ_printf_task_g=
roup_path'
                   strcpy(bufend - 1, "...");                              \
                   ^~~~~~
   kernel/sched/debug.c:667:2: note: Call to function 'strcpy' is insecure =
as it does not provide bounding of the memory buffer. Replace unbounded cop=
y functions with analogous functions that support length arguments such as =
'strlcpy'. CWE-119
           SEQ_printf_task_group_path(m, rt_rq->tg, "rt_rq[%d]:%s\n", cpu);
           ^
   kernel/sched/debug.c:524:3: note: expanded from macro 'SEQ_printf_task_g=
roup_path'
                   strcpy(bufend - 1, "...");                              \
                   ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
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
   4 warnings generated.
   Suppressed 4 warnings (2 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: warning: Value stored =
to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/riscv/kvm/../../../virt/kvm/eventfd.c:392:2: note: Value stored to =
'ret' is never read
           ret =3D 0;
           ^     ~
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
   4 warnings generated.
   security/keys/request_key.c:119:21: warning: Value stored to 'cred' duri=
ng its initialization is never read [clang-analyzer-deadcode.DeadStores]
           const struct cred *cred =3D current_cred();
                              ^~~~
   security/keys/request_key.c:119:21: note: Value stored to 'cred' during =
its initialization is never read
           const struct cred *cred =3D current_cred();
                              ^~~~
   security/keys/request_key.c:510:3: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   ret =3D 0;
                   ^     ~
   security/keys/request_key.c:510:3: note: Value stored to 'ret' is never =
read
                   ret =3D 0;
                   ^     ~
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
   4 warnings generated.
   fs/namei.c:3423:8: warning: 4th function call argument is an uninitializ=
ed value [clang-analyzer-core.CallAndMessage]
           res =3D step_into(nd, WALK_TRAILING, dentry, inode, seq);
                 ^
   fs/namei.c:3636:9: note: Calling 'path_openat'
           filp =3D path_openat(&nd, op, flags | LOOKUP_RCU);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/namei.c:3595:41: note: Left side of '&&' is false
           file =3D alloc_empty_file(op->open_flag, current_cred());
                                                  ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)
           ^
   include/linux/rcupdate.h:594:2: note: expanded from macro 'rcu_dereferen=
ce_protected'
           __rcu_dereference_protected((p), __UNIQUE_ID(rcu), (c), __rcu)
           ^
   include/linux/rcupdate.h:398:2: note: expanded from macro '__rcu_derefer=
ence_protected'
           RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() u=
sage"); \
           ^
   include/linux/rcupdate.h:319:11: note: expanded from macro 'RCU_LOCKDEP_=
WARN'
                   if ((c) && debug_lockdep_rcu_enabled() && !__warned) {  \
                           ^
   fs/namei.c:3595:41: note: Loop condition is false.  Exiting loop
           file =3D alloc_empty_file(op->open_flag, current_cred());
                                                  ^
   include/linux/cred.h:299:2: note: expanded from macro 'current_cred'
           rcu_dereference_protected(current->cred, 1)

vim +/ret +392 arch/riscv/kvm/../../../virt/kvm/eventfd.c

1a02b27035f8209 Eric Auger            2015-09-18  292  =

721eecbf4fe995c Gregory Haskins       2009-05-20  293  static int
d4db2935e4fffeb Alex Williamson       2012-06-29  294  kvm_irqfd_assign(str=
uct kvm *kvm, struct kvm_irqfd *args)
721eecbf4fe995c Gregory Haskins       2009-05-20  295  {
166c9775f1f8b8f Eric Auger            2015-09-18  296  	struct kvm_kernel_i=
rqfd *irqfd, *tmp;
cffe78d92c217a5 Al Viro               2013-08-30  297  	struct fd f;
7a84428af7ca6a8 Alex Williamson       2012-09-21  298  	struct eventfd_ctx =
*eventfd =3D NULL, *resamplefd =3D NULL;
721eecbf4fe995c Gregory Haskins       2009-05-20  299  	int ret;
e6c8adca20ba459 Al Viro               2017-07-03  300  	__poll_t events;
9957c86d659a4d5 Paul Mackerras        2014-06-30  301  	int idx;
721eecbf4fe995c Gregory Haskins       2009-05-20  302  =

01c94e64f5a6f29 Eric Auger            2015-03-04  303  	if (!kvm_arch_intc_=
initialized(kvm))
01c94e64f5a6f29 Eric Auger            2015-03-04  304  		return -EAGAIN;
01c94e64f5a6f29 Eric Auger            2015-03-04  305  =

654f1f13ea56b92 Peter Xu              2019-05-05  306  	if (!kvm_arch_irqfd=
_allowed(kvm, args))
654f1f13ea56b92 Peter Xu              2019-05-05  307  		return -EINVAL;
654f1f13ea56b92 Peter Xu              2019-05-05  308  =

b12ce36a43f29db Ben Gardon            2019-02-11  309  	irqfd =3D kzalloc(s=
izeof(*irqfd), GFP_KERNEL_ACCOUNT);
721eecbf4fe995c Gregory Haskins       2009-05-20  310  	if (!irqfd)
721eecbf4fe995c Gregory Haskins       2009-05-20  311  		return -ENOMEM;
721eecbf4fe995c Gregory Haskins       2009-05-20  312  =

721eecbf4fe995c Gregory Haskins       2009-05-20  313  	irqfd->kvm =3D kvm;
d4db2935e4fffeb Alex Williamson       2012-06-29  314  	irqfd->gsi =3D args=
->gsi;
721eecbf4fe995c Gregory Haskins       2009-05-20  315  	INIT_LIST_HEAD(&irq=
fd->list);
721eecbf4fe995c Gregory Haskins       2009-05-20  316  	INIT_WORK(&irqfd->i=
nject, irqfd_inject);
721eecbf4fe995c Gregory Haskins       2009-05-20  317  	INIT_WORK(&irqfd->s=
hutdown, irqfd_shutdown);
5c73b9a2b1b4ecc Ahmed S. Darwish      2020-07-20  318  	seqcount_spinlock_i=
nit(&irqfd->irq_entry_sc, &kvm->irqfds.lock);
721eecbf4fe995c Gregory Haskins       2009-05-20  319  =

cffe78d92c217a5 Al Viro               2013-08-30  320  	f =3D fdget(args->f=
d);
cffe78d92c217a5 Al Viro               2013-08-30  321  	if (!f.file) {
cffe78d92c217a5 Al Viro               2013-08-30  322  		ret =3D -EBADF;
cffe78d92c217a5 Al Viro               2013-08-30  323  		goto out;
721eecbf4fe995c Gregory Haskins       2009-05-20  324  	}
721eecbf4fe995c Gregory Haskins       2009-05-20  325  =

cffe78d92c217a5 Al Viro               2013-08-30  326  	eventfd =3D eventfd=
_ctx_fileget(f.file);
721eecbf4fe995c Gregory Haskins       2009-05-20  327  	if (IS_ERR(eventfd)=
) {
721eecbf4fe995c Gregory Haskins       2009-05-20  328  		ret =3D PTR_ERR(ev=
entfd);
721eecbf4fe995c Gregory Haskins       2009-05-20  329  		goto fail;
721eecbf4fe995c Gregory Haskins       2009-05-20  330  	}
721eecbf4fe995c Gregory Haskins       2009-05-20  331  =

721eecbf4fe995c Gregory Haskins       2009-05-20  332  	irqfd->eventfd =3D =
eventfd;
721eecbf4fe995c Gregory Haskins       2009-05-20  333  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  334  	if (args->flags & K=
VM_IRQFD_FLAG_RESAMPLE) {
166c9775f1f8b8f Eric Auger            2015-09-18  335  		struct kvm_kernel_=
irqfd_resampler *resampler;
7a84428af7ca6a8 Alex Williamson       2012-09-21  336  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  337  		resamplefd =3D eve=
ntfd_ctx_fdget(args->resamplefd);
7a84428af7ca6a8 Alex Williamson       2012-09-21  338  		if (IS_ERR(resampl=
efd)) {
7a84428af7ca6a8 Alex Williamson       2012-09-21  339  			ret =3D PTR_ERR(r=
esamplefd);
7a84428af7ca6a8 Alex Williamson       2012-09-21  340  			goto fail;
7a84428af7ca6a8 Alex Williamson       2012-09-21  341  		}
7a84428af7ca6a8 Alex Williamson       2012-09-21  342  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  343  		irqfd->resamplefd =
=3D resamplefd;
7a84428af7ca6a8 Alex Williamson       2012-09-21  344  		INIT_LIST_HEAD(&ir=
qfd->resampler_link);
7a84428af7ca6a8 Alex Williamson       2012-09-21  345  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  346  		mutex_lock(&kvm->i=
rqfds.resampler_lock);
7a84428af7ca6a8 Alex Williamson       2012-09-21  347  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  348  		list_for_each_entr=
y(resampler,
49f8a1a5394d8ba Alex Williamson       2012-12-06  349  				    &kvm->irqfds=
.resampler_list, link) {
7a84428af7ca6a8 Alex Williamson       2012-09-21  350  			if (resampler->no=
tifier.gsi =3D=3D irqfd->gsi) {
7a84428af7ca6a8 Alex Williamson       2012-09-21  351  				irqfd->resampler=
 =3D resampler;
7a84428af7ca6a8 Alex Williamson       2012-09-21  352  				break;
7a84428af7ca6a8 Alex Williamson       2012-09-21  353  			}
7a84428af7ca6a8 Alex Williamson       2012-09-21  354  		}
7a84428af7ca6a8 Alex Williamson       2012-09-21  355  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  356  		if (!irqfd->resamp=
ler) {
b12ce36a43f29db Ben Gardon            2019-02-11  357  			resampler =3D kza=
lloc(sizeof(*resampler),
b12ce36a43f29db Ben Gardon            2019-02-11  358  					    GFP_KERNEL_=
ACCOUNT);
7a84428af7ca6a8 Alex Williamson       2012-09-21  359  			if (!resampler) {
7a84428af7ca6a8 Alex Williamson       2012-09-21  360  				ret =3D -ENOMEM;
7a84428af7ca6a8 Alex Williamson       2012-09-21  361  				mutex_unlock(&kv=
m->irqfds.resampler_lock);
7a84428af7ca6a8 Alex Williamson       2012-09-21  362  				goto fail;
7a84428af7ca6a8 Alex Williamson       2012-09-21  363  			}
7a84428af7ca6a8 Alex Williamson       2012-09-21  364  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  365  			resampler->kvm =
=3D kvm;
7a84428af7ca6a8 Alex Williamson       2012-09-21  366  			INIT_LIST_HEAD(&r=
esampler->list);
7a84428af7ca6a8 Alex Williamson       2012-09-21  367  			resampler->notifi=
er.gsi =3D irqfd->gsi;
7a84428af7ca6a8 Alex Williamson       2012-09-21  368  			resampler->notifi=
er.irq_acked =3D irqfd_resampler_ack;
7a84428af7ca6a8 Alex Williamson       2012-09-21  369  			INIT_LIST_HEAD(&r=
esampler->link);
7a84428af7ca6a8 Alex Williamson       2012-09-21  370  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  371  			list_add(&resampl=
er->link, &kvm->irqfds.resampler_list);
7a84428af7ca6a8 Alex Williamson       2012-09-21  372  			kvm_register_irq_=
ack_notifier(kvm,
7a84428af7ca6a8 Alex Williamson       2012-09-21  373  						      &resampl=
er->notifier);
7a84428af7ca6a8 Alex Williamson       2012-09-21  374  			irqfd->resampler =
=3D resampler;
7a84428af7ca6a8 Alex Williamson       2012-09-21  375  		}
7a84428af7ca6a8 Alex Williamson       2012-09-21  376  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  377  		list_add_rcu(&irqf=
d->resampler_link, &irqfd->resampler->list);
719d93cd5f5c5c8 Christian Borntraeger 2014-01-16  378  		synchronize_srcu(&=
kvm->irq_srcu);
7a84428af7ca6a8 Alex Williamson       2012-09-21  379  =

7a84428af7ca6a8 Alex Williamson       2012-09-21  380  		mutex_unlock(&kvm-=
>irqfds.resampler_lock);
7a84428af7ca6a8 Alex Williamson       2012-09-21  381  	}
7a84428af7ca6a8 Alex Williamson       2012-09-21  382  =

721eecbf4fe995c Gregory Haskins       2009-05-20  383  	/*
721eecbf4fe995c Gregory Haskins       2009-05-20  384  	 * Install our own =
custom wake-up handling so we are notified via
721eecbf4fe995c Gregory Haskins       2009-05-20  385  	 * a callback whene=
ver someone signals the underlying eventfd
721eecbf4fe995c Gregory Haskins       2009-05-20  386  	 */
721eecbf4fe995c Gregory Haskins       2009-05-20  387  	init_waitqueue_func=
_entry(&irqfd->wait, irqfd_wakeup);
721eecbf4fe995c Gregory Haskins       2009-05-20  388  	init_poll_funcptr(&=
irqfd->pt, irqfd_ptable_queue_proc);
721eecbf4fe995c Gregory Haskins       2009-05-20  389  =

f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  390  	spin_lock_irq(&kvm-=
>irqfds.lock);
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  391  =

f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13 @392  	ret =3D 0;
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  393  	list_for_each_entry=
(tmp, &kvm->irqfds.items, list) {
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  394  		if (irqfd->eventfd=
 !=3D tmp->eventfd)
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  395  			continue;
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  396  		/* This fd is used=
 for another irq already. */
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  397  		ret =3D -EBUSY;
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  398  		spin_unlock_irq(&k=
vm->irqfds.lock);
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  399  		goto fail;
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  400  	}
f1d1c309f35e9b0 Michael S. Tsirkin    2010-01-13  401  =

9957c86d659a4d5 Paul Mackerras        2014-06-30  402  	idx =3D srcu_read_l=
ock(&kvm->irq_srcu);
9957c86d659a4d5 Paul Mackerras        2014-06-30  403  	irqfd_update(kvm, i=
rqfd);
bd2b53b20fcd0d6 Michael S. Tsirkin    2010-11-18  404  =

721eecbf4fe995c Gregory Haskins       2009-05-20  405  	list_add_tail(&irqf=
d->list, &kvm->irqfds.items);
721eecbf4fe995c Gregory Haskins       2009-05-20  406  =

684a0b719ddbbaf Cornelia Huck         2014-03-17  407  	spin_unlock_irq(&kv=
m->irqfds.lock);
684a0b719ddbbaf Cornelia Huck         2014-03-17  408  =

721eecbf4fe995c Gregory Haskins       2009-05-20  409  	/*
721eecbf4fe995c Gregory Haskins       2009-05-20  410  	 * Check if there w=
as an event already pending on the eventfd
721eecbf4fe995c Gregory Haskins       2009-05-20  411  	 * before we regist=
ered, and trigger it as if we didn't miss it.
721eecbf4fe995c Gregory Haskins       2009-05-20  412  	 */
9965ed174e7d388 Christoph Hellwig     2018-03-05  413  	events =3D vfs_poll=
(f.file, &irqfd->pt);
684a0b719ddbbaf Cornelia Huck         2014-03-17  414  =

a9a08845e9acbd2 Linus Torvalds        2018-02-11  415  	if (events & EPOLLI=
N)
721eecbf4fe995c Gregory Haskins       2009-05-20  416  		schedule_work(&irq=
fd->inject);
721eecbf4fe995c Gregory Haskins       2009-05-20  417  =


:::::: The code at line 392 was first introduced by commit
:::::: f1d1c309f35e9b0fb961cffd70fbd04f450ec47c KVM: only allow one gsi per=
 fd

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Marcelo Tosatti <mtosatti@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0417450211091457075==--

